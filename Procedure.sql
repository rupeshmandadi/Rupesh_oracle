--------------------------------------------------------
--  File created - Sunday-August-13-2017   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Procedure CREATE_CONTRACTOR_USER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "IPMAPPDB"."CREATE_CONTRACTOR_USER" (i_user_name varchar2 default null,i_first_name in varchar2,i_last_name in varchar2,i_email_addr varchar2,i_role_cd in varchar2) is
v_user_cnt number(2);
v_cnt number(1);
  v_object  VARCHAR2 (200)  := 'create_internal_user';
  v_status  VARCHAR2 (500) := NULL;
  v_sqlcode VARCHAR2 (100)  := NULL;
  v_sqlerrm VARCHAR2 (1000) := NULL;
  v_err_line VARCHAR2(2000):=NULL;
v_user_id number(10) :=NULL;
v_user_name VARCHAR2(100) := i_user_name;
begin  
--rupesh
-- this is new change
if i_user_name is null then
v_user_name := i_first_name||'.'||i_last_name ;
end if;
select count(*) into v_user_cnt from ipm_user where lower(user_name)=lower(v_user_name);
select count(*) into v_cnt from fsa_role_ref where fsa_role_cd=i_role_cd and ar_contractor_ind='Y';
if v_user_cnt=0 and v_cnt=1 then
v_status:= 'Insert new user';
  v_user_id:=s_user.nextval;
  INSERT
  INTO ipm_user
    (
      user_id,
      first_name,
      last_name,
      current_status_ind,
      creation_dt,
      modified_dt,
      user_modified,
      AIMS_creation_dt,
      ipm_role_id,
      user_name,
      email_addr
    )
    VALUES
    (
      v_user_id,
      i_first_name,
      i_last_name,
      'C',
      sysdate,
      sysdate,
      'AIMS',
      TRUNC(sysdate),
     3,
     v_user_name,
     i_email_addr
    );
    
    v_status:= 'Insert fsa user role';
  INSERT
  INTO fsa_user_role
    (
      user_id,
      fsa_role_cd,
      current_status_ind,
      creation_dt,
      modified_dt,
      user_modified
    )
    VALUES
    (
      v_user_id,
      i_role_cd,
      'C',
      sysdate,
      sysdate,
      'AIMS'
      );
end  if;

commit;
EXCEPTION
WHEN OTHERS THEN
  ROLLBACK;
  v_sqlcode := SQLCODE;
  v_sqlerrm := v_status || ' - ' || SUBSTR(SQLERRM,1,500);
        v_err_line:=SUBSTR(dbms_utility.format_error_backtrace, 1, 2000);
        --v_object  := v_package || '-' || v_object;
        error_handler_sp (v_sqlcode, v_sqlerrm, v_object,v_err_line);
end;

/
