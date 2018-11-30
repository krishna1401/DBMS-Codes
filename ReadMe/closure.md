## find_closure(...)
> This script is user to find the closure of the functional dependencies set
### Input Variables
1. **closure**: Attribute whose closure need to be calculated
2. **data**: Complete set of functional dependencies's
### Approach
1. Find the dependency whose LHS is present in the closure *(at start closure contains the attribute whose closure need to be calculated)*
2. Add this dependency to the possible_rows *(stores the list of dependency used in the calculation of closure)*
3. Add the RHS of this dependency to the current closure
4. Add this dependency to delete set *(used to remove this dependency later from the complete data set)*
5. Remove the *delete set* from the original functional depedency set if not empty
6. Check whether the original set is empty or not
	- If Empty, exit the loop and return the closure as wee as the possible set
	- If Not, again search for the dependency with LHS in the newly calculate closure 