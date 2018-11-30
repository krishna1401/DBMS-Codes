## remove_char(...)
> This function replaces the characters in the sequence with blank if it matches the specified characters.
### Input Variables
1. **x**: Character sequence on which the replacement need to be made
2. **element**: Characters need to be replaced
### Approach
1. Split the character sequence *x* character wise.
2. Compare each characters in *element* with the single character and replace *by blank* if found

## search_attr(...)
> This function check whether the given string set exsist in another set or not (may not be sequential)
### Input Variables
1. **x**: String set to be checked for occurance
2. **data**: String data to be searched
### Approach
1. Split the complete closure character sequence *data* character wise
2. Now, for each character in *x* check whether it is present in *data* 
	- If Yes, remove the character and check for other characters
	- If No, exit and return failure 

## check_subset(...)
> This function check wether one functional dependencies set is the subset of another functional dependencies set or not
### Input Variables
1. **superset**: Superset functional dependencies
2. **subset**: Subset functional dependencies
### Approach
1. Given a set of functional dependency in *subset* for each dependency *say i* do the following
2. Find closure of LHS of dependency *i* using the functional dependency of *superset*
3. Chech whether RHS of the dependency *i* is present in the closure
	- If Yes, check for other dependencies
	- If No, exit and return failure

## combine_fd(...)
> This function is used to combine functional dependencies's in a set with common Left Hand Side attributes.
### Input Variables
1. **data**: Complete Set of functional dependencies
### Approach
Given the set of functional dependencies for each dependency *say i* do the following:
1. Find other dependency that have the same LHS as that of *i*
2. Combine the RHS of all such dependency
3. Remove duplicate attributes from the combined RHS
4. Create a new dependency using the LHS of *i* and the new created combined RHS
5. Remove all the similar dependency found in *Step 1*
6. Add the new dependency created in *Step 4* to the list of dependency

## find_attr(...)
> This function returns the list of all attributes with the complete functional dependencies set
### Input Variables
1. **input**: Complete set of input functional dependencies
### Approach
1. Combine all the attributes of LHS and RHS of all the functional dependency in the given set
2. Remove duplicate attributes from the combined result