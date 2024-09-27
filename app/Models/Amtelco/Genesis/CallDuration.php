<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class CallDuration extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The total duration of all calls of all Call Types, including the time it took for the calls to connect to the modem, be answered, be on hold, be hung up, be on a conference call, sit on the agent’s screen, and be patched.';
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
