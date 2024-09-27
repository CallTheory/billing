<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class VoceraFail extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of Vocera messages that generated an error message.';
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
