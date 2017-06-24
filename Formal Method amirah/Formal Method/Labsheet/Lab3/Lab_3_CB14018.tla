--------------------------- MODULE Lab_3_CB14018 ---------------------------
EXTENDS Naturals, TLC
CONSTANT Data
VARIABLES val, rdy, ack
TypeInvariant == /\ val \in Data
                 /\ rdy \in {0,1}
                 /\ ack \in {0,1}
Init == /\ val \in Data
        /\ rdy \in {0, 1}
        /\ ack = rdy
(*
Send(d) == /\ rdy =ack
        /\ val' \in Data
        /\ rdy' = 1 - rdy
        /\ UNCHANGED ack
        
Rcv == /\ rdy # ack
       /\ ack' = 1 - ack
       /\ UNCHANGED <<val, rdy>>
*)

Send(d) == /\ rdy =ack
        /\ val' \in Data
        /\ rdy' = 1 - rdy
        /\ UNCHANGED ack
        \*/\Print(<<"Send",val>>,TRUE)
        
Rcv == /\ rdy # ack
       /\ ack' = 1 - ack
       /\ UNCHANGED <<val, rdy>>
      \* /\Print(<<"RCV",val>>,TRUE)

Next == (\E d \in Data : Send(d)) /\ Rcv
Spec == Init /\ [][Next]_<<val,rdy,ack>>


THEOREM Spec =>[]TypeInvariant
\*Q5=For it distinct from 12 it will change to 6 if add the Data set 
\*Q6=It is not correct because it will have error in model checking result
\*Print(exp1, exp2)== exp2
\*Print(exp, TRUE)
\*Print(<<id, exp>>,TRUE)

        
 
                 

=============================================================================
\* Modification History
\* Last modified Fri Oct 23 21:13:48 SGT 2015 by User
\* Last modified Tue Oct 20 10:00:16 SGT 2015 by fskkpump
\* Created Tue Oct 20 08:26:57 SGT 2015 by fskkpump
