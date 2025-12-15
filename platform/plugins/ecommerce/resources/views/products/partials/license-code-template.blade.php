<script type="text/template" id="license-code-template">
    <tr data-license-code-id="__ID__">
        <td>
            <input type="text"
                   name="license_codes[__ID__][code]"
                   value="__CODE__"
                   class="form-control license-code-input">
        </td>
        <td>
            {!! \Botble\Ecommerce\Enums\ProductLicenseCodeStatusEnum::AVAILABLE()->toHtml() !!}
        </td>
        <td>-</td>
        <td>
            <button type="button"
                    class="btn btn-sm btn-danger license-code-delete-btn"
                    data-license-code-id="__ID__">
                <x-core::icon name="ti ti-trash" />
                {{ trans('core/base::tables.delete') }}
            </button>
        </td>
    </tr>
</script>

<!-- Generate License Codes Modal -->
@php
    $modalId = 'license-code-generate-modal' . (isset($isVariation) && $isVariation ? '-variation' : '');
    $quantityId = 'license-code-quantity' . (isset($isVariation) && $isVariation ? '-variation' : '');
    $formatId = 'license-code-format' . (isset($isVariation) && $isVariation ? '-variation' : '');
    $patternId = 'license-code-pattern' . (isset($isVariation) && $isVariation ? '-variation' : '');
    $generateBtnId = 'generate-license-codes-btn' . (isset($isVariation) && $isVariation ? '-variation' : '');
    $customPatternGroupId = 'custom-pattern-group' . (isset($isVariation) && $isVariation ? '-variation' : '');
@endphp

<div class="modal fade" id="{{ $modalId }}" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">{{ trans('plugins/ecommerce::products.license_codes.generate_modal.title') }}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">{{ trans('plugins/ecommerce::products.license_codes.generate_modal.quantity') }}</label>
                    <input type="number" class="form-control license-code-quantity-input" id="{{ $quantityId }}" value="1" min="1" max="100">
                </div>
                <div class="mb-3">
                    <label class="form-label">{{ trans('plugins/ecommerce::products.license_codes.generate_modal.format') }}</label>
                    <select class="form-control license-code-format-select" id="{{ $formatId }}">
                        <option value="uuid">UUID (e.g., 550e8400-e29b-41d4-a716-446655440000)</option>
                        <option value="alphanumeric">Alphanumeric (e.g., ABC123DEF456)</option>
                        <option value="numeric">Numeric (e.g., 123456789012)</option>
                        <option value="custom">Custom Pattern</option>
                    </select>
                </div>
                <div class="mb-3 custom-pattern-group" id="{{ $customPatternGroupId }}" style="display: none;">
                    <label class="form-label">{{ trans('plugins/ecommerce::products.license_codes.generate_modal.custom_pattern') }}</label>
                    <input type="text" class="form-control license-code-pattern-input" id="{{ $patternId }}" placeholder="e.g., PROD-####-####">
                    <small class="form-text text-muted">
                        {{ trans('plugins/ecommerce::products.license_codes.generate_modal.pattern_help') }}
                    </small>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                    {{ trans('core/base::forms.cancel') }}
                </button>
                <button type="button" class="btn btn-primary generate-license-codes-btn" id="{{ $generateBtnId }}">
                    {{ trans('plugins/ecommerce::products.license_codes.generate_modal.generate') }}
                </button>
            </div>
        </div>
    </div>
</div>

