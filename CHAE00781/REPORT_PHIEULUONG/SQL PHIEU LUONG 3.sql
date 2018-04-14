THR_EMPLOYEE
THR_MONTH_SALARY

select 
    A.EMP_ID,
    A.PK,
    A.FULL_NAME,
    A.PHOTO_PK,
    A.STATUS,
    A.JOIN_DT,
    A.LEFT_DT,
    A.SEX,
    A.NATION,
    A.PRESENT_ADDR,
    A.TEL,
    A.BASIC_SAL,
    A.TCO_ORG_PK,
    B.WORK_MON,
    ROUND (NVL (B.SALARY_LEVEL1, 0), 3) as PROBATION_SALARY,        -- luong thu viec
    ROUND (NVL (B.SALARY_LEVEL2, 0), 3) as OFFICIAL_SALARY,         -- luong chinh thuc   
    ROUND (NVL (B.ALLOW_AMT1, 0), 3) as ALLOW_AMT1,                       -- phu cap chuc vu
    ROUND (NVL (B.ALLOW_AMT2, 0), 3) as ALLOW_AMT2,                       -- phu cap tien an
    ROUND (NVL (B.ALLOW_AMT1_L2, 0), 3) as ALLOW_AMT1_L2,
    ROUND (NVL (B.ALLOW_AMT2_L2, 0), 3) as ALLOW_AMT2_L2,
    ROUND (NVL (B.WT_L1, 0) + NVL (B.HOL_DAY_L1, 0) * 8, 3) as WT_L1,
    ROUND (NVL (B.WT_L2, 0) + NVL (B.HOL_DAY_L2, 0) * 8, 3) as Working_Days,       -- Ngày công
    ROUND (NVL (B.WT_L1_AMT, 0)+ NVL (B.HOL_DAY_L1_AMT, 0)+ NVL (B.WT_L2_AMT, 0)+ NVL (B.HOL_DAY_L2_AMT, 0),3) as BASIC_SALARY, -- ngay cong qui ra tien
    ROUND (NVL (B.ABS_ALE_L1, 0), 3) as ALE_ABS,                                              -- Nghỉ phép năm
    ROUND (NVL (B.ABS_ALE_L2, 0), 3) as OTHER_ABS,                                              -- Ngày vắng khác
    ROUND (NVL (B.ABS_ALE_L1_AMT, 0) + NVL (B.ABS_ALE_L2_AMT, 0), 3) as ABS_AMT,              -- Nghỉ phép qui ra tiền
     ROUND (NVL (B.ABS_OTHER_PAY_L1, 0), 3),
         ROUND (NVL (B.ABS_OTHER_PAY_L2, 0), 3),
         ROUND (
            NVL (B.ABS_OTHER_PAY_L1_AMT, 0) + NVL (B.ABS_OTHER_PAY_L2_AMT, 0),
            3),
         ROUND (NVL (B.OT_L1, 0), 3),
         ROUND (NVL (B.OT_L2, 0), 3) as OT_1,                                                   -- Tăng ca thường (Overtime 1.5)
         ROUND (NVL (B.OT_L1_AMT, 0) + NVL (B.OT_L2_AMT, 0), 3) as OT_1_AMT,                        -- Tăng ca qui ra tiền
         ROUND (
              NVL (B.ST_L1, 0)
            + NVL (B.HT_L1, 0)
            + NVL (B.OHT_L1, 0)
            + NVL (B.OST_L1, 0),
            3),
         ROUND (
              NVL (B.ST_L2, 0)
            + NVL (B.HT_L2, 0)
            + NVL (B.OHT_L2, 0)
            + NVL (B.OST_L2, 0),
            3) as OT_2,                                                                     -- Tăng ca CN/Lễ (Overtime 2.0)
         ROUND (
              NVL (B.ST_L1_AMT, 0)
            + NVL (B.HT_L1_AMT, 0)
            + NVL (B.OHT_L1_AMT, 0)
            + NVL (B.ST_L2_AMT, 0)
            + NVL (B.HT_L2_AMT, 0)
            + NVL (B.OHT_L2_AMT, 0)
            + NVL (B.OST_L1_AMT, 0)
            + NVL (B.OST_L2_AMT, 0),
            3) as OT_2_AMT,                                                                     -- Tăng ca qui ra tiền
         ROUND (NVL (B.NT_30_L1, 0), 3) as PC_NT,                                                        -- PC ca đêm
         ROUND (NVL (B.NT_30_L2, 0), 3),                                    
         ROUND (NVL (B.NT_30_L1_AMT, 0) + NVL (B.NT_30_L2_AMT, 0), 3),
         ROUND (NVL (B.NT_45_L1, 0) + NVL (B.NT_45_2_L1, 0), 3),
         ROUND (NVL (B.NT_45_L2, 0) + NVL (B.NT_45_2_L2, 0), 3),
         ROUND (
              NVL (B.NT_45_L1_AMT, 0)
            + NVL (B.NT_45_L2_AMT, 0)
            + NVL (B.NT_45_2_L1_AMT, 0)
            + NVL (B.NT_45_2_L2_AMT, 0),
            3),
         ROUND (NVL (B.NT_60_L1, 0), 3),
         ROUND (NVL (B.NT_60_L2, 0), 3) as PC_OST,                                                -- Phụ cấp tăng ca đêm CN 
         ROUND (NVL (B.NT_60_L1_AMT, 0) + NVL (B.NT_60_L2_AMT, 0), 3) as PC_OST_AMT,                          -- PCTC qui ra tiền
         ROUND (NVL (B.NT_90_L1, 0), 3),                                                            
         ROUND (NVL (B.NT_90_L2, 0), 3) as PC_OHT,                                                            -- PCTC đêm lễ
         ROUND (NVL (B.NT_90_L1_AMT, 0) + NVL (B.NT_90_L2_AMT, 0), 3) as PC_OHT_AMT,                              -- qui ra tiền
         ROUND (NVL (B.ALLOW_K1_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_K2_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_K3_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_K4_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_K5_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_K6_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_K7_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_K8_AMT, 0), 3),
         ROUND (NVL (B.RETURN_AMT, 0), 3),
         ROUND (NVL (B.ALE_STOP, 0), 3),
         ROUND (NVL (B.ALE_STOP_AMT, 0), 3),
         ROUND (NVL (B.SEVERANCE_MONTH, 0), 3),
         ROUND (NVL (B.SEVERANCE_AMT, 0), 3),
         ROUND (NVL (B.GROSS_AMT, 0), 3) as GROSS_SALARY,                                               -- Lương Gross
         ROUND (NVL (B.BREAK_CONTRACT_DAYS, 0), 3),
         ROUND (NVL (B.BREAK_CONTRACT_AMT, 0), 3),
         ROUND (NVL (B.ADVANCE_AMT, 0), 3),
         ROUND (NVL (B.INCOME_BEFORE_TAX, NVL (B.INCOME_AMT, 0)), 3),
         ROUND (NVL (B.INCOME_TAX, 0), 3),
         ROUND (NVL (B.UNION_AMT, 0), 3),
         ROUND (NVL (B.SOCIAL_AMT, 0) + NVL (B.HEALTH_AMT, 0), 3) as BHXH_BHYT,              -- BHXH _ BHYT
         ROUND (NVL (B.RETURN_NO_PIT, 0), 3),
         ROUND (NVL (B.ADVANCE_NO_PIT, 0), 3),
         DECODE ('01',
                 'ALL', ROUND (NVL (B.NET_amt, 0), 0),
                 '01', ROUND (NVL (B.NET_amt, 0), 0),
                 ROUND (NVL (B.NET_AMT, 0), 2)) as NET_SALARY,                                        --Lương NET
         ROUND (NVL (B.UNEMP_INS, 0), 3) as BHTN,                                               -- BH thất nghiệp
         ROUND (NVL (B.OT_TAX_L1_AMT, 0) + NVL (B.OT_TAX_L2_AMT, 0), 3) as OT_SLARY,                   -- Tăng ca 100% qui ra tiền
         ROUND (NVL (B.DEDUCT_PIT, 0), 3) as DEDUCT_PIT,                                                  -- Giảm trừ thuế
         ROUND (NVL (B.INC_AMT, 0), 3),
         ROUND (NVL (B.ALLOW_AMT1_L1, 0), 3),
         ROUND (NVL (B.ALLOW_AMT2_L1, 0), 3),
         ROUND (NVL (B.ALLOW_AMT3_L1, 0), 3),
         ROUND (NVL (B.ALLOW_AMT4_L1, 0), 3),
         ROUND (NVL (B.ALLOW_AMT5_L1, 0), 3),
         ROUND (NVL (B.ALLOW_AMT6_L1, 0), 3),
         ROUND (NVL (B.ALLOW_AMT7_L1, 0), 3),
         ROUND (NVL (B.ALLOW_AMT8_L1, 0), 3)
    
    
    
    
from THR_EMPLOYEE a
left join THR_MONTH_SALARY b on A.EMP_ID = B.EMP_ID and A.DEL_IF = B.DEL_IF
where 
    A.DEL_IF = 0
    and A.EMP_ID = '12602930'