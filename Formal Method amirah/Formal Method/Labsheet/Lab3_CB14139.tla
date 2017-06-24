---------------------------- MODULE Lab3_CB14139 ----------------------------
EXTENDS Naturals, TLC
CONSTANT Data
VARIABLES val, rdy, ack
TypeInvariant == /\ val \in Data
                 /\ rdy \in {0,1}
                 /\ ack \in {0,1}
                 

Init == /\ val \in Data
        /\ rdy \in {0,1}
        /\ ack = rdy

(*        
Send(d) == /\ rdy =ack
        /\ val' \in Data
        /\ rdy' = 1 - rdy
        /\ UNCHANGED ack
        
Rcv == /\ rdy # ack
       /\ ack' = 1 - ack
       /\ UNCHANGED << val, rdy >>
  
 *)      


Send(d) == /\ rdy =ack
        /\ val' \in Data
        /\ rdy' = 1 - rdy
        /\ UNCHANGED ack
        /\ Print(<<"Send(d)",val>>,TRUE)
        
Rcv == /\ rdy # ack
       /\ ack' = 1 - ack
       /\ UNCHANGED << val, rdy >>
       /\ Print(<<"Rcv",val>>,TRUE)

Next == (\E d \in Data : Send(d)) /\ Rcv
Spec == Init /\ [][Next]_<<val,rdy,ack>>


THEOREM Spec => [] TypeInvariant
\* Distinct States change to 16 if I add one element (d4)
\* Distinct States Change to 8 if I delete one element (d3)
\* Q6- 1 error detected and distinct states and states found change to 6
=============================================================================
\* Modification History
\* Last modified Tue Oct 20 09:56:22 SGT 2015 by fskkpump
\* Created Tue Oct 20 08:26:45 SGT 2015 by fskkpump
