<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SelFetchDurationCap extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Fetch time after applying the TimeCap limit to each individual call. A detailed breakdown of the SecTimeCap and FetchTimeCap values and how they are affected by the TimeCap parameter is provided in the Genesis – TimeCap Proof report.';
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
