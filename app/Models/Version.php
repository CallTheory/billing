<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Version extends Model
{
    public static int $major = 0;
    public static int $minor = 0;
    public static int $patch = 3;

    public static function getVersion(): string
    {
        return self::$major . '.' . self::$minor . '.' . self::$patch;
    }
}
