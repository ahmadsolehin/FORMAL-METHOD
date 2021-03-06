--------------------------- MODULE Quiz_3_CB15003 ---------------------------
EXTENDS Naturals, Sequences, TLC
VARIABLES Buf
CONSTANT Data

BUFini == Buf = <<>>
Init == Buf = << 3,7>>

(*Next == /\ Buf' = <<1, 2, 3>>

        /\ Print(Buf, TRUE)*)

Send == /\ Len (Buf) < 4
        /\ Buf' = Append (Buf , 3)
        /\ Print (Buf', TRUE)
\*there is exists an element in Data set, such that we append it to the Buf
       

\* Send ==  /\ \E d\in Data : Buf' = Append (Buf, d)


Rcv == /\ Len(Buf) > 0
        /\ Buf'= Tail (Buf)
        /\ Print (Buf', TRUE)
\*the next state of the Buf will be the tail of Buf in old state

        
       
Next == Send \/ Rcv
(*Buf' == Append (Buf,4)
Buf' == <<1, 2, 3, 4>>
Buf' == Tail(Buf)
Buf' == <<2, 3, 4>>
*)


Spec == Init /\ [][Next]_Buf

THEOREM Spec => []BUFini

=============================================================================
\* Modification History
\* Last modified Tue Apr 18 00:31:56 SGT 2017 by User
\* Created Tue Apr 18 00:29:01 SGT 2017 by User
