--------------------------- MODULE lab_1_cb13125 ---------------------------
EXTENDS Naturals
VARIABLE hr
HCini == /\ hr\in (1 .. 12)
        


HCnxt == /\ hr' = IF hr # 12 THEN hr + 1 ELSE 1

HC == HCini /\ [][HCnxt]_hr 



(*HCnxt2 == /\ hr' = (hr % 12) + 1*)
          
HC2 == HCini /\ [][HCnxt]_<<hr>>

----------------------------------------------------------------------------
THEOREM HC => []HCini

=============================================================================
\* Modification History
\* Last modified Tue Apr 15 09:06:30 SGT 2014 by student
\* Created Tue Mar 18 08:27:40 SGT 2014 by student
