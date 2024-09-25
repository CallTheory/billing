-- noinspection SqlNoDataSourceInspectionForFile

-- changes
-- 08-17-2020 new call kinds
-- 05-08-2018 Added answered and abandoned, Added TimeCap parameter
-- updated on 04-03-2018 Time Cap for selected fetch and Sec time
-- updated on 11-16-2017 removed overdials from dialouts
-- updated on 11-14-2017 Dir setups per client
-- updated on 10-06-2017 added Web Logins
-- updated on 09-28-2017 added MergeComm sources
-- updated on 09-12-2017 added SelPatches UnSelPatches SelSecCalls SelCheckCalls SecTalktime CheckTalktime NonLiveTalktime
-- updated on 06-05-2017 m instead of h in join
-- updated on 08-09-2017 call kind cases order of fields needs to match above table

SET STATISTICS IO ON
DECLARE @StartClient numeric(18,0),
@EndClient numeric(18,0),
@StartDate datetime,
@EndDate datetime,
@TimeCap int

--report parameters
SET @StartDate = {?StartDate}
SET @EndDate = {?EndDate}
SET @StartClient = {?StartClient}
SET @EndClient = {?EndClient}
SET @TimeCap = {?TimeCap}

--test parameters
--SET @StartClient = 1
--SET @EndClient = 9999999999
--SET @StartDate = '2020-08-17 00:00:00'
--SET @EndDate = '2020-08-17 23:59:59'

--test parameters MergeComm data
--SET @StartClient = 2174
--SET @EndClient = 2174
--SET @StartDate = '2017-09-19 00:00:00'
--SET @EndDate = '2017-09-28 00:00:00'
--SET @TimeCap = 10

-- Web Logins 14
--SET @StartClient = 2130
--SET @EndClient = 2130
--SET @STARTDATE = '2017-10-5 15:00:00'
--SET @ENDDATE = '2017-10-5 18:00:00'
--SET @TimeCap = 10

--test parameters Avia Testing
--SET @StartClient = 117
--SET @EndClient = 117
--SET @StartDate = '2017-01-01 00:00:00'
--SET @EndDate = '2017-11-15 00:00:00'
--SET @TimeCap = 0

IF OBJECT_ID('tempdb..#RuleThemAll') IS NOT NULL
BEGIN
DROP TABLE #RuleThemAll
END

CREATE TABLE #RuleThemAll (
 cltID int NOT NULL
 PRIMARY KEY CLUSTERED
(
    cltID ASC
) ON [PRIMARY],
     ClientNumber decimal(10,0) NOT NULL
    ,ClientName varchar(255) NOT NULL
    ,BillingCode nvarchar(150) NOT NULL
    ,ClientSetups int NOT NULL DEFAULT 0
    ,ClientSetupsDur bigint NOT NULL DEFAULT 0
    ,ScriptEdits int NOT NULL DEFAULT 0
    ,ScriptEditsDur bigint NOT NULL DEFAULT 0
    ,Dispatches int NOT NULL DEFAULT 0
    ,DispSaved int NOT NULL DEFAULT 0
    ,DispDelivered int NOT NULL DEFAULT 0
    ,DispDeleted int NOT NULL DEFAULT 0
    ,DispDuration decimal(10,0) NOT NULL Default 0
    ,MsgEdits int NOT NULL DEFAULT 0
    ,MsgDlvrd int NOT NULL DEFAULT 0
    ,MsgTaken int NOT NULL DEFAULT 0
    ,Dialouts int NOT NULL DEFAULT 0
    ,DialoutDur decimal(10,0) NOT NULL Default 0
--,ListingDesc nvarchar(1000) NOT NULL DEFAULT 'So poorly defined that Im leaving it out'
    ,Email int NOT NULL DEFAULT 0
    ,EmailFail int NOT NULL DEFAULT 0
    ,EmailIn int NOT NULL DEFAULT 0
    ,Msm int NOT NULL DEFAULT 0
    ,MsmFail int NOT NULL DEFAULT 0
    ,MsmIn int NOT NULL DEFAULT 0
    ,Sms int NOT NULL DEFAULT 0
    ,SmsFail int NOT NULL DEFAULT 0
    ,SmsIn int NOT NULL DEFAULT 0
    ,Snpp int NOT NULL DEFAULT 0
    ,SnppFail int NOT NULL DEFAULT 0
    ,SnppIn int NOT NULL DEFAULT 0
    ,Tap int NOT NULL DEFAULT 0
    ,TapFail int NOT NULL DEFAULT 0
    ,TapIn int NOT NULL DEFAULT 0
    ,Wctp int NOT NULL DEFAULT 0
    ,WctpFail int NOT NULL DEFAULT 0
    ,WctpIn int NOT NULL DEFAULT 0
    ,Vocera int NOT NULL DEFAULT 0
    ,VoceraFail int NOT NULL DEFAULT 0
    ,VoceraIn int NOT NULL DEFAULT 0
    ,Cisco int NOT NULL DEFAULT 0
    ,CiscoFail int NOT NULL DEFAULT 0
    ,CiscoIn int NOT NULL DEFAULT 0
    ,Fax int NOT NULL DEFAULT 0
    ,FaxFail int NOT NULL DEFAULT 0
    ,FaxIn int NOT NULL DEFAULT 0
    ,UserTaken int NOT NULL DEFAULT 0
    ,SysTaken int NOT NULL DEFAULT 0
    ,InfTaken int NOT NULL DEFAULT 0
    ,SmsTaken int NOT NULL DEFAULT 0
    ,TapTaken int NOT NULL DEFAULT 0
    ,MsmTaken int NOT NULL DEFAULT 0
    ,SnppTaken int NOT NULL DEFAULT 0
    ,WctpTaken int NOT NULL DEFAULT 0
    ,EmailTaken int NOT NULL DEFAULT 0
    ,VmTaken int NOT NULL DEFAULT 0
    ,FaxTaken int NOT NULL DEFAULT 0
    ,VoceraTaken int NOT NULL DEFAULT 0
    ,Hl7Taken int NOT NULL DEFAULT 0
    ,MergeCommTaken int NOT NULL DEFAULT 0
    ,TapTermTaken int NOT NULL DEFAULT 0
    ,AutoTaken int NOT NULL DEFAULT 0
    ,CiscoTaken int NOT NULL DEFAULT 0
    ,SmtpTaken int NOT NULL DEFAULT 0

    ,UserDelivered int NOT NULL DEFAULT 0
    ,SysDelivered int NOT NULL DEFAULT 0
    ,InfDelivered int NOT NULL DEFAULT 0
    ,SmsDelivered int NOT NULL DEFAULT 0
    ,TapDelivered int NOT NULL DEFAULT 0
    ,MsmDelivered int NOT NULL DEFAULT 0
    ,SnppDelivered int NOT NULL DEFAULT 0
    ,WctpDelivered int NOT NULL DEFAULT 0
    ,EmailDelivered int NOT NULL DEFAULT 0
    ,VmDelivered int NOT NULL DEFAULT 0
    ,FaxDelivered int NOT NULL DEFAULT 0
    ,VoceraDelivered int NOT NULL DEFAULT 0
    ,Hl7Delivered int NOT NULL DEFAULT 0
    ,MergeCommDelivered int NOT NULL DEFAULT 0
    ,TapTermDelivered int NOT NULL DEFAULT 0
    ,AutoDelivered int NOT NULL DEFAULT 0
    ,CiscoDelivered int NOT NULL DEFAULT 0
    ,SmtpDelivered int NOT NULL DEFAULT 0
    ,UserUrgent int NOT NULL DEFAULT 0
    ,SysUrgent int NOT NULL DEFAULT 0
    ,InfUrgent int NOT NULL DEFAULT 0
    ,SmsUrgent int NOT NULL DEFAULT 0
    ,TapUrgent int NOT NULL DEFAULT 0
    ,MsmUrgent int NOT NULL DEFAULT 0
    ,SnppUrgent int NOT NULL DEFAULT 0
    ,WctpUrgent int NOT NULL DEFAULT 0
    ,EmailUrgent int NOT NULL DEFAULT 0
    ,VmUrgent int NOT NULL DEFAULT 0
    ,FaxUrgent int NOT NULL DEFAULT 0
    ,VoceraUrgent int NOT NULL DEFAULT 0
    ,Hl7Urgent int NOT NULL DEFAULT 0
    ,MergeCommUrgent int NOT NULL DEFAULT 0
    ,TapTermUrgent int NOT NULL DEFAULT 0
    ,AutoUrgent int NOT NULL DEFAULT 0
    ,CiscoUrgent int NOT NULL DEFAULT 0
    ,SmtpUrgent int NOT NULL DEFAULT 0
    ,UserUrgDelivered int NOT NULL DEFAULT 0
    ,SysUrgDelivered int NOT NULL DEFAULT 0
    ,InfUrgDelivered int NOT NULL DEFAULT 0
    ,SmsUrgDelivered int NOT NULL DEFAULT 0
    ,TapUrgDelivered int NOT NULL DEFAULT 0
    ,MsmUrgDelivered int NOT NULL DEFAULT 0
    ,SnppUrgDelivered int NOT NULL DEFAULT 0
    ,WctpUrgDelivered int NOT NULL DEFAULT 0
    ,EmailUrgDelivered int NOT NULL DEFAULT 0
    ,VmUrgDelivered int NOT NULL DEFAULT 0
    ,FaxUrgDelivered int NOT NULL DEFAULT 0
    ,VoceraUrgDelivered int NOT NULL DEFAULT 0
    ,Hl7UrgDelivered int NOT NULL DEFAULT 0
    ,MergeCommUrgDelivered int NOT NULL DEFAULT 0
    ,TapTermUrgDelivered int NOT NULL DEFAULT 0
    ,AutoUrgDelivered int NOT NULL DEFAULT 0
    ,CiscoUrgDelivered int NOT NULL DEFAULT 0
    ,SmtpUrgDelivered int NOT NULL DEFAULT 0

    ,Calls int NOT NULL DEFAULT 0
    ,CallDuration bigint NOT NULL DEFAULT 0

    ,SecCalls int NOT NULL DEFAULT 0
    ,CheckCalls int NOT NULL DEFAULT 0
    ,FetchCalls int NOT NULL DEFAULT 0
    ,SchedCalls int NOT NULL DEFAULT 0
    ,IVRCalls int NOT NULL DEFAULT 0
    ,WebScrCalls int NOT NULL DEFAULT 0
    ,VMCalls int NOT NULL DEFAULT 0
    ,AutoCalls int NOT NULL DEFAULT 0
    ,AnnCalls int NOT NULL DEFAULT 0
    ,MCommCalls int NOT NULL DEFAULT 0
    ,PgConfirmCalls int NOT NULL DEFAULT 0
    ,SmartPgCalls int NOT NULL DEFAULT 0
    ,CngClientCalls int NOT NULL DEFAULT 0
    ,AudioCalls int NOT NULL DEFAULT 0
    ,RaulandCalls int NOT NULL DEFAULT 0

    ,SelDisc bigint NOT NULL DEFAULT 0
    ,UnSelDisc bigint NOT NULL DEFAULT 0
    ,SelRing bigint NOT NULL DEFAULT 0
    ,UnSelRing bigint NOT NULL DEFAULT 0
    ,SelTalk bigint NOT NULL DEFAULT 0
    ,UnSelTalk bigint NOT NULL DEFAULT 0
    ,SelTalk1 bigint NOT NULL DEFAULT 0
    ,UnSelTalk1 bigint NOT NULL DEFAULT 0
    ,SelTalk2 bigint NOT NULL DEFAULT 0
    ,UnSelTalk2 bigint NOT NULL DEFAULT 0
    ,SelConf bigint NOT NULL DEFAULT 0
    ,UnSelConf bigint NOT NULL DEFAULT 0
    ,SelHold bigint NOT NULL DEFAULT 0
    ,UnSelHold bigint NOT NULL DEFAULT 0
    ,SelInProg bigint NOT NULL DEFAULT 0
    ,UnSelInProg bigint NOT NULL DEFAULT 0
    ,SelVM bigint NOT NULL DEFAULT 0
    ,UnSelVM bigint NOT NULL DEFAULT 0
    ,SelAuto bigint NOT NULL DEFAULT 0
    ,UnSelAuto bigint NOT NULL DEFAULT 0
    ,SelOutboundQueue bigint NOT NULL DEFAULT 0
    ,UnSelOutboundQueue bigint NOT NULL DEFAULT 0
    ,SelAutoHold bigint NOT NULL DEFAULT 0
    ,UnSelAutoHold bigint NOT NULL DEFAULT 0
    ,SelPatch bigint NOT NULL DEFAULT 0
    ,UnSelPatch bigint NOT NULL DEFAULT 0

    ,SecDuration bigint NOT NULL DEFAULT 0
    ,SelSecDuration bigint NOT NULL DEFAULT 0

    ,CheckDuration bigint NOT NULL DEFAULT 0
    ,SelCheckDuration bigint NOT NULL DEFAULT 0

    ,FetchDuration bigint NOT NULL DEFAULT 0
    ,SelFetchDuration bigint NOT NULL DEFAULT 0

    ,SchedDuration bigint NOT NULL DEFAULT 0
    ,SelSchedDuration bigint NOT NULL DEFAULT 0

    ,IVRDuration bigint NOT NULL DEFAULT 0
    ,SelIVRDuration bigint NOT NULL DEFAULT 0

    ,WebScrDuration bigint NOT NULL DEFAULT 0
    ,SelWebScrDuration bigint NOT NULL DEFAULT 0

    ,VMDuration bigint NOT NULL DEFAULT 0
    ,SelVMDuration bigint NOT NULL DEFAULT 0

    ,AutoDuration bigint NOT NULL DEFAULT 0
    ,SelAutoDuration bigint NOT NULL DEFAULT 0

    ,AnnDuration bigint NOT NULL DEFAULT 0
    ,SelAnnDuration bigint NOT NULL DEFAULT 0

    ,MCommDuration bigint NOT NULL DEFAULT 0
    ,SelMCommDuration bigint NOT NULL DEFAULT 0

    ,PgConfirmDuration bigint NOT NULL DEFAULT 0
    ,SelPgConfirmDuration bigint NOT NULL DEFAULT 0

    ,SmartPgDuration bigint NOT NULL DEFAULT 0
    ,SelSmartPgDuration bigint NOT NULL DEFAULT 0

    ,CngClientDuration bigint NOT NULL DEFAULT 0
    ,SelCngClientDuration bigint NOT NULL DEFAULT 0

    ,AudioDuration bigint NOT NULL DEFAULT 0
    ,SelAudioDuration bigint NOT NULL DEFAULT 0

    ,RaulandDuration bigint NOT NULL DEFAULT 0
    ,SelRaulandDuration bigint NOT NULL DEFAULT 0

    ,SelPatches bigint NOT NULL DEFAULT 0
    ,UnSelPatches bigint NOT NULL DEFAULT 0

    ,SelSecCalls bigint NOT NULL DEFAULT 0
    ,SelCheckCalls bigint NOT NULL DEFAULT 0

    ,SecTalkTime bigint NOT NULL DEFAULT 0
    ,CheckTalkTime bigint NOT NULL DEFAULT 0
    ,NonLiveTalkTime bigint NOT NULL DEFAULT 0

