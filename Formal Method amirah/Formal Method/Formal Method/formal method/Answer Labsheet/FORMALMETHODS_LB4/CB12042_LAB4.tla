---------------------------- MODULE CB12042_LAB4 ----------------------------

EXTENDS Lab1_CB12042 
(* Conjoin the specification HC with the Week Fairness condition *) 
LSpec == HC /\ WF_hr(HCnxt) 
 
(* Define some Liveness and Fairness properties that LSpec satisfies. *) 
(* Asserts that infinitely many <<HCnxt>>_hr steps occur. *) 
AlwaysTick == []<><<HCnxt>>_hr 
 
(* Asserts that, for each time n in 1..12, hr infinitely often equals n. *) 
AllTimes == \A n \in (1..10) : []<>(hr = n) 
New == (hr = 1) => []<>(hr = 2) 

TypeInvariance == []HCini 
(* The temporal formula asserting that HCini is always true. *) 
(* It is stated in this way to show another way of telling TLC to check an invariant. *) 
---------------------------------------------------------------------------- 
(* LSpec – is a liveness specification, combining 3 temporal properties *) 

THEOREM LSpec => AlwaysTick /\ AllTimes /\ TypeInvariance /\ New
=============================================================================
\* Modification History
\* Last modified Tue Apr 15 09:22:47 SGT 2014 by student
\* Created Tue Apr 15 08:45:35 SGT 2014 by student
