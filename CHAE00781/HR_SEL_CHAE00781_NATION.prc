CREATE OR REPLACE PROCEDURE STDGW.HR_SEL_CHAE00781_NATION
(
    p_nation   varchar2,
    p_rtn_value    out   sys_refcursor
)
IS
l_rtn_cur   sys_refcursor;

BEGIN

   open l_rtn_cur for

        SELECT A.EMP_ID,A.ID_NUM,A.FULL_NAME,A.FULL_FNAME,A.SEX,A.NATION,A.TEL,A.PK,A.JOIN_DT,A.BIRTH_DT FROM THR_EMPLOYEE A
        WHERE A.DEL_IF = 0 AND A.NATION = p_nation;

    p_rtn_value := l_rtn_cur;
   EXCEPTION
     WHEN NO_DATA_FOUND THEN
       NULL;
     WHEN OTHERS THEN
       -- Consider logging the error and then re-raise
       RAISE;
END HR_SEL_CHAE00781_NATION;
/