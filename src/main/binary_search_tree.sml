structure BINARY_SEARCH_TREE =
struct

datatype Binary_Search_Tree = NIL | CONS of Binary_Search_Tree * int * Binary_Search_Tree

val empty = NIL

(* The insertHelper function is a helper function for insert *)
(* DO NOT CALL DIRECTLY *)
fun insertHelper elem tree =
  case tree of
      CONS(NIL,x,NIL) => if elem < x then CONS(CONS(NIL,elem,NIL),x,NIL) else CONS(NIL,x,CONS(NIL,elem,NIL))
   |  CONS(NIL,x,r) => if elem < x then CONS(CONS(NIL,elem,NIL),x,r) else CONS(NIL,x,(insertHelper elem r))
   |  CONS(l,x,NIL) => if elem < x then CONS((insertHelper elem l),x,NIL) else CONS(l,x,CONS(NIL,elem,NIL))
   |  CONS(l,x,r) => if elem < x then CONS((insertHelper elem l),x,r) else CONS(l,x,(insertHelper elem r))
   |  NIL => CONS(NIL,elem,NIL)

(* The insert function simply inserts the element into the Binary Search Tree *)
fun insert elem tree =
  insertHelper elem tree

(* The makeTreeHelper function is a helper function for makeTree *)
(* Makes a tree, given a List 'listInt' and a previous Binary_Search_Tree, by
* rooting the first element of the List if the Binary_Search__Tree is empty, else inserting in the order presented in the List *)
(* DO NOT CALL DIRECTLY *)
fun makeTreeHelper listInt tree =
  case listInt of
      [] => tree
   |  x::xs' => makeTreeHelper xs' (insert x tree)

(* Makes a Binary_Search_Tree from a List Int *)
fun makeTree listInt =
  makeTreeHelper listInt NIL

(* Returns the data of the root of a Binary_Search_Tree *)
fun getIntList currRoot =
  case currRoot of
      CONS(l,x,r) => [x]
   |  NIL => []

(* Helper Function for doing a Level-Order-Traversal *)
(* DO NOT CALL DIRECTLY *)
fun addNodeToQueue queueNodes currRoot =
  case currRoot of
      CONS(NIL,x,NIL) => queueNodes
   |  CONS(NIL,x,r) => queueNodes @ [r]
   |  CONS(l,x,NIL) => queueNodes @ [l]
   |  CONS(l,x,r) => queueNodes @ [l,r]
   |  _ => queueNodes

(* Helper Function for doing a Level-Order-Traversal *)
(* DO NOT CALL DIRECTLY *)
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

(* Function that returns the Level-Order-Traversal of a Binary_Search_Tree as a List Int *)
fun levelOrderTraversal tree =
  getTreeByLevelHelper [] [tree]
end
