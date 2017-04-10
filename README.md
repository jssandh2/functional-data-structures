# Functional Data Structures
* A repository containing implementations of Data Structures in a _Functional_ Format, using the [SML](https://en.wikipedia.org/wiki/Standard_ML) language.

## LINK TO REPOSITORY
* [functional-data-structures](https://github.com/jssandh2/functional-data-structures)

## INSTALLATION
### Clone Repo
* Make sure you have _git_ installed. If not (and you're using a _Mac_) :
```bash 
brew install git 
```
* You can install _Homebrew_ by pasting this on your Terminal :
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
* For Linux systems, instructions to install _git_ are [here](https://git-scm.com/book/en/v1/Getting-Started-Installing-Git)
* Go to the desired directory in your computer where you'd like to install the repo :
```bash
cd /my/directory/
```
* Just clone the repo as follows :
```bash
git clone git@github.com:jssandh2/Functional_Data_Structures.git
```
## USAGE
### Memory Allocation
* The Data Structures use _immutability_ (mostly) **and** _pattern matching_.
* The Recursion is optimized to be _tail recursive_ (wherever possible). However, for very large ADTs (such as _Trees_), it is possible to run into a **Stack Overflow** exception. The easiest way to get rid of this is to increase the memory allocated to the Stack in your IDE/Environment.

### Types
* Each Data Structure is implemented as a :
```sml
structure DATA_STRUCTURE
```
* Within each of these _structures_, is a _datatype_ which contains the Algebraic expression for that Data Structure as a _Type_.
```sml
datatype Data_Structure = BASE_CASE | CONS of a1 * a2 * .. * aN
```

### Repo Structure
* The repo is structured so that the code can be found in : _src/main/data_structure.sml_
* To use any of the Data-Structures, simply give the path to the cloned repo and import into your _sml_ file :
```sml
use "~/path/to/repo/src/main/data_structure.sml";
```
* Once the _use_ statement is inserted, one can use the _functions_ in the _structure_ as follows :
```sml
val a = DATA_STRUCTURE.functionOne args1 .. argsN
```

### Currying
* **Almost** every function in the _structure_ for a given Data Structure is _curried_. 
* This is made convenient because of SML syntax, providing syntactic sugar for Currying as :
```sml
fun areThreeReversed x = fn y => fn z => x >=y andalso y >= z (* This function has type : int -> int -> int -> bool *)
```
* The above has syntactic sugar as :
```sml
fun areThreeReversed x y z = x >= y andalso y >= z (* This functiona also has type : int -> int -> int -> bool *)
```
* However, the above 2 are **not** equivalent to this :
```sml
fun areThreeReversed (x,y,z) = x >= y andalso y >= z (* This function has type : (int*int*int) -> bool *)
```
* A good example of the power of this is partial-application, which can be used as follows :
```sml
val listIntOne = [1,2,3,4,5,6]
val listIntTwo = [4,2,9,6,8,7,1]
val avlTreeOne = AVL_TREE.makeTree listIntOne
val avlTreeTwo = AVL_TREE.makeTree listIntTwo
val insertTen = AVL_TREE.insert 10 (* Returns a function of type : Avl_Tree -> Avl_Tree *)
val avlTreeOne' = insertTen avlTreeOne (* Returns an Avl_Tree *)
val avlTreeTwo' = insertTen avlTreeTwo (* Returns an Avl_Tree *)
```

## DATA STRUCTURES
### Data Structures (Currently Supported)
* The Data Structures currently avaiable are :
    * Stack : Details regarding _Time_ and _Space_ Complexity of the supported functions will be up soon.
    * AVL Tree : Details regarding _Time_ and _Space_ Complexity of the supported functions will be up soon.
    
### Data Structures (In Progress)
* The Data Structures that are being (currently) completed and updated are :
    * AVL Tree

### Data Structures (Planned)
* The Data Structures that the repo shall provide support for in the future include :
    * Red-Black Tree
    * Queue
    * Binomial Heap
    * Treap
    * Finite Dictionary 
    * Graph
