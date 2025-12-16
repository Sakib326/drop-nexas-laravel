@php
    Theme::layout('full-width');
@endphp

<div class="page-content pt-50 pb-150 affiliate-dashboard-page">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="dashboard-menu">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.dashboard') }}">
                                <i class="fi-rs-home"></i>
                                {{ __('Dashboard') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.products') }}">
                                <i class="fi-rs-shopping-bag"></i>
                                {{ __('Products') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.downline') }}">
                                <i class="fi-rs-users"></i>
                                {{ __('My Downline') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('affiliate.commissions') }}">
                                <i class="fi-rs-dollar"></i>
                                {{ __('Commissions') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="{{ route('affiliate.withdrawals') }}">
                                <i class="fi-rs-bank"></i>
                                {{ __('Withdrawals') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('customer.overview') }}">
                                <i class="fi-rs-user"></i>
                                {{ __('My Account') }}
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="{{ route('customer.logout') }}">
                                <i class="fi-rs-sign-out"></i>
                                {{ __('Logout') }}
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="tab-content account dashboard-content pl-50">
                    <div class="card">
                        <div class="card-header">
                            <h3 class="mb-0">{{ __('Request Withdrawal') }}</h3>
                        </div>
                        <div class="card-body">
                            {{-- Balance Info --}}
                            <div class="alert alert-success mb-4">
                                <div class="row text-center">
                                    <div class="col-md-12">
                                        <h5 class="mb-0">{{ __('Available Balance') }}</h5>
                                        <h2 class="mb-0 mt-2">{{ format_price($customer->available_balance ?? 0) }}
                                        </h2>
                                    </div>
                                </div>
                            </div>

                            @if (session('success'))
                                <div class="alert alert-success">
                                    {{ session('success') }}
                                </div>
                            @endif

                            @if (session('error'))
                                <div class="alert alert-danger">
                                    {{ session('error') }}
                                </div>
                            @endif

                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <ul class="mb-0">
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            @if ($customer->available_balance < $minimumWithdrawal)
                                <div class="alert alert-warning">
                                    <i class="fi-rs-info"></i>
                                    {{ __('Minimum withdrawal amount is :amount. Your current balance is not sufficient.', ['amount' => format_price($minimumWithdrawal)]) }}
                                </div>
                            @else
                                <form method="POST" action="{{ route('affiliate.withdrawal.store') }}"
                                    id="withdrawalForm">
                                    @csrf

                                    <div class="row">
                                        <div class="col-md-12 mb-4">
                                            <label class="form-label">{{ __('Withdrawal Amount') }} <span
                                                    class="text-danger">*</span></label>
                                            <input type="number" name="amount" class="form-control" step="0.01"
                                                min="{{ $minimumWithdrawal }}"
                                                max="{{ $customer->available_balance }}" required
                                                placeholder="{{ __('Enter amount') }}">
                                            <small
                                                class="text-muted">{{ __('Minimum: :min | Maximum: :max', ['min' => format_price($minimumWithdrawal), 'max' => format_price($customer->available_balance)]) }}</small>
                                        </div>

                                        <div class="col-md-12 mb-4">
                                            <label class="form-label">{{ __('Withdrawal Method') }} <span
                                                    class="text-danger">*</span></label>
                                            <select name="withdrawal_method" id="withdrawalMethod" class="form-control"
                                                required>
                                                <option value="">{{ __('Select Method') }}</option>
                                                <option value="bank">{{ __('Bank Transfer') }}</option>
                                                <option value="mfs">{{ __('Mobile Financial Service (MFS)') }}
                                                </option>
                                                <option value="cash">{{ __('Cash Pickup') }}</option>
                                            </select>
                                        </div>

                                        {{-- Bank Transfer Fields --}}
                                        <div id="bankFields" class="payment-fields" style="display: none;">
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Bank Name') }} <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="account_details[bank_name]"
                                                    class="form-control" placeholder="{{ __('Enter bank name') }}">
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Account Number') }} <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="account_details[account_number]"
                                                    class="form-control"
                                                    placeholder="{{ __('Enter account number') }}">
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Account Holder Name') }} <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="account_details[account_holder]"
                                                    class="form-control"
                                                    placeholder="{{ __('Enter account holder name') }}">
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Branch Name') }}</label>
                                                <input type="text" name="account_details[branch]"
                                                    class="form-control" placeholder="{{ __('Enter branch name') }}">
                                            </div>
                                        </div>

                                        {{-- MFS Fields --}}
                                        <div id="mfsFields" class="payment-fields" style="display: none;">
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('MFS Provider') }} <span
                                                        class="text-danger">*</span></label>
                                                <select name="account_details[mfs_provider]" class="form-control">
                                                    <option value="">{{ __('Select Provider') }}</option>
                                                    <option value="bKash">bKash</option>
                                                    <option value="Nagad">Nagad</option>
                                                    <option value="Rocket">Rocket</option>
                                                    <option value="Upay">Upay</option>
                                                    <option value="Other">{{ __('Other') }}</option>
                                                </select>
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Mobile Number') }} <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="account_details[mobile_number]"
                                                    class="form-control"
                                                    placeholder="{{ __('Enter mobile number') }}">
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Account Type') }} <span
                                                        class="text-danger">*</span></label>
                                                <select name="account_details[account_type]" class="form-control">
                                                    <option value="Personal">{{ __('Personal') }}</option>
                                                    <option value="Agent">{{ __('Agent') }}</option>
                                                </select>
                                            </div>
                                        </div>

                                        {{-- Cash Pickup Fields --}}
                                        <div id="cashFields" class="payment-fields" style="display: none;">
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Full Name') }} <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="account_details[full_name]"
                                                    class="form-control"
                                                    placeholder="{{ __('Enter your full name') }}">
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label class="form-label">{{ __('Phone Number') }} <span
                                                        class="text-danger">*</span></label>
                                                <input type="text" name="account_details[phone]"
                                                    class="form-control"
                                                    placeholder="{{ __('Enter phone number') }}">
                                            </div>
                                            <div class="col-md-12 mb-3">
                                                <label
                                                    class="form-label">{{ __('Preferred Pickup Location') }}</label>
                                                <textarea name="account_details[pickup_location]" class="form-control" rows="2"
                                                    placeholder="{{ __('Enter preferred pickup location') }}"></textarea>
                                            </div>
                                        </div>

                                        <div class="col-md-12 mb-3">
                                            <label class="form-label">{{ __('Additional Notes') }}</label>
                                            <textarea name="account_details[notes]" class="form-control" rows="3"
                                                placeholder="{{ __('Any additional information...') }}"></textarea>
                                        </div>

                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-primary btn-lg">
                                                <i class="fi-rs-paper-plane"></i>
                                                {{ __('Submit Withdrawal Request') }}
                                            </button>
                                            <a href="{{ route('affiliate.withdrawals') }}"
                                                class="btn btn-secondary btn-lg">
                                                {{ __('Cancel') }}
                                            </a>
                                        </div>
                                    </div>
                                </form>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const methodSelect = document.getElementById('withdrawalMethod');
        const bankFields = document.getElementById('bankFields');
        const mfsFields = document.getElementById('mfsFields');
        const cashFields = document.getElementById('cashFields');

        methodSelect.addEventListener('change', function() {
            // Hide all fields
            bankFields.style.display = 'none';
            mfsFields.style.display = 'none';
            cashFields.style.display = 'none';

            // Clear required attributes
            document.querySelectorAll('.payment-fields input, .payment-fields select').forEach(
            input => {
                input.removeAttribute('required');
            });

            // Show and set required for selected method
            if (this.value === 'bank') {
                bankFields.style.display = 'block';
                bankFields.querySelectorAll(
                        'input[name*="bank_name"], input[name*="account_number"], input[name*="account_holder"]'
                        )
                    .forEach(input => {
                        input.setAttribute('required', 'required');
                    });
            } else if (this.value === 'mfs') {
                mfsFields.style.display = 'block';
                mfsFields.querySelectorAll(
                        'select[name*="mfs_provider"], input[name*="mobile_number"], select[name*="account_type"]'
                        )
                    .forEach(input => {
                        input.setAttribute('required', 'required');
                    });
            } else if (this.value === 'cash') {
                cashFields.style.display = 'block';
                cashFields.querySelectorAll('input[name*="full_name"], input[name*="phone"]').forEach(
                    input => {
                        input.setAttribute('required', 'required');
                    });
            }
        });
    });
</script>
