<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class SelInProg extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The sum of all Selected in-progress time for calls in the InProgress state. The InProgress state is when the call is a dial-out with the agent hearing ringback or other call progress tones.';
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
