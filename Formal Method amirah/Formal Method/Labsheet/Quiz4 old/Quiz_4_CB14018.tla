--------------------------- MODULE Quiz_4_CB14018 ---------------------------
EXTENDS Naturals, Sequences, TLC
VARIABLES Buf
CONSTANT Data

BUFini == Buf = <<>>
Init == Buf = << 3,7>>

Send == /\ Len (Buf) < 4
        /\ Buf' = Append (Buf , 3)
        /\ Print (Buf', TRUE)
\*there is exists an element in Data set, such that we append it to the Buf
       

\* Send ==  /\ \E d\in Data : Buf' = Append (Buf, d)


Rec == /\ Len(Buf) > 0
        /\ Buf'= Tail (Buf)
        /\ Print (Buf', TRUE)
\*the next state of the Buf will be the tail of Buf in old state

        
       
Next == Send \/ Rec


Spec == Init /\ [][Next]_Buf

THEOREM Spec => []BUFini


=============================================================================
\* Modification History
\* Last modified Thu Nov 05 22:11:04 SGT 2015 by User
\* Last modified Tue Nov 03 09:59:00 SGT 2015 by fskkpump
\* Created Tue Nov 03 08:23:49 SGT 2015 by fskkpump