-- MergeComm
    ,OtherSource int NOT NULL DEFAULT 0
    ,ScriptSource int NOT NULL DEFAULT 0
    ,ScheduleSource int NOT NULL DEFAULT 0
    ,PhoneSource int NOT NULL DEFAULT 0
    ,SmsSource int NOT NULL DEFAULT 0
    ,MsmSource int NOT NULL DEFAULT 0
    ,Hl7Source int NOT NULL DEFAULT 0
    ,SmtpSource int NOT NULL DEFAULT 0
    ,EmailSource int NOT NULL DEFAULT 0
    ,WctpSource int NOT NULL DEFAULT 0
    ,VoceraSource int NOT NULL DEFAULT 0
    ,FaxSource int NOT NULL DEFAULT 0
    ,TapSource int NOT NULL DEFAULT 0
    ,SnppSource int NOT NULL DEFAULT 0
    ,RaulandBorgSource int NOT NULL DEFAULT 0
    ,WebServiceSource int NOT NULL DEFAULT 0

    ,OtherSourceDur bigint NOT NULL DEFAULT 0
    ,ScriptSourceDur bigint NOT NULL DEFAULT 0
    ,ScheduleSourceDur bigint NOT NULL DEFAULT 0
    ,PhoneSourceDur bigint NOT NULL DEFAULT 0
    ,SmsSourceDur bigint NOT NULL DEFAULT 0
    ,MsmSourceDur bigint NOT NULL DEFAULT 0
    ,Hl7SourceDur bigint NOT NULL DEFAULT 0
    ,SmtpSourceDur bigint NOT NULL DEFAULT 0
    ,EmailSourceDur bigint NOT NULL DEFAULT 0
    ,WctpSourceDur bigint NOT NULL DEFAULT 0
    ,VoceraSourceDur bigint NOT NULL DEFAULT 0
    ,FaxSourceDur bigint NOT NULL DEFAULT 0
    ,TapSourceDur bigint NOT NULL DEFAULT 0
    ,SnppSourceDur bigint NOT NULL DEFAULT 0
    ,RaulandBorgSourceDur int NOT NULL DEFAULT 0
    ,WebServiceSourceDur int NOT NULL DEFAULT 0

    ,WebDirectory int NOT NULL DEFAULT 0
    ,WebMessaging int NOT NULL DEFAULT 0
    ,MiTeamWeb  int NOT NULL DEFAULT 0

    ,WebDirectoryDur  bigint NOT NULL DEFAULT 0
    ,WebMessagingDur  bigint NOT NULL DEFAULT 0
    ,MiTeamWebDur  bigint NOT NULL DEFAULT 0
    ,DirSetups     int NOT NULL DEFAULT 0
    ,DirSetupsDuration bigint NOT NULL DEFAULT 0

    ,SelSecDurationCap bigint NOT NULL DEFAULT 0
    ,SelFetchDurationCap bigint NOT NULL DEFAULT 0

    ,AnsweredCalls bigint NOT NULL DEFAULT 0
    ,AbandonedCalls bigint NOT NULL DEFAULT 0

    ,AutoAttendantCalls int NOT NULL DEFAULT 0
    ,ListingLookupCalls int NOT NULL DEFAULT 0
    ,DispatchCalls int NOT NULL DEFAULT 0
    ,ParkOrbitCalls int NOT NULL DEFAULT 0
    ,VMCallBackCalls int NOT NULL DEFAULT 0
    ,CueCalls int NOT NULL DEFAULT 0
    ,[RepeatCalls] int NOT NULL DEFAULT 0
    ,ConfBridgeCalls int NOT NULL DEFAULT 0
    ,OrbitCalls int NOT NULL DEFAULT 0

    ,AutoAttendantDuration bigint NOT NULL DEFAULT 0
    ,UnSelAutoAttendantDuration  bigint NOT NULL DEFAULT 0
    ,ListingLookupDuration  bigint NOT NULL DEFAULT 0
    ,UnSelListingLookupDuration  bigint NOT NULL DEFAULT 0
    ,DispatchDuration  bigint NOT NULL DEFAULT 0
    ,UnSelDispatchDuration  bigint NOT NULL DEFAULT 0
    ,ParkOrbitDuration  bigint NOT NULL DEFAULT 0
    ,UnSelParkOrbitDuration  bigint NOT NULL DEFAULT 0
    ,VMCallBackDuration  bigint NOT NULL DEFAULT 0
    ,UnSelVMCallBackDuration  bigint NOT NULL DEFAULT 0
    ,CueDuration  bigint NOT NULL DEFAULT 0
    ,UnSelCueDuration  bigint NOT NULL DEFAULT 0
    ,[RepeatDuration]  bigint NOT NULL DEFAULT 0
    ,[UnSelRepeatDuration]  bigint NOT NULL DEFAULT 0
    ,ConfBridgeDuration  bigint NOT NULL DEFAULT 0
    ,UnSelConfBridgeDuration  bigint NOT NULL DEFAULT 0
    ,OrbitDuration   bigint NOT NULL DEFAULT 0
    ,UnSelOrbitDuration  bigint NOT NULL DEFAULT 0

    ,UNIQUE (ClientNumber)
)

    INSERT INTO #RuleThemAll (cltID, ClientNumber, ClientName, BillingCode)
SELECT cltID, ClientNumber, ClientName, BillingCode
FROM cltClients
WHERE ClientNumber >= @StartClient AND ClientNumber <= @EndClient;

