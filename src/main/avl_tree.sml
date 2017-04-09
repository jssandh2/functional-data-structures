structure AVL_TREE =
struct

datatype Avl_Tree = NIL | CONS of Avl_Tree * int * Avl_Tree

val empty = NIL

fun balance tree =
  tree

fun insertHelper elem tree =
  case tree of
      CONS(NIL,x,NIL) => if elem < x then CONS(CONS(NIL,elem,NIL),x,NIL) else CONS(NIL,x,CONS(NIL,elem,NIL))
   |  CONS(NIL,x,r) => if elem < x then CONS(CONS(NIL,elem,NIL),x,r) else CONS(NIL,x,(insertHelper elem r))
   |  CONS(l,x,NIL) => if elem < x then CONS((insertHelper elem l),x,NIL) else CONS(l,x,CONS(NIL,elem,NIL))
   |  CONS(l,x,r) => if elem < x then CONS((insertHelper elem l),x,r) else CONS(l,x,(insertHelper elem r))
   |  NIL => CONS(NIL,elem,NIL) 

fun insert elem tree = (* The insert function is self-balancing, and returns a balanced tree *)
  let
      val unbalancedTree = insertHelper elem tree
  in
      balance unbalancedTree
  end

fun makeTreeHelper listInt tree = (* Makes a tree, given a List 'listInt' and a previous Avl_Tree, by rooting the first element of the List if Avl_Tree is empty, else inserting in the order presented in the List *)
  case listInt of
      [] => tree
   |  x::xs' => makeTreeHelper xs' (insert x tree)

fun makeTree listInt =
  makeTreeHelper listInt NIL

fun getIntList currRoot =
  case currRoot of
      CONS(l,x,r) => [x]
   |  NIL => []

fun addNodeToQueue queueNodes currRoot =
    case currRoot of
	CONS(NIL,x,NIL) => queueNodes
     |  CONS(NIL,x,r) => queueNodes @ [r]
     |  CONS(l,x,NIL) => queueNodes @ [l]
     |  CONS(l,x,r) => queueNodes @ [l,r]
     |  _ => queueNodes 
		 
fun getTreeByLevelHelper listInt queueNodes =
  if null queueNodes
  then listInt
  else
      let
	  val currRoot = hd queueNodes
	  val currIntList = getIntList currRoot 
	  val newQueueNodes = addNodeToQueue (tl queueNodes) currRoot
      in
	  getTreeByLevelHelper (listInt @ currIntList) newQueueNodes
      end 
  
fun levelOrderTraversal tree =
  getTreeByLevelHelper [] [tree] 
end 
       
