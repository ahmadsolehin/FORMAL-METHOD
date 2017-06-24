------------------------------ MODULE project ------------------------------
EXTENDS Naturals, Sequences, TLC

CONSTANTS Producers,   (* the (nonempty) set of producers                           *)
          Consumers,   (* the (nonempty) set of consumers                           *)
          BufferSize,  (* the maximum number of messages in the bounded buffer      *)
          Data         (* the set of values that can be produced and/or consumed    *)

ASSUME /\ Producers # {}                      (* at least one producer *)
       /\ Consumers # {}                      (* at least one consumer *)
       /\ Producers \intersect Consumers = {} (* no thread is both consumer and producer *)
       /\ BufferSize > 0                      (* buffer capacity is at least 1 *)
       /\ Data # {}                           (* the type of data is nonenpty *)                       

-------------------------------------------------
VARIABLE buffer, (* the buffer, as a sequence of objects *)
         waitSet (* the wait set, as a set of threads *)

Participants == Producers \union Consumers

RunningThreads == Participants \ waitSet

TypeInv == /\ buffer \in Seq(Data)
           /\ Len(buffer) \in (0..BufferSize)
           /\ waitSet \subseteq Participants
           
Notify == IF waitSet # {} THEN (\E x \in waitSet : waitSet' = waitSet \ {x} ) ELSE UNCHANGED waitSet
          
NotifyAll == waitSet' = {}

Wait(t) == waitSet' = waitSet \union {t}

----------------------------------------------------

Init ==  buffer = << >> /\ waitSet = {}

Put(t,m) == /\ IF Len(buffer) < BufferSize THEN /\ buffer' = Append(buffer, m) /\ Notify ELSE /\ Wait(t) /\ UNCHANGED buffer
            /\ Print(<<"Put", t, buffer, waitSet>>,TRUE) 
            
Get(t) == /\ IF Len(buffer) > 0 THEN /\ buffer' = Tail(buffer) /\ Notify ELSE /\ Wait(t) /\ UNCHANGED buffer
          /\ Print(<<"GET", t, buffer, waitSet>>,TRUE) 
          
Next == \E t \in RunningThreads : \/ (t \in Producers /\ \E m \in Data : Put(t, m)) \/ (t \in Consumers  /\ Get(t))
                                  
Prog == Init /\ [][Next]_<<buffer, waitSet>>

-------------------------------------------------------

NoDeadlock == [](RunningThreads # {} )

THEOREM Prog => []TypeInv /\ NoDeadlock
=============================================================================
\* Modification History
\* Last modified Wed Dec 18 21:19:28 SGT 2013 by RedX
\* Created Fri Dec 13 16:25:35 SGT 2013 by RedX
