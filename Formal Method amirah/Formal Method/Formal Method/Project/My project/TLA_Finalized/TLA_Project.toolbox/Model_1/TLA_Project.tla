---------------------------- MODULE TLA_Project----------------------------

EXTENDS Naturals, Sequences, TLC

CONSTANTS Buffer,        \* Declare Buffer as Constants that specify maximum amount of data
          Data,          \* Declare Data as Constants that specify the data that is to be produce or use
          PersonMakes,   \* Declare PersonMakes as a Constants that specify the person that produce
          PersonEats     \* Declare PersonEats as a Constants that specify the person that use


ASSUME /\ Buffer > 0           \* The size of buffer should not equal to 0
       /\ Data # {}           \* Data should not be empty  
       /\ PersonMakes # {}    \* There should be at least on person that produce
       /\ PersonEats # {}     \* There should be at least on person that use
       /\ PersonMakes \intersect PersonEats = {} \* The person that produce should not be the same person that consume
              

---------------------------------------------------------------------------------------------------------------------------------------------

VARIABLE ExpectClues,     \* Declare variable ExpectClues for the set of clues.
         buffer            \* Declare variable buffer for the sequence of objects
         
         
AllClues == PersonMakes \union PersonEats   

RunningClues == AllClues \ ExpectClues          \* Define the difference between all clues and the clues currently in Expect Clues

TypeInvariant == /\ buffer \in Seq(Data)
                 /\ Len(buffer) \in (0..Buffer)
                 /\ ExpectClues \subseteq AllClues
                 
Notify == IF ExpectClues # {} THEN (\E x \in ExpectClues : ExpectClues' = ExpectClues \ {x} )  \* Selects a clues in the ExpectClues, if any, to resume execution
          ELSE UNCHANGED ExpectClues    \* no effect if the expectClues are empty.
          
Expect(clue) == ExpectClues' = ExpectClues \union {clue}   \* place the clues into the ExpectClues

-----------------------------------------------------------------------------------------------------------------------------------------------

Init == /\ buffer = << >>           \* initialize buffer as empty 
        /\ ExpectClues = {}      \* initialize ExpectClues as empty

Get(clue) == /\ IF Len(buffer) > 0 THEN /\ buffer' = Tail(buffer) /\ Notify \*Tail the buffer and Notify if still got element in buffer
                  ELSE /\ Expect(clue) /\ UNCHANGED buffer \* place clues into ExpectClues and dont change buffer                  
               /\ Print(<<"Get",clue, buffer, ExpectClues>>,TRUE) \*Display the word "Get" clue input , buffer and ExpectClues

Put(clue,data) == /\ IF Len(buffer) < Buffer THEN /\ buffer' = Append(buffer, data) /\ Notify  \*Append the buffer and Notify if buffer length shorter than Buffer(Capacity)
                       ELSE /\ Expect(clue) /\ UNCHANGED buffer \* place clues into ExpectClues and dont change buffer 
                    /\ Print(<<"Put",clue, buffer, ExpectClues>>,TRUE)\*Display the word "Put" clue input , buffer and ExpectClues
          

               
          
Next == \E clue \in RunningClues : \/ (clue \in PersonMakes /\ \E data \in Data : Put(clue, data))  
                                       \/ (clue \in PersonEats  /\ Get(clue))
                                       
Spec == Init /\ [][Next]_<<buffer, ExpectClues>>

-------------------------------------------------------

NoDeadlock == [](RunningClues # {} )    (* there is always at least one clue running Elvira *)

THEOREM Spec => []TypeInvariant /\ NoDeadlock

=============================================================================
\* Modification History
\* Last modified Mon May 12 20:46:23 SGT 2014 by David Keong
\* Last modified Sat May 10 21:01:11 SGT 2014 by Asus
\* Last modified Fri May 09 23:17:42 SGT 2014 by elvis
\* Last modified Thu Dec 19 18:07:44 SGT 2013 by RedX
\* Created Wed Dec 18 21:24:10 SGT 2013 by RedX
