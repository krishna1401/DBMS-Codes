## super_dependency(...)
> This function check whether the LHS of a functional dependency is a super key or not
### Input Variables
1. **lhs**: Left Hand Side (*determinant*) of a particular functional dependency
2. **super**: Super Keys of the complete set of functional dependency
### Approach
1. Consider all the possible Super Keys
2. For each super key, do the following:
	- Split the LHS of the functional dependency character-wise
	- Replace each character in the considered super key with blank if found in the LHS
	- If the resultant key becomes empty, LHS is a super key
	- If Not, consider other super key

## update_fd(...)
> This function updates i.e. defines the relation set number in the original functional dependency depending on the changes made.
### Input Variable
1. **original**: Original set of Functional Dependencies
2. **updates**: Updated set of Functional Dependencies
### Approach
1. For each of the updated functional dependency, do the following:
2. For each of the original functional dependency, do the following:
	- If the functional dependency matches, update the decomposition set number in original with the corresponding number in decomposed functional dependency

## decompose_relation(...)
> This function decomposes the set of functional dependency voilating the NF Rules
### Input Variables
1. **input**: Set of functional dependencies that need to be decomposed
2. **tables**: Total number of decomposed functional dependency set in the input
### Approach
1. Select the set of functional dependency that may voilate the NF rule *(dependencies in the last set number)*
2. Do the following, until all the functional dependencies of *Step 1* are not considered:
	- Find the FD's participated (update) in the closure of the LHS of the first functional dependency present in the set
	- Remove these functional dependency from the set created in Step 1
	- Find position of above FD's (update) in the original set of input
	- Update the decomposed relation set number for these functional dependency in the original set of input

## bcnf(...)
> This function returns the decomposed functional dependency into Boyce Codd Normal Form
### Input Variables
1. **input**: Original set of functional dependency
### Approach
For all the set of decomposed relations in the input, perform the following operations:
1. Extract a single set of decomposed relation *(temp)* from the original input *(initially this set will be equal to the complete input set)*
2. Find all the attributes in this decomposed set *(temp)* along with all the super keys of the set
3. Check LHS of all the functional dependency in *temp* for super key dependency
	- If not dependent, assign a different decomposed set number to this dependency
4. If any one of the functional dependency in *temp* is not super key dependent, do:
	- Decompose the functional dependency set (temp)
	- Update the number of decomposed relations
5. If the functional dependency set *(temp)* is updated, update the original set
6. If all functional dependency is super key dependent, *break the loop* 