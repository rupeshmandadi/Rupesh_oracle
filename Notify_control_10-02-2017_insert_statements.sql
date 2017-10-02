REM INSERTING into NOTIFY_CONTROL
SET DEFINE OFF;
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (80,'Unlocked No Of Days','Unlocked No Of Days5.10','select (SELECT * FROM (SELECT  TRUNC(UPDT_OFF_DT-UPDT_ON_DT)  FROM APPL_UPDT_ACCESS WHERE CASE_ID=:I_CASE_ID ORDER BY UPDT_ACCESS_ID DESC) WHERE ROWNUM=1) from dual','C',to_date('14-JUL-17 05:15:07','DD-MON-RR HH:MI:SS'),to_date('14-JUL-17 05:15:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (43,'PR End Date','PR End Date','SELECT (select to_char(expected_end_dt,''mm-dd-yyyy'') from  pr_candidate where ipmsysid=:i_ipmsysid and case_id=:i_case_id) FROM DUAL','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (57,'Guaranty Agency Name','Guaranty Agency Name','select (select partner_name from partner where ipmsysid in (select initiator_ipmsysid from PARTNER_INITIATION where ipmsysid=:i_ipmsysid and rownum=1) and rownum=1) from dual','C',to_date('21-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('21-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (16,'PRCN','PRCN','select
         (select prcn 
            from program_review 
           where program_review_id=:i_pr_id
             and current_status_ind=''C''
         ) prcn
      from dual','C',to_date('23-NOV-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('23-NOV-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (17,'PRR Issue Date','PRR Issue Date','select
         (select prr_issued_dt 
            from pr_determ
           where program_review_id=:i_pr_id
             and current_status_ind=''C''
         ) prcn
      from dual','C',to_date('23-NOV-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('23-NOV-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (37,'Recert Due Date','Recert Due Date','  SELECT( SELECT 
         TO_CHAR(d.recert_due_dt,''YYYY'')
    FROM determination d
   WHERE record_type=''A''
     AND ipmsysid=:i_ipmsysid)
     FROM DUAL','C',to_date('02-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('02-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (19,'COFP Due Date','Current Operations and Future Plans Due Date','SELECT( SELECT 
         TO_CHAR(pd.cofp_due_dt ,''MM/DD/YYYY'')
    FROM partner_detail pd
   WHERE ipmsysid=:i_ipmsysid)
     FROM DUAL','C',to_date('14-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('14-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (15,'CA Due Date','Compliance Audit Due Date','SELECT( SELECT 
         TO_CHAR(pd.ca_due_dt,''MM/DD/YYYY'')
    FROM partner_detail pd
   WHERE ipmsysid=:i_ipmsysid)
     FROM DUAL','C',to_date('15-OCT-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-OCT-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (18,'PRR Response Due Date','PRR Response Due Date','select 
          ( select response_due_dt
              from
                  (select response_due_dt 
                     from prr
                    where program_review_id=:i_pr_id
                    order by prr_id desc
                   )
              where rownum=1
          ) response_due_dt
      from dual','C',to_date('23-NOV-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('23-NOV-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (21,'Submission Date','Submission Date','SELECT ( SELECT TO_CHAR(ps.submit_dt,''MM/DD/YYYY HH:MI:SS'')
                   FROM partner_submission ps 
                  WHERE ps.ipmsysid=:i_ipmsysid 
                    AND ps.submission_id=:i_submission_id 
                    AND ps.current_status_ind=''C'' 
               ) 
         FROM DUAL','C',to_date('18-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('18-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (22,'Due Date','Due Date','SELECT (SELECT TO_CHAR(NVL(pd.fs_due_dt,pd.ca_due_dt),''MM/DD/YYYY'') 
          FROM partner_detail pd 
         WHERE ipmsysid=:i_ipmsysid 
           AND current_status_ind=''C''
        ) due_date
   FROM DUAL','C',to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (23,'CA Due Date','Compliance Due Date',' SELECT (SELECT TO_CHAR(pd.ca_due_dt,''MM/DD/YYYY'') 
          FROM partner_detail pd 
         WHERE ipmsysid=:i_ipmsysid 
           AND current_status_ind=''C''
        ) due_date
   FROM DUAL','C',to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (24,'Submission FY End Date','Submission Fiscal Year End Date',' SELECT 
 (SELECT to_char(ps.fy_end_dt,''MM/DD/YYYY'') 
   FROM partner_submission ps
  WHERE ps.ipmsysid=:i_ipmsysid 
    AND ps.submission_id=:i_submission_id 
    AND current_status_ind=''C''
  ) sub_fy_end_dt
  FROM DUAL','C',to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (25,'RID','RID','SELECT 
(SELECT rid FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=''A'' and p.end_dt is null) rid
FROM DUAL','C',to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('21-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (26,'FS Due Date','Financial Statement Due Date',' SELECT (SELECT TO_CHAR(pd.fs_due_dt,''MM/DD/YYYY'') 
          FROM partner_detail pd 
         WHERE ipmsysid=:i_ipmsysid 
           AND current_status_ind=''C''
        ) due_date
   FROM DUAL','C',to_date('22-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('22-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (20,'FY End Date','FY End Date','SELECT( SELECT 
         TO_CHAR(pd.current_fye_dt ,''MM/DD/YYYY'')
    FROM partner_detail pd
   WHERE ipmsysid=:i_ipmsysid)
     FROM DUAL','C',to_date('15-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-DEC-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (59,'Cohort Date','Cohort Date','select trunc(LAST_DAY(ADD_MONTHS(:i_recert_cohort_dt,9))) Cohort_dt from dual','C',to_date('17-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),to_date('17-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (60,'PPA Exp Begin DT','PPA Expiration Between Dates','select LAST_DAY(ADD_MONTHS(:i_recert_cohort_dt,6)) Cohort_dt from dual','C',to_date('17-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),to_date('17-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (61,'PPA Exp End dt','PPA Exp End Dt','select (LAST_DAY(ADD_MONTHS(:i_recert_cohort_dt,9))-1) Cohort_dt from dual','C',to_date('17-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),to_date('17-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (62,'Contact Due Dt','Contact Due Dt','select sysdate+14 from dual','C',to_date('22-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),to_date('22-FEB-17 12:00:00','DD-MON-RR HH:MI:SS'),'IPSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (27,'ARS Name','ARS Name','select(SELECT  
u.First_name||'' ''||last_name 
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND lower(pc.case_owner)=lower(u.user_name)
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') from dual','C',to_date('12-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('12-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (28,'ARS Phone Number','ARS Phone Number','select(SELECT  
u.PHONE_NBR
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND lower(pc.case_owner)=lower(u.user_name)
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') from dual','C',to_date('12-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('12-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (29,'Specific Case User','Specific Case User','select (
SELECT 
U.FIRST_NAME||'' ''||U.LAST_NAME
                   FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_ATTRIBUTE fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_attribute_cd  IN ( SELECT col1 FROM TABLE(f_string_to_arrayString(:i_fsa_attribute))) 
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND ROWNUM=1) from dual','C',to_date('13-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('13-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (30,'Approved/Reject','Approved/Reject','select (SELECT 
CASE extn_approv_ind
WHEN ''Y'' THEN ''Approved''
when ''N'' then ''Rejected''
END  from OIG_AUDIT_receipt where case_iD=i_case_id) from dual','C',to_date('13-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('13-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (31,'Role Name','Role Name','select (SELECT  
ir.ipm_role_name
         FROM partner_case pc,
                   ipm_user u,
                   ipm_role_ref ir
       WHERE  ir.ipm_role_id=u.ipm_role_id
         AND lower(pc.case_owner)=lower(u.user_name)
       and pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') from dual','C',to_date('14-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('14-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (42,'PR Start Date','PR Start Date','SELECT ( SELECT to_char(expected_start_dt,''mm-dd-yyyy'') FROM  pr_candidate WHERE ipmsysid=:i_ipmsysid AND case_id=:i_case_id) FROM DUAL','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (36,'FMS Insert Table','FMS Insert Table','select null from dual','C',to_date('29-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('29-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (44,'Adjunct Name','Adjunct Name','select (select iu.user_id  from aaa_reviewer ar,ipm_user iu
where iu.user_name=ar.reviewer_user
and  ar.reviewer_user is not null and rownum=1) from dual where rownum=1','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (45,'Notification Sent Date','Notification Sent Date','select (select sent_dt from notify  where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (46,'Onsite/Offsite','Onsite/Offsite','select (SELECT ONOFF_SITE_CD FROM PR_CANDIDATE WHERE PR_CANDIDATE_ID =(SELECT PR_CANDIDATE_ID FROM PROGRAM_REVIEW WHERE PR_CANDIDATE_ID=:I_PR_ID)) from dual','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (92,'Due Date','Due Date 12.1','select (select due_dt from fsca_detail where ipmsysid=:i_ipmsysid and  to_char(fye_dt,''mm-dd-yy'')=to_char(to_date(:i_fye_dt,''mm-dd-yy''),''mm-dd-yy'')) from dual','C',to_date('14-SEP-17 02:02:39','DD-MON-RR HH:MI:SS'),to_date('14-SEP-17 02:02:39','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (93,'FY End Date','FY End Date 12.1','select (select fye_dt from fsca_detail where ipmsysid=:i_ipmsysid and  to_char(fye_dt,''mm-dd-yy'')=to_char(to_date(:i_fye_dt,''mm-dd-yy''),''mm-dd-yy'')) from dual','C',to_date('14-SEP-17 02:03:59','DD-MON-RR HH:MI:SS'),to_date('14-SEP-17 02:03:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (67,'DPA Name','DPA Name','select (SELECT FIRST_NAME||'' ''||LAST_NAME 
FROM IPM_USER IU,partner_user_role PU
 where IU.USER_ID=PU.PARTNER_USER_ID
 AND ipmsysid=:i_ipmsysid AND RECORD_TYPE=''A'' and partner_role_cd IN (''PDPA'',''SPDA'',''AA'') AND ROWNUM=1) name from dual','C',to_date('14-APR-17 01:00:04','DD-MON-RR HH:MI:SS'),to_date('14-APR-17 01:00:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (68,'Debared Official','Debared Official','SELECT (select  p.FIRST_NAME||'' ''||P.LAST_NAME from person p where p.person_id=:i_person_id ) PERSON_NAME FROM DUAL','C',to_date('14-APR-17 01:06:23','DD-MON-RR HH:MI:SS'),to_date('14-APR-17 01:06:23','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (69,'Debared Official Role','Debared Official Role','SELECT (select  DE.ENTITY_ROLE  from debarment_entity de where person_id=:i_person_id) Official_role FROM DUAL','C',to_date('14-APR-17 01:10:29','DD-MON-RR HH:MI:SS'),to_date('14-APR-17 01:10:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (70,'date received','Appl Receive Dt','SELECT (SELECT
                      pa.CREATION_DT
                  FROM 
                      partner_appl pa
                     WHERE pa.application_id=(SELECT pc.application_id  FROM partner_case pc WHERE pc.ipmsysid=:i_ipmsysid AND pc.case_id=:i_case_id)
                  AND pa.current_status_ind=''C''
                ) RECEIVE_DATE
           FROM DUAL','C',to_date('14-APR-17 02:09:47','DD-MON-RR HH:MI:SS'),to_date('14-APR-17 02:09:47','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (71,'Application Purpose','Appl Purpose','SELECT (SELECT
                      pr.appl_purp_name
                  FROM 
                      partner_appl pa,
                      appl_purp_ref pr
                WHERE pa.application_id=(SELECT pc.application_id  FROM partner_case pc WHERE pc.ipmsysid=:i_ipmsysid AND pc.case_id=:i_case_id)
                  AND pa.primary_purp_id=pr.appl_purp_id
                  AND pa.current_status_ind=''C''
                ) appl_purp_name
           FROM DUAL','C',to_date('14-APR-17 02:16:02','DD-MON-RR HH:MI:SS'),to_date('14-APR-17 02:16:02','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (72,'Missing Documents','Missing Documents','select (SELECT  DTR.DOC_TYPE_NAME 
FROM IPM_DOC ID,DOC_TYPE_REF DTR 
WHERE  ID.DOC_TYPE_ID=DTR.DOC_TYPE_ID
AND APPLICATION_ID=:I_APPLICATION_ID
AND ACCEPT_STATUS=''U'' and rownum=1) from dual','C',to_date('18-APR-17 11:10:03','DD-MON-RR HH:MI:SS'),to_date('18-APR-17 11:10:03','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (73,'Debared User Role','Debared User Role','SELECT (select  DE.ENTITY_ROLE  from debarment_entity de where USER_ID=:I_USER_ID and current_status_ind=''C'') Official_role FROM DUAL','C',to_date('19-APR-17 11:26:46','DD-MON-RR HH:MI:SS'),to_date('19-APR-17 11:26:46','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (47,'Determination Issue Date','Detarmination Issue Date','select (select to_char(issued_dt,''mm/dd/yyyy'' from pr_determ where program_review_id=:i_pr_id) issued_dt from dual','C',to_date('08-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('08-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (48,'PR Report Issued Date','PR Report Issued Date','select (select to_char(PRR_ISSUED_DT,''mm/dd/yyyy'' from pr_determ where program_review_id=:i_pr_id) issued_dt from dual','C',to_date('08-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('08-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (49,'PR Report Due Date','PR Report Due Date','select (select to_char(PRR_PARTNER_DUE_DT,''mm/dd/yyyy'' from pr_determ where program_review_id=:i_pr_id) issued_dt from dual','C',to_date('08-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('08-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (50,'Eligilibility Report Receive Date','Eligilibility Report Receive Date','SELECT (select  submit_dt from partner_submission 
where ipmsysid=:i_ipmsysid and application_id=:i_application_id and current_status_ind=''C'') SUBMIT_DT FROM DUAL','C',to_date('14-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('14-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (54,'Case Receive/submit date','Case Receive/submit date','SELECT (select start_dt from partner_case where case_id=i_case_id and current_status_ind=''C'') START_DATE) FORM DUAL','C',to_date('15-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (55,'Case Receive/submit Time','Case Receive/submit Time','SELECT (select TO_CHAR(start_dt,''HH\MI\SS'' from partner_case where case_id=i_case_id and current_status_ind=''C'') START_TIME) FORM DUAL','C',to_date('15-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (56,'OIG Audit Report<Approved/Rejected>','OIG Audit Report<Approved/Rejected>','select (SELECT DECODE(EXTN_REQUEST_IND,''Y'',''Approved'',''N'',''Rejected'',EXTN_REQUEST_IND) FROM OIG_AUDIT_RECEIPT WHERE ipmsysid=:i_ipmsysid
and case_id=:i_case_id) "Approved/rejected" FROM dual','C',to_date('15-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (65,'Weak Debarment Failed Usr','Weak Debarment Failed Usr','select (SELECT IU.first_name||'' ''||IU.LAST_NAME
           FROM DEBARMENT_ENTITY DE,
           IPM_USER IU 
           WHERE DE.USER_ID=IU.USER_ID
           AND IPMSYSID=:i_ipmsysid AND DEBARMENT_ID=:i_debarment_id
           AND DEBAR_TYPE_CD=''W''
           AND DEBAR_RESULT_CD=2) Debared_user from dual','C',to_date('12-APR-17 01:14:49','DD-MON-RR HH:MI:SS'),to_date('12-APR-17 01:14:49','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (66,'Shoten Partner Name','Shorten Partner Name','SELECT
(SELECT p.partner_name FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type and p.end_dt is null)
FROM dual','C',to_date('13-APR-17 11:04:20','DD-MON-RR HH:MI:SS'),to_date('13-APR-17 11:04:20','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (75,'Testing Year','Testing Year','select (select  testing_yr  from USMLE_REPORTING where IPMSYSID=:i_ipmsysid and review_by_cd=''P'' and current_status_ind=''C'' and rownum=1) from dual','C',to_date('27-APR-17 10:31:02','DD-MON-RR HH:MI:SS'),to_date('27-APR-17 10:31:02','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (74,'Debarment Failed Dt','Debarment Failed Dt','SELECT (SELECT TO_CHAR(CREATION_DT,''MM/DD/YYY'') FORM DEBARMENT_ENTITY WHERE USER_ID=I_USER_ID AND CURRENT_STATUS_IND=''C'') FROM DUAL','C',to_date('19-APR-17 12:01:31','DD-MON-RR HH:MI:SS'),to_date('19-APR-17 12:01:31','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (64,'Partner Ph Nbr','Partner Ph Nbr','SELECT 
(select  PHONE_NBR from partner_address  where ipmsysid=:I_IPMSYSID and record_type=:i_record_type and rownum=1) PARTNER_PH_NBR
FROM DUAL','C',to_date('10-APR-17 04:07:37','DD-MON-RR HH:MI:SS'),to_date('10-APR-17 04:07:37','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (63,'Modified User','Modified User','select (select first_name||'' ''||last_name from ipm_user
where user_NAME =(select user_modified from ipm_user where user_id=:i_user_id AND CURRENT_STATUS_IND=''C''))user_modified from dual','C',to_date('21-MAR-17 12:36:19','DD-MON-RR HH:MI:SS'),to_date('21-MAR-17 12:36:19','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (32,'Name','Name','select (select first_name||'' ''||last_name from ipm_user where user_id=:i_user_id) from dual','C',to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (33,'Debarment Count','Debarment Count','select (select count(debar_result_cd)
from annual_debarment ad,debarment d,debarment_entity de
where ad.annual_debarment_id=d.annual_debarment_id
and de.debarment_id=d.debarment_id
and ad.annual_debarment_id=:i_annual_debarment_id) from dual','C',to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (34,'Debarment Passes','Debarment Passes','select (select count(debar_result_cd)
from annual_debarment ad,debarment d,debarment_entity de
where ad.annual_debarment_id=d.annual_debarment_id
and de.debarment_id=d.debarment_id
AND debar_result_cd=1
and ad.annual_debarment_id=:i_annual_debarment_id) from dual','C',to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (35,'Debarment Fails','Debarment Fails','select (select count(debar_result_cd)
from annual_debarment ad,debarment d,debarment_entity de
where ad.annual_debarment_id=d.annual_debarment_id
and de.debarment_id=d.debarment_id
AND debar_result_cd=2
and ad.annual_debarment_id=:i_annual_debarment_id) from dual','C',to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('15-SEP-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (58,'Public Comments','Public Comments','select (select public_comments from close_school_review  where case_id=:i_case_id) public_comments from dual','C',to_date('04-JAN-17 12:00:00','DD-MON-RR HH:MI:SS'),to_date('04-JAN-17 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (14,'Recertification Due Date','Recertification Due Date','  SELECT( SELECT 
         TO_CHAR(d.recert_due_dt,''MM/DD/YYYY'')
    FROM determination d
   WHERE record_type=''A''
     AND ipmsysid=:i_ipmsysid)
     FROM DUAL','C',to_date('09-OCT-15 12:00:00','DD-MON-RR HH:MI:SS'),to_date('09-OCT-15 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (38,'LOC Number','LOC Number','SELECT( SELECT 
         LOC_NBR
    FROM partner_loc d
   where ipmsysid=:i_ipmsysid
     and loc_id=:i_loc_id)
     FROM DUAl','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (1,'President/Chancellor/CEO','President/Chancellor/CEO','SELECT      
               (SELECT
              p.first_name||'',''||p.last_name||'' ''||
              p.middle_initial official_name
     FROM person p,
              partner_official po,
              partner_official_title pot,
              official_title_ref otr
  WHERE p.person_id = po.person_id
      AND po.partner_official_id = pot.partner_official_id
      AND pot.official_title_id=otr.official_title_id
      AND p.current_status_ind=''C''
      AND po.current_status_ind=''C''
      AND pot.current_status_ind=''C''
      AND pot.record_type=po.record_type
      AND pot.record_type= p.record_type
      AND pot.end_dt IS NULL
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      AND pot.official_title_id=1) official_name
      FROM DUAL','C',to_date('05-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('05-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (76,'Money Flow Meeting Date','Money Flow Meeting Date','select (SELECT meeting_dt FROM TEAM_MEETING where meeting_id=:i_meeting_id where rownum=1) from dual','C',to_date('09-JUN-17 09:49:45','DD-MON-RR HH:MI:SS'),to_date('09-JUN-17 09:49:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (77,'Money Flow Meeting Start Time','Money Flow Meeting Start Time','select (SELECT start_time FROM TEAM_MEETING where meeting_id=:i_meeting_id and rownum=1) from dual','C',to_date('09-JUN-17 09:51:13','DD-MON-RR HH:MI:SS'),to_date('09-JUN-17 09:51:13','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (78,'Money Flow Meeting Subject','Money Flow Meeting Subject','select (SELECT meeting_subject FROM TEAM_MEETING where meeting_id=:i_meeting_id and rownum=1) from dual','C',to_date('09-JUN-17 09:52:26','DD-MON-RR HH:MI:SS'),to_date('09-JUN-17 09:52:26','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (79,'MOP Determ DT','MOP Determ DT','select (SELECT  MOP_DETERM_DT  FROM CHANGE_MOP where case_id=:i_case_id and rownum=1) from dual','C',to_date('13-JUN-17 05:30:02','DD-MON-RR HH:MI:SS'),to_date('13-JUN-17 05:30:02','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (81,'Purpose','Purpose 5.10','select (select ap.APPL_PURP_NAME from partner_appl pa,appl_purp_ref ap
 where PA.appl_type_id=AP.APPL_PURP_ID
 and  application_id=:i_application_id and rownum=1) from dual','C',to_date('19-JUL-17 02:10:54','DD-MON-RR HH:MI:SS'),to_date('19-JUL-17 02:10:54','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (83,'User Name','User Name','select (select user_name from ipm_user where user_id=:i_user_id and rownum=1) from dual','C',to_date('19-JUL-17 04:25:24','DD-MON-RR HH:MI:SS'),to_date('19-JUL-17 04:25:24','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (84,'New User Role','New User Role','select (SELECT LISTAGG(FSA_ROLE_CD,'','') WITHIN GROUP(ORDER BY 1)FSA_ROLE_CD FROM FSA_USER_ROLE WHERE USER_ID=:I_USER_ID
AND END_DT IS NULL and rownum=1) from dual','C',to_date('19-JUL-17 04:25:26','DD-MON-RR HH:MI:SS'),to_date('19-JUL-17 04:25:26','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (85,'Old User Role','Old User Role','select (SELECT LISTAGG(FSA_ROLE_CD,'','') WITHIN GROUP(ORDER BY 1)FSA_ROLE_CD FROM FSA_USER_ROLE WHERE USER_ID=:I_USER_ID
AND END_DT IS not NULL and rownum=1) from dual','C',to_date('19-JUL-17 04:25:27','DD-MON-RR HH:MI:SS'),to_date('19-JUL-17 04:25:27','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (86,'Date Of Change','Date Of Change','select (select  isso_approv_dt from fsa_user_request where fsa_user_request_id=:i_user_id and rownum=1) from dual','C',to_date('19-JUL-17 04:25:29','DD-MON-RR HH:MI:SS'),to_date('19-JUL-17 04:25:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (87,'Approv Comments','Approv Comments','select (select  isso_approv_comments from fsa_user_request where fsa_user_request_id=:i_user_id and rownum=1) from dual','C',to_date('19-JUL-17 04:25:31','DD-MON-RR HH:MI:SS'),to_date('19-JUL-17 04:25:31','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (88,'Role Name','Role Name_13','select (SELECT IPM_ROLE_NAME FROM IPM_ROLE_REF IRF,IPM_USER IU
           WHERE IU.IPM_ROLE_ID=IRF.IPM_ROLE_ID
           AND IU.USER_ID=:i_user_id AND ROWNUM=1) from dual','C',to_date('21-JUL-17 04:55:32','DD-MON-RR HH:MI:SS'),to_date('21-JUL-17 04:55:32','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (2,'Date','Date','SELECT TO_CHAR(TRUNC(SYSDATE),''MM/DD/YYYY'') FROM DUAL WHERE length(:i_ipmsysid)>=0 AND length(:i_record_type)>0','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (3,'CEO Job Title','CEO Job Title','SELECT 
(SELECT
                 po.job_title 
     FROM person p,
              partner_official po,
              partner_official_title pot,
              official_title_ref otr
  WHERE p.person_id = po.person_id
      AND po.partner_official_id = pot.partner_official_id
      AND pot.official_title_id=otr.official_title_id
      AND p.current_status_ind=''C''
      AND po.current_status_ind=''C''
      AND pot.current_status_ind=''C''
      AND pot.record_type=po.record_type
      AND pot.record_type= p.record_type
      AND pot.end_dt IS NULL
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      AND pot.official_title_id=1)
      FROM DUAL','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (4,'Partner Name','Partner Name','SELECT
(SELECT p.partner_name FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:I_RECORD_TYPE)
FROM dual','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (5,'Address1','Address1','SELECT
(SELECT pa.address1 FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (6,'Address2','Address2','SELECT
(SELECT pa.address2 FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (41,'Collection Sent Date','Collection Sent Date','SELECT( SELECT 
         to_char(collection_sent_dt,''mm/dd/yyyy''
    FROM manage_loc d
   where ipmsysid=:i_ipmsysid
     and loc_nbr=:i_loc_id)
     FROM DUAL','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (8,'City','City','SELECT
(SELECT pa.city FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (9,'State','State','select (SELECT s.state_name FROM partner_address pa,state_ref s WHERE  pa.state_cd=s.state_cd(+) AND  pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null and rownum=1) from dual','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (10,'Country','Country','SELECT
(SELECT c.country_name FROM partner_address pa,country_ref c WHERE  pa.country_cd=c.country_cd AND  pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (11,'Zip Code','Zip Code','SELECT
(SELECT pa.zip_code FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (12,'Address','Address','SELECT 
(SELECT CASE WHEN p.address1 IS NULL THEN NULL ELSE TRIM(p.address1)||'', ''END
              ||CASE WHEN p.address2 IS NULL THEN NULL ELSE TRIM(p.address2)||'', ''END
              ||CASE WHEN p.city IS NULL THEN NULL ELSE TRIM(p.city)||'', ''END
              ||CASE WHEN p.state_cd IS NULL THEN NULL ELSE TRIM( p.state_cd)||'', ''END
              || CASE WHEN p.country_cd IS NULL THEN NULL ELSE TRIM(p.country_cd) END
                      FROM partner_address p
                    WHERE p.ipmsysid=:i_ipmsysid
                        AND p.record_type=:i_record_type
                       AND p.end_dt is null
                        AND p.address_type_id=6) address
FROM DUAL','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (13,'Partner ID','Partner ID','SELECT 
(SELECT p.partner_id FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type ) partnerid
FROM DUAL','C',to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 12:00:00','DD-MON-RR HH:MI:SS'),null);
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (39,'LOC Amount','LOC Amount','SELECT( SELECT 
         LOC_AMT
    FROM partner_loc d
   where ipmsysid=:i_ipmsysid
     and loc_id=:i_loc_id)
     FROM DUAl','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into NOTIFY_CONTROL (MSG_CONTROL_ID,MSG_CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (40,'LOC Expiration Date','LOC Expiration Date','SELECT( SELECT 
         to_char(expire_dt,''mm/dd/yyyy''
    FROM partner_loc d
   where ipmsysid=:i_ipmsysid
     and loc_nbr=:i_loc_id)
     FROM DUAL','C',to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),to_date('07-DEC-16 12:00:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');



