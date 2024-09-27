<?php

namespace App\Models\Amtelco\Genesis;

use Exception;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

abstract class GenesisStat extends Model
{
    use HasFactory;
    abstract public static function amtelcoStatisticDefinition(): string;
    abstract public function amtelcoSqlCommand(): string;
    abstract public function amtelcoSqlParams(): array;
}
