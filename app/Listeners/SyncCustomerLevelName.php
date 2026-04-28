<?php

namespace App\Listeners;

use Botble\Ecommerce\Models\Customer;
use Illuminate\Support\Facades\Log;

class SyncCustomerLevelName
{
    protected const DISTRIBUTION_CONFIG_PATH = 'config/commission_distribution.json';

    public function handle(Customer $customer): void
    {
        Log::info("SyncCustomerLevelName triggered for customer #{$customer->id}", [
            'current_level' => $customer->level,
            'current_level_name' => $customer->level_name,
            'lifetime_earnings' => $customer->lifetime_earnings,
        ]);

        $levels = $this->getLevelsFromConfig();
        $desiredLevel = $this->calculateLevel($customer->lifetime_earnings, $levels);
        $desiredLevelName = $this->getLevelName($desiredLevel, $levels);

        Log::info("Calculated level for customer #{$customer->id}", [
            'desired_level' => $desiredLevel,
            'desired_level_name' => $desiredLevelName,
        ]);

        if ((int) $customer->level === $desiredLevel && (string) $customer->level_name === $desiredLevelName) {
            Log::info("No level update needed for customer #{$customer->id}");
            return;
        }

        Log::info("Updating level for customer #{$customer->id}", [
            'from_level' => $customer->level,
            'to_level' => $desiredLevel,
            'from_name' => $customer->level_name,
            'to_name' => $desiredLevelName,
        ]);

        $customer->forceFill([
            'level' => $desiredLevel,
            'level_name' => $desiredLevelName,
        ])->saveQuietly();

        Log::info("Level updated successfully for customer #{$customer->id}");
    }

    protected function getLevelsFromConfig(): array
    {
        $configPath = base_path(self::DISTRIBUTION_CONFIG_PATH);

        if (! is_readable($configPath)) {
            throw new \RuntimeException("Commission distribution config file not readable: {$configPath}");
        }

        $content = file_get_contents($configPath);

        if ($content === false) {
            throw new \RuntimeException("Commission distribution config file could not be read: {$configPath}");
        }

        $decoded = json_decode($content, true);

        if (! is_array($decoded) || ! isset($decoded['levels'])) {
            throw new \RuntimeException("Commission distribution config is invalid or missing levels: {$configPath}");
        }

        return $decoded['levels'];
    }

    protected function calculateLevel(float $earnings, array $levels): int
    {
        // Sort levels in reverse order by their numeric key
        $levelKeys = array_keys($levels);
        rsort($levelKeys);

        foreach ($levelKeys as $levelKey) {
            $levelData = $levels[$levelKey];
            if ($earnings >= ($levelData['threshold'] ?? 0)) {
                return (int) $levelKey;
            }
        }

        return 1;
    }

    protected function getLevelName(int $level, array $levels): string
    {
        $levelKey = (string) $level;
        if (isset($levels[$levelKey])) {
            return $levels[$levelKey]['name'] ?? 'Spark';
        }
        return 'Spark';
    }
}
