<?php

namespace Botble\Ecommerce\Tables;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Facades\Html;
use Botble\Ecommerce\Enums\CustomerStatusEnum;
use Botble\Ecommerce\Facades\EcommerceHelper;
use Botble\Ecommerce\Models\Customer;
use Botble\Table\Abstracts\TableAbstract;
use Botble\Table\Actions\DeleteAction;
use Botble\Table\Actions\EditAction;
use Botble\Table\BulkActions\DeleteBulkAction;
use Botble\Table\BulkChanges\CreatedAtBulkChange;
use Botble\Table\BulkChanges\EmailBulkChange;
use Botble\Table\BulkChanges\NameBulkChange;
use Botble\Table\BulkChanges\StatusBulkChange;
use Botble\Table\Columns\Column;
use Botble\Table\Columns\CreatedAtColumn;
use Botble\Table\Columns\EmailColumn;
use Botble\Table\Columns\IdColumn;
use Botble\Table\Columns\NameColumn;
use Botble\Table\Columns\PhoneColumn;
use Botble\Table\Columns\StatusColumn;
use Botble\Table\Columns\YesNoColumn;
use Illuminate\Contracts\View\Factory;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Relations\Relation;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Http\JsonResponse;
use Illuminate\Validation\Rule;
use Symfony\Component\HttpFoundation\Response;

class CustomerTable extends TableAbstract
{
    public function setup(): void
    {
        $this
            ->model(Customer::class)
            ->addActions([
                EditAction::make()->route('customers.edit'),
                DeleteAction::make()->route('customers.destroy'),
            ]);
    }

    public function ajax(): JsonResponse
    {
        $data = $this->table
            ->eloquent($this->query())
            ->editColumn('avatar', function (Customer $item) {
                if ($this->isExportingToCSV() || $this->isExportingToExcel()) {
                    return $item->avatar_url;
                }

                return Html::tag(
                    'img',
                    '',
                    ['src' => $item->avatar_url, 'alt' => BaseHelper::clean($item->name), 'width' => 50]
                );
            })
            ->editColumn('affiliate_status', function (Customer $item) {
                return $item->is_affiliate ? $item->affiliate_status->toHtml() : '&mdash;';
            })
            ->editColumn('affiliate_applied_at', function (Customer $item) {
                return $item->affiliate_applied_at ? $item->affiliate_applied_at->translatedFormat('Y-m-d H:i') : '&mdash;';
            })
            ->editColumn('affiliate_status_changed_at', function (Customer $item) {
                return $item->affiliate_status_changed_at ? $item->affiliate_status_changed_at->translatedFormat('Y-m-d H:i') : '&mdash;';
            });

        \Illuminate\Support\Facades\Log::info('CustomerTable SQL: ' . $this->query()->toSql());
        \Illuminate\Support\Facades\Log::info('CustomerTable Bindings: ' . json_encode($this->query()->getBindings()));

        return $this->toJson($data);
    }

    public function query(): Relation|Builder|QueryBuilder
    {
        $query = $this
            ->getModel()
            ->query()
            ->select([
                'id',
                'name',
                'email',
                'phone',
                'avatar',
                'created_at',
                'status',
                'confirmed_at',
                'is_affiliate',
                'affiliate_status',
                'affiliate_applied_at',
                'affiliate_status_changed_at',
                'referral_username',
            ]);

        return $this->applyScopes($query);
    }

    public function columns(): array
    {
        $columns = [
            IdColumn::make(),
            Column::make('avatar')
                ->title(trans('plugins/ecommerce::customer.avatar')),
            NameColumn::make()->route('customers.edit'),
            Column::make('affiliate_status')
                ->title(trans('plugins/ecommerce::customer.affiliate_status')),
            Column::make('affiliate_applied_at')
                ->title(__('Applied At')),
            Column::make('affiliate_status_changed_at')
                ->title(__('Status Changed At')),
            Column::make('referral_username')
                ->title(__('Referral')),
        ];

        if (EcommerceHelper::isLoginUsingPhone()) {
            $columns[] = PhoneColumn::make();
        } else {
            $columns[] = EmailColumn::make();

            if (EcommerceHelper::isEnableEmailVerification()) {
                $columns = array_merge($columns, [
                    YesNoColumn::make('confirmed_at')
                        ->title(trans('plugins/ecommerce::customer.email_verified')),
                ]);
            }
        }

        return array_merge($columns, [
            CreatedAtColumn::make(),
            StatusColumn::make(),
        ]);
    }

    public function buttons(): array
    {
        return $this->addCreateButton(route('customers.create'), 'customers.create');
    }

    public function bulkActions(): array
    {
        return [
            DeleteBulkAction::make()->permission('customers.destroy'),
        ];
    }

    public function getBulkChanges(): array
    {
        return [
            NameBulkChange::make(),
            EmailBulkChange::make(),
            StatusBulkChange::make()
                ->choices(CustomerStatusEnum::labels())
                ->validate(['required', Rule::in(CustomerStatusEnum::values())]),
            CreatedAtBulkChange::make(),
        ];
    }

    public function getFilters(): array
    {
        $filters = parent::getFilters();

        if (EcommerceHelper::isEnableEmailVerification()) {
            $filters['confirmed_at'] = [
                'title' => trans('plugins/ecommerce::customer.email_verified'),
                'type' => 'select',
                'choices' => [1 => trans('core/base::base.yes'), 0 => trans('core/base::base.no')],
                'validate' => 'required|in:1,0',
            ];
        }

        $filters['is_pending_affiliate'] = [
            'title' => __('Pending Affiliates'),
            'type' => 'select',
            'choices' => [1 => trans('core/base::base.yes'), 0 => trans('core/base::base.no')],
            'validate' => 'required|in:1,0',
        ];

        $filters['affiliate_status'] = [
            'title' => trans('plugins/ecommerce::customer.affiliate_status'),
            'type' => 'select',
            'choices' => \Botble\Ecommerce\Enums\AffiliateStatusEnum::labels(),
            'validate' => 'required|in:' . implode(',', \Botble\Ecommerce\Enums\AffiliateStatusEnum::values()),
        ];

        $filters['no_referral'] = [
            'title' => __('No Referral'),
            'type' => 'select',
            'choices' => [1 => trans('core/base::base.yes'), 2 => trans('core/base::base.no')],
            'validate' => 'required|in:1,2',
        ];

        return $filters;
    }


    public function getDefaultButtons(): array
    {
        return array_unique(array_merge(['export'], parent::getDefaultButtons()));
    }

    public function applyFilterCondition(
        Relation|Builder|QueryBuilder $query,
        string $key,
        string $operator,
        ?string $value
    ) {
        if ($key == 'is_pending_affiliate') {
            if ($value == '1') {
                return $query->where('is_affiliate', 1)->where('affiliate_status', \Botble\Ecommerce\Enums\AffiliateStatusEnum::PENDING);
            }
            return $query->where(function ($q) {
                $q->where('is_affiliate', 0)->orWhere('affiliate_status', '!=', \Botble\Ecommerce\Enums\AffiliateStatusEnum::PENDING);
            });
        }

        if ($key == 'no_referral') {
            if ($value == '1') {
                return $query->where(function ($q) {
                    $q->whereNull('referral_username')->orWhere('referral_username', '');
                });
            }
            return $query->whereNotNull('referral_username')->where('referral_username', '!=', '');
        }

        return parent::applyFilterCondition($query, $key, $operator, $value);
    }
}
