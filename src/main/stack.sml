structure STACK =
struct

datatype Stack = NIL | CONS of int * Stack

val empty = NIL (* The empty Stack *)
		
fun makeStack listInt = (* Given a List of integers 'listInt', return a Stack *) 
  case listInt of
      [] => NIL
   |  x::xs' => CONS(x,makeStack xs')
		    
fun isEmpty stack = (* Given a Stack 's', returns true if empty, false otherwise *)
  case stack of
      NIL => true
   |  _ => false  

fun cons (x, s) = CONS(x,s) (* Given an (int,Stack) pair '(x,s)', returns a new Stack with 'x' as head *) 
		      
fun head stack = (* Given a Stack 'stack', returns 0 if empty, and the int at the head otherwise *)
  case stack of
      NIL => 0
   |  CONS(x,s) => x
		       
fun tail stack = (* Given a Stack 'stack', returns the Stack as if the first element had been popped *)
  case stack of
      NIL => NIL
   |  CONS(x,s) =>  s

fun addTwoLists xs ys = (* Given 2 Lists 'xs' and 'ys', returns a Stack that is made by merging them *)
  case xs of
      [] => makeStack ys
   |  x::xs' => CONS(x,addTwoLists xs' ys) 						  

fun addTwoStacks s1 s2 = (* Given 2 Stacks 's1' and 's2', returns a Stack that merges them *)
  case s1 of
      NIL => s2
   |  CONS(x,s1') => CONS(x,addTwoStacks s1' s2)
			 
end