WITH ClientSetups (cltID, Setups, Duration) AS
         (
             SELECT CM.cltID, COUNT(CM.cltID), SUM(CM.Duration) FROM statClientMaintenance CM
                                                                         JOIN #RuleThemAll R ON CM.cltID = R.cltID
             WHERE CM.Stamp BETWEEN @StartDate AND @EndDate AND CM.Type=0
             GROUP BY CM.cltID
         )

    MERGE INTO #RuleThemAll
USING ClientSetups
ON #RuleThemAll.cltID = ClientSetups.cltID
    WHEN MATCHED THEN
UPDATE SET ClientSetups = ClientSetups.Setups, ClientSetupsDur= ClientSetups.Duration;

WITH ScriptEdits (cltID, Setups, Duration) AS
         (
             SELECT CM.cltID, COUNT(CM.cltID), SUM(CM.Duration) FROM statClientMaintenance CM
                                                                         JOIN #RuleThemAll R ON CM.cltID = R.cltID
             WHERE CM.Stamp BETWEEN @StartDate AND @EndDate AND CM.Type=1
             GROUP BY CM.cltID
         )

    MERGE INTO #RuleThemAll
USING ScriptEdits
ON #RuleThemAll.cltID = ScriptEdits.cltID
    WHEN MATCHED THEN
UPDATE SET ScriptEdits = ScriptEdits.Setups, ScriptEditsDur= ScriptEdits.Duration;

WITH DispatchCount (cltID, Total) AS
         (
             SELECT DA.cltID, COUNT(DA.cltID) FROM statDispatchAdded DA
                                                       JOIN #RuleThemAll R ON R.cltID = DA.cltID
             WHERE DA.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY DA.cltID
         )

    MERGE INTO #RuleThemAll
USING DispatchCount
ON #RuleThemAll.cltID=DispatchCount.cltID
    WHEN MATCHED THEN
UPDATE SET Dispatches = DispatchCount.Total;

WITH DispatchReasons (cltID, Saved, Delivered, Deleted, Duration) AS
         (
             SELECT DA.cltID,
                    'Saved' = SUM(CASE DD.Reason WHEN 0 THEN 1 ELSE 0 END),
                    'Delivered' = SUM(CASE DD.Reason WHEN 1 THEN 1 ELSE 0 END),
                    'Deleted' = SUM(CASE DD.Reason WHEN 2 THEN 1 ELSE 0 END),
                    SUM(CAST(DATEDIFF(SS, DA.Timestamp , DD.Timestamp) AS decimal(18,0))) AS Duration
             FROM statDispatchDeleted DD
                      JOIN statDispatchAdded DA ON DA.dispID = DD.dispID
                      JOIN #RuleThemAll R ON R.cltID = DA.cltID
             WHERE DA.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY DA.cltID
         )

    MERGE INTO #RuleThemAll
USING DispatchReasons
ON #RuleThemAll.cltID = DispatchReasons.cltID
    WHEN MATCHED THEN
UPDATE SET DispSaved = DispatchReasons.Saved, DispDelivered = DispatchReasons.Delivered, DispDeleted = DispatchReasons.Deleted, DispDuration=DispatchReasons.Duration;

WITH Histories (cltID, Edits, Delivered, Taken) AS
         (
             SELECT M.cltID,
                    'Edits'=SUM(CASE H.DispositionID WHEN 1 THEN 1 ELSE 0 END),
                    'Delivered'=SUM(CASE H.DispositionID WHEN 2 THEN 1 ELSE 0 END),
                    'Taken'=SUM(CASE H.DispositionID WHEN 0 THEN 1 ELSE 0 END)
             FROM msgHistories H
                      JOIN msgMessages M  ON H.msgId = M.msgId
                      JOIN #RuleThemAll R ON R.cltID = M.cltID
             WHERE H.Stamp BETWEEN @StartDate AND @EndDate
             GROUP BY M.cltID
         )

    MERGE INTO #RuleThemAll
USING Histories
ON #RuleThemAll.cltID = Histories.cltID
    WHEN MATCHED THEN
UPDATE SET MsgEdits = Histories.Edits, MsgDlvrd = Histories.Delivered, MsgTaken = Histories.Taken;

WITH Dialouts (cltID, Total, Duration) AS
         (
             SELECT D.cltID, COUNT(D.cltID), SUM(D.Duration)
             FROM statDialouts D
                      JOIN #RuleThemAll R ON R.cltID = D.cltID
             WHERE D.Timestamp BETWEEN @StartDate AND @EndDate
               AND Overdial = 0
             GROUP BY D.cltID
         )

    MERGE INTO #RuleThemAll
USING Dialouts
ON #RuleThemAll.cltID = Dialouts.cltID
    WHEN MATCHED THEN
UPDATE SET Dialouts = Dialouts.Total, DialoutDur = Dialouts.Duration;

