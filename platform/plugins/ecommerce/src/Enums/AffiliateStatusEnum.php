<?php

namespace Botble\Ecommerce\Enums;

use Botble\Base\Facades\BaseHelper;
use Botble\Base\Supports\Enum;
use Illuminate\Support\HtmlString;

/**
 * @method static AffiliateStatusEnum PENDING()
 * @method static AffiliateStatusEnum APPROVED()
 * @method static AffiliateStatusEnum REJECTED()
 * @method static AffiliateStatusEnum SUSPENDED()
 */
class AffiliateStatusEnum extends Enum
{
    public const PENDING = 'pending';

    public const APPROVED = 'approved';

    public const REJECTED = 'rejected';

    public const SUSPENDED = 'suspended';

    public static $langPath = 'plugins/ecommerce::customer.affiliate_statuses';

    public function toHtml(): HtmlString|string
    {
        $color = match ($this->value) {
            self::PENDING => 'warning',
            self::APPROVED => 'success',
            self::REJECTED, self::SUSPENDED => 'danger',
            default => 'primary',
        };

        return BaseHelper::renderBadge($this->label(), $color);
    }
}
