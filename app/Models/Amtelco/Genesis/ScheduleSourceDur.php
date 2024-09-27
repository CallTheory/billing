<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class ScheduleSourceDur extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The total duration of all MergeComm jobs triggered by the System Schedule.';
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