WITH Emails (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statEmail S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Emails
ON
    #RuleThemAll.cltID = Emails.cltID
    WHEN MATCHED THEN
UPDATE SET Email = Emails.Total, EmailFail = Emails.Failures, EmailIn = Emails.Inbound;

WITH Msms (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statMsm S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Msms
ON
    #RuleThemAll.cltID = Msms.cltID
    WHEN MATCHED THEN
UPDATE SET Msm = Msms.Total, MsmFail = Msms.Failures, MsmIn = Msms.Inbound;

WITH Smss (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statSms S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Smss
ON
    #RuleThemAll.cltID = Smss.cltID
    WHEN MATCHED THEN
UPDATE SET Sms = Smss.Total, SmsFail = Smss.Failures, SmsIn = Smss.Inbound;

WITH Snpps (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statSnpp S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Snpps
ON
    #RuleThemAll.cltID = Snpps.cltID
    WHEN MATCHED THEN
UPDATE SET Snpp = Snpps.Total, SnppFail = Snpps.Failures, SnppIn = Snpps.Inbound;

WITH Taps (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statTap S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Taps
ON
    #RuleThemAll.cltID = Taps.cltID
    WHEN MATCHED THEN
UPDATE SET Tap = Taps.Total, TapFail = Taps.Failures, TapIn = Taps.Inbound;

WITH Wctps (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statWctp S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Wctps
ON
    #RuleThemAll.cltID = Wctps.cltID
    WHEN MATCHED THEN
UPDATE SET Wctp = Wctps.Total, WctpFail = Wctps.Failures, WctpIn = Wctps.Inbound;

WITH Voceras (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statVocera S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Voceras
ON
    #RuleThemAll.cltID = Voceras.cltID
    WHEN MATCHED THEN
UPDATE SET Vocera = Voceras.Total, VoceraFail = Voceras.Failures, VoceraIn = Voceras.Inbound;

WITH Ciscos (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statCisco S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Ciscos
ON
    #RuleThemAll.cltID = Ciscos.cltID
    WHEN MATCHED THEN
UPDATE SET Cisco = Ciscos.Total, CiscoFail = Ciscos.Failures, CiscoIn = Ciscos.Inbound;

WITH Faxs (cltID, Total, Failures, Inbound) AS
         (
             SELECT S.cltID, COUNT(S.cltID),
                    'Failures'=SUM(CASE WHEN S.Error IS NULL THEN 0 ELSE 1 END),
                    SUM(CONVERT(int,S.Inbound))
             FROM statFax S
                      JOIN #RuleThemAll R ON R.cltID = S.cltID
             WHERE S.Timestamp BETWEEN @StartDate AND @EndDate
             GROUP BY S.cltID
         )

    MERGE INTO #RuleThemAll
USING Faxs
ON #RuleThemAll.cltID = Faxs.cltID
    WHEN MATCHED THEN
UPDATE SET Fax = Faxs.Total, FaxFail = Faxs.Failures, FaxIn = Faxs.Inbound;

WITH NonUrgentTakens (cltID, UserTaken, SysTaken, InfTaken, SmsTaken, TapTaken, MsmTaken, SnppTaken, WctpTaken, EmailTaken,
                      VmTaken, FaxTaken, VoceraTaken, Hl7Taken, MergeCommTaken, TapTermTaken, AutoTaken, CiscoTaken, SmtpTaken) AS
         (
             SELECT M.cltID,
                    'UserTaken' = SUM(CASE A.agtType WHEN 0 THEN 1 ELSE 0 END),
                    'SysTaken' = SUM(CASE A.agtType WHEN 1 THEN 1 ELSE 0 END),
                    'InfTaken' = SUM(CASE A.agtType WHEN 5 THEN 1 ELSE 0 END),
                    'SmsTaken' = SUM(CASE A.agtType WHEN 6 THEN 1 ELSE 0 END),
                    'TapTaken' = SUM(CASE A.agtType WHEN 7 THEN 1 ELSE 0 END),
                    'MsmTaken' = SUM(CASE A.agtType WHEN 8 THEN 1 ELSE 0 END),
                    'SnppTaken' = SUM(CASE A.agtType WHEN 9 THEN 1 ELSE 0 END),
                    'WctpTaken' = SUM(CASE A.agtType WHEN 10 THEN 1 ELSE 0 END),
                    'EmailTaken' = SUM(CASE A.agtType WHEN 11 THEN 1 ELSE 0 END),
                    'VmTaken' = SUM(CASE A.agtType WHEN 12 THEN 1 ELSE 0 END),
                    'FaxTaken' = SUM(CASE A.agtType WHEN 13 THEN 1 ELSE 0 END),
                    'VoceraTaken' = SUM(CASE A.agtType WHEN 14 THEN 1 ELSE 0 END),
                    'HL7Taken' = SUM(CASE A.agtType WHEN 15 THEN 1 ELSE 0 END),
                    'MergeCommTaken' = SUM(CASE A.agtType WHEN 16 THEN 1 ELSE 0 END),
                    'TapTermTaken' = SUM(CASE A.agtType WHEN 17 THEN 1 ELSE 0 END),
                    'AutoTaken' = SUM(CASE A.agtType WHEN 18 THEN 1 ELSE 0 END),
                    'CiscoTaken' = SUM(CASE A.agtType WHEN 19 THEN 1 ELSE 0 END),
                    'SmtpTaken' = SUM(CASE A.agtType WHEN 20 THEN 1 ELSE 0 END)
             FROM msgHistories H
                      JOIN msgMessages M  ON M.msgId = H.msgId
                      JOIN #RuleThemAll R ON R.cltID = M.cltId
                      JOIN agtAgents A ON H.agtId = A.agtId
             WHERE H.Stamp BETWEEN @StartDate AND @EndDate
               AND H.DispositionId = 0
               AND M.Urgent=0
             GROUP BY M.cltId
         )

    MERGE INTO #RuleThemAll
USING NonUrgentTakens
ON #RuleThemAll.cltID = NonUrgentTakens.cltID
    WHEN MATCHED THEN
UPDATE SET UserTaken = NonUrgentTakens.UserTaken, SysTaken = NonUrgentTakens.SysTaken, TapTaken = NonUrgentTakens.TapTaken,
    MsmTaken = NonUrgentTakens.MsmTaken, SnppTaken = NonUrgentTakens.SnppTaken, WctpTaken = NonUrgentTakens.WctpTaken,
    EmailTaken = NonUrgentTakens.EmailTaken, VmTaken = NonUrgentTakens.VmTaken, FaxTaken = NonUrgentTakens.FaxTaken,
    VoceraTaken = NonUrgentTakens.VoceraTaken, HL7Taken = NonUrgentTakens.HL7Taken, MergeCommTaken = NonUrgentTakens.MergeCommTaken,
    TapTermTaken = NonUrgentTakens.TapTermTaken, AutoTaken = NonUrgentTakens.AutoTaken, CiscoTaken = NonUrgentTakens.CiscoTaken,
    SmtpTaken = NonUrgentTakens.SmtpTaken;


WITH Delivereds (cltID, UserDelivered, SysDelivered, InfDelivered, SmsDelivered, TapDelivered, MsmDelivered, SnppDelivered, WctpDelivered, EmailDelivered,
                 VmDelivered, FaxDelivered, VoceraDelivered, Hl7Delivered, MergeCommDelivered, TapTermDelivered, AutoDelivered, CiscoDelivered, SmtpDelivered) AS
         (
             SELECT M.cltID,
                    'UserDelivered' = SUM(CASE A.agtType WHEN 0 THEN 1 ELSE 0 END),
                    'SysDelivered' = SUM(CASE A.agtType WHEN 1 THEN 1 ELSE 0 END),
                    'InfDelivered' = SUM(CASE A.agtType WHEN 5 THEN 1 ELSE 0 END),
                    'SmsDelivered' = SUM(CASE A.agtType WHEN 6 THEN 1 ELSE 0 END),
                    'TapDelivered' = SUM(CASE A.agtType WHEN 7 THEN 1 ELSE 0 END),
                    'MsmDelivered' = SUM(CASE A.agtType WHEN 8 THEN 1 ELSE 0 END),
                    'SnppDelivered' = SUM(CASE A.agtType WHEN 9 THEN 1 ELSE 0 END),
                    'WctpDelivered' = SUM(CASE A.agtType WHEN 10 THEN 1 ELSE 0 END),
                    'EmailDelivered' = SUM(CASE A.agtType WHEN 11 THEN 1 ELSE 0 END),
                    'VmDelivered' = SUM(CASE A.agtType WHEN 12 THEN 1 ELSE 0 END),
                    'FaxDelivered' = SUM(CASE A.agtType WHEN 13 THEN 1 ELSE 0 END),
                    'VoceraDelivered' = SUM(CASE A.agtType WHEN 14 THEN 1 ELSE 0 END),
                    'HL7Delivered' = SUM(CASE A.agtType WHEN 15 THEN 1 ELSE 0 END),
                    'MergeCommDelivered' = SUM(CASE A.agtType WHEN 16 THEN 1 ELSE 0 END),
                    'TapTermDelivered' = SUM(CASE A.agtType WHEN 17 THEN 1 ELSE 0 END),
                    'AutoDelivered' = SUM(CASE A.agtType WHEN 18 THEN 1 ELSE 0 END),
                    'CiscoDelivered' = SUM(CASE A.agtType WHEN 19 THEN 1 ELSE 0 END),
                    'SmtpDelivered' = SUM(CASE A.agtType WHEN 20 THEN 1 ELSE 0 END)
             FROM msgHistories H
                      JOIN msgMessages M  ON M.msgId = H.msgId
                      JOIN #RuleThemAll R ON R.cltID = M.cltId
                      JOIN agtAgents A ON H.agtId = A.agtId
             WHERE H.Stamp BETWEEN @StartDate AND @EndDate
               AND H.DispositionId = 2
               AND M.Urgent=0
             GROUP BY M.cltId
         )

    MERGE INTO #RuleThemAll
USING Delivereds
ON #RuleThemAll.cltID = Delivereds.cltID
    WHEN MATCHED THEN
UPDATE SET UserDelivered = Delivereds.UserDelivered, SysDelivered = Delivereds.SysDelivered, TapDelivered = Delivereds.TapDelivered,
    MsmDelivered = Delivereds.MsmDelivered, SnppDelivered = Delivereds.SnppDelivered, WctpDelivered = Delivereds.WctpDelivered,
    EmailDelivered = Delivereds.EmailDelivered, VmDelivered = Delivereds.VmDelivered, FaxDelivered = Delivereds.FaxDelivered,
    VoceraDelivered = Delivereds.VoceraDelivered, HL7Delivered = Delivereds.HL7Delivered, MergeCommDelivered = Delivereds.MergeCommDelivered,
    TapTermDelivered = Delivereds.TapTermDelivered, AutoDelivered = Delivereds.AutoDelivered, CiscoDelivered = Delivereds.CiscoDelivered,
    SmtpDelivered = Delivereds.SmtpDelivered;


WITH UrgentTakens (cltID, UserUrgent, SysUrgent, InfUrgent, SmsUrgent, TapUrgent, MsmUrgent, SnppUrgent, WctpUrgent, EmailUrgent,
                   VmUrgent, FaxUrgent, VoceraUrgent, Hl7Urgent, MergeCommUrgent, TapTermUrgent, AutoUrgent, CiscoUrgent, SmtpUrgent) AS
         (
             SELECT M.cltID,
                    'UserUrgent' = SUM(CASE A.agtType WHEN 0 THEN 1 ELSE 0 END),
                    'SysUrgent' = SUM(CASE A.agtType WHEN 1 THEN 1 ELSE 0 END),
                    'InfUrgent' = SUM(CASE A.agtType WHEN 5 THEN 1 ELSE 0 END),
                    'SmsUrgent' = SUM(CASE A.agtType WHEN 6 THEN 1 ELSE 0 END),
                    'TapUrgent' = SUM(CASE A.agtType WHEN 7 THEN 1 ELSE 0 END),
                    'MsmUrgent' = SUM(CASE A.agtType WHEN 8 THEN 1 ELSE 0 END),
                    'SnppUrgent' = SUM(CASE A.agtType WHEN 9 THEN 1 ELSE 0 END),
                    'WctpUrgent' = SUM(CASE A.agtType WHEN 10 THEN 1 ELSE 0 END),
                    'EmailUrgent' = SUM(CASE A.agtType WHEN 11 THEN 1 ELSE 0 END),
                    'VmUrgent' = SUM(CASE A.agtType WHEN 12 THEN 1 ELSE 0 END),
                    'FaxUrgent' = SUM(CASE A.agtType WHEN 13 THEN 1 ELSE 0 END),
                    'VoceraUrgent' = SUM(CASE A.agtType WHEN 14 THEN 1 ELSE 0 END),
                    'HL7Urgent' = SUM(CASE A.agtType WHEN 15 THEN 1 ELSE 0 END),
                    'MergeCommUrgent' = SUM(CASE A.agtType WHEN 16 THEN 1 ELSE 0 END),
                    'TapTermUrgent' = SUM(CASE A.agtType WHEN 17 THEN 1 ELSE 0 END),
                    'AutoUrgent' = SUM(CASE A.agtType WHEN 18 THEN 1 ELSE 0 END),
                    'CiscoUrgent' = SUM(CASE A.agtType WHEN 19 THEN 1 ELSE 0 END),
                    'SmtpUrgent' = SUM(CASE A.agtType WHEN 20 THEN 1 ELSE 0 END)
             FROM msgHistories H
                      JOIN msgMessages M  ON M.msgId = H.msgId
                      JOIN #RuleThemAll R  ON R.cltID = M.cltId
                      JOIN agtAgents A ON H.agtId = A.agtId
             WHERE H.Stamp BETWEEN @StartDate AND @EndDate
               AND H.DispositionId = 0
               AND M.Urgent=1
             GROUP BY M.cltId
         )

    MERGE INTO #RuleThemAll
USING UrgentTakens
ON #RuleThemAll.cltID = UrgentTakens.cltID
    WHEN MATCHED THEN
UPDATE SET UserUrgent = UrgentTakens.UserUrgent, SysUrgent = UrgentTakens.SysUrgent, TapUrgent = UrgentTakens.TapUrgent,
    MsmUrgent = UrgentTakens.MsmUrgent, SnppUrgent = UrgentTakens.SnppUrgent, WctpUrgent = UrgentTakens.WctpUrgent,
    EmailUrgent = UrgentTakens.EmailUrgent, VmUrgent = UrgentTakens.VmUrgent, FaxUrgent = UrgentTakens.FaxUrgent,
    VoceraUrgent = UrgentTakens.VoceraUrgent, HL7Urgent = UrgentTakens.HL7Urgent, MergeCommUrgent = UrgentTakens.MergeCommUrgent,
    TapTermUrgent = UrgentTakens.TapTermUrgent, AutoUrgent = UrgentTakens.AutoUrgent, CiscoUrgent = UrgentTakens.CiscoUrgent,
    SmtpUrgent = UrgentTakens.SmtpUrgent;


WITH UrgDelivereds (cltID, UserUrgDelivered, SysUrgDelivered, InfUrgDelivered, SmsUrgDelivered, TapUrgDelivered, MsmUrgDelivered, SnppUrgDelivered, WctpUrgDelivered, EmailUrgDelivered,
                    VmUrgDelivered, FaxUrgDelivered, VoceraUrgDelivered, Hl7UrgDelivered, MergeCommUrgDelivered, TapTermUrgDelivered, AutoUrgDelivered, CiscoUrgDelivered, SmtpUrgDelivered) AS
         (
             SELECT M.cltID,
                    'UserUrgDelivered' = SUM(CASE A.agtType WHEN 0 THEN 1 ELSE 0 END),
                    'SysUrgDelivered' = SUM(CASE A.agtType WHEN 1 THEN 1 ELSE 0 END),
                    'InfUrgDelivered' = SUM(CASE A.agtType WHEN 5 THEN 1 ELSE 0 END),
                    'SmsUrgDelivered' = SUM(CASE A.agtType WHEN 6 THEN 1 ELSE 0 END),
                    'TapUrgDelivered' = SUM(CASE A.agtType WHEN 7 THEN 1 ELSE 0 END),
                    'MsmUrgDelivered' = SUM(CASE A.agtType WHEN 8 THEN 1 ELSE 0 END),
                    'SnppUrgDelivered' = SUM(CASE A.agtType WHEN 9 THEN 1 ELSE 0 END),
                    'WctpUrgDelivered' = SUM(CASE A.agtType WHEN 10 THEN 1 ELSE 0 END),
                    'EmailUrgDelivered' = SUM(CASE A.agtType WHEN 11 THEN 1 ELSE 0 END),
                    'VmUrgDelivered' = SUM(CASE A.agtType WHEN 12 THEN 1 ELSE 0 END),
                    'FaxUrgDelivered' = SUM(CASE A.agtType WHEN 13 THEN 1 ELSE 0 END),
                    'VoceraUrgDelivered' = SUM(CASE A.agtType WHEN 14 THEN 1 ELSE 0 END),
                    'HL7UrgDelivered' = SUM(CASE A.agtType WHEN 15 THEN 1 ELSE 0 END),
                    'MergeCommUrgDelivered' = SUM(CASE A.agtType WHEN 16 THEN 1 ELSE 0 END),
                    'TapTermUrgDelivered' = SUM(CASE A.agtType WHEN 17 THEN 1 ELSE 0 END),
                    'AutoUrgDelivered' = SUM(CASE A.agtType WHEN 18 THEN 1 ELSE 0 END),
                    'CiscoUrgDelivered' = SUM(CASE A.agtType WHEN 19 THEN 1 ELSE 0 END),
                    'SmtpUrgDelivered' = SUM(CASE A.agtType WHEN 20 THEN 1 ELSE 0 END)
             FROM msgHistories H
                      JOIN msgMessages M  ON M.msgId = H.msgId
                      JOIN #RuleThemAll R ON R.cltID = M.cltId
                      JOIN agtAgents A ON H.agtId = A.agtId
             WHERE H.Stamp BETWEEN @StartDate AND @EndDate
               AND H.DispositionId = 2
               AND M.Urgent=1
             GROUP BY M.cltId
         )

    MERGE INTO #RuleThemAll
USING UrgDelivereds
ON #RuleThemAll.cltID = UrgDelivereds.cltID
    WHEN MATCHED THEN
UPDATE SET UserUrgDelivered = UrgDelivereds.UserUrgDelivered, SysUrgDelivered = UrgDelivereds.SysUrgDelivered, TapUrgDelivered = UrgDelivereds.TapUrgDelivered,
    MsmUrgDelivered = UrgDelivereds.MsmUrgDelivered, SnppUrgDelivered = UrgDelivereds.SnppUrgDelivered, WctpUrgDelivered = UrgDelivereds.WctpUrgDelivered,
    EmailUrgDelivered = UrgDelivereds.EmailUrgDelivered, VmUrgDelivered = UrgDelivereds.VmUrgDelivered, FaxUrgDelivered = UrgDelivereds.FaxUrgDelivered,
    VoceraUrgDelivered = UrgDelivereds.VoceraUrgDelivered, HL7UrgDelivered = UrgDelivereds.HL7UrgDelivered, MergeCommUrgDelivered = UrgDelivereds.MergeCommUrgDelivered,
    TapTermUrgDelivered = UrgDelivereds.TapTermUrgDelivered, AutoUrgDelivered = UrgDelivereds.AutoUrgDelivered, CiscoUrgDelivered = UrgDelivereds.CiscoUrgDelivered,
    SmtpUrgDelivered = UrgDelivereds.SmtpUrgDelivered;


WITH CallDuration (callID, Duration, SelDuration) AS    -- so we only calculate duration once per call
         (
--Looks like datediff truncates.
--SELECT CS.callId, DATEDIFF(SS, CS.Stamp, CE.Stamp) 'Duration'

--This will round to the nearest second instead:
             SELECT  CS.callId, DATEDIFF(SS,CS.Stamp,DATEADD(MS,500, CE.Stamp)) 'Duration'

,CE.SelDisc + CE.SelRing + CE.SelTalk + CE.SelTalk1 + CE.SelTalk2 + CE.selConference + CE.SelHold
                 + CE.selInProgress+ CE.selVoiceMail + CE.selAuto + CE.selOutboundQueue + CE.selPatch + selAutoHold 'SelDuration'

             FROM statCallStart CS
                      JOIN statCallEnd CE ON CS.callId = CE.callId
         ),
     CallStats (cltID, Total, Duration,SecCalls

-- important! field orter in select must match this!
         ,CheckCalls,FetchCalls,SchedCalls,IVRCalls,WebScrCalls ,VMCalls,AutoCalls
         ,AnnCalls,MCommCalls ,PgConfirmCalls,SmartPgCalls ,CngClientCalls,AudioCalls ,RaulandCalls

         ,SelDisc, UnSelDisc,SelRing,UnSelRing,SelTalk,UnSelTalk,SelTalk1,UnSelTalk1,SelTalk2 ,UnSelTalk2
         ,SelConf,UnSelConf,SelHold,UnSelHold,SelInProg,UnSelInProg,SelVM,UnSelVM,SelAuto,UnSelAuto,SelOutboundQueue,UnSelOutboundQueue
         ,SelAutoHold,UnSelAutoHold,SelPatch,UnSelPatch

         ,SecDuration, SelSecDuration
         ,CheckDuration,SelCheckDuration
         ,FetchDuration,SelFetchDuration
         ,SchedDuration,SelSchedDuration
         ,IVRDuration,SelIVRDuration
         ,WebScrDuration,SelWebScrDuration
         ,VmDuration,SelVmDuration
         ,AutoDuration,SelAutoDuration
         ,AnnDuration,SelAnnDuration
         ,MCommDuration,SelMCommDuration
         ,PgConfirmDuration,SelPgConfirmDuration
         ,SmartPgDuration,SelSmartPgDuration
         ,CngClientDuration,SelCngClientDuration
         ,AudioDuration,SelAudioDuration
         ,RaulandDuration,SelRaulandDuration
         ,selPatches,UnselPatches
         ,SelSecCalls,SelCheckCalls
         ,SectalkTime,ChecktalkTime,NonLiveTalktime

         ,SelSecDurationCap,SelFetchDurationCap
         ,AnsweredCalls,AbandonedCalls

         ,AutoAttendantCalls,ListingLookupCalls
         ,DispatchCalls,ParkOrbitCalls,VMCallBackCalls
         ,CueCalls,[RepeatCalls],ConfBridgeCalls,OrbitCalls

         ,AutoAttendantDuration
         ,UnSelAutoAttendantDuration

         ,ListingLookupDuration
         ,UnSelListingLookupDuration

         ,DispatchDuration
         ,UnSelDispatchDuration

         ,ParkOrbitDuration
         ,UnSelParkOrbitDuration

         ,VMCallBackDuration
         ,UnSelVMCallBackDuration

         ,CueDuration
         ,UnSelCueDuration

         ,[RepeatDuration]
,[UnSelRepeatDuration]

,ConfBridgeDuration
         ,UnSelConfBridgeDuration

         ,OrbitDuration
         ,UnSelOrbitDuration
         )
         AS (
-- call kind cases
         SELECT CE.cltID, COUNT(CE.cltID) 'Total'
--new
,'Duration'         = SUM(CD.Duration)
              ,'SecCalls'         = SUM(CASE CE.Kind WHEN 1 THEN 1 ELSE 0 END)
              ,'CheckCalls'       = SUM(CASE CE.Kind WHEN 2 THEN 1 ELSE 0 END)
              ,'FetchCalls'       = SUM(CASE CE.Kind WHEN 3 THEN 1 ELSE 0 END)
              ,'SchedCalls'       = SUM(CASE CE.Kind WHEN 4 THEN 1 ELSE 0 END)
              ,'IVRCalls'         = SUM(CASE CE.Kind WHEN 5 THEN 1 ELSE 0 END)
              ,'WebScrCalls'      = SUM(CASE CE.Kind WHEN 6 THEN 1 ELSE 0 END)
              ,'VMCalls'          = SUM(CASE CE.Kind WHEN 7 THEN 1 ELSE 0 END)
              ,'AutoCalls'        = SUM(CASE CE.Kind WHEN 8 THEN 1 ELSE 0 END)
              ,'AnnCalls'         = SUM(CASE CE.Kind WHEN 9 THEN 1 ELSE 0 END)
              ,'MCommCalls'       = SUM(CASE CE.Kind WHEN 10 THEN 1 ELSE 0 END)
              ,'PgConfirmCalls'   = SUM(CASE CE.Kind WHEN 11 THEN 1 ELSE 0 END)
              ,'SmartPgCalls'     = SUM(CASE CE.Kind WHEN 12 THEN 1 ELSE 0 END)
              ,'CngClientCalls'   = SUM(CASE CE.Kind WHEN 13 THEN 1 ELSE 0 END)
              ,'AudioCalls'       = SUM(CASE CE.Kind WHEN 14 THEN 1 ELSE 0 END)
              ,'RaulandCalls'     = SUM(CASE CE.Kind WHEN 15 THEN 1 ELSE 0 END)

              ,'SelDisc' = SUM(CE.selDisc)
              ,'UnSelDisc' = SUM(CE.unselDisc)

              ,'SelRing' = SUM(CE.selRing)
              ,'UnSelRing' = SUM(CE.unselRing)

              ,'SelTalk' = SUM(CE.selTalk)
              ,'UnSelTalk' = SUM(CE.unselTalk)

              ,'SelTalk1' = SUM(CE.selTalk1)
              ,'UnSelTalk1' = SUM(CE.unselTalk1)

              ,'SelTalk2' = SUM(CE.selTalk2)
              ,'UnSelTalk2' = SUM(CE.unselTalk2)

              ,'SelConf' = SUM(CE.selConference)
              ,'UnSelConf' = SUM(CE.unselConference)

              ,'SelHold' = SUM(CE.selHold)
              ,'UnSelHold' = SUM(CE.unselHold)

              ,'SelInProg' = SUM(CE.selInProgress)
              ,'UnSelInProg' = SUM(CE.unselInProgress)

              ,'SelVM' = SUM(CE.selVoiceMail)
              ,'UnSelVM' = SUM(CE.unselVoiceMail)

              ,'SelAuto' = SUM(CE.selAuto)
              ,'UnSelAuto' = SUM(CE.unselAuto)

              ,'SelOutboundQueue' = SUM(CE.selOutboundQueue)
              ,'UnSelOutboundQueue' = SUM(CE.unselOutboundQueue)

              ,'SelAutoHold' = SUM(CE.selAutoHold)
              ,'UnSelAutoHold' = SUM(CE.unselAutoHold)

              ,'SelPatch' = SUM(CE.selPatch)
              ,'UnSelPatch' = SUM(CE.unselPatch)

              ,'SecDuration' = SUM(CASE CE.Kind WHEN 1 THEN CD.Duration ELSE 0 END)
              ,'SelSecDuration' = SUM(CASE CE.Kind WHEN 1 THEN CD.SelDuration ELSE 0 END)

              ,'CheckDuration' = SUM(CASE CE.Kind WHEN 2 THEN CD.Duration ELSE 0 END)
              ,'SelCheckDuration' = SUM(CASE CE.Kind WHEN 2 THEN CD.SelDuration ELSE 0 END)

              ,'FetchDuration' = SUM(CASE CE.Kind WHEN 3 THEN CD.Duration ELSE 0 END)
              ,'SelFetchDuration' = SUM(CASE CE.Kind WHEN 3 THEN CD.SelDuration ELSE 0 END)

              ,'SchedDuration' = SUM(CASE CE.Kind WHEN 4 THEN CD.Duration ELSE 0 END)
              ,'SelSchedDuration' = SUM(CASE CE.Kind WHEN 4 THEN CD.SelDuration ELSE 0 END)

              ,'IVRDuration' = SUM(CASE CE.Kind WHEN 5 THEN CD.Duration ELSE 0 END)
              ,'SelIVRDuration' = SUM(CASE CE.Kind WHEN 5 THEN CD.SelDuration ELSE 0 END)

              ,'WebScrDuration' = SUM(CASE CE.Kind WHEN 6 THEN CD.Duration ELSE 0 END)
              ,'SelWebScrDuration' = SUM(CASE CE.Kind WHEN 6 THEN CD.SelDuration ELSE 0 END)

              ,'VmDuration' = SUM(CASE CE.Kind WHEN 7 THEN CD.Duration ELSE 0 END)
              ,'SelVmDuration' = SUM(CASE CE.Kind WHEN 7 THEN CD.SelDuration ELSE 0 END)

              ,'AutoDuration' = SUM(CASE CE.Kind WHEN 8 THEN CD.Duration ELSE 0 END)
              ,'SelAutoDuration' = SUM(CASE CE.Kind WHEN 8 THEN CD.SelDuration ELSE 0 END)

              ,'AnnDuration' = SUM(CASE CE.Kind WHEN 9 THEN CD.Duration ELSE 0 END)
              ,'SelAnnDuration' = SUM(CASE CE.Kind WHEN 9 THEN CD.SelDuration ELSE 0 END)

              ,'MCommDuration' = SUM(CASE CE.Kind WHEN 10 THEN CD.Duration ELSE 0 END)
              ,'SelMCommDuration' = SUM(CASE CE.Kind WHEN 10 THEN CD.SelDuration ELSE 0 END)

              ,'PgConfirmDuration' = SUM(CASE CE.Kind WHEN 11 THEN CD.Duration ELSE 0 END)
              ,'SelPgConfirmDuration' = SUM(CASE CE.Kind WHEN 11 THEN CD.SelDuration ELSE 0 END)

              ,'SmartPgDuration' = SUM(CASE CE.Kind WHEN 12 THEN CD.Duration ELSE 0 END)
              ,'SelSmartPgDuration' = SUM(CASE CE.Kind WHEN 12 THEN CD.SelDuration ELSE 0 END)

              ,'ChgClientDuration' = SUM(CASE CE.Kind WHEN 13 THEN CD.Duration ELSE 0 END)
              ,'SelChgClientDuration' = SUM(CASE CE.Kind WHEN 13 THEN CD.SelDuration ELSE 0 END)

              ,'AudioDuration' = SUM(CASE CE.Kind WHEN 14 THEN CD.Duration ELSE 0 END)
              ,'SelAudioDuration' = SUM(CASE CE.Kind WHEN 14 THEN CD.SelDuration ELSE 0 END)

              ,'RaulandDuration' = SUM(CASE CE.Kind WHEN 15 THEN CD.Duration ELSE 0 END)
              ,'SelRaulandDuration' = SUM(CASE CE.Kind WHEN 15 THEN CD.SelDuration ELSE 0 END)

              ,'SelPatches' = SUM(CASE WHEN CE.selPatch > 0 THEN 1 ELSE 0 END)
              ,'UnSelPatches' = SUM(CASE WHEN CE.unselPatch > 0 THEN 1 ELSE 0 END)
              ,'SelSecCalls' = SUM(CASE  WHEN CE.Kind = 1 AND CD.SelDuration > 0 THEN 1 ELSE 0 END)
              ,'SelCheckCalls' = SUM(CASE  WHEN CE.Kind = 2 AND CD.SelDuration > 0 THEN 1 ELSE 0 END)
              ,'SecTalkTime' = SUM(CASE  WHEN CE.Kind = 1 THEN CE.selTalk + CE.selTalk1 + CE.selTalk2 + CE.selConference ELSE 0 END)
              ,'CheckTalkTime' = SUM(CASE  WHEN CE.Kind = 2 THEN CE.selTalk + CE.selTalk1 + CE.selTalk2 + CE.selConference ELSE 0 END)
              ,'NonLiveTalkTime' = SUM(CASE  WHEN CE.Kind > 2 THEN CE.selTalk + CE.selTalk1 + CE.selTalk2 + CE.selConference ELSE 0 END)
              ,'SelSecDurationCap' = SUM(CASE CE.Kind WHEN 1 THEN CASE WHEN @TimeCap > 0 AND CD.SelDuration > (@TimeCap * 60) THEN @TimeCap * 60 ELSE CD.SelDuration END  ELSE 0 END)
              ,'SelFetchDurationCap' = SUM(CASE CE.Kind WHEN 3 THEN  CASE WHEN @TimeCap > 0 AND CD.SelDuration > (@TimeCap * 60) THEN @TimeCap * 60 ELSE CD.SelDuration END ELSE 0 END)
              ,'AnsweredCalls' = SUM(CASE WHEN CE.CompCode = 0 AND CE.selTalk > 0 THEN 1 ELSE 0 END)
              ,'AbandonedCalls' = SUM(CASE WHEN CE.CompCode = 3 AND CE.selTalk = 0 AND CE.kind IN (1,2) THEN 1 ELSE 0 END)

-- new call kinds
              ,'AutoAttendantCalls' = SUM(CASE CE.Kind WHEN 16 THEN 1 ELSE 0 END)
              ,'ListingLookupCalls' = SUM(CASE CE.Kind WHEN 17 THEN 1 ELSE 0 END)
              ,'DispatchCalls'      = SUM(CASE CE.Kind WHEN 18 THEN 1 ELSE 0 END)
              ,'ParkOrbitCalls'     = SUM(CASE CE.Kind WHEN 19 THEN 1 ELSE 0 END)
              ,'VMCallBackCalls'    = SUM(CASE CE.Kind WHEN 20 THEN 1 ELSE 0 END)
              ,'CueCalls'           = SUM(CASE CE.Kind WHEN 21 THEN 1 ELSE 0 END)
              ,'RepeatCalls'        = SUM(CASE CE.Kind WHEN 22 THEN 1 ELSE 0 END)
              ,'ConfBridgeCalls'    = SUM(CASE CE.Kind WHEN 23 THEN 1 ELSE 0 END)
              ,'OrbitCalls'         = SUM(CASE CE.Kind WHEN 24 THEN 1 ELSE 0 END)

              ,'AutoAttendantDuration' = SUM(CASE CE.Kind WHEN 16 THEN CD.Duration ELSE 0 END)
              ,'UnSelAutoAttendantDuration' = SUM(CASE CE.Kind WHEN 16 THEN CD.SelDuration ELSE 0 END)

              ,'ListingLookupDuration' = SUM(CASE CE.Kind WHEN 17 THEN CD.Duration ELSE 0 END)
              ,'UnSelListingLookupDuration' = SUM(CASE CE.Kind WHEN 17 THEN CD.SelDuration ELSE 0 END)

              ,'Dispatch' = SUM(CASE CE.Kind WHEN 18 THEN CD.Duration ELSE 0 END)
              ,'UnSelDispatchDuration' = SUM(CASE CE.Kind WHEN 18 THEN CD.SelDuration ELSE 0 END)

              ,'ParkOrbitDuration' = SUM(CASE CE.Kind WHEN 19 THEN CD.Duration ELSE 0 END)
              ,'UnSelParkOrbitDuration' = SUM(CASE CE.Kind WHEN 19 THEN CD.SelDuration ELSE 0 END)

              ,'VMCallBackDuration' = SUM(CASE CE.Kind WHEN 20 THEN CD.Duration ELSE 0 END)
              ,'UnSelVMCallBackDuration' = SUM(CASE CE.Kind WHEN 20 THEN CD.SelDuration ELSE 0 END)

              ,'CueDuration' = SUM(CASE CE.Kind WHEN 21 THEN CD.Duration ELSE 0 END)
              ,'UnSelCueDuration' = SUM(CASE CE.Kind WHEN 21 THEN CD.SelDuration ELSE 0 END)

              ,'[RepeatDuration]' = SUM(CASE CE.Kind WHEN 22 THEN CD.Duration ELSE 0 END)
              ,'[UnSelRepeatDuration]' = SUM(CASE CE.Kind WHEN 22 THEN CD.SelDuration ELSE 0 END)

              ,'ConfBridgeDuration' = SUM(CASE CE.Kind WHEN 23 THEN CD.Duration ELSE 0 END)
              ,'UnSelConfBridgeDuration' = SUM(CASE CE.Kind WHEN 23 THEN CD.SelDuration ELSE 0 END)

              ,'OrbitDuration' = SUM(CASE CE.Kind WHEN 24 THEN CD.Duration ELSE 0 END)
              ,'UnSelOrbitDuration' = SUM(CASE CE.Kind WHEN 24 THEN CD.SelDuration ELSE 0 END)
         FROM statCallEnd CE
                  JOIN CallDuration CD ON CE.callId = CD.callId
                  JOIN #RuleThemAll R ON R.cltID = CE.cltId
         WHERE CE.Stamp BETWEEN @StartDate AND @EndDate
         GROUP BY CE.cltId
     )

    MERGE INTO #RuleThemAll
USING CallStats
ON #RuleThemAll.cltID = CallStats.cltID
    WHEN MATCHED THEN
UPDATE
    SET CallDuration    = CallStats.Duration
    ,Calls              = CallStats.Total
    ,SecCalls           = CallStats.SecCalls

    ,CheckCalls         = CallStats.CheckCalls
    ,FetchCalls         = CallStats.FetchCalls
    ,SchedCalls         = CallStats.SchedCalls
    ,IVRCalls           = CallStats.IVRCalls
    ,WebScrCalls        = CallStats.WebScrCalls
    ,VMCalls            = CallStats.VMCalls
    ,AutoCalls          = CallStats.AutoCalls
    ,AnnCalls           = CallStats.AnnCalls
    ,MCommCalls         = CallStats.MCommCalls
    ,PgConfirmCalls     = CallStats.PgConfirmCalls
    ,SmartPgCalls       = CallStats.SmartPgCalls
    ,CngClientCalls     = CallStats.CngClientCalls
    ,AudioCalls         = CallStats.AudioCalls
    ,RaulandCalls       = CallStats.RaulandCalls

    ,SecDuration        = CallStats.SecDuration
    ,SelSecDuration     = CallStats.SelSecDuration

    ,SelDisc            = CallStats.SelDisc
    ,UnSelDisc          = CallStats.UnSelDisc

    ,SelRing            = CallStats.SelRing
    ,UnSelRing          = CallStats.UnSelRing
    ,SelTalk            = CallStats.SelTalk
    ,UnSelTalk          = CallStats.UnSelTalk
    ,SelTalk1           = CallStats.SelTalk1
    ,UnSelTalk1         = CallStats.UnselTalk1
    ,SelTalk2           = CallStats.SelTalk2
    ,UnSelTalk2         = CallStats.UnselTalk2
    ,SelConf            = CallStats.SelConf
    ,UnSelConf          = CallStats.UnselConf
    ,SelHold            = CallStats.SelHold
    ,UnSelHold          = CallStats.UnSelHold
    ,SelInProg          = CallStats.SelInProg
    ,UnSelInProg        = CallStats.UnSelInProg
    ,SelVM              = CallStats.SelVm
    ,UnSelVM            = CallStats.UnselVm
    ,SelAuto            = CallStats.SelAuto
    ,UnSelAuto          = CallStats.UnSelAuto
    ,SelOutboundQueue   = CallStats.SelOutboundQueue
    ,UnSelOutboundQueue = CallStats.UnSelOutboundQueue
    ,SelAutoHold        = CallStats.SelAutoHold
    ,UnSelAutoHold      = CallStats.UnSelAutoHold
    ,SelPatch           = CallStats.SelPatch
    ,UnSelPatch         = CallStats.UnSelPatch

    ,CheckDuration      = CallStats.CheckDuration
    ,SelCheckDuration   = CallStats.SelCheckDuration

    ,FetchDuration      = CallStats.FetchDuration
    ,SelFetchDuration   = CallStats.SelFetchDuration

    ,SchedDuration      = CallStats.SchedDuration
    ,SelSchedDuration   = CallStats.SelSchedDuration

    ,IVRDuration        = CallStats.IVRDuration
    ,SelIVRDuration     = CallStats.SelIVRDuration

    ,WebScrDuration     = CallStats.WebScrDuration
    ,SelWebScrDuration  = CallStats.SelWebScrDuration

    ,VMDuration         = CallStats.VMDuration
    ,SelVMDuration      = CallStats.SelVMDuration

    ,AutoDuration       = CallStats.AutoDuration
    ,SelAutoDuration    = CallStats.SelAutoDuration

    ,AnnDuration        = CallStats.AnnDuration
    ,SelAnnDuration     = CallStats.SelAnnDuration

    ,MCommDuration      = CallStats.MCommDuration
    ,SelMCommDuration   = CallStats.SelMCOMMDuration

    ,PgConfirmDuration      = CallStats.PgConfirmDuration
    ,SelPgConfirmDuration   = CallStats.SelPgConfirmDuration

    ,SmartPgDuration        = CallStats.SmartPgDuration
    ,SelSmartPgDuration     = CallStats.SelSmartPgDuration

    ,CngClientDuration      = CallStats.CngClientDuration
    ,SelCngClientDuration   = CallStats.SelCngClientDuration

    ,AudioDuration          = CallStats.AudioDuration
    ,SelAudioDuration       = CallStats.SelAudioDuration

    ,RaulandDuration        = CallStats.RaulandDuration
    ,SelRaulandDuration     = CallStats.SelRaulandDuration

    ,SelPatches             = CallStats.SelPatches
    ,UnSelPatches           = CallStats.UnSelPatches

    ,SelSecCalls            = CallStats.SelSecCalls
    ,SelCheckCalls          = CallStats.SelCheckCalls

    ,SecTalktime            = CallStats.SecTalkTime
    ,CheckTalkTime          = CallStats.CheckTalkTime
    ,NonLiveTalktime        = CallStats.NonLiveTalkTime

    ,SelSecDurationCap      = CallStats.SelSecDurationCap
    ,SelFetchDurationCap    = CallStats.SelFetchDurationCap

    ,AnsweredCalls      = CallStats.AnsweredCalls
    ,AbandonedCalls     = CallStats.AbandonedCalls

    ,AutoAttendantCalls = CallStats.AutoAttendantCalls
    ,ListingLookupCalls = CallStats.ListingLookupCalls
    ,DispatchCalls      = CallStats.DispatchCalls
    ,ParkOrbitCalls     = CallStats.ParkOrbitCalls
    ,VMCallBackCalls    = CallStats.VMCallBackCalls
    ,CueCalls           = CallStats.CueCalls
    ,[RepeatCalls]      = CallStats.RepeatCalls
    ,ConfBridgeCalls    = CallStats.ConfBridgeCalls
    ,OrbitCalls         = CallStats.OrbitCalls

-- new duration fields
    ,AutoAttendantDuration       = CallStats.AutoAttendantDuration
    ,UnSelAutoAttendantDuration  = CallStats.UnSelAutoAttendantDuration

    ,ListingLookupDuration       = CallStats.ListingLookupDuration
    ,UnSelListingLookupDuration  = CallStats.UnSelListingLookupDuration

    ,DispatchDuration            = CallStats.DispatchDuration
    ,UnSelDispatchDuration       = CallStats.UnSelDispatchDuration

    ,ParkOrbitDuration           = CallStats.ParkOrbitDuration
    ,UnSelParkOrbitDuration      = CallStats.UnSelParkOrbitDuration

    ,VMCallBackDuration          = CallStats.VMCallBackDuration
    ,UnSelVMCallBackDuration     = CallStats.UnSelVMCallBackDuration

    ,CueDuration                 = CallStats.CueDuration
    ,UnSelCueDuration            = CallStats.UnSelCueDuration

    ,[RepeatDuration]            = CallStats.[RepeatDuration]
    ,[UnSelRepeatDuration]       = CallStats.[UnSelRepeatDuration]

    ,ConfBridgeDuration          = CallStats.ConfBridgeDuration
    ,UnSelConfBridgeDuration     = CallStats.UnSelConfBridgeDuration

    ,OrbitDuration               = CallStats.OrbitDuration
    ,UnSelOrbitDuration          = CallStats.UnSelOrbitDuration

;  -- Notice the semi colon on the end!




-- MergeComm
WITH MergeComm (cltID
    ,OtherSource, ScriptSource, ScheduleSource, PhoneSource, SmsSource, MsmSource, Hl7Source, SmtpSource, EmailSource, WctpSource, VoceraSource, FaxSource, TapSource,SnppSource,RaulandBorgSource,WebServiceSource
    ,OtherSourceDur,ScriptSourceDur ,ScheduleSourceDur ,PhoneSourceDur ,SmsSourceDur ,MsmSourceDur ,Hl7SourceDur ,SmtpSourceDur ,EmailSourceDur ,WctpSourceDur ,VoceraSourceDur
    ,FaxSourceDur ,TapSourceDur ,SnppSourceDur,RaulandBorgSourceDur,WebServiceSourceDur) AS
         (
             SELECT C.cltId,
                    'OtherSource'    = SUM(CASE MC.SourceType WHEN 0 THEN 1 ELSE 0 END),
                    'ScriptSource'   = SUM(CASE MC.SourceType WHEN 1 THEN 1 ELSE 0 END),
                    'ScheduleSource' = SUM(CASE MC.SourceType WHEN 2 THEN 1 ELSE 0 END),
                    'PhoneSource'    = SUM(CASE MC.SourceType WHEN 3 THEN 1 ELSE 0 END),
                    'SmsSource'      = SUM(CASE MC.SourceType WHEN 4 THEN 1 ELSE 0 END),
                    'MsmSource'      = SUM(CASE MC.SourceType WHEN 5 THEN 1 ELSE 0 END),
                    'Hl7Source'      = SUM(CASE MC.SourceType WHEN 6 THEN 1 ELSE 0 END),
                    'SmtpSource'     = SUM(CASE MC.SourceType WHEN 7 THEN 1 ELSE 0 END),
                    'EmailSource'    = SUM(CASE MC.SourceType WHEN 8 THEN 1 ELSE 0 END),
                    'WctpSource'     = SUM(CASE MC.SourceType WHEN 9 THEN 1 ELSE 0 END),
                    'VoceraSource'   = SUM(CASE MC.SourceType WHEN 10 THEN 1 ELSE 0 END),
                    'FaxSource'      = SUM(CASE MC.SourceType WHEN 11 THEN 1 ELSE 0 END),
                    'TapSource'      = SUM(CASE MC.SourceType WHEN 12 THEN 1 ELSE 0 END),
                    'SnppSource'     = SUM(CASE MC.SourceType WHEN 13 THEN 1 ELSE 0 END),
                    'RaulandBorgSource' = SUM(CASE MC.SourceType WHEN 14 THEN 1 ELSE 0 END),
                    'WebServiceSource'  = SUM(CASE MC.SourceType WHEN 15 THEN 1 ELSE 0 END),

                    'OtherSourceDur'    = SUM(CASE MC.SourceType WHEN 0 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'ScriptSourceDur'   = SUM(CASE MC.SourceType WHEN 1 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'ScheduleSourceDur' = SUM(CASE MC.SourceType WHEN 2 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'PhoneSourceDur'    = SUM(CASE MC.SourceType WHEN 3 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'SmsSourceDur'      = SUM(CASE MC.SourceType WHEN 4 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'MsmSourceDur'      = SUM(CASE MC.SourceType WHEN 5 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'Hl7SourceDur'      = SUM(CASE MC.SourceType WHEN 6 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'SmtpSourceDur'     = SUM(CASE MC.SourceType WHEN 7 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'EmailSourceDur'    = SUM(CASE MC.SourceType WHEN 8 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'WctpSourceDur'     = SUM(CASE MC.SourceType WHEN 9 THEN   DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'VoceraSourceDur'   = SUM(CASE MC.SourceType WHEN 10 THEN  DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'FaxSourceDur'      = SUM(CASE MC.SourceType WHEN 11 THEN  DATEDIFF(MS,HS.Stamp,HC.stamp) ELSE 0 END),
                    'TapSourceDur'      = SUM(CASE MC.SourceType WHEN 12 THEN  DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'SnppSourceDur'     = SUM(CASE MC.SourceType WHEN 13 THEN  DATEDIFF(MS,HS.Stamp,HC.Stamp) ELSE 0 END),
                    'RaulandBorgSource' = SUM(CASE MC.SourceType WHEN 14 THEN  DATEDIFF(MS,HS.Stamp,HC.Stamp)  ELSE 0 END),
                    'WebServiceSource'  = SUM(CASE MC.SourceType WHEN 15 THEN  DATEDIFF(MS,HS.Stamp,HC.Stamp)  ELSE 0 END)

             FROM statMergeComm MC
                      JOIN cltClients C ON C.cltId = MC.cltID
                      JOIN msgHistories HS ON HS.msgId = MC.msgID AND HS.DispositionId = 35
                      JOIN msgHistories HC ON HC.msgId = MC.msgID AND HC.DispositionId = 36
                      LEFT OUTER JOIN agtAgents A ON A.agtId = MC.agtID
             WHERE
                 (C.ClientNumber BETWEEN @STARTCLIENT AND @ENDCLIENT
                     AND HS.stamp BETWEEN @STARTDATE AND @ENDDATE)
             GROUP BY C.cltID
         )

    MERGE INTO #RuleThemAll
USING MergeComm
ON #RuleThemAll.cltID = MergeComm.cltID
    WHEN MATCHED THEN

UPDATE
    SET OtherSource = MergeComm.OtherSource
    ,ScriptSource   = MergeComm.ScriptSource
    ,ScheduleSource = MergeComm.ScheduleSource
    ,PhoneSource    = MergeComm.PhoneSource
    ,SmsSource      = MergeComm.SmsSource
    ,MsmSource      = MergeComm.MsmSource
    ,Hl7Source      = MergeComm.Hl7source
    ,SmtpSource     = MergeComm.SmtpSource
    ,EmailSource    = MergeComm.Emailsource
    ,WctpSource     = MergeComm.WctpSource
    ,VoceraSource   = MergeComm.VoceraSource
    ,FaxSource      = MergeComm.FaxSource
    ,TapSource      = MergeComm.TapSource
    ,SnppSource     = MergeComm.SnppSource
    ,RaulandBorgSource = MergeComm.RaulandBorgSource
    ,WebServiceSource = MergeComm.WebServiceSource

    ,OtherSourceDur    = MergeComm.OtherSourceDur/1000
    ,ScriptSourceDur   = MergeComm.ScriptSourceDur/1000
    ,ScheduleSourceDur = MergeComm.ScheduleSourceDur/1000
    ,PhoneSourceDur    = MergeComm.PhoneSourceDur/1000
    ,SmsSourceDur      = MergeComm.SmsSourceDur/1000
    ,MsmSourceDur      = MergeComm.MsmSourceDur/1000
    ,Hl7SourceDur      = MergeComm.Hl7SourceDur/1000
    ,SmtpSourceDur     = MergeComm.SmtpSourceDur/1000
    ,EmailSourceDur    = MergeComm.EmailSourceDur/1000
    ,WctpSourceDur     = MergeComm.WctpSourceDur/1000
    ,VoceraSourceDur   = MergeComm.VoceraSourceDur/1000
    ,FaxSourceDur      = MergeComm.FaxSourceDur/1000
    ,TapSourceDur      = MergeComm.TapSourceDur/1000
    ,SnppSourceDur     = MergeComm.SnppSourceDur/1000
    ,RaulandBorgSourceDur = MergeComm.RaulandBorgSourceDur
    ,WebServiceSourceDur = MergeComm.WebServiceSourceDur;

With Logins(cltId
    ,WebDirectory,WebMessaging ,MiTeamWeb,WebDirectoryDur,WebMessagingDur,MiTeamWebDur) AS
         (

             SELECT T.cltId
                  ,SUM(T.WebDirectory) AS WebDirectory,SUM(T.WebMessaging) AS WebMessaging,SUM(T.MiTeamWeb) AS MiTeamWeb
                  ,SUM(T.WebDirectoryDur) AS WebDirectoryDur,SUM(T.WebMessagingDur) AS WebMessagingDur,SUM(T.MiTeamWebDur) AS MiTeamWebDur
             FROM
                 (
                     SELECT C.cltId
-- ,SUM(CASE L.stationType WHEN 0 THEN 1 else 0 end) AS Agent
-- ,SUM(CASE L.stationType WHEN 1 THEN 1 else 0 end) AS Supervisor
-- ,SUM(CASE L.stationType WHEN 10 THEN 1 else 0 end) AS SoftAgent

                          ,SUM(CASE L.stationType WHEN 2 THEN 1 else 0 end) AS WebDirectory
                          ,SUM(CASE L.stationType WHEN 18 THEN 1 else 0 end) AS WebMessaging
                          ,SUM(CASE L.stationType WHEN 26 THEN 1 else 0 end) AS MiTeamWeb

-- ,SUM(CASE L.stationType WHEN 0 THEN DATEDIFF(SS,L.[Login], L.[Logout]) else 0 end) AS AgentDur
-- ,SUM(CASE L.stationType WHEN 1 THEN DATEDIFF(SS,L.[Login], L.[Logout]) else 0 end) AS SupervisorDur
-- ,SUM(CASE L.stationType WHEN 10 THEN DATEDIFF(SS,L.[Login], L.[Logout]) else 0 end) AS SoftAgentDur
                          ,SUM(CASE L.stationType WHEN 2 THEN DATEDIFF(SS,L.[Login], L.[Logout]) else 0 end) AS WebDirectoryDur
                          ,SUM(CASE L.stationType WHEN 18 THEN DATEDIFF(SS,L.[Login], L.[Logout])  else 0 end) AS WebMessagingDur
                          ,SUM(CASE L.stationType WHEN 26 THEN DATEDIFF(SS,L.[Login], L.[Logout]) else 0 end) AS MiTeamWebDur

                     FROM   statLogout L
                                JOIN  agtAgents A ON A.agtID = L.agtId
                                JOIN dirListings D ON D.agtID = A.agtId AND D.subId = A.subID
                                JOIN cltClients C ON C.cltId = D.cltId
                     WHERE
                         (C.ClientNumber BETWEEN @STARTCLIENT AND @ENDCLIENT
                             AND L.[Login] BETWEEN @STARTDATE AND @ENDDATE
                             AND (L.stationType = 2 OR L.stationType = 18 OR L.stationType = 26))
--AND A.Name = 'kbeale'
                     GROUP BY C.cltId, L.stationType
                 ) T
             GROUP By cltId
         )

    MERGE INTO #RuleThemAll
USING Logins
ON #RuleThemAll.cltID = Logins.cltID
    WHEN MATCHED THEN

UPDATE
    SET WebDirectory = Logins.WebDirectory
    ,WebMessaging = Logins.WebMessaging
    ,MiTeamWeb = Logins.MiTeamWeb

    ,WebDirectoryDur = Logins.WebDirectoryDur
    ,WebMessagingDur = Logins.WebMessagingDur
    ,MiTeamWebDur = Logins.MiTeamWebDur;

WITH DirSetups (cltID, Setups, Duration) AS
         (
             SELECT C.cltID, COUNT(C.cltID) AS Setups
                  ,SUM(DATEDIFF(SECOND, '1900-01-01 00:00:00.000', D.Duration)) AS Duration
             FROM statDirectorySetup D
                      JOIN dirSubjects S ON S.subId = D.subId
                      JOIN cltClients C ON C.cltId = S.BillingcltID
             WHERE D.Stamp BETWEEN @StartDate AND @EndDate
             GROUP BY C.cltID
         )

    MERGE INTO #RuleThemAll
USING DirSetups
ON #RuleThemAll.cltID = DirSetups.cltID
    WHEN MATCHED THEN
UPDATE SET DirSetups = DirSetups.Setups, DirSetupsDuration = DirSetups.Duration;

-------------------------------------------------

-- real select
SELECT * FROM #RuleThemAll

-- Test Time Cap
--SELECT @TimeCap As [Actual], @TimeCap * 60 AS [Seconds]
--SELECT ClientNumber, ClientName,BillingCode,SelSecDuration, SelFetchDuration, SelSecDurationCap, SelFetchDurationCap FROM #RuleThemAll

-- WHERE DirSetups > 1
ORDER BY ClientNumber



DROP TABLE #RuleThemAll -- not needed in crystal if it closes its SQL session when done.


--Test code
--select C.ClientNumber, C.ClientName, CE.*
--FROM statCallEnd CE
--JOIN cltClients C ON C.cltId = CE.cltId
--WHERE kind = 2
--ORDER BY ClientNumber

--select C.ClientNumber, C.ClientName, CE.*
--FROM statCallEnd CE
--JOIN cltClients C ON C.cltId = CE.cltId
--WHERE kind = 10
----AND (selAuto > 0 OR unselAuto >0)
--AND C.ClientNumber > 0
--ORDER BY ClientNumber