<script>
    // Prevent multiple initialization of license code handlers
    if (typeof window.licenseCodeHandlersInitialized === 'undefined') {
        window.licenseCodeHandlersInitialized = true;

        $(document).ready(function() {
            let licenseCodeCounter = {{ $product ? $product->licenseCodes->count() : 0 }};

            // Initialize license codes management visibility
            function initializeLicenseCodesVisibility() {
                const generateLicenseCode = $('input[name="generate_license_code"]').is(':checked');
                const licenseCodeType = $('#license_code_type').val();
                const licenseCodesManagement = $('#license-codes-management');

                if (generateLicenseCode && licenseCodeType === 'pick_from_list') {
                    licenseCodesManagement.show();
                } else {
                    licenseCodesManagement.hide();
                }
            }

            // Initialize on page load
            initializeLicenseCodesVisibility();

            // Handle license code type change
            $(document).on('change', '#license_code_type', function() {
                const selectedType = $(this).val();
                const licenseCodesManagement = $('#license-codes-management');
                const generateLicenseCode = $('input[name="generate_license_code"]').is(':checked');

                if (generateLicenseCode && selectedType === 'pick_from_list') {
                    licenseCodesManagement.show();
                } else {
                    licenseCodesManagement.hide();
                }
            });

            // Handle generate license code checkbox change
            $(document).on('change', 'input[name="generate_license_code"]', function() {
                const isChecked = $(this).is(':checked');
                const licenseCodeOptions = $('#license-code-options');
                const licenseCodesManagement = $('#license-codes-management');

                if (isChecked) {
                    licenseCodeOptions.addClass('show');
                    // Check if pick_from_list is selected
                    if ($('#license_code_type').val() === 'pick_from_list') {
                        licenseCodesManagement.show();
                    }
                } else {
                    licenseCodeOptions.removeClass('show');
                    licenseCodesManagement.hide();
                }
            });

            // Add license code
            $(document).on('click', '.license-code-add-btn', function() {
                const template = $('#license-code-template').html();
                const newId = 'new_' + Date.now();
                const newRow = template
                    .replace(/__ID__/g, newId)
                    .replace(/__CODE__/g, '');

                $('#license-codes-table-body').append(newRow);
                licenseCodeCounter++;
            });

            // Delete license code
            $(document).on('click', '.license-code-delete-btn', function() {
                const licenseCodeId = $(this).data('license-code-id');
                const row = $(this).closest('tr');

                if (licenseCodeId.toString().startsWith('new_')) {
                    // New license code, just remove the row
                    row.remove();
                } else {
                    // Existing license code, mark for deletion
                    row.append('<input type="hidden" name="license_codes[' + licenseCodeId + '][_delete]" value="1">');
                    row.hide();
                }
            });

            // Generate license codes
            $(document).on('click', '.license-code-generate-btn', function() {
                // Find the appropriate modal - look for one that's not already shown
                let modal = $('[id^="license-code-generate-modal"]:not(.show)').first();
                if (!modal.length) {
                    modal = $('[id^="license-code-generate-modal"]').first();
                }

                if (modal.length) {
                    modal.modal('show');
                }
            });

            // Prevent license code modal from interfering with parent modals
            $(document).on('hidden.bs.modal', '[id^="license-code-generate-modal"]', function(e) {
                // Stop event propagation to prevent parent modal handlers from firing
                e.stopPropagation();
            });

            // Handle format change
            $(document).on('change', '.license-code-format-select', function() {
                const customPatternGroup = $(this).closest('.modal').find('.custom-pattern-group');
                if ($(this).val() === 'custom') {
                    customPatternGroup.show();
                } else {
                    customPatternGroup.hide();
                }
            });

            // Generate codes - Fixed to prevent multiple executions
            $(document).on('click', '.generate-license-codes-btn', function(e) {
                e.preventDefault();

                // Prevent multiple clicks
                if ($(this).hasClass('generating')) {
                    return;
                }

                $(this).addClass('generating');

                const currentModal = $(this).closest('.modal');
                const quantity = parseInt(currentModal.find('.license-code-quantity-input').val());
                const format = currentModal.find('.license-code-format-select').val();
                const pattern = currentModal.find('.license-code-pattern-input').val();

                // Find the correct table body - look for the one in the parent context
                let tableBody = $('#license-codes-table-body');

                // If we're in a variation modal, find the table body within the edit modal
                const editModal = $('#edit-product-variation-modal');
                if (editModal.length && editModal.hasClass('show')) {
                    const editModalTableBody = editModal.find('#license-codes-table-body');
                    if (editModalTableBody.length) {
                        tableBody = editModalTableBody;
                    }
                }

                // Track generated codes to prevent duplicates within this batch
                const generatedCodes = [];
                const existingCodes = [];

                // Get existing codes from the table
                tableBody.find('.license-code-input').each(function() {
                    const existingCode = $(this).val().trim();
                    if (existingCode) {
                        existingCodes.push(existingCode);
                    }
                });

                let attempts = 0;
                const maxAttempts = quantity * 10; // Prevent infinite loops

                while (generatedCodes.length < quantity && attempts < maxAttempts) {
                    attempts++;
                    const code = generateLicenseCode(format, pattern);

                    // Check for duplicates in existing codes and current batch
                    if (!existingCodes.includes(code) && !generatedCodes.includes(code)) {
                        generatedCodes.push(code);

                        const template = $('#license-code-template').html();
                        const newId = 'new_' + Date.now() + '_' + generatedCodes.length;
                        const newRow = template
                            .replace(/__ID__/g, newId)
                            .replace(/__CODE__/g, code);

                        tableBody.append(newRow);
                    }
                }

                // Show warning if we couldn't generate all requested codes
                if (generatedCodes.length < quantity) {
                    console.warn(`Could only generate ${generatedCodes.length} out of ${quantity} requested license codes due to duplicates.`);
                }

                // Hide the current modal
                currentModal.modal('hide');

                // Remove the generating class after a short delay
                setTimeout(() => {
                    $(this).removeClass('generating');
                }, 500);
            });

            function generateLicenseCode(format, pattern) {
                switch (format) {
                    case 'uuid':
                        return generateUUID();
                    case 'alphanumeric':
                        return generateAlphanumeric(12);
                    case 'numeric':
                        return generateNumeric(12);
                    case 'custom':
                        return generateCustomPattern(pattern);
                    default:
                        return generateUUID();
                }
            }

            function generateUUID() {
                return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
                    const r = Math.random() * 16 | 0;
                    const v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
            }

            function generateAlphanumeric(length) {
                const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
                let result = '';

                // Add some entropy from current timestamp to reduce duplicates
                const microtime = Date.now() * 1000 + performance.now();
                const entropy = Math.floor(microtime).toString(36).toUpperCase().slice(-3);
                result += entropy;

                // Fill remaining length with random characters
                for (let i = result.length; i < length; i++) {
                    result += chars.charAt(Math.floor(Math.random() * chars.length));
                }

                // If result is longer than desired length, truncate
                if (result.length > length) {
                    result = result.slice(0, length);
                }

                return result;
            }

            function generateNumeric(length) {
                // Add timestamp to make numeric codes more unique
                const timestamp = Date.now().toString().slice(-6); // Last 6 digits of timestamp
                let result = timestamp;

                // Fill remaining length with random digits
                for (let i = timestamp.length; i < length; i++) {
                    result += Math.floor(Math.random() * 10);
                }

                // If result is longer than desired length, truncate
                if (result.length > length) {
                    result = result.slice(0, length);
                }

                return result;
            }

            function generateCustomPattern(pattern) {
                // Add some randomness to custom patterns to reduce duplicates
                return pattern.replace(/#/g, () => Math.floor(Math.random() * 10))
                             .replace(/A/g, () => String.fromCharCode(65 + Math.floor(Math.random() * 26)))
                             .replace(/a/g, () => String.fromCharCode(97 + Math.floor(Math.random() * 26)));
            }
        });
    }
</script>
