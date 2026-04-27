<?php

namespace App\Listeners;

use Botble\Ecommerce\Models\Customer;
use Illuminate\Support\Facades\Log;

class SyncCustomerLevelName
{
    protected const DISTRIBUTION_CONFIG_PATH = 'config/commission_distribution.json';

    public function handle(Customer $customer): void
    {
        $levels = $this->getLevelsFromConfig();
        $desiredLevel = $this->calculateLevel($customer->lifetime_earnings, $levels);
        $desiredLevelName = $this->getLevelName($desiredLevel, $levels);

        if ((int) $customer->level === $desiredLevel && (string) $customer->level_name === $desiredLevelName) {
            return;
        }

        $customer->forceFill([
            'level' => $desiredLevel,
            'level_name' => $desiredLevelName,
        ])->saveQuietly();
    }

    protected function getLevelsFromConfig(): array
    {
        $configPath = base_path(self::DISTRIBUTION_CONFIG_PATH);

        if (! is_readable($configPath)) {
            Log::warning('Commission distribution config file not readable.', [
                'path' => $configPath,
            ]);

            return $this->getDefaultLevels();
        }

        $content = file_get_contents($configPath);

        if ($content === false) {
            Log::warning('Commission distribution config file could not be read.', [
                'path' => $configPath,
            ]);

            return $this->getDefaultLevels();
        }

        $decoded = json_decode($content, true);

        if (! is_array($decoded) || ! isset($decoded['levels'])) {
            Log::warning('Commission distribution config is invalid or missing levels.', [
                'path' => $configPath,
            ]);

            return $this->getDefaultLevels();
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

    protected function getDefaultLevels(): array
    {
        return [
            '1' => [
                'slug' => 'spark',
                'name' => 'Spark',
                'threshold' => 0,
            ],
            '2' => [
                'slug' => 'flare',
                'name' => 'Flare',
                'threshold' => 10000,
            ],
            '3' => [
                'slug' => 'blaze',
                'name' => 'Blaze',
                'threshold' => 30000,
            ],
            '4' => [
                'slug' => 'pathfinder',
                'name' => 'Pathfinder',
                'threshold' => 70000,
            ],
            '5' => [
                'slug' => 'global_thrive',
                'name' => 'Global Thrive',
                'threshold' => 1000000,
            ],
            '6' => [
                'slug' => 'galaxy_pulse',
                'name' => 'Galaxy Pulse',
                'threshold' => 10000000,
            ],
            '7' => [
                'slug' => 'empire_builder',
                'name' => 'Empire Builder',
                'threshold' => 100000000,
            ],
        ];
    }
}
