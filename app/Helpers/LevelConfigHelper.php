<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Log;

class LevelConfigHelper
{
    protected const DISTRIBUTION_CONFIG_PATH = 'config/commission_distribution.json';
    protected static ?array $cachedConfig = null;

    /**
     * Get all levels from JSON config with caching
     */
    public static function getLevels(): array
    {
        if (self::$cachedConfig === null) {
            self::$cachedConfig = self::loadConfig();
        }

        return self::$cachedConfig['levels'] ?? [];
    }

    /**
     * Get level data by level number
     */
    public static function getLevelData(int $level): array
    {
        $levels = self::getLevels();
        $levelKey = (string) $level;

        return $levels[$levelKey] ?? [
            'slug' => 'spark',
            'name' => 'Spark',
            'threshold' => 0,
        ];
    }

    /**
     * Get level name by level number
     */
    public static function getLevelName(int $level): string
    {
        return self::getLevelData($level)['name'] ?? 'Spark';
    }

    /**
     * Get level slug by level number
     */
    public static function getLevelSlug(int $level): string
    {
        return self::getLevelData($level)['slug'] ?? 'spark';
    }

    /**
     * Get level threshold by level number
     */
    public static function getLevelThreshold(int $level): float
    {
        return (float) (self::getLevelData($level)['threshold'] ?? 0);
    }

    /**
     * Get level by slug
     */
    public static function getLevelBySlug(string $slug): ?int
    {
        $levels = self::getLevels();

        foreach ($levels as $level => $data) {
            if (($data['slug'] ?? '') === $slug) {
                return (int) $level;
            }
        }

        return null;
    }

    /**
     * Get badge color for level
     */
    public static function getLevelBadgeColor(int $level): string
    {
        $colors = [
            1 => 'secondary',  // Spark
            2 => 'info',       // Flare
            3 => 'primary',    // Blaze
            4 => 'success',    // Pathfinder
            5 => 'warning',    // Global Thrive
            6 => 'danger',     // Galaxy Pulse
            7 => 'dark',       // Empire Builder
        ];

        return $colors[$level] ?? 'secondary';
    }

    /**
     * Check if level is eligible for specific pool
     */
    public static function isEligibleForPool(int $level, string $poolSlug): bool
    {
        $config = self::loadConfig();
        $pools = $config['pools'] ?? [];

        if (!isset($pools[$poolSlug])) {
            return false;
        }

        $eligibleSlugs = $pools[$poolSlug]['eligible_level_slugs'] ?? [];
        $levelSlug = self::getLevelSlug($level);

        return in_array($levelSlug, $eligibleSlugs);
    }

    /**
     * Get pool configuration
     */
    public static function getPoolConfig(): array
    {
        $config = self::loadConfig();
        return $config['pools'] ?? [];
    }

    /**
     * Get referral configuration
     */
    public static function getReferralConfig(): array
    {
        $config = self::loadConfig();
        return $config['referral'] ?? [];
    }

    /**
     * Get commission type label from JSON config
     */
    public static function getCommissionLabel(string $commissionType): string
    {
        $config = self::loadConfig();
        $labels = $config['commission_labels'] ?? [];

        return $labels[$commissionType] ?? ucwords(str_replace('_', ' ', $commissionType));
    }

    /**
     * Load and cache configuration
     */
    protected static function loadConfig(): array
    {
        $configPath = base_path(self::DISTRIBUTION_CONFIG_PATH);

        if (!is_readable($configPath)) {
            throw new \RuntimeException("Commission distribution config file not readable: {$configPath}");
        }

        $content = file_get_contents($configPath);

        if ($content === false) {
            throw new \RuntimeException("Commission distribution config file could not be read: {$configPath}");
        }

        $decoded = json_decode($content, true);

        if (!is_array($decoded)) {
            throw new \RuntimeException("Commission distribution config is invalid JSON: {$configPath}");
        }

        return $decoded;
    }

    /**
     * Clear cache (useful for testing)
     */
    public static function clearCache(): void
    {
        self::$cachedConfig = null;
    }
}
