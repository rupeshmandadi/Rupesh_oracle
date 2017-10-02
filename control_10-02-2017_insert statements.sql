REM INSERTING into CONTROL
SET DEFINE OFF;
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (175,'Eligibility Analyst','Eligibility Analyst','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_attribute fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_attribute_cd=''EA-AN''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND ROWNUM<2) Elligibility_enalyst
       FROM
       DUAL','C',to_date('28-APR-17 02:15:47','DD-MON-RR HH:MI:SS'),to_date('28-APR-17 02:15:47','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (171,'First Recert Due Letter Sent Dt','First Recert Due Letter Sent Dt','select null from dual','C',to_date('24-APR-17 10:38:01','DD-MON-RR HH:MI:SS'),to_date('24-APR-17 10:38:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (31,'Case Manager','Case Manager','SELECT
 (SELECT u.first_name||'',''||u.last_name
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'' and rownum=1) case_manager_email
       FROM
       DUAL','C',to_date('16-MAR-14 06:23:16','DD-MON-RR HH:MI:SS'),to_date('16-MAR-14 06:23:20','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (32,'Compliance Manager','Compliance Manager','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_role fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_role_cd=''CM''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND ROWNUM<2) compliance_manager
       FROM
       DUAL','C',to_date('16-MAR-14 06:26:23','DD-MON-RR HH:MI:SS'),to_date('16-MAR-14 06:26:27','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (33,'Approval Date','Approval Date','SELECT TO_CHAR(TRUNC(SYSDATE),''MM/DD/YYYY'') FROM DUAL WHERE length(:i_ipmsysid)>=0 AND length(:i_record_type)>0','C',to_date('16-MAR-14 06:36:36','DD-MON-RR HH:MI:SS'),to_date('16-MAR-14 06:36:40','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (34,'Division Director','Division Director','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_role fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_role_cd=''DD''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND rownum<2) division_director
       FROM
       DUAL','C',to_date('16-MAR-14 06:50:36','DD-MON-RR HH:MI:SS'),to_date('16-MAR-14 06:50:38','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (17,'PPA Approval Date',null,'SELECT (SELECT TO_CHAR(p.actn_dt,''MM/DD/YYYY'')  approval_date FROM ppa p,determination d WHERE p.ipmsysid=d.ipmsysid AND p.ppa_sys_id=d.ppa_sys_id AND d.ipmsysid=:i_ipmsysid AND d.record_type=:i_record_type) FROM DUAL','C',to_date('23-DEC-13 02:57:24','DD-MON-RR HH:MI:SS'),to_date('23-DEC-13 02:57:24','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (24,'Phone Number','Phone Number','SELECT
(SELECT pa.phone_nbr FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6)
FROM dual','C',to_date('03-JAN-14 01:17:58','DD-MON-RR HH:MI:SS'),to_date('03-JAN-14 01:18:01','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (18,'Recertification Due Date',null,'SELECT (SELECT TO_CHAR(p.recert_due_dt,''MM/DD/YYYY'') recert_due_dt  FROM ppa p,determination d WHERE p.ipmsysid=d.ipmsysid AND p.ppa_sys_id=d.ppa_sys_id AND d.ipmsysid=:i_ipmsysid AND d.record_type=:i_record_type) FROM DUAL','C',to_date('23-DEC-13 02:57:31','DD-MON-RR HH:MI:SS'),to_date('23-DEC-13 02:57:31','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (19,'TIN',null,'SELECT f_alternative_id(:i_ipmsysid,6,:i_record_rype ) tin_nbr FROM  DUAL','C',to_date('23-DEC-13 02:57:33','DD-MON-RR HH:MI:SS'),to_date('23-DEC-13 02:57:33','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (20,'DUNS',null,'SELECT f_alternative_id(:i_ipmsysid,5,:i_record_rype ) tin_nbr FROM  DUAL','C',to_date('23-DEC-13 02:57:35','DD-MON-RR HH:MI:SS'),to_date('23-DEC-13 02:57:35','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (25,'Accrediting Agency','Accrediting Agency','SELECT
      (SELECT
                LISTAGG(a.accrediting_agency_name,''|'') WITHIN GROUP (ORDER BY accrediting_agency_name) accrediting_agency_name
       FROM accrediting_agency a, 
                school_accreditation sa
    WHERE a.ipmsysid = sa.accrediting_agency_ipmsysid
         AND a.current_status_ind = ''C''
         AND sa.current_status_ind = ''C''
         AND a.record_type=sa.record_type
         AND sa.school_ipmsysid=:i_ipmsysid
         AND sa.record_type=:i_record_type
         AND sa.end_dt is null
         ) accrediting_agency_name
        FROM dual','C',to_date('03-JAN-14 01:26:03','DD-MON-RR HH:MI:SS'),to_date('03-JAN-14 01:26:07','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (26,'State Agency','State Agency','SELECT
        (SELECT 
                 LISTAGG(sa.agency_name,''|'') WITHIN GROUP (ORDER BY agency_name) agency_name
       FROM school_state_authorization s, 
                state_authorizing_agency sa
     WHERE s.state_agency_ipmsysid = sa.ipmsysid
         AND sa.current_status_ind = ''C''
         AND s.current_status_ind = ''C''
         AND s.record_type=sa.record_type
         AND s.school_ipmsysid=:i_ipmsysid
         AND sa.record_type=:i_record_type
         AND sa.current_status_ind=''C''
         ) agency_name
         FROM DUAL','C',to_date('03-JAN-14 01:39:22','DD-MON-RR HH:MI:SS'),to_date('03-JAN-14 01:39:26','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (35,'Disapproved Additional Locations','Disapproved Additional Locations','SELECT
    (SELECT
              LISTAGG (sl.location_name||'',''||f_partner_address(sl.location_ipmsysid,sl.record_type)  , ''|'') WITHIN GROUP (ORDER BY sl.location_ipmsysid) 
    FROM school_location sl
    WHERE sl.school_ipmsysid=:i_ipmsysid
    AND sl.record_type=:i_record_type
    AND TO_NUMBER(sl.location_nbr)!=0
    AND sl.current_status_ind=''C''
   AND sl.disapprov_dt>=(SELECT pa.appl_start_dt FROM partner_appl pa WHERE pa.ipmsysid=sl.location_ipmsysid AND pa.current_status_ind=''C'')
   ) location_name
   FROM DUAL','C',to_date('16-MAR-14 08:58:00','DD-MON-RR HH:MI:SS'),to_date('16-MAR-14 08:58:03','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (174,'Date Entered By Analyst','Date Entered By Analyst','SELECT (SELECT APPL_RESUBMIT_DT FROM PARTNER_APPL PA,PARTNER_CASE PC
WHERE PC.APPLICATION_ID=PA.APPLICATION_ID
AND PC.IPMSYSID=:I_IPMSYSID AND PC.CASE_ID=:I_CASE_ID
AND PC.CURRENT_STATUS_IND=''C'' AND PA.CURRENT_STATUS_IND=''C'') FROM DUAL','C',to_date('28-APR-17 01:55:19','DD-MON-RR HH:MI:SS'),to_date('28-APR-17 01:55:19','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (36,'Denial Reason','Denial Reason',' SELECT
    (SELECT
              LISTAGG (dr.disapprov_reason, ''|'') WITHIN GROUP (ORDER BY sl.location_ipmsysid) 
    FROM school_location sl,
             disapprov_reason_ref dr
    WHERE sl.school_ipmsysid=:i_ipmsysid
    AND sl.record_type=:i_record_type
    AND sl.disapprov_reason_id=dr.disapprov_reason_id(+)
    AND TO_NUMBER(sl.location_nbr)!=0
    AND sl.current_status_ind=''C''
   AND sl.disapprov_dt>=(SELECT pa.appl_start_dt 
                           FROM partner_appl pa 
                          WHERE pa.ipmsysid=sl.location_ipmsysid 
                            AND pa.current_status_ind=''C'' 
                            AND pa.appl_type_id=1 )
   ) location_name
   FROM DUAL','C',to_date('16-MAR-14 09:04:39','DD-MON-RR HH:MI:SS'),to_date('16-MAR-14 09:04:41','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (21,'Provisional Condition','Provisional Condition','SELECT(SELECT  LISTAGG (prov_condition_id, ''|'') WITHIN GROUP (ORDER BY prov_condition_id) prov_condition_id from Prov_condition where ipmsysid=:i_ipmsysid AND record_type=:i_record_type GROUP BY ipmsysid)prov_condition_id FROM DUAL','C',to_date('30-DEC-13 01:23:32','DD-MON-RR HH:MI:SS'),to_date('30-DEC-13 01:23:39','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (22,'Additional Consideration','Additional Consideration','SELECT (SELECT  LISTAGG (ADDL_CONSIDER_ID, ''|'') WITHIN GROUP (ORDER BY ADDL_CONSIDER_ID) ADDL_CONSIDER_ID FROM ADDL_CONSIDER WHERE ipmsysid=:I_ipmsysid AND RECORD_TYPE=:I_RECORD_TYPE GROUP BY ipmsysid) ADDL_CONSIDER_ID FROM DUAL','C',to_date('30-DEC-13 01:27:34','DD-MON-RR HH:MI:SS'),to_date('30-DEC-13 01:27:37','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (353,'AmmendedQCAmt','AmmendedQCAmt','select (select TO_CHAR(AMMENDED_OR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:28:20','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:28:20','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (440,'Finding Nbr Description','Finding Nbr Description','SELECT
   (SELECT LISTAGG (defic_nbr||''|''||defic_name,'','' ) WITHIN GROUP (ORDER BY defic_name)  defic_name
   FROM
    (SELECT
           DISTINCT defic_nbr,d.defic_name
    FROM submission_defic sd,
         defic_ref d
    WHERE sd.ipmsysid=:i_ipmsysid
    AND sd.submission_id=:i_submission_id
    AND sd.defic_cd=d.defic_cd
    AND sd.review_by_cd=''AR''
    AND sd.current_status_ind=''C''
   ) )defic_name
   FROM dual','C',to_date('14-JUN-17 01:01:15','DD-MON-RR HH:MI:SS'),to_date('14-JUN-17 01:01:15','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (449,'MOP HCM2 Effective Dt','MOP HCM2 Effective Dt','select null from dual','C',to_date('30-JUN-17 10:53:48','DD-MON-RR HH:MI:SS'),to_date('30-JUN-17 10:53:48','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (274,'PA Email','PA Email','SELECT 
 (SELECT  u.EMAIL_ADDR 
         FROM partner_case pc, 
                   team_member tm, 
                   ipm_user u, 
                   fsa_user_ATTRIBUTE fur 
       WHERE pc.team_nbr=tm.team_nbr 
           AND tm.user_id=u.user_id 
           AND fur.user_id=u.user_id 
           AND fur.fsa_ATTRIBUTE_cd=''PA-AN'' 
           AND pc.ipmsysid=:i_ipmsysid 
           AND pc.case_id=:i_case_id 
           AND pc.current_status_ind=''C'' 
           AND tm.current_status_ind=''C'' 
           AND u.current_status_ind=''C'' 
           AND fur.current_status_ind=''C'' 
           AND rownum<2) PA_NAME 
       FROM 
       DUAL','C',to_date('24-MAY-17 11:57:50','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:57:50','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (437,'Exemption Audit FY end Dt','Exemption Audit FY end Dt','select null from dual','C',to_date('13-JUN-17 11:40:40','DD-MON-RR HH:MI:SS'),to_date('13-JUN-17 11:40:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (438,'Exemption next audit is due dt','Exemption next audit is due dt','select null from dual','C',to_date('13-JUN-17 11:41:42','DD-MON-RR HH:MI:SS'),to_date('13-JUN-17 11:41:42','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (137,'Audit Resolution Officer','Audit Resolution Officer','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_ATTRIBUTE fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_Attribute_cd=''ARS-AN''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND rownum<2) division_director
       FROM
       DUAL','C',to_date('25-JAN-17 11:12:42','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 11:12:42','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (441,'Institution name','Institution name','SELECT (SELECT bank_name FROM PARTNER_LOC WHERE LOC_ID IN (SELECT LOC_ID FROM MANAGE_LOC WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID)) FROM DUAL','C',to_date('15-JUN-17 01:59:53','DD-MON-RR HH:MI:SS'),to_date('15-JUN-17 01:59:53','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (143,'Financial Analyst','Financial Analyst','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_attribute fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_attribute_cd=''FA-AN''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND rownum<2) division_director
       FROM
       DUAL','C',to_date('30-JAN-17 11:10:35','DD-MON-RR HH:MI:SS'),to_date('30-JAN-17 11:10:35','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (416,'Previous Partner Name','Previous Partner Name','select (SELECT p.partner_name FROM partner p WHERE p.ipmsysid =(select previous_ipmsysid from change_affiliation where ipmsysid=:i_ipmsysid and record_type=:i_record_type)) from dual','C',to_date('07-JUN-17 10:12:53','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:12:53','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (419,'Previous DUNS','Previous DUNS','select (SELECT f_alternative_id(PREVIOUS_IPMSYSID,5,''A'') FROM 
(SELECT  PREVIOUS_IPMSYSID  FROM CHANGE_AFFILIATION  WHERE IPMSYSID=:i_ipmsysid) where  rownum=1) alternat_id from dual','C',to_date('07-JUN-17 10:14:02','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:14:02','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (420,'Previous Direct Loan','Previous Direct Loan','select 
(SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID IN (SELECT PREVIOUS_IPMSYSID FROM CHANGE_AFFILIATION WHERE IPMSYSID=:I_IPMSYSID AND RECORD_TYPE=''A'') AND ALTERNATIVE_TYPE_ID=7 and rownum=1)
from dual','C',to_date('07-JUN-17 10:14:34','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:14:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (422,'Previous PELL','Previous PELL','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID IN (SELECT PREVIOUS_IPMSYSID FROM CHANGE_AFFILIATION WHERE IPMSYSID=:I_IPMSYSID AND RECORD_TYPE=''A'') AND ALTERNATIVE_TYPE_ID=10 and rownum=1) alternative_id
from dual','C',to_date('07-JUN-17 10:15:42','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:15:42','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (458,'ammendedtotaldeductions','ammendedtotaldeductions','select (select TO_CHAR(ammended_oth_amt+ammended_aas_amt+ammended_ar_amt,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('25-AUG-17 11:26:19','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:26:19','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (455,'reviewofficials','reviewofficials','select (select review_official from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('25-AUG-17 11:22:44','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:22:44','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (456,'audittotal','audittotal','select (select TO_CHAR(total_audIt_amt,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('25-AUG-17 11:24:05','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:24:05','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (457,'originaltotaldeductions','originaltotaldeductions','select (select TO_CHAR(orig_oth_amt+orig_aas_amt+orig_ar_amt,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('25-AUG-17 11:25:00','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:25:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (459,'originalnetamount','originalnetamount','select (select TO_CHAR(orig_tr_amt-(orig_oth_amt+orig_aas_amt+orig_ar_amt),''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('25-AUG-17 11:27:21','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:27:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (460,'ammendednetamount','ammendednetamount','select (select TO_CHAR(ammended_tr_amt-(ammended_oth_amt+ammended_aas_amt+ammended_ar_amt),''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('25-AUG-17 11:28:21','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:28:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (461,'originaldate','originaldate','select (select start_dt from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('25-AUG-17 11:29:01','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:29:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (462,'mgmtimprep','mgmtimprep','select null from DUAL','C',to_date('25-AUG-17 11:33:52','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 11:33:52','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (463,'ammendedaramt','ammendedaramt','select ammended_ar_amt from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1','C',to_date('25-AUG-17 01:04:43','DD-MON-RR HH:MI:SS'),to_date('25-AUG-17 01:04:43','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (430,'Financial Analyst Fax','Financial Analyst Fax','SELECT
 (SELECT  u.FAX_NBR case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_attribute fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_attribute_cd=''FA-AN''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND rownum<2) division_director
       FROM
       DUAL','C',to_date('07-JUN-17 03:37:57','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:37:57','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (273,'PA Phone Nbr','PA Phone Nbr','SELECT 
 (SELECT  u.PHONE_NBR 
         FROM partner_case pc, 
                   team_member tm, 
                   ipm_user u, 
                   fsa_user_ATTRIBUTE fur 
       WHERE pc.team_nbr=tm.team_nbr 
           AND tm.user_id=u.user_id 
           AND fur.user_id=u.user_id 
           AND fur.fsa_ATTRIBUTE_cd=''PA-AN'' 
           AND pc.ipmsysid=:i_ipmsysid 
           AND pc.case_id=:i_case_id 
           AND pc.current_status_ind=''C'' 
           AND tm.current_status_ind=''C'' 
           AND u.current_status_ind=''C'' 
           AND fur.current_status_ind=''C'' 
           AND rownum<2) PA_NAME 
       FROM 
       DUAL','C',to_date('24-MAY-17 11:57:22','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:57:22','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (275,'date of loss of eligibility','date of loss of eligibility 40.1','select nvl(REVISED_CLOSURE_DT,CLOSURE_DT) from CLOSE_SCHOOL_REVIEW where close_school_id=:i_close_school_id','C',to_date('24-MAY-17 12:58:14','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 12:58:14','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (276,'reason for placement on Stop Payment','reason for placement on Stop Payment','select (select  MOP_REASON_NAME from change_mop cm,mop_reason_ref mrf
       where CM.MOP_REASON_ID=mrf.MOP_REASON_ID
       and cm.ipmsysid=:i_ipmsysid
       and cm.case_id=:i_case_id and rownum=1) from dual','C',to_date('24-MAY-17 01:00:21','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 01:00:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (324,'TPSOG Team Member','TPSOG Team Member','select null from dual','C',to_date('26-MAY-17 10:02:10','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:02:10','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (325,'TPSOG Due Dt','TPSOG Due Dt','select null from dual','C',to_date('26-MAY-17 10:03:34','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:03:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (326,'Servicer Personnel','Servicer Personnel','select null from dual','C',to_date('26-MAY-17 10:12:59','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:12:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (327,'Number of years in position/Date when employment began','Number of years in position/Date when employment began','select null from dual','C',to_date('26-MAY-17 10:28:04','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:28:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (328,'Date/Time of interview','Date/Time of interview','select null from dual','C',to_date('26-MAY-17 10:29:00','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:29:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (329,'Program of study','Program of study','select null from dual','C',to_date('26-MAY-17 10:37:01','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:37:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (330,'Award years enrolled/status','Award years enrolled/status','select null from dual','C',to_date('26-MAY-17 10:37:45','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:37:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (331,'Date of withdrawal/graduation','Date of withdrawal/graduation','select null from dual','C',to_date('26-MAY-17 10:38:31','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:38:31','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (332,'Relationship to student','Relationship to student','select null from dual','C',to_date('26-MAY-17 10:40:18','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:40:18','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (333,'Name','Name 41.2','select null from dual','C',to_date('26-MAY-17 10:41:29','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:41:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (334,'Final Determination Date','Final Determination Date','select null from dual','C',to_date('26-MAY-17 10:52:06','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 10:52:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (335,'PR necessary supporting information','PR necessary supporting information','select null from dual','C',to_date('26-MAY-17 01:39:13','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 01:39:13','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (336,'Total PR Liabilities','Total PR Liabilities','select null from dual','C',to_date('26-MAY-17 02:01:03','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 02:01:03','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (337,'FPRD start dt','FPRD start dt','select null from dual','C',to_date('26-MAY-17 02:04:29','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 02:04:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (338,'FPRD end dt','FPRD end dt','select null from dual','C',to_date('26-MAY-17 02:04:38','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 02:04:38','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (339,'Final PR Determination','Final PR Determination','select null from dual','C',to_date('26-MAY-17 02:23:04','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 02:23:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (340,'PR Findings','PR Findings','select null from dual','C',to_date('26-MAY-17 02:24:06','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 02:24:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (341,'description of statute/regulation','description of statute/regulation','select null from dual','C',to_date('26-MAY-17 02:26:20','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 02:26:20','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (342,'FPEO-Region','FPEO-Region','SELECT ct.team_name FROM case_team ct,partner_case pc
WHERE pc.team_nbr=ct.team_nbr
and pc.case_id=:i_case_id','C',to_date('26-MAY-17 02:56:27','DD-MON-RR HH:MI:SS'),to_date('26-MAY-17 02:56:27','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (413,'DPA Phone Nbr','DPA Phone Nbr','select (SELECT IU.PHONE_NBR 
FROM IPM_USER IU,partner_user_role PU
 where IU.USER_ID=PU.PARTNER_USER_ID
 AND ipmsysid=:i_ipmsysid AND RECORD_TYPE=''P'' and partner_role_cd IN (''PDPA'',''SPDA'',''AA'') AND ROWNUM=1) name from dual','C',to_date('07-JUN-17 09:48:40','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 09:48:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (414,'DPA Email','DPA Email','select (SELECT IU.EMAIL_ADDR 
FROM IPM_USER IU,partner_user_role PU
 where IU.USER_ID=PU.PARTNER_USER_ID
 AND ipmsysid=:i_ipmsysid AND RECORD_TYPE=''P'' and partner_role_cd IN (''PDPA'',''SPDA'',''AA'') AND ROWNUM=1) name from dual','C',to_date('07-JUN-17 09:49:03','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 09:49:03','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (415,'Federal School Code','Federal School Code','SELECT (SELECT ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID=:I_IPMSYSID AND ALTERNATIVE_TYPE_ID=12 AND ROWNUM=1) FROM DUAL','C',to_date('07-JUN-17 09:53:55','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 09:53:55','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (418,'Previous Address','Previous Address','select null from dual','C',to_date('07-JUN-17 10:13:39','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:13:39','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (424,'Chief Fianacial Officier','Chief Fianacial Officier','SELECT  (   SELECT
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      and pot.end_dt is null
      AND pot.official_title_id=4) FROM DUAL','C',to_date('07-JUN-17 03:14:33','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:14:33','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (178,'On-site/Off-site','On-site/Off-site','select null from dual','C',to_date('03-MAY-17 09:38:50','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 09:38:50','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (179,'PR Scheduled Begin Dt','PR Scheduled Begin Dt','select null from dual','C',to_date('03-MAY-17 09:40:59','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 09:40:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (180,'Name of Person Teliphoned Inst','Name of Person Teliphoned Inst','select null from dual','C',to_date('03-MAY-17 09:42:46','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 09:42:46','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (182,'Review Date','Review Date','select (SELECT to_char(nvl(pe.response_due_dt,p.response_due_dt),''mm-dd-yyyy'') FROM prr_extn pe,prr P 
WHERE P.ipmsysid=pe.ipmsysid 
AND P.case_id=pe.case_id
and  p.ipmsysid=:i_ipmsysid and p.case_id=:i_case_id and rownum=1) from dual','C',to_date('03-MAY-17 09:48:11','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 09:48:11','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (183,'Name Of SPT','Name Of SPT','select null from dual','C',to_date('03-MAY-17 09:49:40','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 09:49:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (184,'Preparation Review Dt','Preparation Review Dt','select null from dual','C',to_date('03-MAY-17 09:59:09','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 09:59:09','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (185,'Return File Dt','Return File Dt','select null from dual','C',to_date('03-MAY-17 10:12:43','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 10:12:43','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (186,'Award Year Begin Dt','Award Year Begin Dt','select null from dual','C',to_date('03-MAY-17 10:15:35','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 10:15:35','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (187,'Award Year End Dt','Award Year End Dt','select null from dual','C',to_date('03-MAY-17 10:16:10','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 10:16:10','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (198,'Tracking Number','Tracking Number','select null from dual','C',to_date('08-MAY-17 09:34:48','DD-MON-RR HH:MI:SS'),to_date('08-MAY-17 09:34:48','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (284,'Third Party Servicer','Third Party Servicer','SELECT  (   SELECT
              p.first_name||'', ''||p.last_name||'' ''||
              p.middle_initial official_name
     FROM person p,
              partner_official po,
              partner_official_title pot,
              official_title_ref otr
  WHERE p.person_id = po.person_id
      AND po.partner_official_id = pot.partner_official_id
      AND pot.official_title_id=otr.official_title_id
      AND P.current_status_ind=''C''
      AND po.current_status_ind=''C''
      AND pot.current_status_ind=''C''
      AND pot.record_type=po.record_type
      AND pot.record_type= P.record_type
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      AND pot.end_dt IS NULL
      AND pot.official_title_id=41) FROM DUAL','C',to_date('24-MAY-17 02:59:19','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 02:59:19','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (194,'Award Year','Award Year','select (SELECT award_yr FROM funds_request_270form WHERE application_id IN (SELECT application_id FROM partner_case WHERE case_id=:i_case_id) and rownum=1) from dual','C',to_date('04-MAY-17 03:28:59','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 03:28:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (200,'Compliance Audit Determ Days','Audit Determ Days','SELECT (SELECT RESPONSE_DUE_DT-PADL_SENT_DT FROM CA_REVIEW WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID AND ROWNUM=1) FROM DUAL','C',to_date('08-MAY-17 10:00:36','DD-MON-RR HH:MI:SS'),to_date('08-MAY-17 10:00:36','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (201,'Appendices Name Number','Appendices Name Number','select null from dual','C',to_date('08-MAY-17 10:22:34','DD-MON-RR HH:MI:SS'),to_date('08-MAY-17 10:22:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (202,'FEDWIRE','FEDWIRE','select null from dual','C',to_date('08-MAY-17 10:28:05','DD-MON-RR HH:MI:SS'),to_date('08-MAY-17 10:28:05','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (203,'Pell or TEACH','Pell or TEACH','select null from dual','C',to_date('08-MAY-17 10:29:04','DD-MON-RR HH:MI:SS'),to_date('08-MAY-17 10:29:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (204,'check','check','select null from dual','C',to_date('08-MAY-17 10:36:07','DD-MON-RR HH:MI:SS'),to_date('08-MAY-17 10:36:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (205,'PR Report Dt','PR Report Dt','SELECT (SELECT ISSUED_DT FROM PR_DETERM P WHERE  CASE_ID=:I_CASE_ID) FROM DUAL','C',to_date('10-MAY-17 09:30:55','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:30:55','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (206,'Compliance Summary','Compliance Summary','select null from dual','C',to_date('10-MAY-17 09:33:40','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:33:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (207,'Summary Response','Summary Response','select null from dual','C',to_date('10-MAY-17 09:34:35','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:34:35','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (209,'Lead Reviewer','Lead Reviewer','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') case_manager
       FROM
       DUAL','C',to_date('10-MAY-17 09:37:38','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:37:38','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (210,'Lead Reviewer Address','Lead Reviewer Address','SELECT
 (SELECT  u.EMAIL_ADDR
                       FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') case_manager
       FROM
       DUAL','C',to_date('10-MAY-17 09:38:03','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:38:03','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (211,'Division','Division','SELECT (SELECT  TEAM_NAME  FROM PARTNER_CASE PC,CASE_TEAM CT
WHERE PC.TEAM_NBR=CT.TEAM_NBR
 AND IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID) FROM DUAL','C',to_date('10-MAY-17 09:40:18','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:40:18','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (212,'Eligible Lender','Eligible Lender','select null from dual','C',to_date('10-MAY-17 09:42:12','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:42:12','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (314,'TPS Oversight Group','TPS Oversight Group','select null from dual','C',to_date('25-MAY-17 03:15:49','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 03:15:49','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (250,'PRR Issue Dt','PRR Issue Dt','SELECT (select prr_issued_dt from pr_determ where case_id=:I_CASE_ID and rownum=1)  prr_issued_dt FROM DUAL ORDER BY prr_issued_dt DESC','C',to_date('23-MAY-17 03:25:01','DD-MON-RR HH:MI:SS'),to_date('23-MAY-17 03:25:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (251,'PRR Response Dt','PRR Response Dt','select (SELECT RESPONSE_DT FROM PRR WHERE CASE_ID=:i_case_id and rownum=1) RESPONSE_DT from dual ORDER BY RESPONSE_DT DESC','C',to_date('23-MAY-17 03:28:33','DD-MON-RR HH:MI:SS'),to_date('23-MAY-17 03:28:33','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (252,'PRR Response Comments','PRR Response Comments','select (SELECT prr_response_comments FROM PRR where case_id=:i_case_id) from dual','C',to_date('23-MAY-17 04:17:33','DD-MON-RR HH:MI:SS'),to_date('23-MAY-17 04:17:33','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (315,'PRR Response Due Dt','PRR Response Due Dt','select (select response_due_dt from prr where ipmsysid=:i_ipmsysid and case_id=:i_case_id) from dual','C',to_date('25-MAY-17 03:30:26','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 03:30:26','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (316,'PRR Request Dt','PRR Request Dt','select (select to_char(extn_request_dt,''mm-dd-yyyy'') from prr_extn where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('25-MAY-17 03:50:06','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 03:50:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (317,'Third-Party Requester','Third-Party Requester','select null from dual','C',to_date('25-MAY-17 03:52:50','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 03:52:50','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (385,'Previous HCM2, Reimbursement','Previous HCM2, Reimbursement','select (select * from (select  MOP_TYPE_NAME from mop m ,mop_type_ref mtr
        where m.mop_type_id=mtr.mop_type_id
        and mtr.mop_type_id in (2,3)
        and ipmsysid=:i_ipmsysid
        order by start_dt desc) where rownum=1) from dual','C',to_date('31-MAY-17 09:59:20','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 09:59:20','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (425,'Chief Fianacial Officier Title','Chief Fianacial Officier Title','SELECT  (   SELECT
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      and pot.end_dt is null
      AND pot.official_title_id=4) FROM DUAL','C',to_date('07-JUN-17 03:15:52','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:15:52','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (199,'Compliance Audit Issued DT','Audit Issued DT','SELECT (SELECT PADL_SENT_DT FROM CA_REVIEW WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID AND ROWNUM=1) FROM DUAL','C',to_date('08-MAY-17 09:57:59','DD-MON-RR HH:MI:SS'),to_date('08-MAY-17 09:57:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (354,'FNUnsupportedCost','FNUnsupportedCost','select (select UC_FINDING_NUMBERS from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:29:57','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:29:57','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (355,'RecommendedUCAmt','RecommendedUCAmt','select (select TO_CHAR(RECOMMENDED_UC_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:30:33','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:30:33','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (356,'OrigUCAmt','OrigUCAmt','select (select TO_CHAR(ORIG_UC_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:31:39','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:31:39','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (357,'AmmendedUCAmt','AmmendedUCAmt','select (select TO_CHAR(AMMENDED_UC_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:32:31','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:32:31','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (358,'FNOtherRecoveries','FNOtherRecoveries','select (select OR_FINDING_NUMBERS from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:34:27','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:34:27','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (359,'RecommendedORAmt','RecommendedORAmt','select (select TO_CHAR(RECOMMENDED_OR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:35:21','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:35:21','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (360,'OrigORAmt','OrigORAmt','select (select TO_CHAR(ORIG_OR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:36:00','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:36:00','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (361,'AmmendedORAmt','AmmendedORAmt','select (select TO_CHAR(ammended_or_amt,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:37:00','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:37:00','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (362,'NonMonetary','NonMonetary','select (select NM_FINDING_NUMBERS from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:38:37','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:38:37','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (363,'OrigNRAmt','OrigNRAmt','select (select TO_CHAR(ORIG_NR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:42:53','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:42:53','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (364,'AmmendedNRAmt','AmmendedNRAmt','select (select TO_CHAR(AMMENDED_NR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:43:47','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:43:47','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (365,'OrigARAAmt','OrigARAAmt','select (select TO_CHAR(ORIG_ARA_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:45:08','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:45:08','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (366,'AmmendedARAAmt','AmmendedARAAmt','select (select TO_CHAR(AMMENDED_AR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:45:53','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:45:53','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (367,'OrigTRAmt','OrigTRAmt','select (select TO_CHAR(ORIG_TR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:46:37','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:46:37','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (368,'AmmendedTRAmt','AmmendedTRAmt','select (select TO_CHAR(AMMENDED_TR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:47:26','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:47:26','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (369,'FindingCount','FindingCount','select (select FINDING_CNT from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:48:16','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:48:16','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (370,'Openfindings','Openfindings','select (select OPEN_FINDINGS from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:49:19','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:49:19','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (371,'OrigARAmt','OrigARAmt','select (select TO_CHAR(ORIG_AR_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:50:39','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:50:39','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (372,'OrigAASAmt','OrigAASAmt','select (select TO_CHAR(ORIG_AAS_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:54:03','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:54:03','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (373,'AmmendedAASAmt','AmmendedAASAmt','select (select TO_CHAR(AMMENDED_AAS_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:54:48','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:54:48','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (374,'OrigOTHSAmt','OrigOTHSAmt','select (select TO_CHAR(ORIG_OTH_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:56:12','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:56:12','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (375,'AmmendedOTHAmt','AmmendedOTHAmt','select (select TO_CHAR(AMMENDED_OTH_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:57:11','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:57:11','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (376,'BufoneAmt','BufoneAmt','select (select TO_CHAR(BUF1_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:00:00','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:00:00','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (377,'BuftwoAmt','BuftwoAmt','select (select TO_CHAR(BUF2_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:00:39','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:00:39','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (379,'BuffourAmt','BuffourAmt','select (select TO_CHAR(BUF4_AMT,''l99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:01:17','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:01:17','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (380,'Approveruser','Approveruser','select (select APPROVER_USER from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:08:23','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:08:23','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (381,'Ogcclearance','Ogcclearance','select (select OGC_CLEARANCE from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:09:18','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:09:18','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (382,'ACDComments','ACDComments 32.3','select (select COMMENTS from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:10:45','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:10:45','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (384,'amendedTotal','amendedTotal','select (select TO_CHAR(TOTAL_MGMT_DECISION,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:16:23','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:16:23','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (387,'Certified or Overnight Mail','Certified or Overnight Mail','select null from dual','C',to_date('31-MAY-17 11:53:37','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 11:53:37','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (388,'Choose an item','Choose an item 44.3','select null from dual','C',to_date('31-MAY-17 11:54:47','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 11:54:47','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (389,'CMO Grantee DUNS','CMO Grantee DUNS','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID=:I_IPMSYSID AND ALTERNATIVE_TYPE_ID =5 AND ROWNUM=1) from dual','C',to_date('31-MAY-17 01:09:46','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:09:46','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (390,'Campus Based ID','Campus Based ID','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID=:I_IPMSYSID AND ALTERNATIVE_TYPE_ID =1 AND ROWNUM=1) from dual','C',to_date('31-MAY-17 01:10:10','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:10:10','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (391,'Campus Based Grantee DUNS','Campus Based Grantee DUNS','select (select ALTERNATIVE_ID  from alternative_identifier where ALTERNATIVE_TYPE_ID=24 AND  ipmsysid=:i_ipmsysid AND record_type=:i_record_type and rownum=1) from dual','C',to_date('31-MAY-17 01:10:41','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:10:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (392,'PELL ID','PELL ID','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID=:I_IPMSYSID AND ALTERNATIVE_TYPE_ID =10 AND ROWNUM=1) from dual','C',to_date('31-MAY-17 01:11:25','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:11:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (394,'FFEL ID','FFEL ID','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID=:I_IPMSYSID AND ALTERNATIVE_TYPE_ID =8 AND ROWNUM=1) from dual','C',to_date('31-MAY-17 01:13:04','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:13:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (395,'Direct Loan ID','Direct Loan ID','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID=:I_IPMSYSID AND ALTERNATIVE_TYPE_ID =7 AND ROWNUM=1) from dual','C',to_date('31-MAY-17 01:14:04','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:14:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (397,'Campus','Campus','SELECT NULL FROM DUAL','C',to_date('31-MAY-17 01:15:38','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:15:38','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (398,'School Bond Amount','School Bond Amount','select (select BOND_AMT  from close_school 
  where close_school_id=:i_close_school_id and rownum=1) from dual','C',to_date('31-MAY-17 01:16:17','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:16:17','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (399,'Tuition Recovery Fund','Tuition Recovery Fund','select (select FUND_AMT  from close_school  
 where close_school_id=:i_close_school_id and rownum=1) from dual','C',to_date('31-MAY-17 01:17:11','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:17:11','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (400,'Perkins','Perkins','SELECT NULL FROM DUAL','C',to_date('31-MAY-17 01:21:19','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:21:19','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (401,'Close School Notice Comments','Close School Notice Comments','select (select COMMENTS  from close_school  
 where close_school_id=:i_close_school_id and rownum=1) from dual','C',to_date('31-MAY-17 01:22:06','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:22:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (403,'Accreditation End Date','Accreditation End Date','select (select nvl(REVISED_CLOSURE_DT,CLOSURE_DT) from CLOSE_SCHOOL_REVIEW where close_school_id=:i_close_school_id and rownum=1) from dual','C',to_date('31-MAY-17 01:25:41','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:25:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (404,'School Closed Effective Dt','School Closed Effective Dt','select (select nvl(REVISED_CLOSURE_DT,CLOSURE_DT) from CLOSE_SCHOOL_REVIEW where close_school_id=:i_close_school_id and rownum=1) from dual','C',to_date('31-MAY-17 01:26:34','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:26:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (405,'Student Arrangements','Student Arrangements','select (select ARRANGEMENT_COMMENTS  from close_school
 where  close_school_id=:i_close_school_id and rownum=1) from dual','C',to_date('31-MAY-17 01:29:05','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:29:05','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (406,'Federal Register notice published DT','Federal Register notice published DT 49.2','SELECT NULL FROM DUAL','C',to_date('31-MAY-17 01:43:28','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:43:28','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (411,'Additional Information Due Dt','Additional Information Due Dt','select null from dual','C',to_date('02-JUN-17 02:12:25','DD-MON-RR HH:MI:SS'),to_date('02-JUN-17 02:12:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (412,'telephone conversation DT','telephone conversation DT','select null from dual','C',to_date('02-JUN-17 02:18:08','DD-MON-RR HH:MI:SS'),to_date('02-JUN-17 02:18:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (213,'Closure Date','Closure Date','select null from dual','C',to_date('10-MAY-17 02:28:45','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 02:28:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (214,'Title IV Date','Title IV Date','select null from dual','C',to_date('10-MAY-17 03:02:29','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:02:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (215,'Pell Grants','Pell Grants','select null from dual','C',to_date('10-MAY-17 03:05:01','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:05:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (216,'ACG','ACG','select null from dual','C',to_date('10-MAY-17 03:05:27','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:05:27','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (217,'National SMART Grants','National SMART Grants','select null from dual','C',to_date('10-MAY-17 03:06:23','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:06:23','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (218,'Teach Grants','Teach Grants','select null from dual','C',to_date('10-MAY-17 03:07:14','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:07:14','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (219,'Federal SEOG','Federal SEOG','select null from dual','C',to_date('10-MAY-17 03:07:44','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:07:44','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (220,'Federal Work Study funds','Federal Work Study funds ','select null from dual','C',to_date('10-MAY-17 03:08:17','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:08:17','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (221,'discharge Amount','discharge Amount ','select null from dual','C',to_date('10-MAY-17 03:09:12','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:09:12','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (222,'Loan Liablities','Loan Liablities','select null from dual','C',to_date('10-MAY-17 03:10:14','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:10:14','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (223,'Amount of actual loss','Amount of actual loss','select null from dual','C',to_date('10-MAY-17 03:11:05','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:11:05','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (224,'Cohort Default Rate','Cohort Default Rate','select null from dual','C',to_date('10-MAY-17 03:12:34','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:12:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (225,'HCM2, Reimbursement','HCM2, Reimbursement','SELECT (SELECT MTR.MOP_TYPE_NAME FROM funds_request_review fr,mop M,mop_type_ref MTR
        WHERE M.mop_id=fr.mop_id
        AND M.mop_type_id=mtr.mop_type_id
        AND  FR.CASE_ID=:i_case_id and ROWNUM=1 ) FROM DUAL','C',to_date('10-MAY-17 03:56:25','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:56:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (226,'FFEL liability','FFEL liability','select null from dual','C',to_date('10-MAY-17 03:57:52','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 03:57:52','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (227,'LOC unacceptable Reason','LOC unacceptable Reason','select (select  FA_COMMENTS from loc_request where  IPMSYSID=:i_ipmsysid AND CASE_ID=:i_case_id and rownum=1) from dual','C',to_date('10-MAY-17 04:44:03','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 04:44:03','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (239,'OGC Due Date','OGC Due Date','select null from dual','C',to_date('19-MAY-17 10:06:14','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:06:14','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (240,'OGC Staff Member Name','OGC Staff Member Name','select null from dual','C',to_date('19-MAY-17 10:11:55','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:11:55','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (241,'OIG Due Dt','OIG Due Dt','select null from dual','C',to_date('19-MAY-17 10:14:47','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:14:47','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (242,'Partner Assistance Conduct Dt','Partner Assistance Conduct Dt','select null from dual','C',to_date('19-MAY-17 10:26:25','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:26:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (243,'Partner Assistance revisions Dt','Partner Assistance revisions Dt','select null from dual','C',to_date('19-MAY-17 10:28:21','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:28:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (244,'Partner Assistance Visit Begin Dt','Partner Assistance Visit Begin Dt','select null from dual','C',to_date('19-MAY-17 10:46:07','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:46:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (245,'Partner Assistance Visit End Dt','Partner Assistance Visit End Dt','select null from dual','C',to_date('19-MAY-17 10:46:16','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:46:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (246,'Partner Assistance participate','Partner Assistance participate','select null from dual','C',to_date('19-MAY-17 10:58:32','DD-MON-RR HH:MI:SS'),to_date('19-MAY-17 10:58:32','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (247,'previous calendar year','previous calendar year duc 7.2','select null from dual','C',to_date('23-MAY-17 10:26:10','DD-MON-RR HH:MI:SS'),to_date('23-MAY-17 10:26:10','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (277,'Name of Nondegree Program','Name of Nondegree Program','select null from dual','C',to_date('24-MAY-17 01:43:48','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 01:43:48','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (278,'number of credit or clock hours','number of credit or clock hours','select null from dual','C',to_date('24-MAY-17 01:44:24','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 01:44:24','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (279,'number of weeks','number of weeks 60.1','select null from dual','C',to_date('24-MAY-17 01:45:07','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 01:45:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (280,'Agreement Program Name','Agreement Program Name','select null from dual','C',to_date('24-MAY-17 02:29:38','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 02:29:38','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (281,'Agreement Partner Name','Agreement Partner Name','select null from dual','C',to_date('24-MAY-17 02:30:29','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 02:30:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (282,'G5 entry date','G5 entry date','SELECT (SELECT to_char(approved_g5_dt,''mm-dd-yyyy'') FROM funds_request_review WHERE CASE_ID=:I_CASE_ID AND ROWNUM=1) FROM DUAL','C',to_date('24-MAY-17 02:56:16','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 02:56:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (285,'Application Submission Dt','Application Submission Dt 40.4','SELECT (SELECT appl_submit_dt FROM partner_appl WHERE APPLICATION_ID IN (SELECT APPLICATION_ID FROM PARTNER_cASE WHERE CASE_ID=:I_CASE_ID) AND ROWNUM=1) FROM DUAL','C',to_date('24-MAY-17 03:28:23','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 03:28:23','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (286,'experiment name','experiment name','select (select  spr.SPECIAL_PROGRAM_NAME from special_program_ref spr,special_appl sa,special_appl_review sar
where spr.SPECIAL_PROGRAM_ID=sa.SPECIAL_PROGRAM_ID
and sar.special_application_id=sa.special_application_id
and sar.case_id=:i_case_id) from dual','C',to_date('24-MAY-17 04:25:43','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 04:25:43','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (287,'Ammended PPA Begin Dt','Ammended PPA Begin Dt','select (select sa.SITE_START_DT from special_appl sa,special_appl_review sar
where sar.special_application_id=sa.special_application_id
and sar.case_id=:i_case_id) from dual','C',to_date('24-MAY-17 04:30:16','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 04:30:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (288,'Ammended PPA End Dt','Ammended PPA End Dt','SELECT NULL FROM DUAL','C',to_date('24-MAY-17 04:30:51','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 04:30:51','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (289,'Special Appl Comments','Special Appl Comments','SELECT NULL FROM DUAL','C',to_date('24-MAY-17 04:32:30','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 04:32:30','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (312,'Conference Schdule Dt','Conference Schdule Dt','select null from dual','C',to_date('25-MAY-17 02:57:18','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 02:57:18','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (313,'Conference Schdule Time','Conference Schdule Time','select null from dual','C',to_date('25-MAY-17 02:57:44','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 02:57:44','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (426,'FADr Title','FAD Title','SELECT 
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      AND pot.end_dt is null
      AND pot.official_title_id=38)
      FROM DUAL','C',to_date('07-JUN-17 03:16:43','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:16:43','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (427,'LOC Amount Collected','LOC Amount Collected','select (SELECT  RECEIVED_AMT FROM MANAGE_LOC WHERE IPMSYSID=:i_ipmsysid AND CASE_ID=:i_case_id and rownum=1) from dual','C',to_date('07-JUN-17 03:26:41','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:26:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (428,'LOC state reason','LOC state reason','select (select  FA_COMMENTS from manage_loc where  IPMSYSID=:i_ipmsysid AND CASE_ID=:i_case_id and rownum=1) from dual','C',to_date('07-JUN-17 03:27:41','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:27:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (432,'Previous Campus Based','Previous Campus Based','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID IN (SELECT PREVIOUS_IPMSYSID FROM CHANGE_AFFILIATION WHERE IPMSYSID=:I_IPMSYSID AND RECORD_TYPE=''A'' and rownum=1) 
AND ALTERNATIVE_TYPE_ID=1 and RECORD_TYPE=''A'' and rownum=1) from dual','C',to_date('08-JUN-17 02:01:29','DD-MON-RR HH:MI:SS'),to_date('08-JUN-17 02:01:29','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (410,'status of license','status of license 18.1','select null from dual','C',to_date('02-JUN-17 12:59:16','DD-MON-RR HH:MI:SS'),to_date('02-JUN-17 12:59:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (433,'Date of change','Date of change','select to_char(sysdate,''mm/dd/yyyy'') from dual','C',to_date('08-JUN-17 02:02:22','DD-MON-RR HH:MI:SS'),to_date('08-JUN-17 02:02:22','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (396,'Direct Loan Grantee DUNS','Direct Loan Grantee DUNS','select (select ALTERNATIVE_ID  from alternative_identifier where ALTERNATIVE_TYPE_ID=25 AND  ipmsysid=:i_ipmsysid AND record_type=:i_record_type and rownum=1) from dual','C',to_date('31-MAY-17 01:14:49','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:14:49','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (402,'Close School Region','Close School Region','SELECT (select  REGION_ID   from school_location where school_ipmsysid=:I_IPMSYSID and close_school_id=:i_close_school_id and record_type=''A'') FROM DUAL','C',to_date('31-MAY-17 01:24:58','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:24:58','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (407,'institution resides state','institution resides state','select null from dual','C',to_date('02-JUN-17 12:01:21','DD-MON-RR HH:MI:SS'),to_date('02-JUN-17 12:01:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (408,'name and address of auditor','name and address of auditor 18.1','select null from dual','C',to_date('02-JUN-17 12:04:19','DD-MON-RR HH:MI:SS'),to_date('02-JUN-17 12:04:19','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (409,'name of auditor','name of auditor 18.1','select null from dual','C',to_date('02-JUN-17 12:07:07','DD-MON-RR HH:MI:SS'),to_date('02-JUN-17 12:07:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (189,'Appropriate Title','Appropriate Title','select null from dual','C',to_date('04-MAY-17 09:43:57','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 09:43:57','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (190,'Name of Legal Entity on FS','Name of Legal Entity on FS','SELECT
(SELECT p.partner_name FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type)
FROM dual','C',to_date('04-MAY-17 09:48:48','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 09:48:48','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (191,'Insert Numbers and Names','Insert Numbers and Names','select null from dual','C',to_date('04-MAY-17 03:21:56','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 03:21:56','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (192,'Liability Amount','Liability Amount','select null from dual','C',to_date('04-MAY-17 03:25:54','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 03:25:54','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (193,'Appendix','Appendix','select null from dual','C',to_date('04-MAY-17 03:28:11','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 03:28:11','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (195,'Title IV Grant Program','Title IV Grant Program','select null from dual','C',to_date('04-MAY-17 03:30:45','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 03:30:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (196,'Compliance Audit FYE','Compliance Audit FYE','select null from dual','C',to_date('05-MAY-17 11:37:40','DD-MON-RR HH:MI:SS'),to_date('05-MAY-17 11:37:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (197,'FS Audit  FYE','FS Audit FYE','select null from dual','C',to_date('05-MAY-17 11:41:07','DD-MON-RR HH:MI:SS'),to_date('05-MAY-17 11:41:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (228,'waiver End Dt','waiver End Dt','select (select to_char(waiver_end_dt,''mm-dd-yyyy'') from waiver_review where ipmsysid=:i_ipmsysid and case_id=:i_case_id) from dual','C',to_date('12-MAY-17 04:36:29','DD-MON-RR HH:MI:SS'),to_date('12-MAY-17 04:36:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (231,'Extension Submission FYE','Extension Submission FYE','select (select to_char(fy_end_dt,''mm-dd-yyyy'') from partner_submission where submission_id in (select submission_id from partner_case where case_id=:i_case_id) ) from dual','C',to_date('15-MAY-17 12:11:29','DD-MON-RR HH:MI:SS'),to_date('15-MAY-17 12:11:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (232,'Extension Submission End Dt','Extension Submission End Dt','select null  from dual','C',to_date('15-MAY-17 12:17:08','DD-MON-RR HH:MI:SS'),to_date('15-MAY-17 12:17:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (233,'Reasons for denial of request','Reasons for denial of request','select null  from dual','C',to_date('15-MAY-17 12:22:45','DD-MON-RR HH:MI:SS'),to_date('15-MAY-17 12:22:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (234,'LOC Amount Written','LOC Amount Written','select (select spell_number(pc.LOC_AMT) from manage_loc ml,partner_loc pc
     where pc.loc_id=ml.loc_id
     and ml.case_id=:i_case_id and rownum=1) from dual','C',to_date('15-MAY-17 01:58:39','DD-MON-RR HH:MI:SS'),to_date('15-MAY-17 01:58:39','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (235,'No-Title IV submission FYE','No-Title IV submission FYE','SELECT NULL FROM DUAL','C',to_date('18-MAY-17 10:07:32','DD-MON-RR HH:MI:SS'),to_date('18-MAY-17 10:07:32','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (236,'Title IV Funding Period Begin Dt','Title IV Funding Period Begin Dt duc 39.1','SELECT NULL FROM DUAL','C',to_date('18-MAY-17 10:16:23','DD-MON-RR HH:MI:SS'),to_date('18-MAY-17 10:16:23','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (237,'Title IV Funding Period End Dt','Title IV Funding Period End Dt duc 39.1','SELECT NULL FROM DUAL','C',to_date('18-MAY-17 10:16:33','DD-MON-RR HH:MI:SS'),to_date('18-MAY-17 10:16:33','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (238,'Exemption FYE','Exemption FYE','SELECT NULL FROM DUAL','C',to_date('18-MAY-17 10:51:25','DD-MON-RR HH:MI:SS'),to_date('18-MAY-17 10:51:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (248,'previous calendar year -1','previous calendar year duc 7.2','select null from dual','C',to_date('23-MAY-17 11:30:45','DD-MON-RR HH:MI:SS'),to_date('23-MAY-17 11:30:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (249,'previous calendar year -2','previous calendar year duc 7.2','select null from dual','C',to_date('23-MAY-17 11:30:54','DD-MON-RR HH:MI:SS'),to_date('23-MAY-17 11:30:54','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (291,'list of documents required','list of documents required','select null from dual','C',to_date('25-MAY-17 10:25:16','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 10:25:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (434,'Prevoius CMO Grantee DUNS','Previous CMO Grantee DUNS','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID IN (SELECT PREVIOUS_IPMSYSID FROM CHANGE_AFFILIATION WHERE IPMSYSID=:I_IPMSYSID AND RECORD_TYPE=''A'') AND ALTERNATIVE_TYPE_ID=5  AND RECORD_TYPE=''A'' and rownum=1) from dual','C',to_date('08-JUN-17 02:21:20','DD-MON-RR HH:MI:SS'),to_date('08-JUN-17 02:21:20','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (435,'HCM1 or Reimbursement','HCM1 or Reimbursement','select (select  MOP_TYPE_NAME from change_mop cm,mop_type_ref  m
        where cm.mop_type_id=m.mop_type_id
        and M.MOP_TYPE_ID in (1,3)
        and ipmsysid=:i_ipmsysid
        and case_id=:i_case_id and rownum=1 ) from dual','C',to_date('13-JUN-17 09:51:08','DD-MON-RR HH:MI:SS'),to_date('13-JUN-17 09:51:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (16,'Chief Financial Aid Director','Chief Financial Aid Director','SELECT  (   SELECT
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      and pot.end_dt is null
      AND pot.official_title_id=3) FROM DUAL','C',to_date('20-DEC-13 01:54:42','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:45','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (30,'Prefix','Prefix','SELECT      
               (SELECT
                  pr.prefix_name prefix
     FROM person p,
              partner_official po,
              partner_official_title pot,
              official_title_ref otr,
              prefix_ref pr
  WHERE p.person_id = po.person_id
      AND po.partner_official_id = pot.partner_official_id
      AND pot.official_title_id=otr.official_title_id
      AND p.prefix_id=pr.prefix_id
      AND p.current_status_ind=''C''
      AND po.current_status_ind=''C''
      AND pot.current_status_ind=''C''
      AND pot.record_type=po.record_type
      AND pot.record_type= p.record_type
      AND pot.end_dt IS NULL
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      AND pot.official_title_id=34) prefix
      FROM DUAL','C',to_date('13-MAR-14 04:30:49','DD-MON-RR HH:MI:SS'),to_date('13-MAR-14 04:30:53','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (29,'Disapproval Reason','Disapproval Reason','SELECT (SELECT p.disapprov_reasn_text  approval_date FROM ppa p,determination d WHERE p.ipmsysid=d.ipmsysid AND p.ppa_sys_id=d.ppa_sys_id AND d.ipmsysid=:i_ipmsysid AND d.record_type=:i_record_type) FROM DUAL','C',to_date('04-MAR-14 12:48:41','DD-MON-RR HH:MI:SS'),to_date('04-MAR-14 12:48:44','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (112,'Official name','Official Name','select (SELECT IU.FIRST_NAME||'' ''||MIDDLE_INITIAL||'' ''||LAST_NAME  
FROM IPM_USER IU,
FSA_USER_ATTRIBUTE FUA ,
PARTNER_USER_ROLE PUR
WHERE IU.USER_ID=FUA.USER_ID 
AND PUR.USER_ID=IU.USER_ID
AND FUA.FSA_ATTRIBUTE_CD = :i_attribute_cd
AND FUA.CURRENT_STATUS_IND=''C''
AND IU.CURRENT_STATUS_IND=''C''
AND PUR.CURRENT_STATUS_IND=''C''
AND PUR.RECORD_TYPE=''P''
AND PUR.IPMSYSID=:I_IPMSYSID) Official_Name from dual','C',to_date('22-DEC-16 02:48:45','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 02:48:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (119,'Case Manager FAX Number','Case manager Fax Number','SELECT
 (SELECT u.FAX_NBR
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') FAX_NBR
       FROM
       DUAL','C',to_date('05-JAN-17 03:27:49','DD-MON-RR HH:MI:SS'),to_date('05-JAN-17 03:27:49','DD-MON-RR HH:MI:SS'),'PMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (120,'Official Phone Number1','Official Phone Number1','select (SELECT IU.phone_nbr  
FROM IPM_USER IU,
FSA_USER_ATTRIBUTE FUA ,
PARTNER_USER_ROLE PUR
WHERE IU.USER_ID=FUA.USER_ID 
AND PUR.USER_ID=IU.USER_ID
AND FUA.FSA_ATTRIBUTE_CD = :i_attribute_cd1
AND FUA.CURRENT_STATUS_IND=''C''
AND IU.CURRENT_STATUS_IND=''C''
AND PUR.CURRENT_STATUS_IND=''C''
AND PUR.RECORD_TYPE=''P''
AND PUR.IPMSYSID=:I_IPMSYSID) phone_nbr from dual','C',to_date('06-JAN-17 11:40:04','DD-MON-RR HH:MI:SS'),to_date('06-JAN-17 11:40:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (121,'Official name1','Official Name1','select (SELECT IU.FIRST_NAME||'' ''||MIDDLE_INITIAL||'' ''||LAST_NAME 
FROM IPM_USER IU,
FSA_USER_ATTRIBUTE FUA ,
PARTNER_USER_ROLE PUR
WHERE IU.USER_ID=FUA.USER_ID 
AND PUR.USER_ID=IU.USER_ID
AND FUA.FSA_ATTRIBUTE_CD = :i_attribute_cd1
AND FUA.CURRENT_STATUS_IND=''C''
AND IU.CURRENT_STATUS_IND=''C''
AND PUR.CURRENT_STATUS_IND=''C''
AND PUR.RECORD_TYPE=''P''
AND PUR.IPMSYSID=:I_IPMSYSID) phone_nbr from dual','C',to_date('06-JAN-17 11:40:18','DD-MON-RR HH:MI:SS'),to_date('06-JAN-17 11:40:18','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (122,'Officials Email1','Officials Email1','select (SELECT IU.EMAIL_ADDR
FROM IPM_USER IU,
FSA_USER_ATTRIBUTE FUA ,
PARTNER_USER_ROLE PUR
WHERE IU.USER_ID=FUA.USER_ID 
AND PUR.USER_ID=IU.USER_ID
AND FUA.FSA_ATTRIBUTE_CD = :i_attribute_cd1
AND FUA.CURRENT_STATUS_IND=''C''
AND IU.CURRENT_STATUS_IND=''C''
AND PUR.CURRENT_STATUS_IND=''C''
AND PUR.RECORD_TYPE=''P''
AND PUR.IPMSYSID=:I_IPMSYSID) phone_nbr from dual','C',to_date('06-JAN-17 11:40:32','DD-MON-RR HH:MI:SS'),to_date('06-JAN-17 11:40:32','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (123,'LOC Number','LOC Number','select (select pc.LOC_NBR from manage_loc ml,partner_loc pc
     where pc.loc_id=ml.loc_id
     and ml.case_id=:i_case_id and rownum=1) from dual','C',to_date('06-JAN-17 01:58:58','DD-MON-RR HH:MI:SS'),to_date('06-JAN-17 01:58:58','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (124,'LOC Amount','LOC Amount','select (select pc.LOC_AMT from manage_loc ml,partner_loc pc
     where pc.loc_id=ml.loc_id
     and ml.case_id=:i_case_id and rownum=1) from dual','C',to_date('06-JAN-17 01:59:11','DD-MON-RR HH:MI:SS'),to_date('06-JAN-17 01:59:11','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (125,'LOC Expiration Date','LOC Expiration Date','select (select to_char(expire_dt,''mm/dd/yyyy'') from manage_loc ml,partner_loc pc
     where pc.loc_id=ml.loc_id
     and ml.case_id=:i_case_id and rownum=1) from dual','C',to_date('06-JAN-17 01:59:24','DD-MON-RR HH:MI:SS'),to_date('06-JAN-17 01:59:24','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (141,'Department Address','Depatment Address','select null FROM dual','C',to_date('30-JAN-17 11:02:07','DD-MON-RR HH:MI:SS'),to_date('30-JAN-17 11:02:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (142,'Department City,State,Zip','Depatment City,State,Zip','select null FROM dual','C',to_date('30-JAN-17 11:02:52','DD-MON-RR HH:MI:SS'),to_date('30-JAN-17 11:02:52','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (144,'Cite Letter Due Dt','Cite Letter Due Dt','select :i_cite_due_dt from dual','C',to_date('30-JAN-17 11:19:40','DD-MON-RR HH:MI:SS'),to_date('30-JAN-17 11:19:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (145,'Cite Letter FYE Dt','Cite Letter FYE Dt','SELECT :i_cite_fye_dt FROM dual','C',to_date('30-JAN-17 11:42:28','DD-MON-RR HH:MI:SS'),to_date('30-JAN-17 11:42:28','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (102,'Close School Request','Close School Request','SELECT ''Close School Request'' from dual','C',to_date('15-DEC-16 11:13:58','DD-MON-RR HH:MI:SS'),to_date('15-DEC-16 11:13:58','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (131,'Finding Number','Finding Number','select (SELECT LISTAGG(DEFIC_NBR,'','') WITHIN GROUP(ORDER BY DEFIC_NBR) FROM SUBMISSION_DEFIC WHERE IPMSYSID=:i_ipmsysid AND CASE_ID=:i_case_id
AND REVIEW_BY_CD IN (''ARS'',''CM'')) finding_nbr from dual','C',to_date('25-JAN-17 09:54:30','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 09:54:30','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (132,'Shorten Partner Name','Shorten Partner Name','SELECT
(SELECT p.partner_name FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type and current_status_ind=''C'' )
FROM dual','C',to_date('25-JAN-17 09:55:58','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 09:55:58','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (133,'Licensing Agency Name','Licensing Agency Name','select null from dual','C',to_date('25-JAN-17 09:59:16','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 09:59:16','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (134,'Finding Title','Finding Title','select (SELECT  DEFIC_NAME FROM DEFIC_REF WHERE DEFIC_CD IN (SELECT  DEFIC_ID FROM SUBMISSION_DEFIC WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID 
AND   REVIEW_BY_CD IN(''ARS'',''CM'') and current_status_ind=''C'')) finding_title FROM dual','C',to_date('25-JAN-17 10:22:26','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 10:22:26','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (135,'Final Audit Determination','Final Audit Determination','select null FROM dual','C',to_date('25-JAN-17 10:29:21','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 10:29:21','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (136,'Domestic Return Receipt','Domestic Return Receipt','SELECT NULL FROM DUAL','C',to_date('25-JAN-17 10:36:34','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 10:36:34','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (138,'IIS Name','IIS name','select null FROM dual','C',to_date('25-JAN-17 01:20:24','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 01:20:24','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (139,'MIS Revision Date','MIS Revision Date','select null FROM dual','C',to_date('25-JAN-17 01:22:21','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 01:22:21','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (140,'MIS End Date','MIS End Date','select (SELECT M.end_dt 
FROM MIS m,mis_visit mv 
WHERE m.mis_id=mv.mis_id 
and m.IPMSYSID=:i_ipmsysid 
AND m.CASE_ID=:i_case_id
and m.current_status_ind=''C'')mis_end_dt  from dual','C',to_date('25-JAN-17 01:30:16','DD-MON-RR HH:MI:SS'),to_date('25-JAN-17 01:30:16','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (146,'Submission FYE Date','Submission FYE Date','select (select requested_fy_end_dt from submission_detail where ipmsysid=:i_ipmsysid and submission_id=:i_submission_id and current_status_ind=''C'') fye_date from dual','C',to_date('31-JAN-17 09:59:08','DD-MON-RR HH:MI:SS'),to_date('31-JAN-17 09:59:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (147,'Compliance Manager Title','Compliance Manager Title','select null from dual','C',to_date('31-JAN-17 10:05:56','DD-MON-RR HH:MI:SS'),to_date('31-JAN-17 10:05:56','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (148,'ARO Name','ARO Name','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') case_manager
       FROM
       DUAL','C',to_date('31-JAN-17 10:12:35','DD-MON-RR HH:MI:SS'),to_date('31-JAN-17 10:12:35','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (149,'ARS/TL Data','ARS/TL Data','select null from dual','C',to_date('31-JAN-17 10:14:05','DD-MON-RR HH:MI:SS'),to_date('31-JAN-17 10:14:05','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (150,'ARS Delete Data','ARS Delete Data','select null from dual','C',to_date('31-JAN-17 10:25:01','DD-MON-RR HH:MI:SS'),to_date('31-JAN-17 10:25:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (151,'FA Comments','FA Comments','select null from dual','C',to_date('31-JAN-17 10:26:46','DD-MON-RR HH:MI:SS'),to_date('31-JAN-17 10:26:46','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (152,'Cite Requirement','Cite Requirement','select null from dual','C',to_date('31-JAN-17 11:18:10','DD-MON-RR HH:MI:SS'),to_date('31-JAN-17 11:18:10','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (153,'Request Submission Date','Request Submission Date','select (select creation_dt from submission_detail where ipmsysid=:i_ipmsysid AND  submission_id=:i_submission_id and current_status_ind=''C'' and rownum=1) from dual','C',to_date('01-FEB-17 02:24:53','DD-MON-RR HH:MI:SS'),to_date('01-FEB-17 02:24:53','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (154,'LOC Receive Date','LOC Receive Date','SELECT (SELECT 
         to_char(D.RECEIVE_DT,''mm/dd/yyyy'')
    FROM partner_loc d,MANAGE_LOC ML
    WHERE ML.LOC_ID=D.LOC_ID
    AND ML.CASE_ID=:i_case_id)RECEIVE_DT FROM DUAL','C',to_date('21-FEB-17 10:30:18','DD-MON-RR HH:MI:SS'),to_date('21-FEB-17 10:30:18','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (126,'Program Review Start Date','Program Review Start Date','select (SELECT START_DT  FROM PROGRAM_REVIEW  WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('18-JAN-17 10:05:14','DD-MON-RR HH:MI:SS'),to_date('18-JAN-17 10:05:14','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (127,'Program Review End Date','Program Review End Date','select (SELECT END_DT  FROM PROGRAM_REVIEW  WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('18-JAN-17 10:06:45','DD-MON-RR HH:MI:SS'),to_date('18-JAN-17 10:06:45','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (128,'PRCN','PRCN','select (SELECT PRCN  FROM PROGRAM_REVIEW  WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('18-JAN-17 10:42:57','DD-MON-RR HH:MI:SS'),to_date('18-JAN-17 10:42:57','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (129,'PR Period Begin Date','PR Period Begin Date','select (SELECT PERIOD_START_DT  FROM PROGRAM_REVIEW  WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('18-JAN-17 11:09:26','DD-MON-RR HH:MI:SS'),to_date('18-JAN-17 11:09:26','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (130,'PR Period Begin Date','PR Period Begin Date','select (SELECT PERIOD_END_DT  FROM PROGRAM_REVIEW  WHERE IPMSYSID=:I_IPMSYSID AND CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('18-JAN-17 11:09:46','DD-MON-RR HH:MI:SS'),to_date('18-JAN-17 11:09:46','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (155,'LOC Name','LOC Name','select (SELECT LOCATION_NAME FROM SCHOOL_LOCATION WHERE LOCATION_IPMSYSID=:I_IPMSYSID AND RECORD_TYPE=''P'') loc_name from dual','C',to_date('02-MAR-17 11:29:16','DD-MON-RR HH:MI:SS'),to_date('02-MAR-17 11:29:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (111,'Officials Email','Officials Email','select (SELECT IU.EMAIL_ADDR
FROM IPM_USER IU,
FSA_USER_ATTRIBUTE FUA ,
PARTNER_USER_ROLE PUR
WHERE IU.USER_ID=FUA.USER_ID 
AND PUR.USER_ID=IU.USER_ID
AND FUA.FSA_ATTRIBUTE_CD = :i_attribute_cd
AND FUA.CURRENT_STATUS_IND=''C''
AND IU.CURRENT_STATUS_IND=''C''
AND PUR.CURRENT_STATUS_IND=''C''
AND PUR.RECORD_TYPE=''P''
AND PUR.IPMSYSID=:I_IPMSYSID) phone_nbr from dual','C',to_date('22-DEC-16 01:47:46','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 01:47:46','DD-MON-RR HH:MI:SS'),'IPMSYSTE');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (103,'COO NAME','COO NAME','SELECT (SELECT   
LISTAGG ( u.first_name||'' ''||middle_initial||'' ''||last_name, '','')  
               WITHIN GROUP (ORDER BY  u.user_id)   
         FROM partner_case pc,  
                   team_member tm,  
                   ipm_user u,  
                   fsa_user_attribute fur  
       WHERE pc.team_nbr=tm.team_nbr  
           AND tm.user_id=u.user_id  
           AND fur.user_id=u.user_id  
           AND fur.fsa_attribute_cd  IN ( SELECT col1 FROM TABLE(f_string_to_arrayString(''COO-APR'')))    
           AND pc.ipmsysid=:i_ipmsysid  
           AND pc.case_id=:i_case_id  
           AND pc.current_status_ind=''C''  
           AND tm.current_status_ind=''C''  
           AND u.current_status_ind=''C''  
           AND fur.current_status_ind=''C'') NAME FROM DUAL','C',to_date('20-DEC-16 02:26:14','DD-MON-RR HH:MI:SS'),to_date('20-DEC-16 02:26:14','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (104,'CCO NAME','CCO NAME','SELECT (SELECT   
LISTAGG ( u.first_name||'' ''||middle_initial||'' ''||last_name, '','')  
               WITHIN GROUP (ORDER BY  u.user_id)   
         FROM partner_case pc,  
                   team_member tm,  
                   ipm_user u,  
                   fsa_user_attribute fur  
       WHERE pc.team_nbr=tm.team_nbr  
           AND tm.user_id=u.user_id  
           AND fur.user_id=u.user_id  
           AND fur.fsa_attribute_cd  IN ( SELECT col1 FROM TABLE(f_string_to_arrayString(''CCO-APR'')))    
           AND pc.ipmsysid=:i_ipmsysid  
           AND pc.case_id=:i_case_id  
           AND pc.current_status_ind=''C''  
           AND tm.current_status_ind=''C''  
           AND u.current_status_ind=''C''  
           AND fur.current_status_ind=''C'') NAME FROM DUAL','C',to_date('20-DEC-16 02:28:46','DD-MON-RR HH:MI:SS'),to_date('20-DEC-16 02:28:46','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (105,'CA Visit date','CA Visit Date','select (SELECT M.start_dt 
FROM MIS m,mis_visit mv 
WHERE m.mis_id=mv.mis_id 
and m.IPMSYSID=:i_ipmsysid 
AND m.CASE_ID=:i_case_id
and m.current_status_ind=''C'' and rownum=1) from dual','C',to_date('22-DEC-16 10:35:22','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 10:35:22','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (106,'CA Due date','CA Due Date','select (SELECT  DUE_DT FROM  IPM_DOC WHERE IPM_DOC_ID=:i_doc_id and rownum=1) from dual','C',to_date('22-DEC-16 10:38:48','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 10:38:48','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (107,'Email Address','Email Address','SELECT
(SELECT pa.email_addr FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6)
FROM dual','C',to_date('22-DEC-16 11:06:27','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 11:06:27','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (108,'FAC ACN','FAC ACN','SELECT ( SELECT cs.fac_acn 
                   FROM compliance_submission cs 
                  WHERE cs.ipmsysid=:i_ipmsysid 
                    AND cs.submission_id=:i_submission_id 
                    AND cs.current_status_ind=''C'' 
               ) 
         FROM DUAL','C',to_date('22-DEC-16 11:33:57','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 11:33:57','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (109,'FAD Name','FAD Name','SELECT 
(SELECT
                 p.FIRST_NAME||'' ''||MIDDLE_INITIAL||'' ''||LAST_NAME
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=''P''
      AND pot.end_dt is null
      AND pot.official_title_id=3) fad_name
      FROM DUAL','C',to_date('22-DEC-16 12:18:53','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 12:18:53','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (110,'FAD Email','FAD Email','select (SELECT IU.EMAIL_ADDR
FROM IPM_USER IU,
FSA_USER_ATTRIBUTE FUA ,
PARTNER_USER_ROLE PUR
WHERE IU.USER_ID=FUA.USER_ID 
AND PUR.USER_ID=IU.USER_ID
AND FUA.FSA_ATTRIBUTE_CD = :i_attribute_cd
AND FUA.CURRENT_STATUS_IND=''C''
AND IU.CURRENT_STATUS_IND=''C''
AND PUR.CURRENT_STATUS_IND=''C''
AND PUR.RECORD_TYPE=''P''
AND PUR.IPMSYSID=:I_IPMSYSID) EMAIL_ADDR from dual','C',to_date('22-DEC-16 12:26:37','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 12:26:37','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (113,'SPD Phone Nbr','SPD Phone Nbr','SELECT
 ( SELECT ct.PHONE_NBR spd_name
         FROM partner_case pc,
                   case_team ct 
       WHERE pc.team_nbr=ct.team_nbr
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND ct.current_status_ind=''C'') PHONE_NBR
           FROM
           DUAL','C',to_date('22-DEC-16 03:32:23','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 03:32:23','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (114,'Guaranty Agency Name','Guaranty Agency Name','select (select partner_name from partner where ipmsysid in (select initiator_ipmsysid from PARTNER_INITIATION where ipmsysid=:i_ipmsysid and rownum=1) and rownum=1) from dual','C',to_date('22-DEC-16 04:52:34','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 04:52:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (115,'Compliance Auditor Name','Compliance Auditor Name','SELECT
 ( SELECT fs.auditor_name
  FROM compliance_submission fs 
 WHERE fs.ipmsysid=:i_ipmsysid
   AND fs.submission_id=:i_submission_id
   AND fs.current_status_ind=''C'')
 FROM DUAL','C',to_date('22-DEC-16 05:13:20','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 05:13:20','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (116,'Compliance Start Date','Compliance Start Date','SELECT
 ( SELECT fs.period_begin_dt
  FROM compliance_submission fs 
 WHERE fs.ipmsysid=:i_ipmsysid
   AND fs.submission_id=:i_submission_id
   AND fs.current_status_ind=''C'') begin_dt
 FROM DUAL','C',to_date('22-DEC-16 05:16:35','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 05:16:35','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (117,'Compliance End Date','Compliance End Date','SELECT
 ( SELECT fs.period_end_dt
  FROM compliance_submission fs 
 WHERE fs.ipmsysid=:i_ipmsysid
   AND fs.submission_id=:i_submission_id
   AND fs.current_status_ind=''C'') begin_dt
 FROM DUAL','C',to_date('22-DEC-16 05:16:59','DD-MON-RR HH:MI:SS'),to_date('22-DEC-16 05:16:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (118,'Compliance Auditor PH Nbr','Compliance Auditor PH Nbr','SELECT
 ( SELECT fs.AUDITOR_PHONE_NBR
  FROM compliance_submission fs 
 WHERE fs.ipmsysid=:i_ipmsysid
   AND fs.submission_id=:i_submission_id
   AND fs.current_status_ind=''C'')
 FROM DUAL','C',to_date('23-DEC-16 02:07:29','DD-MON-RR HH:MI:SS'),to_date('23-DEC-16 02:07:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (167,'Partner CA Begin Dt','Partner CA Begin Dt','select (select to_char(PERIOD_BEGIN_DT,''mm/dd/yyyy'') from partner_detail where current_status_ind=''C'' AND  ipmsysid=:i_ipmsysid)
from dual','C',to_date('21-APR-17 04:42:53','DD-MON-RR HH:MI:SS'),to_date('21-APR-17 04:42:53','DD-MON-RR HH:MI:SS'),'IPMOTHER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (168,'Partner CA End Dt','Partner CA End Dt','select (select to_char(PERIOD_END_DT,''mm/dd/yyyy'') from partner_detail where current_status_ind=''C'' AND  ipmsysid=:i_ipmsysid)
from dual','C',to_date('21-APR-17 04:42:55','DD-MON-RR HH:MI:SS'),to_date('21-APR-17 04:42:55','DD-MON-RR HH:MI:SS'),'IPMOTHER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (170,'Change FYE Dt','Change FYE Dt','select (SELECT TO_CHAR(REQUESTED_FY_END_DT,''MM/DD/YYYY'') FROM  SUBMISSION_DETAIL WHERE
CURRENT_STATUS_IND=''C'' AND  SUBMISSION_ID=:I_SUBMISSION_ID) from dual','C',to_date('21-APR-17 04:42:57','DD-MON-RR HH:MI:SS'),to_date('21-APR-17 04:42:57','DD-MON-RR HH:MI:SS'),'IPMOTHER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (177,'New Loc Value','New Loc Value','select (select request_amt from loc_request where case_id=:i_case_id) from dual','C',to_date('02-MAY-17 10:53:28','DD-MON-RR HH:MI:SS'),to_date('02-MAY-17 10:53:28','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (162,'FS Due Date','FS Due Date','SELECT (SELECT * FROM (SELECT TO_CHAR(DUE_DT,''MM-DD-YYYY'') FROM  FSCA_DETAIL WHERE IPMSYSID=:I_IPMSYSID ORDER BY FISCAL_YR DESC NULLS LAST) WHERE ROWNUM=1) FROM DUAL','C',to_date('20-APR-17 02:24:59','DD-MON-RR HH:MI:SS'),to_date('20-APR-17 02:24:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (163,'Tot Title IV Funding','Tot Title IV Funding','select (select * from (
select TOTAL_CB+TOTAL_NON_CB from funding where IPMSYSID=:i_ipmsysid order by funding_yrs desc)
where rownum=1)funding_amt from dual','C',to_date('20-APR-17 02:30:56','DD-MON-RR HH:MI:SS'),to_date('20-APR-17 02:30:56','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (164,'LOC Request Amt','LOC Request Amt','SELECT (select REQUEST_AMT from loc_request where case_id=:i_case_id and current_status_ind=''C'')REQUEST_AMT FROM DUAL','C',to_date('20-APR-17 02:34:24','DD-MON-RR HH:MI:SS'),to_date('20-APR-17 02:34:24','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (160,'FS Comments','FS Comments','SELECT LISTAGG(RRF.REASON_NAME,'','') WITHIN GROUP(ORDER BY 1)
FROM IPM_DOC ID,
DOC_REJECT_REASON DRM,
DOC_REJECT_REASON_REF RRF
WHERE ID.IPM_DOC_ID=DRM.IPM_DOC_ID
AND RRF.REJECT_REASON_ID=DRM.REJECT_REASON_ID
AND FS_IND=''Y''
AND ID.SUBMISSION_ID=:I_SUBMISSION_ID','C',to_date('17-APR-17 11:54:41','DD-MON-RR HH:MI:SS'),to_date('17-APR-17 11:54:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (161,'LOC FYE','LOC FYE','SELECT (SELECT * FROM (SELECT TO_CHAR(FYE_DT,''MM-DD-YYYY'') FROM  FSCA_DETAIL WHERE IPMSYSID=:I_IPMSYSID ORDER BY FISCAL_YR DESC NULLS LAST) WHERE ROWNUM=1) FROM DUAL','C',to_date('20-APR-17 02:20:22','DD-MON-RR HH:MI:SS'),to_date('20-APR-17 02:20:22','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (166,'New LOC Exp Dt','New LOC Exp Dt','SELECT (select to_char(REQUESTED_EXPIRE_DT,''MM/DD/YYYY'') FROM LOC_REQUEST WHERE CURRENT_STATUS_IND=''C''
AND case_id=:i_case_id)EXPIRE_DT FROM DUAL','C',to_date('20-APR-17 02:58:31','DD-MON-RR HH:MI:SS'),to_date('20-APR-17 02:58:31','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (156,'Loc Issue Date','Loc Issue Date','select (SELECT PL.loc_issue_dt FROM MANAGE_LOC ML,PARTNER_LOC PL
WHERE PL.LOC_ID=ML.LOC_ID
AND ML.CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('07-APR-17 01:35:11','DD-MON-RR HH:MI:SS'),to_date('07-APR-17 01:35:11','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (157,'Loc Request Date','Loc Issue Date','SELECT (SELECT REQUEST_DT FROM LOC_REQUEST WHERE ipmsysid=:i_ipmsysid and  case_id=:i_case_id and current_status_ind=''C'' and rownum=1)LOC_REQUEST_DT FROM DUAL','C',to_date('07-APR-17 01:36:08','DD-MON-RR HH:MI:SS'),to_date('07-APR-17 01:36:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (158,'Denial Comments','Denial Comments','select 
(select DENIAL_COMMENTS from EXTN_FYE_ZFW_REVIEW where IPMSYSID=:I_IPMSYSID and CASE_ID=:I_CASE_ID) denial_comments
FROM dual','C',to_date('10-APR-17 02:26:43','DD-MON-RR HH:MI:SS'),to_date('10-APR-17 02:26:43','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (254,'Date of Zone Letter','Date of Zone Letter','select null from dual','C',to_date('24-MAY-17 10:08:04','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:08:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (255,'Method Of Payment','Method Of Payment','select null from dual','C',to_date('24-MAY-17 10:17:01','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:17:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (256,'date of Provisional Certification Alternative letter','date of Provisional Certification Alternative letter','select null from dual','C',to_date('24-MAY-17 10:17:47','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:17:47','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (257,'FS late refunds','FS late refunds ','select null from dual','C',to_date('24-MAY-17 10:30:32','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:30:32','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (258,'total refund amount','total refund amount','select null from dual','C',to_date('24-MAY-17 10:32:09','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:32:09','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (259,'Credit coverage DT','Credit coverage DT','select null from dual','C',to_date('24-MAY-17 10:34:17','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:34:17','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (260,'compliance audit or program review','compliance audit or program review','select null from dual','C',to_date('24-MAY-17 10:37:13','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:37:13','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (261,'number of problems out of total sample size','number of problems out of total sample size','select null from dual','C',to_date('24-MAY-17 10:38:57','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:38:57','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (262,'percent of problems','percent of problems','select null from dual','C',to_date('24-MAY-17 10:39:45','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:39:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (263,'PPA effective DT','PPA effective DT','select null from dual','C',to_date('24-MAY-17 10:46:31','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:46:31','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (264,'New LOC Due Dt','New LOC Due Dt','select null from dual','C',to_date('24-MAY-17 10:53:34','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:53:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (265,'change in ownership','change in ownership','select null from dual','C',to_date('24-MAY-17 10:59:32','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:59:32','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (266,'description of improper accounting treatment','description of improper accounting treatment','select null from dual','C',to_date('24-MAY-17 11:03:12','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:03:12','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (267,'Direct Loan unsubstantiated cash','Direct Loan unsubstantiated cash','select null from dual','C',to_date('24-MAY-17 11:33:51','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:33:51','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (268,'Previous MOP','Previous MOP','select null from dual','C',to_date('24-MAY-17 11:38:41','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:38:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (269,'HCM1 or HCM2','HCM1 or HCM2','select (select  MOP_TYPE_NAME from change_mop cm,mop_type_ref  m
        where cm.mop_type_id=m.mop_type_id
        and M.MOP_TYPE_ID in (1,2)
        and ipmsysid=:i_ipmsysid
        and case_id=:i_case_id and rownum=1) from dual','C',to_date('24-MAY-17 11:39:48','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:39:48','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (229,'Link','Link','select :i_link  from dual','C',to_date('15-MAY-17 09:40:00','DD-MON-RR HH:MI:SS'),to_date('15-MAY-17 09:40:00','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (230,'System Date','System Date','select null  from dual','C',to_date('15-MAY-17 09:45:06','DD-MON-RR HH:MI:SS'),to_date('15-MAY-17 09:45:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (253,'Composit Score','Composit Score 20.2','select null from dual','C',to_date('24-MAY-17 10:06:33','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 10:06:33','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (270,'Synopsis Comments','Synopsis Comments','select (select Synopsis_Comments from change_mop where case_id =:i_case_id) from dual','C',to_date('24-MAY-17 11:51:21','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:51:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (23,'Chief FAD Job Title','Chief FAD Job Title','SELECT 
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      AND pot.end_dt is null
      AND pot.official_title_id=3)
      FROM DUAL','C',to_date('20-DEC-13 01:54:14','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:15','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (27,'Sub Purpose','Sub Purpose','select (  SELECT 
  LISTAGG (SR.APPL_SUBPURP_NAME, '','')
               WITHIN GROUP (ORDER BY SR.APPL_SUBPURP_ID ) subpurpose
FROM appl_subpurp s,appl_subpurp_ref sr,PARTNER_CASE PC
WHERE s.appl_subpurp_id=sr.appl_subpurp_id
AND PC.APPLICATION_ID=S.APPLICATION_ID
AND PC.CASE_ID=:i_case_id
AND s.current_status_ind=''C'') from dual','C',to_date('28-FEB-14 01:16:44','DD-MON-RR HH:MI:SS'),to_date('28-FEB-14 01:16:47','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (28,'SPD Name','Case Team Name','SELECT
 ( SELECT ct.team_name spd_name
         FROM partner_case pc,
                   case_team ct 
       WHERE pc.team_nbr=ct.team_nbr
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND ct.current_status_ind=''C'') spd_name
           FROM
           DUAL','C',to_date('28-FEB-14 01:43:08','DD-MON-RR HH:MI:SS'),to_date('28-FEB-14 01:43:11','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (37,'School Web Site','School Web Site','SELECT (SELECT s.website_url FROM school s WHERE s.ipmsysid=:i_ipmsysid AND s.record_type=:i_record_type and s.current_status_ind=''C'' ) FROM DUAL','C',to_date('18-MAR-14 01:33:52','DD-MON-RR HH:MI:SS'),to_date('18-MAR-14 01:33:56','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (38,'No. of additional locations','No. of additional locations','select (SELECT COUNT(sl.location_ipmsysid) FROM school_location sl WHERE sl.school_ipmsysid=:i_ipmsysid AND sl.record_type=:i_record_type and sl.current_status_ind=''C'' AND TO_NUMBER(sl.location_nbr)!=0 and rownum=1) from dual','C',to_date('18-MAR-14 01:38:41','DD-MON-RR HH:MI:SS'),to_date('18-MAR-14 01:38:44','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (39,'States Located','States Located','SELECT
   (SELECT LISTAGG (state_name,''|'' ) WITHIN GROUP (ORDER BY state_name)  state_name
   FROM
    (SELECT
                DISTINCT s.state_name
    FROM school_location sl,
             partner_address pa,
             state_ref s
    WHERE sl.school_ipmsysid=:i_ipmsysid
    AND sl.record_type=:i_record_type
    AND sl.location_ipmsysid=pa.ipmsysid
    AND sl.record_type=pa.record_type
    AND pa.state_cd=s.state_cd
    AND PA.ADDRESS_TYPE_ID=6
    AND sl.current_status_ind=''C''
   ) )state_name
   FROM DUAL','C',to_date('18-MAR-14 01:53:29','DD-MON-RR HH:MI:SS'),to_date('18-MAR-14 01:53:33','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (40,'Countries Located','Countries Located','SELECT
   (SELECT LISTAGG (country_name,''|'' ) WITHIN GROUP (ORDER BY country_name)  country_name
   FROM
    (SELECT
                DISTINCT c.country_name
    FROM school_location sl,
             partner_address pa,
             country_ref c
    WHERE sl.school_ipmsysid=:i_ipmsysid
    AND sl.record_type=:i_record_type
    AND sl.location_ipmsysid=pa.ipmsysid
    AND sl.record_type=pa.record_type
    AND pa.country_cd=c.country_cd
    AND PA.ADDRESS_TYPE_ID=6
    AND sl.current_status_ind=''C''
   ) )country_name
   FROM DUAL','C',to_date('18-MAR-14 01:58:27','DD-MON-RR HH:MI:SS'),to_date('18-MAR-14 01:58:30','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (41,'Institution Type','Institution Type',' SELECT
          (SELECT sr.sch_type_name
            FROM school s,
                     school_type_ref sr 
         WHERE s.ipmsysid=:i_ipmsysid 
             AND s.record_type=:i_record_type 
             AND S.SCH_TYPE_ID=SR.SCH_TYPE_ID
             AND s.current_status_ind=''C'' 
             ) Institution_type
             FROM DUAL','C',to_date('18-MAR-14 02:02:57','DD-MON-RR HH:MI:SS'),to_date('18-MAR-14 02:03:01','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (42,'Foreign School Ind','Foreign School Ind','SELECT (SELECT CASE WHEN p.partner_type_id=2 THEN ''Y'' ELSE ''N'' END foreign_schoo_ind FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type AND p.current_status_ind=''C'' ) FROM DUAL','C',to_date('18-MAR-14 02:09:00','DD-MON-RR HH:MI:SS'),to_date('18-MAR-14 02:09:10','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (43,'Month PPA Ind','Month PPA Ind','SELECT
(SELECT d.month_ppa_ind  FROM determination d WHERE d.ipmsysid=:i_ipmsysid AND d.record_type=:i_record_type) month_ppa_ind
FROM DUAL','C',to_date('18-MAR-14 02:20:54','DD-MON-RR HH:MI:SS'),to_date('18-MAR-14 02:20:56','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (48,'Submission Type','SubmissionType','SELECT (SELECT
                      pr.appl_purp_name
                  FROM 
                      partner_appl pa,
                      appl_purp_ref pr
                WHERE pa.application_id=(SELECT pc.application_id  FROM partner_case pc WHERE pc.ipmsysid=:i_ipmsysid AND pc.case_id=:i_case_id)
                  AND pa.primary_purp_id=pr.appl_purp_id
                  AND pa.current_status_ind=''C''
                ) appl_purp_name
           FROM DUAL','C',to_date('04-JAN-15 04:26:16','DD-MON-RR HH:MI:SS'),to_date('04-JAN-15 04:26:18','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (49,'Financial Incomplete Fields','Financial Incomplete Fields',' SELECT
  (SELECT
        LISTAGG (qr.question_name||'',''||qre.ar_incomplete_reason, ''|'')
               WITHIN GROUP (ORDER BY qre.question_id) question_id
  FROM fsca_ques_response qre,
       fsca_question_ref qr 
 WHERE qre.question_id=qr.question_id
   AND qre.ipmsysid=:i_ipmsysid
   AND qre.submission_id=:i_submission_id
   AND qre.ar_incomplete_reason IS NOT NULL
   AND qr.fs_ind=''Y''
  )
  FROM DUAL','C',to_date('05-JAN-15 10:08:44','DD-MON-RR HH:MI:SS'),to_date('05-JAN-15 10:08:48','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (50,'Financial Comments','Financial Comments',' SELECT
 (SELECT
       LISTAGG (qr.question_name||'',''||qre.ar_comments, ''|'')
               WITHIN GROUP (ORDER BY qre.question_id) question_id
  FROM fsca_ques_response qre,
       fsca_question_ref qr 
 WHERE qre.question_id=qr.question_id
   AND qre.ipmsysid=:i_ipmsysid
   AND qre.submission_id=:i_submission_id
   AND qre.ar_comments IS NOT NULL
   AND qr.fs_ind=''Y'')
 FROM DUAL','C',to_date('05-JAN-15 10:09:52','DD-MON-RR HH:MI:SS'),to_date('05-JAN-15 10:09:55','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (51,'Compliance Incomplete Fields','Compliance Incomplete Fields','SELECT
  (SELECT
        LISTAGG (qr.question_name ||'',''||qre.ar_incomplete_reason, ''|'')
               WITHIN GROUP (ORDER BY qre.question_id) question_id
  FROM fsca_ques_response qre,
       fsca_question_ref qr 
 WHERE qre.question_id=qr.question_id
   AND qre.ipmsysid=:i_ipmsysid
   AND qre.submission_id=:i_submission_id
   AND qre.ar_incomplete_reason IS NOT NULL
   AND qr.ca_ind=''Y''
  )
  FROM DUAL','C',to_date('05-JAN-15 10:13:41','DD-MON-RR HH:MI:SS'),to_date('05-JAN-15 10:13:45','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (52,'Compliance Comments','Compliance Comments','SELECT
 (SELECT
       LISTAGG (qr.question_name ||'',''||qre.ar_comments, ''|'')
               WITHIN GROUP (ORDER BY qre.question_id) question_id
  FROM fsca_ques_response qre,
       fsca_question_ref qr 
 WHERE qre.question_id=qr.question_id
   AND qre.ipmsysid=:i_ipmsysid
   AND qre.submission_id=:i_submission_id
   AND qre.ar_comments IS NOT NULL
   AND qr.ca_ind=''Y'')
 FROM DUAL','C',to_date('05-JAN-15 10:13:32','DD-MON-RR HH:MI:SS'),to_date('05-JAN-15 10:13:36','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (65,'Heighten Report CA Approval Date','Heighten Report CA Approval Date','SELECT
           (SELECT tl_approv_dt
             FROM
                 (SELECT tl_approv_dt 
                    FROM heighten_reporting 
                   WHERE ca_ind=''Y'' 
                     AND ipmsysid=:i_ipmsysid 
                     AND length(:i_record_type)>0
                   ORDER BY heighten_report_id DESC
                 )
            WHERE ROWNUM=1
            )tl_approv_dt
        FROM DUAL','C',to_date('03-DEC-15 02:35:04','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 02:35:08','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (5,'Address1','Address1','SELECT
(SELECT pa.address1 FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 )
FROM dual','C',to_date('20-DEC-13 01:54:18','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:19','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (6,'Address2','Address2','SELECT
(SELECT pa.address2 FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 01:54:21','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:22','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (8,'City','City','SELECT
(SELECT pa.city FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 01:54:25','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:26','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (9,'State','State','SELECT (SELECT s.state_name FROM partner_address pa,state_ref s WHERE  pa.state_cd=s.state_cd(+) AND  pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null) from DUAL','C',to_date('20-DEC-13 01:54:27','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:28','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (10,'Country','Country','SELECT
(SELECT c.country_name FROM partner_address pa,country_ref c WHERE  pa.country_cd=c.country_cd AND  pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null)
FROM dual','C',to_date('20-DEC-13 01:54:29','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:30','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (11,'Zip Code','Zip Code','select (SELECT pa.zip_code FROM partner_address pa WHERE pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6) from dual','C',to_date('20-DEC-13 01:54:31','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:32','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (12,'Address','Address','SELECT 
(SELECT CASE WHEN p.address1 IS NULL THEN NULL ELSE TRIM(p.address1)||'', ''END
              ||CASE WHEN p.address2 IS NULL THEN NULL ELSE TRIM(p.address2)||'', ''END
              ||CASE WHEN p.city IS NULL THEN NULL ELSE TRIM(p.city)||'', ''END
              ||CASE WHEN p.state_cd IS NULL THEN NULL ELSE TRIM( p.state_cd)||'', ''END
              || CASE WHEN p.country_cd IS NULL THEN NULL ELSE TRIM(p.country_cd) END
                      FROM partner_address p
                    WHERE p.ipmsysid=:i_ipmsysid
                        AND p.record_type=:i_record_type
                               AND p.address_type_id=6
                               AND ROWNUM=1) address
FROM DUAL','C',to_date('20-DEC-13 01:54:33','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:34','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (13,'Partner ID','Partner ID','SELECT 
(SELECT p.partner_id FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type and ROWNUM=1) partnerid
FROM DUAL','C',to_date('20-DEC-13 01:54:35','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:36','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (14,'Last Name of CEO','Last Name of CEO','SELECT
(SELECT p.last_name official_name
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.end_dt is null
      AND pot.official_title_id=34 AND ROWNUM=1)
      FROM DUAL','C',to_date('20-DEC-13 01:54:37','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:38','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (15,'PPA Expiration Date','PPA Expiration Date','SELECT
(SELECT TO_CHAR(d.ppa_expire_dt,''MM/DD/YYYY'') FROM determination d WHERE d.ipmsysid=:i_ipmsysid AND d.record_type=:i_record_type)
FROM dual','C',to_date('20-DEC-13 01:54:40','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:41','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (45,'ACN','ACN','SELECT ( SELECT cs.acn 
                   FROM compliance_submission cs 
                  WHERE cs.ipmsysid=:i_ipmsysid 
                    AND cs.submission_id=:i_submission_id 
                    AND cs.current_status_ind=''C'' 
               ) 
         FROM DUAL','C',to_date('04-JAN-15 04:07:13','DD-MON-RR HH:MI:SS'),to_date('04-JAN-15 04:07:16','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (66,'Heighten Report CA FYE Date','Heighten Report CA FYE Date','SELECT
           (SELECT ca_start_dt
             FROM
                 (SELECT ca_start_dt 
                    FROM heighten_reporting 
                   WHERE ca_ind=''Y'' 
                     AND ipmsysid=:i_ipmsysid 
                     AND length(:i_record_type)>0
                   ORDER BY heighten_report_id DESC
                 )
            WHERE ROWNUM=1
            )ca_start_dt
        FROM DUAL','C',to_date('03-DEC-15 02:37:02','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 02:37:04','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (91,'CA Due Date','Compliance Due Date',' SELECT (SELECT TO_CHAR(pd.ca_due_dt,''MM/DD/YYYY'') 
          FROM partner_detail pd 
         WHERE ipmsysid=:i_ipmsysid 
           AND current_status_ind=''C''
        ) due_date
   FROM DUAL','C',to_date('28-DEC-15 04:27:50','DD-MON-RR HH:MI:SS'),to_date('28-DEC-15 04:27:52','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (99,'Close School Analyst','Close School Analyst','SELECT (SELECT IU.FIRST_NAME||'' ''||IU.LAST_NAME  FROM IPM_USER IU,CLOSE_SCHOOL CS
 WHERE LOWER(IU.USER_NAME)=LOWER(CS.INITIATED_BY)
  AND IU.IPM_ROLE_ID=2
  AND CS.CASE_ID=:I_CASE_ID ) CLOSE_SCH_NAME FROM DUAL','C',to_date('13-DEC-16 10:22:59','DD-MON-RR HH:MI:SS'),to_date('13-DEC-16 10:22:59','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (101,'Official Phone Number','Official Phone Number','select (SELECT IU.phone_nbr  
FROM IPM_USER IU,
FSA_USER_ATTRIBUTE FUA ,
PARTNER_USER_ROLE PUR
WHERE IU.USER_ID=FUA.USER_ID 
AND PUR.USER_ID=IU.USER_ID
AND FUA.FSA_ATTRIBUTE_CD = '':i_attribute_cd''
AND FUA.CURRENT_STATUS_IND=''C''
AND IU.CURRENT_STATUS_IND=''C''
AND PUR.CURRENT_STATUS_IND=''C''
AND PUR.RECORD_TYPE=''P''
AND PUR.IPMSYSID=:I_IPMSYSID) phone_nbr from dual','C',to_date('13-DEC-16 11:30:23','DD-MON-RR HH:MI:SS'),to_date('13-DEC-16 11:30:23','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (100,'Close Schoo Analyst Email','Close Schoo Analyst Email','SELECT (SELECT IU.EMAIL_ADDR  FROM IPM_USER IU,CLOSE_SCHOOL CS
 WHERE IU.USER_NAME=CS.INITIATED_BY
  AND IU.IPM_ROLE_ID=2
  AND CS.CASE_ID=:I_CASE_ID) CLOSE_SCH_EMAIL FROM DUAL','C',to_date('13-DEC-16 11:31:27','DD-MON-RR HH:MI:SS'),to_date('13-DEC-16 11:31:27','DD-MON-RR HH:MI:SS'),'IPMUSER');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (1,'President/Chancellor/CEO','President/Chancellor/CEO','SELECT      
               (SELECT
              p.first_name||'', ''||p.last_name||'' ''||
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.official_title_id IN (1,34) and rownum=1) official_name
      FROM DUAL','C',to_date('05-DEC-13 10:23:05','DD-MON-RR HH:MI:SS'),to_date('05-DEC-13 10:23:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (3,'CEO Job Title','CEO Job Title','SELECT 
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
      AND po.ipmsysid=:I_IPMSYSID
      AND pot.official_title_id IN (1,34) 
      AND ROWNUM=1)
      FROM DUAL','C',to_date('20-DEC-13 01:54:14','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:15','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (2,'Date','Date','SELECT TO_CHAR(TRUNC(SYSDATE),''MM/DD/YYYY'') FROM DUAL WHERE length(:i_ipmsysid)>=0 AND length(:i_record_type)>0','C',to_date('20-DEC-13 01:54:10','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:12','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (4,'Partner Name','Partner Name','SELECT
(SELECT p.partner_name FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type and current_status_ind=''C'' )
FROM dual','C',to_date('20-DEC-13 01:54:16','DD-MON-RR HH:MI:SS'),to_date('20-DEC-13 01:54:17','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (46,'School FYE','School Fiscal Year End Date','SELECT ( SELECT ps.fy_end_dt
                   FROM partner_submission ps 
                  WHERE ps.ipmsysid=:i_ipmsysid 
                    AND ps.submission_id=:i_submission_id 
                    AND ps.current_status_ind=''C'' 
               ) 
         FROM DUAL','C',to_date('04-JAN-15 04:11:44','DD-MON-RR HH:MI:SS'),to_date('04-JAN-15 04:11:49','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (47,'Submission Date','Submission Date','SELECT ( SELECT TO_CHAR(ps.SUBMIT_DT,''MM/DD/YYYY HH:MI:SS'')
                   FROM partner_submission ps 
                  WHERE ps.ipmsysid=:i_ipmsysid 
                    AND ps.submission_id=:i_submission_id 
                    AND ps.current_status_ind=''C''
               ) 
         FROM DUAL','C',to_date('04-JAN-15 04:13:07','DD-MON-RR HH:MI:SS'),to_date('04-JAN-15 04:13:09','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (61,'Case Manager Phone Number','Case Manager Phone Number','SELECT
 (SELECT  u.phone_nbr
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_role fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_role_cd=''CM''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND ROWNUM<2) compliance_manager
       FROM
       DUAL','C',to_date('28-SEP-15 09:38:37','DD-MON-RR HH:MI:SS'),to_date('28-SEP-15 09:38:40','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (67,'Heighten Report FS Approval Date','Heighten Report FS Approval Date','SELECT
           (SELECT tl_approv_dt
             FROM
                 (SELECT tl_approv_dt 
                    FROM heighten_reporting 
                   WHERE fs_ind=''Y'' 
                     AND ipmsysid=:i_ipmsysid 
                     AND length(:i_record_type)>0
                   ORDER BY heighten_report_id DESC
                 )
            WHERE ROWNUM=1
            )tl_approv_dt
        FROM DUAL
','C',to_date('03-DEC-15 02:46:51','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 02:46:53','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (68,'Heighten Report FS FYE Date','Heighten Report FS FYE Date','SELECT
           (SELECT fs_start_dt
             FROM
                 (SELECT fs_start_dt 
                    FROM heighten_reporting 
                   WHERE fs_ind=''Y'' 
                     AND ipmsysid=:i_ipmsysid 
                     AND length(:i_record_type)>0
                   ORDER BY heighten_report_id DESC
                 )
            WHERE ROWNUM=1
            )fs_start_dt
        FROM DUAL','C',to_date('03-DEC-15 02:48:15','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 02:48:18','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (69,'Heightened CA Reporting Requirement','Heightened CA Reporting Requirement','SELECT  ''Annually Submit a Standard Complinace Audit Report''
                       FROM DUAL WHERE length(:i_ipmsysid)>=0  AND length(:i_record_type)>0','C',to_date('03-DEC-15 02:56:33','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 02:56:37','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (70,'Heightened FS Reporting Requirement','Heightened FS Reporting Requirement','SELECT
           (SELECT fs_report_req
             FROM
                 (SELECT CASE WHEN fs_annual_ind=''Y'' AND fs_annual_usgaap_ind= ''Y'' THEN
                            ''Anually Submit audited Finanacial Statements Prepared in accordance with generally accepted accounting principles of your instuton''''s home country''
                            || ''and'' ||''Anually Submit audited Finanacial Statements Prepared in accordance with U.S. GAAP and U.S. Goverment Audting Standards''
                           WHEN fs_annual_ind=''Y'' THEN
                           ''Anually Submit audited Finanacial Statements Prepared in accordance with generally accepted accounting principles of your instuton''''s home country''
                           WHEN fs_annual_usgaap_ind= ''Y'' THEN
                           ''Anually Submit audited Finanacial Statements Prepared in accordance with U.S. GAAP and U.S. Goverment Audting Standards''
                           END fs_report_req
                    FROM heighten_reporting 
                   WHERE fs_ind=''Y'' 
                     AND ipmsysid=:i_ipmsysid 
                     AND length(:i_record_type)>0
                   ORDER BY heighten_report_id DESC
                 )
            WHERE ROWNUM=1
            )fs_report_req
        FROM DUAL','C',to_date('03-DEC-15 03:07:38','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 03:07:40','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (71,'Case Manager Email','Case Manager Email','SELECT
 (SELECT u.email_addr
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') case_manager_email
       FROM
       DUAL','C',to_date('03-DEC-15 04:25:36','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 04:25:38','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (72,'Partner Current Fiscal Year End Date','Partner Current Fiscal Year End Date','SELECT 
       (SELECT pd.current_fye_dt
          FROM partner_detail pd
         WHERE pd.ipmsysid=:i_ipmsysid
               AND pd.current_status_ind=''C''
       ) curr_fye_dt
   FROM DUAL','C',to_date('03-DEC-15 05:40:28','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 05:40:31','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (73,'Partner Current Fiscal Year End Date - Late Six Months','Partner Current Fiscal Year End Date - Late Six Months','SELECT   
       (SELECT add_months(pd.current_fye_dt,6)  
          FROM partner_detail pd  
         WHERE pd.ipmsysid=:i_ipmsysid  
                     AND pd.current_status_ind=''C''  
       ) curr_fye_dt  
   FROM DUAL','C',to_date('03-DEC-15 05:59:39','DD-MON-RR HH:MI:SS'),to_date('03-DEC-15 05:59:41','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (75,'New FS Begin Date','New FS Begin Date',' SELECT
       ( SELECT e.new_fs_begin_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) new_fs_begin_dt
        FROM DUAL','C',to_date('04-DEC-15 03:03:07','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:03:08','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (76,'New FS End Date','New FS End Date',' SELECT
       ( SELECT e.new_fs_end_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) new_fs_end_dt
        FROM DUAL','C',to_date('04-DEC-15 03:03:43','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:03:44','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (77,'Attestation Begin Date','Attestation Begin Date',' SELECT
       ( SELECT e.attest_begin_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) attest_begin_dt
        FROM DUAL','C',to_date('04-DEC-15 03:07:04','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:07:07','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (78,'Attestation End Date','Attestation End Date',' SELECT
       ( SELECT e.attest_end_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) attest_end_dt
        FROM DUAL','C',to_date('04-DEC-15 03:08:00','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:08:02','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (79,'FYE Change FS Due Date','FS Due Date','SELECT
       ( SELECT e.fs_report_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) fs_due_date
        FROM DUAL','C',to_date('04-DEC-15 03:10:26','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:10:28','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (80,'FYE Change CA Begin Date','CA Begin Date',' SELECT
       ( SELECT e.ca_begin_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) ca_begin_dt
        FROM DUAL','C',to_date('04-DEC-15 03:11:27','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:11:29','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (81,'FYE Change CA End Date','CA End Date',' SELECT
       ( SELECT e.ca_end_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) ca_end_dt
        FROM DUAL','C',to_date('04-DEC-15 03:12:12','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:12:15','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (82,'Stub Begin Date','Stub Begin Date','SELECT
       ( SELECT e.stub_begin_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) stub_begin_dt
        FROM DUAL','C',to_date('04-DEC-15 03:13:53','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:13:55','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (92,'DPA Name','DPA Name','select (SELECT FIRST_NAME||'' ''||LAST_NAME 
FROM IPM_USER IU,partner_user_role PU
 where IU.USER_ID=PU.PARTNER_USER_ID
 AND ipmsysid=:I_IPMSYSID
  AND RECORD_TYPE=''A'' and partner_role_cd IN (''PDPA'',''SPDA'',''AA'') AND ROWNUM=1) name from dual','C',to_date('09-SEP-16 12:14:38','DD-MON-RR HH:MI:SS'),to_date('09-SEP-16 12:14:38','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (98,'Financial Aid Director','Financial Aid Director','SELECT  (   SELECT
              p.first_name||'', ''||p.last_name||'' ''||
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
      AND po.ipmsysid=:i_ipmsysid
      and pot.end_dt is null
      AND pot.official_title_id=38) FROM DUAL','C',to_date('23-SEP-16 03:10:25','DD-MON-RR HH:MI:SS'),to_date('23-SEP-16 03:10:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (83,'Stub End Date','Stub End Date','SELECT
       ( SELECT e.stub_end_dt
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) stub_end_dt
        FROM DUAL','C',to_date('04-DEC-15 03:14:45','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:14:47','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (84,'FYE Change CA Due Date','CA Due Date','SELECT
       ( SELECT NVL(e.ca_report_dt,e.stub_report_dt)
          FROM extn_fye_zfw_review e
         WHERE e.ipmsysid=:i_ipmsysid
           AND e.case_id=:i_case_id
           AND e.current_status_ind=''C''
       ) ca_due_dt
        FROM DUAL','C',to_date('04-DEC-15 03:15:57','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:15:59','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (53,'City State Zip','City,State,Zip','SELECT
(SELECT pa.city||'',''||pa.zip_code||'',''||s.state_name FROM partner_address pa,state_ref s WHERE  pa.state_cd=s.state_cd(+) AND pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and ROWNUM=1)
FROM dual','C',to_date('16-FEB-15 11:57:27','DD-MON-RR HH:MI:SS'),to_date('16-FEB-15 11:57:30','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (54,'Period Begin Date','Period Begin Date','SELECT
 ( SELECT TO_CHAR(ps.period_begin_dt,''MM/DD/YYYY'')
  FROM partner_submission ps 
 WHERE ps.ipmsysid=:i_ipmsysid
   AND ps.submission_id=:i_submission_id
   AND ps.current_status_ind=''C'')
 FROM DUAL','C',to_date('17-FEB-15 12:34:57','DD-MON-RR HH:MI:SS'),to_date('17-FEB-15 12:34:59','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (55,'Period End Date','Period End Date','SELECT
 ( SELECT TO_CHAR(ps.period_end_dt,''MM/DD/YYYY'')
  FROM partner_submission ps 
 WHERE ps.ipmsysid=:i_ipmsysid
   AND ps.submission_id=:i_submission_id
   AND ps.current_status_ind=''C'')
 FROM DUAL','C',to_date('17-FEB-15 12:35:50','DD-MON-RR HH:MI:SS'),to_date('17-FEB-15 12:35:52','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (56,'Auditor Name','Financial Submission Auditor','SELECT
 ( SELECT fs.auditor_name
  FROM financial_submission fs 
 WHERE fs.ipmsysid=:i_ipmsysid
   AND fs.submission_id=:i_submission_id
   AND fs.current_status_ind=''C'')
 FROM DUAL','C',to_date('17-FEB-15 12:40:36','DD-MON-RR HH:MI:SS'),to_date('17-FEB-15 12:40:38','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (57,'Finding Number','Finding Number','SELECT
   (SELECT LISTAGG (defic_nbr,''|'' ) WITHIN GROUP (ORDER BY defic_nbr)  defic_nbr
   FROM
    (SELECT
           DISTINCT sd.defic_nbr
    FROM submission_defic sd
    WHERE sd.ipmsysid=:i_ipmsysid
    AND sd.submission_id=:i_submission_id
    AND sd.review_by_cd=''AR''
    AND sd.current_status_ind=''C''
   ) )defic_nbr
   FROM dual','C',to_date('17-FEB-15 01:40:06','DD-MON-RR HH:MI:SS'),to_date('17-FEB-15 01:40:07','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (58,'ARS Name','ARS Name','SELECT
 (
  SELECT pc.case_owner FROM partner_case pc WHERE pc.ipmsysid=:i_ipmsysid AND pc.case_id=:i_case_id AND pc.current_status_ind=''C''
 )
FROM dual','C',to_date('17-FEB-15 01:58:50','DD-MON-RR HH:MI:SS'),to_date('17-FEB-15 01:58:52','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (59,'City State','City and State','select (SELECT pa.city||'',''||s.state_name FROM partner_address pa,state_ref s WHERE  pa.state_cd=s.state_cd(+) AND  pa.ipmsysid=:i_ipmsysid AND pa.record_type=:i_record_type AND pa.address_type_id=6 and pa.end_dt is null and rownum=1) from dual','C',to_date('30-MAR-15 09:54:58','DD-MON-RR HH:MI:SS'),to_date('30-MAR-15 09:55:03','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (60,'Finding Description','Finding Description','SELECT
   (SELECT LISTAGG (defic_name,''|'' ) WITHIN GROUP (ORDER BY defic_name)  defic_name
   FROM
    (SELECT
           DISTINCT d.defic_name
    FROM submission_defic sd,
         defic_ref d
    WHERE sd.ipmsysid=:i_ipmsysid
    AND sd.submission_id=:i_submission_id
    AND sd.defic_cd=d.defic_cd
    AND sd.review_by_cd=''AR''
    AND sd.current_status_ind=''C''
   ) )defic_name
   FROM dual','C',to_date('30-MAR-15 10:19:50','DD-MON-RR HH:MI:SS'),to_date('30-MAR-15 10:19:53','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (62,'AAASG Adjunct Name','AAASG Adjunct Name','SELECT  
 (SELECT  u.first_name||'',''||u.last_name||'' ''||  
              u.middle_initial case_manager  
         FROM partner_case pc,  
                   team_member tm,  
                   ipm_user u,  
                   fsa_user_role fur  
       WHERE pc.team_nbr=tm.team_nbr  
           AND tm.user_id=u.user_id  
           AND fur.user_id=u.user_id  
           AND fur.fsa_role_cd=''AAAD-AD''  
           AND pc.ipmsysid=:i_ipmsysid  
           AND pc.case_id=:i_case_id  
           AND pc.current_status_ind=''C''  
           AND tm.current_status_ind=''C''  
           AND u.current_status_ind=''C''  
           AND fur.current_status_ind=''C'') AAAD_Adjunct  
       FROM  
       DUAL','C',to_date('09-OCT-15 10:45:59','DD-MON-RR HH:MI:SS'),to_date('09-OCT-15 10:46:02','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (63,'AAASG Director Name','AAASG Director Name','SELECT  
 (SELECT  u.first_name||'',''||u.last_name||'' ''||  
              u.middle_initial case_manager  
         FROM partner_case pc,  
                   team_member tm,  
                   ipm_user u,  
                   fsa_user_role fur  
       WHERE pc.team_nbr=tm.team_nbr  
           AND tm.user_id=u.user_id  
           AND fur.user_id=u.user_id  
           AND fur.fsa_role_cd=''AAAD-D''  
           AND pc.ipmsysid=:i_ipmsysid  
           AND pc.case_id=:i_case_id  
           AND pc.current_status_ind=''C''  
           AND tm.current_status_ind=''C''  
           AND u.current_status_ind=''C''  
           AND fur.current_status_ind=''C'') AAAD_D  
       FROM  
       DUAL','C',to_date('09-OCT-15 10:48:00','DD-MON-RR HH:MI:SS'),to_date('09-OCT-15 10:48:02','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (85,'Total Title IV Amount','Total Title IV Amount','select (select * from (
select TOTAL_CB+TOTAL_NON_CB from funding where IPMSYSID=:i_ipmsysid order by funding_yrs desc)
where rownum=1)funding_amt from dual','C',to_date('04-DEC-15 03:27:38','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:27:40','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (86,'Additional Federal Amount','Additional Federal Amount','SELECT
         (SELECT w.addl_federal_amt
           FROM waiver_myca_exempt_determ w
          WHERE w.ipmsysid=:i_ipmsysid
            AND w.submission_id=:i_submission_id
            AND w.current_status_ind=''C''
          ) addl_federal_amt
          FROM dual','C',to_date('04-DEC-15 03:28:59','DD-MON-RR HH:MI:SS'),to_date('04-DEC-15 03:29:02','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (64,'RID','RID','SELECT 
(SELECT rid FROM partner p WHERE p.ipmsysid=:i_ipmsysid AND p.record_type=:i_record_type and p.end_dt is null) rid
FROM DUAL','C',to_date('06-NOV-15 05:01:32','DD-MON-RR HH:MI:SS'),to_date('06-NOV-15 05:01:34','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (89,'FY End Date','FY End Date','SELECT( SELECT 
         TO_CHAR(pd.current_fye_dt ,''MM/DD/YYYY'')
    FROM partner_detail pd
   WHERE ipmsysid=:i_ipmsysid)
     FROM DUAL','I',to_date('28-DEC-15 04:26:14','DD-MON-RR HH:MI:SS'),to_date('28-DEC-15 04:26:16','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (90,'Due Date','Due Date','SELECT (SELECT TO_CHAR(NVL(pd.fs_due_dt,pd.ca_due_dt),''MM/DD/YYYY'') 
          FROM partner_detail pd 
         WHERE ipmsysid=:i_ipmsysid 
           AND current_status_ind=''C''
        ) due_date
   FROM DUAL','C',to_date('28-DEC-15 04:27:01','DD-MON-RR HH:MI:SS'),to_date('28-DEC-15 04:27:03','DD-MON-RR HH:MI:SS'),null);
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (272,'PA Name','PA Name','SELECT 
 (SELECT  u.first_name||'',''||u.last_name||'' ''|| 
              u.middle_initial case_manager 
         FROM partner_case pc, 
                   team_member tm, 
                   ipm_user u, 
                   fsa_user_ATTRIBUTE fur 
       WHERE pc.team_nbr=tm.team_nbr 
           AND tm.user_id=u.user_id 
           AND fur.user_id=u.user_id 
           AND fur.fsa_ATTRIBUTE_cd=''PA-AN''
           AND pc.ipmsysid=:i_ipmsysid 
           AND pc.case_id=:i_case_id 
           AND pc.current_status_ind=''C'' 
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C'' 
           AND fur.current_status_ind=''C'' 
           AND rownum<2) PA_NAME 
       FROM 
       DUAL','C',to_date('24-MAY-17 11:54:02','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:54:02','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (386,'MOP Stop Payment Effective Dt','MOP Stop Payment Effective Dt','select (select MOP_DETERM_DT from change_mop where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('31-MAY-17 10:10:24','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 10:10:24','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (442,'Period Begin Date','CS Period Begin Date','select (select cs.period_begin_dt  from partner_case pc,compliance_submission cs
where cs.submission_id=pc.submission_id
and pc.case_id=:i_case_id and rownum=1) from dual','C',to_date('16-JUN-17 01:01:08','DD-MON-RR HH:MI:SS'),to_date('16-JUN-17 01:01:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (443,'Period End Date','CS Period End Date','select (select cs.period_end_dt  from partner_case pc,compliance_submission cs
where cs.submission_id=pc.submission_id
and pc.case_id=:i_case_id and rownum=1) from dual','C',to_date('16-JUN-17 01:01:10','DD-MON-RR HH:MI:SS'),to_date('16-JUN-17 01:01:10','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (444,'Final Audit Determination','Final Audit Determination','SELECT ''APPROVED'' FROM  DUAL','C',to_date('20-JUN-17 04:00:06','DD-MON-RR HH:MI:SS'),to_date('20-JUN-17 04:00:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (446,'LOC Number','LOC Number 25.1','select (SELECT LOC_NBR FROM LOC_RESPONSE WHERE CASE_ID=:I_CASE_ID) from dual','C',to_date('23-JUN-17 02:24:15','DD-MON-RR HH:MI:SS'),to_date('23-JUN-17 02:24:15','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (447,'Loc Issue Date','Loc Issue Date 25.1','select (SELECT LOC_ISSUE_DT FROM LOC_RESPONSE WHERE CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('23-JUN-17 02:36:43','DD-MON-RR HH:MI:SS'),to_date('23-JUN-17 02:36:43','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (445,'LOC Contact Name','LOC Contact Name','select (select  pc.CONTACT_FIRST_NAME||'' ''|| PC.CONTACT_LAST_NAME  from manage_loc ml,partner_loc pc
     where pc.loc_id=ml.loc_id   and ml.case_id=:i_case_id and rownum=1) from dual','C',to_date('23-JUN-17 10:59:31','DD-MON-RR HH:MI:SS'),to_date('23-JUN-17 10:59:31','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (429,'Financial Analyst Phone Nbr','Financial Analyst Phone Nbr','SELECT
 (SELECT  u.email_addr case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_attribute fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_attribute_cd=''FA-AN''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND rownum<2) division_director
       FROM
       DUAL','C',to_date('07-JUN-17 03:36:56','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:36:56','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (431,'Financial Analyst Email','Financial Analyst Email','SELECT
 (SELECT  u.email_addr case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_attribute fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_attribute_cd=''FA-AN''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND rownum<2) division_director
       FROM
       DUAL','C',to_date('07-JUN-17 03:37:30','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 03:37:30','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (172,'Type Of Change','Type Of Change','select (  SELECT 
  LISTAGG (SR.APPL_SUBPURP_NAME, '','')
               WITHIN GROUP (ORDER BY SR.APPL_SUBPURP_ID ) subpurpose
FROM appl_subpurp s,appl_subpurp_ref sr,PARTNER_CASE PC
WHERE s.appl_subpurp_id=sr.appl_subpurp_id
AND PC.APPLICATION_ID=S.APPLICATION_ID
AND PC.CASE_ID=:i_case_id
AND s.current_status_ind=''C'') abc from dual','C',to_date('28-APR-17 01:43:45','DD-MON-RR HH:MI:SS'),to_date('28-APR-17 01:43:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (208,'Description OF Finding Info','Description OF Finding Info','SELECT
   (SELECT LISTAGG (defic_name,''|'' ) WITHIN GROUP (ORDER BY defic_name)  defic_name
   FROM
    (SELECT
           DISTINCT d.defic_name
    FROM submission_defic sd,
         defic_ref d
    WHERE sd.ipmsysid=:i_ipmsysid
    AND sd.submission_id=:i_submission_id
    AND sd.defic_cd=d.defic_cd
    AND sd.review_by_cd=''AR''
    AND sd.current_status_ind=''C''
    AND ROWNUM=1
   ) )defic_name
   FROM dual','C',to_date('10-MAY-17 09:36:25','DD-MON-RR HH:MI:SS'),to_date('10-MAY-17 09:36:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (181,'Reviewer Name','Reviewer Name','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'' AND ROWNUM=1) case_manager
       FROM
       DUAL','C',to_date('03-MAY-17 09:45:54','DD-MON-RR HH:MI:SS'),to_date('03-MAY-17 09:45:54','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (448,'LOC Receive Date','LOC Receive Date 25.1','select (SELECT to_char(received_dt,''mm-dd-yyyy'') FROM loc_response where case_id=:i_case_id) from dual','C',to_date('23-JUN-17 02:59:29','DD-MON-RR HH:MI:SS'),to_date('23-JUN-17 02:59:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (450,'LOC Amount','LOC Amount25.1','select (select received_amt from loc_response where case_id=:i_case_id) from dual','C',to_date('12-JUL-17 03:22:31','DD-MON-RR HH:MI:SS'),to_date('12-JUL-17 03:22:31','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (468,'Due Dt of acceptable LOC','Due Dt of acceptable LOC','SELECT (select loc_due_dt from loc_request where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1 and current_status_ind=''C'') FROM DUAL','C',to_date('11-SEP-17 05:13:35','DD-MON-RR HH:MI:SS'),to_date('11-SEP-17 05:13:35','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (469,'DPA Title','DPA Title','SELECT 
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
      AND po.ipmsysid=:i_ipmsysid
      AND pot.record_type=:i_record_type
      AND pot.official_title_id IN (36) 
      AND ROWNUM=1)
      FROM DUAL','C',to_date('11-SEP-17 05:13:50','DD-MON-RR HH:MI:SS'),to_date('11-SEP-17 05:13:50','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (290,'Program Reviewer Name','Program Reviewer Name','SELECT
 (SELECT  u.first_name||'' ''||u.last_name
                       FROM partner_case pc,
                   ipm_user u
       WHERE  pc.ipmsysid=:i_ipmsysid
       AND lower(PC.CASE_OWNER)=lower(U.USER_NAME)
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND u.current_status_ind=''C'') case_manager
       FROM
       DUAL','C',to_date('25-MAY-17 10:20:02','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 10:20:02','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (188,'Appropriate name','Appropriate name','SELECT
 (SELECT  u.first_name||'',''||u.last_name||'' ''||
              u.middle_initial case_manager
         FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_role fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_role_cd=''CM''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND ROWNUM<2) compliance_manager
       FROM
       DUAL','C',to_date('04-MAY-17 09:43:35','DD-MON-RR HH:MI:SS'),to_date('04-MAY-17 09:43:35','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (470,'Third-Party Requester Title','Third-Party Requester Title','select null from dual','C',to_date('13-SEP-17 01:41:47','DD-MON-RR HH:MI:SS'),to_date('13-SEP-17 01:41:47','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (472,'Award Year','Program Review Award Year','select (select review_yr from program_review where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('18-SEP-17 11:21:38','DD-MON-RR HH:MI:SS'),to_date('18-SEP-17 11:21:38','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (478,'Period End Date','Period End Date(waiver End Dt) 36.1','select (select to_char(waiver_end_dt,''mm-dd-yyyy'') from waiver_review where ipmsysid=:i_ipmsysid and case_id=:i_case_id) from dual','C',to_date('22-SEP-17 10:06:25','DD-MON-RR HH:MI:SS'),to_date('22-SEP-17 10:06:25','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (480,'Date Of Letter','Date Of Letter 52.10','select (select to_char(TL_APPROV_DT,''mm-dd-yyyy'') from SANCTION  where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('27-SEP-17 01:07:49','DD-MON-RR HH:MI:SS'),to_date('27-SEP-17 01:07:49','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (481,'Loss Elig Dt','Loss Elig Dt 52.10','select (select to_char(loss_elig_dt,''mm-dd-yyyy'') from sanction where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('27-SEP-17 01:08:41','DD-MON-RR HH:MI:SS'),to_date('27-SEP-17 01:08:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (482,'Notification Year','Notification Year 52.10','select (select to_char(TL_APPROV_DT,''yyyy'') from SANCTION  where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('27-SEP-17 01:09:23','DD-MON-RR HH:MI:SS'),to_date('27-SEP-17 01:09:23','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (483,'FY After 2 Year','FY After 2 Year 52.10','select (select to_char(add_months(TL_APPROV_DT,24),''yyyy'') from SANCTION  where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('27-SEP-17 01:11:24','DD-MON-RR HH:MI:SS'),to_date('27-SEP-17 01:11:24','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (484,'Review Dates','Review Dates 41.3','SELECT (SELECT LISTAGG(to_char(start_dt,''mm-dd-yyyy'')||''-''||to_char(end_dt,''mm-dd-yyyy''),'','') WITHIN GROUP(ORDER BY program_review_id) FROM pr_review_date
where program_review_id in (select program_review_id from program_review where ipmsysid=:i_ipmsysid and case_id=:i_case_id)) from dual','C',to_date('27-SEP-17 01:35:37','DD-MON-RR HH:MI:SS'),to_date('27-SEP-17 01:35:37','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (485,'Review Period','Review Period 41.3','SELECT (SELECT LISTAGG(to_char(start_dt,''mm-dd-yyyy'')||''-''||to_char(end_dt,''mm-dd-yyyy''),'','') WITHIN GROUP(ORDER BY program_review_id) FROM pr_review_date
where program_review_id in (select program_review_id from program_review where ipmsysid=:i_ipmsysid and case_id=:i_case_id)) from dual','C',to_date('27-SEP-17 01:45:58','DD-MON-RR HH:MI:SS'),to_date('27-SEP-17 01:45:58','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (486,'List of Critical Elements','List of Critical Elements 41.3','SELECT (SELECT LISTAGG(critical_element_name,'','') WITHIN GROUP (ORDER BY critical_element_id) FROM critical_element_ref WHERE critical_element_id
in (select critical_element_id from pr_critical_element where ipmsysid=:i_ipmsysid and case_id=:i_case_id)) from dual','C',to_date('27-SEP-17 01:58:14','DD-MON-RR HH:MI:SS'),to_date('27-SEP-17 01:58:14','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (464,'Waiver Request DT','Waiver Request DT','select (select to_char(creation_dt,''DD/MM/YYYY'') WAIVER_DT from WAIVER_review where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('07-SEP-17 11:10:18','DD-MON-RR HH:MI:SS'),to_date('07-SEP-17 11:10:18','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (471,'FY End Date','FY End Date 17.1','SELECT (SELECT NVL(fiscal_yr,to_char(NVL(FY_END_DT,PERIOD_END_DT),''YYYY'')) FROM PARTNER_SUBMISSION WHERE SUBMISSION_ID IN (SELECT SUBMISSION_ID FROM PARTNER_CASE WHERE CASE_ID=:I_CASE_ID)) FROM DUAL','C',to_date('14-SEP-17 03:28:21','DD-MON-RR HH:MI:SS'),to_date('14-SEP-17 03:28:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (465,'date of loss of eligibility','date of loss of eligibility 40.4','SELECT (SELECT to_char(loss_elig_dt,''MM-DD-YYYY'') FROM funds_request_review WHERE case_id=:i_case_id AND ROWNUM=1) FROM duaL','C',to_date('11-SEP-17 12:14:07','DD-MON-RR HH:MI:SS'),to_date('11-SEP-17 12:14:07','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (466,'Interval Status Report','Interval Status Report','select null from dual','C',to_date('11-SEP-17 02:13:27','DD-MON-RR HH:MI:SS'),to_date('11-SEP-17 02:13:27','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (453,'Close_out_Audit_dt','Close_out_Audit_dt','SELECT * FROM (SELECT to_char(submit_dt,''mm/dd/yyy'') FROM fsca_detail WHERE ipmsysid=:i_ipmsysid ORDER BY creation_dt DESC NULLS LAST) WHERE ROWNUM=1','C',to_date('24-AUG-17 10:37:39','DD-MON-RR HH:MI:SS'),to_date('24-AUG-17 10:37:39','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (454,'HCM2 Payment Reqt Dt','HCM2 Payment Reqt Dt','SELECT (SELECT appl_submit_dt FROM partner_appl WHERE APPLICATION_ID IN (SELECT APPLICATION_ID FROM PARTNER_cASE WHERE CASE_ID=:I_CASE_ID) AND ROWNUM=1) FROM DUAL','C',to_date('24-AUG-17 10:59:16','DD-MON-RR HH:MI:SS'),to_date('24-AUG-17 10:59:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (473,'Received and Reviewed DT','Received and Reviewed DT 41.3','select (select to_char(extn_request_dt,''mm/dd/yyyy'') from prr_extn where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('18-SEP-17 04:25:26','DD-MON-RR HH:MI:SS'),to_date('18-SEP-17 04:25:26','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (474,'Response Received DT','Response Received DT 41.3','select (select to_char(extn_request_dt,''mm/dd/yyyy'') from prr_extn where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from dual','C',to_date('18-SEP-17 04:27:40','DD-MON-RR HH:MI:SS'),to_date('18-SEP-17 04:27:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (475,'Date Of Cite Ltr','Date Of Cite Ltr','select (select :cite_ltr_dt from dual) from dual','C',to_date('19-SEP-17 03:19:49','DD-MON-RR HH:MI:SS'),to_date('19-SEP-17 03:19:49','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (476,'Date Of Partner Ltr','Date Of Partner Ltr','select null from dual','C',to_date('19-SEP-17 03:22:20','DD-MON-RR HH:MI:SS'),to_date('19-SEP-17 03:22:20','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (477,'FY End Date','FY End Date 25.2','SELECT (SELECT * FROM (SELECT TO_CHAR(FYE_DT,''MM-DD-YYYY'') FROM  FSCA_DETAIL WHERE IPMSYSID=:I_IPMSYSID ORDER BY FISCAL_YR DESC NULLS LAST) WHERE ROWNUM=1) FROM DUAL','C',to_date('21-SEP-17 11:34:15','DD-MON-RR HH:MI:SS'),to_date('21-SEP-17 11:34:15','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (479,'Auditor Name','Compliance Submission Auditor','SELECT  auditor_name FROM compliance_submission WHERE ipmsysid=:i_ipmsysid AND submission_id=:i_submission_id  and current_status_ind=''C'' AND ROWNUM=1','C',to_date('25-SEP-17 10:49:04','DD-MON-RR HH:MI:SS'),to_date('25-SEP-17 10:49:04','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (283,'program name(s)','program name(s)','select (SELECT listagg(loan_pgm_name,'','') within group (order by 1) FROM loan_pgm_ref lpr,funds_request_270form fr,partner_case pc
WHERE pc.application_id=fr.application_id
AND fr.loan_pgm_id=lpr.loan_pgm_id
and pc.case_id=:i_case_id) from dual','C',to_date('24-MAY-17 02:57:46','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 02:57:46','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (271,'Division Director PH NBR','Division Director PH NBR','SELECT
 (SELECT  u.phone_nbr
                       FROM partner_case pc,
                   team_member tm,
                   ipm_user u,
                   fsa_user_role fur
       WHERE pc.team_nbr=tm.team_nbr
           AND tm.user_id=u.user_id
           AND fur.user_id=u.user_id
           AND fur.fsa_role_cd=''DD''
           AND pc.ipmsysid=:i_ipmsysid
           AND pc.case_id=:i_case_id
           AND pc.current_status_ind=''C''
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C''
           AND fur.current_status_ind=''C''
           AND rownum<2) division_director
       FROM
       DUAL','C',to_date('24-MAY-17 11:52:34','DD-MON-RR HH:MI:SS'),to_date('24-MAY-17 11:52:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (423,'Previous Federal School Code','Previous Federal School Code','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE IPMSYSID IN (SELECT PREVIOUS_IPMSYSID FROM CHANGE_AFFILIATION WHERE IPMSYSID=:I_IPMSYSID AND RECORD_TYPE=''A'') AND ALTERNATIVE_TYPE_ID=12 and RECORD_TYPE=''A'' and rownum=1) from dual','C',to_date('07-JUN-17 10:16:21','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:16:21','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (417,'Previous Partner Id','Previous Partner Id','select(SELECT p.partner_id FROM partner p WHERE PARTNER_TYPE_ID IN (1,2) AND RECORD_TYPE=''A''  AND p.ipmsysid IN (SELECT PREVIOUS_IPMSYSID  FROM CHANGE_AFFILIATION WHERE IPMSYSID=:I_IPMSYSID AND RECORD_TYPE=:I_RECORD_TYPE and rownum=1) and rownum=1)
from dual','C',to_date('07-JUN-17 10:13:08','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:13:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (421,'Previous FFEL','Previous FFEL','select (SELECT  ALTERNATIVE_ID FROM ALTERNATIVE_IDENTIFIER WHERE 
IPMSYSID IN (SELECT PREVIOUS_IPMSYSID FROM CHANGE_AFFILIATION WHERE IPMSYSID=:i_ipmsysid AND RECORD_TYPE=''A'' and rownum=1) AND ALTERNATIVE_TYPE_ID=8 AND ROWNUM=1) from dual','C',to_date('07-JUN-17 10:15:06','DD-MON-RR HH:MI:SS'),to_date('07-JUN-17 10:15:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (176,'Analyst Title','Analyst Title','SELECT 
 (SELECT  far.FSA_ATTRIBUTE_NAME 
         FROM partner_case pc, 
                   team_member tm, 
                   ipm_user u, 
                   fsa_user_attribute fur ,
                   fsa_attribute_ref far
       WHERE pc.team_nbr=tm.team_nbr 
           AND tm.user_id=u.user_id 
           AND fur.user_id=u.user_id
           and lower(pc.case_owner)=lower(u.user_name)
           and FAR.FSA_ATTRIBUTE_CD=FUR.FSA_ATTRIBUTE_CD 
           AND fur.fsa_attribute_cd=''EA-AN'' 
           AND pc.ipmsysid=:i_ipmsysid 
           AND pc.case_id=:i_case_id 
           AND pc.current_status_ind=''C'' 
           AND tm.current_status_ind=''C''
           AND u.current_status_ind=''C'' 
           AND fur.current_status_ind=''C'' 
           AND ROWNUM<2) Elligibility_enalyst 
       FROM 
       DUAL','C',to_date('28-APR-17 02:16:15','DD-MON-RR HH:MI:SS'),to_date('28-APR-17 02:16:15','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (292,'list the review information needed','list thereview information needed','select null from dual','C',to_date('25-MAY-17 10:28:22','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 10:28:22','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (293,'time interval for status report','time interval for status report','select null from dual','C',to_date('25-MAY-17 10:33:18','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 10:33:18','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (294,'information institution required to submit to demonstrate','information institution required to submit to demonstrate 41.1','select null from dual','C',to_date('25-MAY-17 10:36:47','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 10:36:47','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (295,'Reviewed Award Year','Reviewed Award Year','select null from dual','C',to_date('25-MAY-17 10:57:39','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 10:57:39','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (296,'Response Recieve Dt','Response Recieve Dt','select null from dual','C',to_date('25-MAY-17 10:58:36','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 10:58:36','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (297,'Program Review Report Necessary Info','Program Review Report Necessary Info','select null from dual','C',to_date('25-MAY-17 11:09:14','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 11:09:14','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (298,'Repaid Liabilities','Repaid Liabilities','select null from dual','C',to_date('25-MAY-17 11:18:54','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 11:18:54','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (299,'FPRD  Liabilities','FPRD  Liabilities','select null from dual','C',to_date('25-MAY-17 11:19:15','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 11:19:15','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (300,'FPRD Liabilities identified Dt','FPRD Liabilities identified Dt','select null from dual','C',to_date('25-MAY-17 11:25:50','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 11:25:50','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (301,'Date of Person Teliphoned Inst','Date of Person Teliphoned Inst','select null from dual','C',to_date('25-MAY-17 11:36:06','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 11:36:06','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (302,'Case Manager Phone Extn','Case Manager Phone Extn','select null from dual','C',to_date('25-MAY-17 12:01:05','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 12:01:05','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (303,'Partner Close Dt','Partner Close Dt','select null from dual','C',to_date('25-MAY-17 12:04:37','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 12:04:37','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (304,'Case Manager Title','Case Manager Title','select null from dual','C',to_date('25-MAY-17 12:57:39','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 12:57:39','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (305,'Review Required Dt','Review Required Dt 41.1','select null from dual','C',to_date('25-MAY-17 01:02:40','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 01:02:40','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (306,'quarters/years included in scope of review','quarters/years included in scope of review','select null from dual','C',to_date('25-MAY-17 01:08:53','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 01:08:53','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (307,'FIOS-Region','FIOS-Region','select null from dual','C',to_date('25-MAY-17 01:11:53','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 01:11:53','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (308,'Student Loan Officer/GA Officer Name','Student Loan Officer/GA Officer Name','select null from dual','C',to_date('25-MAY-17 01:14:14','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 01:14:14','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (309,'Beneficial Holder','Beneficial Holder','select null from dual','C',to_date('25-MAY-17 01:14:48','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 01:14:48','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (310,'borrower number','borrower number','select null from dual','C',to_date('25-MAY-17 01:16:55','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 01:16:55','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (311,'information needed to correct the problem','information needed to correct the problem 41.1','select null from dual','C',to_date('25-MAY-17 01:26:16','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 01:26:16','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (318,'Servicer Name','Servicer Name','select null from dual','C',to_date('25-MAY-17 04:35:36','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 04:35:36','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (319,'Student Number','Student Number','select null from dual','C',to_date('25-MAY-17 04:53:50','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 04:53:50','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (320,'description of problem with the response','description of problem with the response','select null from dual','C',to_date('25-MAY-17 04:54:41','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 04:54:41','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (321,'Entrance Conference Dt','Entrance Conference Dt','select null from dual','C',to_date('25-MAY-17 05:07:52','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 05:07:52','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (322,'Status Meeting Dt','Status Meeting Dt','select null from dual','C',to_date('25-MAY-17 05:08:39','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 05:08:39','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (323,'Exit Meeting Dt','Exit Meeting Dt','select null from dual','C',to_date('25-MAY-17 05:09:01','DD-MON-RR HH:MI:SS'),to_date('25-MAY-17 05:09:01','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (343,'ACD Original','ACD Original','select (SELECT decode(ACD_TYPE_NAME,''Original'',''YES'') FROM ACD,ACD_TYPE_REF ATF
WHERE ACD.ACD_TYPE_ID=ATF.ACD_TYPE_ID
AND ACD.IPMSYSID=:I_IPMSYSID AND ACD.CASE_ID=:I_CASE_ID
AND ATF.ACD_TYPE_ID=1 and rownum=1) from DUAL','C',to_date('30-MAY-17 01:11:29','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 01:11:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (344,'ACD Amended','ACD Amended','select (SELECT ACD_TYPE_NAME FROM ACD,ACD_TYPE_REF ATF
WHERE ACD.ACD_TYPE_ID=ATF.ACD_TYPE_ID
AND ACD.IPMSYSID=:I_IPMSYSID AND ACD.CASE_ID=:I_CASE_ID
AND ATF.ACD_TYPE_ID=2 and rownum=1) from DUAL','C',to_date('30-MAY-17 01:12:13','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 01:12:13','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (345,'ACD Revised ACD','ACD Revised ACD','select (SELECT ACD_TYPE_NAME FROM ACD,ACD_TYPE_REF ATF
WHERE ACD.ACD_TYPE_ID=ATF.ACD_TYPE_ID
AND ACD.IPMSYSID=:I_IPMSYSID AND ACD.CASE_ID=:I_CASE_ID
AND ATF.ACD_TYPE_ID=3 and rownum=1) from DUAL','C',to_date('30-MAY-17 01:12:54','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 01:12:54','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (346,'ACD Revised FAD','ACD Revised FAD','select (SELECT ACD_TYPE_NAME FROM ACD,ACD_TYPE_REF ATF
WHERE ACD.ACD_TYPE_ID=ATF.ACD_TYPE_ID
AND ACD.IPMSYSID=:I_IPMSYSID AND ACD.CASE_ID=:I_CASE_ID
AND ATF.ACD_TYPE_ID=4 and rownum=1) from DUAL','C',to_date('30-MAY-17 01:13:10','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 01:13:10','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (347,'ACD Compromise Settlement','ACD Compromise Settlement','select (SELECT ACD_TYPE_NAME FROM ACD,ACD_TYPE_REF ATF
WHERE ACD.ACD_TYPE_ID=ATF.ACD_TYPE_ID
AND ACD.IPMSYSID=:I_IPMSYSID AND ACD.CASE_ID=:I_CASE_ID
AND ATF.ACD_TYPE_ID=5 and rownum=1) from DUAL','C',to_date('30-MAY-17 01:13:34','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 01:13:34','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (348,'TPS ID','TPS ID','select null from dual','C',to_date('30-MAY-17 03:03:52','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 03:03:52','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (349,'Fianl PR Determination Issue Dt','Fianl PR Determination Issue Dt','select null from dual','C',to_date('30-MAY-17 03:41:08','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 03:41:08','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (350,'FNQuestionedCost','FNQuestionedCost','select (select QC_FINDING_NUMBERS from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:25:18','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:25:18','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (351,'RecommendedQCAmt','RecommendedQCAmt','select (select TO_CHAR(RECOMMENDED_QC_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 04:26:52','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:26:52','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (352,'OrigQCAmt','OrigQCAmt','select (select TO_CHAR(ORIG_QC_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1)  from DUAL','C',to_date('30-MAY-17 04:27:29','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 04:27:29','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (451,'Summary','Summary65.1','select null from dual','C',to_date('19-JUL-17 01:55:29','DD-MON-RR HH:MI:SS'),to_date('19-JUL-17 01:55:29','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (159,'CA Comments','CA Comments','SELECT LISTAGG(RRF.REASON_NAME,'','') WITHIN GROUP(ORDER BY 1)
FROM IPM_DOC ID,
DOC_REJECT_REASON DRM,
DOC_REJECT_REASON_REF RRF
WHERE ID.IPM_DOC_ID=DRM.IPM_DOC_ID
AND RRF.REJECT_REASON_ID=DRM.REJECT_REASON_ID
AND CA_IND=''Y''
AND ID.SUBMISSION_ID=:I_SUBMISSION_ID','C',to_date('17-APR-17 11:55:13','DD-MON-RR HH:MI:SS'),to_date('17-APR-17 11:55:13','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (378,'BufthreeAmt','BufthreeAmt','select (select TO_CHAR(BUF3_AMT,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:00:57','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:00:57','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (383,'originalTotal','originalTotal','select (select TO_CHAR(TOTAL_ORIGINAL_ACD,''L99,999,999,999'') from acd where ipmsysid=:i_ipmsysid and case_id=:i_case_id and rownum=1) from DUAL','C',to_date('30-MAY-17 05:15:01','DD-MON-RR HH:MI:SS'),to_date('30-MAY-17 05:15:01','DD-MON-RR HH:MI:SS'),'ipmsystem');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (393,'PELL Grantee DUNS','PELL Grantee DUNS','select (select ALTERNATIVE_ID  from alternative_identifier where ALTERNATIVE_TYPE_ID=22 AND  ipmsysid=:i_ipmsysid AND record_type=:i_record_type and rownum=1) from dual','C',to_date('31-MAY-17 01:11:54','DD-MON-RR HH:MI:SS'),to_date('31-MAY-17 01:11:54','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (173,'Partner Respond Instruction','Partner Respond Instruction','select (SELECT   USMLE_COMMENTS  FROM ANNUAL_REPORTING_DETERM WHERE CASE_ID=:I_CASE_ID and rownum=1) from dual','C',to_date('28-APR-17 01:46:55','DD-MON-RR HH:MI:SS'),to_date('28-APR-17 01:46:55','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (165,'Increased or Decreased','Increased or Decreased','SELECT decode(sign((select (select pc.LOC_AMT from manage_loc ml,partner_loc pc 
     where pc.loc_id=ml.loc_id 
     and ml.case_id=:i_case_id and rownum=1) from dual)- 
     (select (select request_amt from loc_request where case_id=:i_case_id)  from dual) ),-1,''Increased'',''Decreased'')abc 
     FROM DUAL','C',to_date('20-APR-17 02:40:48','DD-MON-RR HH:MI:SS'),to_date('20-APR-17 02:40:48','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (452,'Submission Date','New Submission Due Date','select (select NEW_due_DT  from EXTN_FYE_ZFW_REVIEW where case_id=:i_case_id and rownum=1) from dual','C',to_date('01-AUG-17 02:48:52','DD-MON-RR HH:MI:SS'),to_date('01-AUG-17 02:48:52','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');
Insert into CONTROL (CONTROL_ID,CONTROL_NAME,DESCRIPTION,SQL_CODE,CURRENT_STATUS_IND,CREATION_DT,MODIFIED_DT,USER_MODIFIED) values (436,'Previous HCM1 or Reimbursement','Previous HCM1 or Reimbursement','select (select * from (select  MOP_TYPE_NAME from mop m ,mop_type_ref mtr
        where m.mop_type_id=mtr.mop_type_id
        and mtr.mop_type_id in (1,3)
        and ipmsysid=:i_ipmsysid
        order by start_dt desc) where rownum=1) from dual','C',to_date('13-JUN-17 09:51:45','DD-MON-RR HH:MI:SS'),to_date('13-JUN-17 09:51:45','DD-MON-RR HH:MI:SS'),'IPMSYSTEM');



