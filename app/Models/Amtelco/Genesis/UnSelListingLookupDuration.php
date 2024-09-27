<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class UnSelListingLookupDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Unselected time for calls that went to Listing Lookup.';
    }
    public function amtelcoSqlCommand(): string
    {
        return
            <<<TSQL
        select 'TODO';
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        return [];
    }
}
