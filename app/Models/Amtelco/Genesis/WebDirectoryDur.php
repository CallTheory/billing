<?php

namespace App\Models\Amtelco\Genesis;

use Exception;

class WebDirectoryDur extends GenesisStat
{
    public static function amtelcoStatisticDefinition(): string
    {
        return 'The total of the amounts of time each user was logged into the IS Web application with an Agent ID that is linked to a Client. Agent IDs are linked to a Client by assigning the Agent ID and Client Number to a Listing in the Agent ID’s Default Directory Subject.';
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
