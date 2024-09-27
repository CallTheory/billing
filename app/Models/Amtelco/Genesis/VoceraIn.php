<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class VoceraIn extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of incoming Vocera messages. This count includes replies and unsolicited Vocera messages.';
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
