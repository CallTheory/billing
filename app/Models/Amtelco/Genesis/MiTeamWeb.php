<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class MiTeamWeb extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'A count of the number of times users logged into the miTeamWeb application with an Agent ID that is linked to a Client. Agent IDs are linked to a Client by assigning the Agent ID and Client Number to a Listing in the Agent ID’s Default Directory Subject.';
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
