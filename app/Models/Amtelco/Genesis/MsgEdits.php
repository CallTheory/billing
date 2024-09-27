<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MsgEdits extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The number of message edits performed.';
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
