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
            SELECT msgMessages.cltID,
                cltClients.cltID,
                cltClients.ClientNumber,
                cltClients.BillingCode,
                cltClients.ClientName,
                msgMessages.*,
                msgHistories.*
                FROM msgHistories
             JOIN msgMessages  ON msgHistories.msgId = msgMessages.msgId
             left join cltClients on msgMessages.cltId = cltClients.cltId
             where msgHistories.histId = ?
             and msgHistories.DispositionId = 1
        TSQL;
    }

    public function amtelcoSqlParams(): array
    {
        return [];
    }
}
