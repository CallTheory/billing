<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class ListingLookupCalls extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of calls that went to Listing Lookup.';
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
