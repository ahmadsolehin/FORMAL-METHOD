---------------------------- MODULE TLA_Project ----------------------------

EXTENDS Naturals, Sequences, TLC

CONSTANTS Producers,        (* the non-empty set of producers                           *)
          Consumers,        (* the non-empty set of consumers                           *)
          BufferSize,       (* the maximum number of messages in the bounded buffer     *)
          DataSet           (* the set of values that can be produced or consumed       *)

ASSUME /\ Producers # {}                      (* assume there is at least one producer *)
       /\ Consumers # {}                      (* assume there is at least one consumer *)
       /\ Producers \intersect Consumers = {} (* assume there is no thread with both consumer and producer *)
       /\ BufferSize > 0                      (* assume the buffer size must be at least 1 *)
       /\ DataSet # {}                        (* assume the data set is non-empty *)                       

---------------------------------------------------------------------------------------------------------------------------------------------

VARIABLE buffer,            (* the buffer as a sequence of objects *)
         WaitingThreads     (* the WaitingThreads as a set of threads *)
         
AllThreads == Producers \union Consumers   

RunningThreads == AllThreads \ WaitingThreads          (* set difference between all threads and the threads currently in Waiting Thread *)

TypeInvariant == /\ buffer \in Seq(DataSet)
                 /\ Len(buffer) \in (0..BufferSize)
                 /\ WaitingThreads \subseteq AllThreads
                 
Notify == IF WaitingThreads # {} THEN (\E x \in WaitingThreads : WaitingThreads' = WaitingThreads \ {x} )  (* selects a thread in the watingThreads, if any, to resume execution *)
          ELSE UNCHANGED WaitingThreads    (* no effect if the waitingThreads are empty.  *)
          
Wait(thread) == WaitingThreads' = WaitingThreads \union {thread}   (* place the thread into the WaitingThreads *)

-----------------------------------------------------------------------------------------------------------------------------------------------

Init == /\ buffer = << >>           (* initialize buffer = empty *)
        /\ WaitingThreads = {}      (* initialize watingThreads = empty *)

Put(thread,data) == /\ IF Len(buffer) < BufferSize THEN /\ buffer' = Append(buffer, data) /\ Notify 
                       ELSE /\ Wait(thread) /\ UNCHANGED buffer
                    /\ Print(<<"Put",thread, buffer, WaitingThreads>>,TRUE)
          
            
Get(thread) == /\ IF Len(buffer) > 0 THEN /\ buffer' = Tail(buffer) /\ Notify 
                  ELSE /\ Wait(thread) /\ UNCHANGED buffer
               /\ Print(<<"Get",thread, buffer, WaitingThreads>>,TRUE)
          
          
Next == \E thread \in RunningThreads : \/ (thread \in Producers /\ \E data \in DataSet : Put(thread, data)) 
                                       \/ (thread \in Consumers  /\ Get(thread))
                                       
Spec == Init /\ [][Next]_<<buffer, WaitingThreads>>

-------------------------------------------------------

NoDeadlock == [](RunningThreads # {} )    (* there is always at least one thread running *)

THEOREM Spec => []TypeInvariant /\ NoDeadlock

=============================================================================
\* Modification History
\* Last modified Thu Dec 19 18:07:44 SGT 2013 by RedX
\* Created Wed Dec 18 21:24:10 SGT 2013 by RedX
