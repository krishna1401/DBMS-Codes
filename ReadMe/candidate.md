## keys(...)
> This function finds the possible candidate/super key for the given function dependencies set.
### Input Variables
1. **attr**: Complete list of all possible attributes
2. **data**: Complete set of function dependencies's
3. **type**: Specifies wether to find candidate key or super key (*Default: Candidate Key*)
### Approach
1. Define *all_keys* as set of all possible candidate or super keys
2. Let minimal key *mkey* for the set of functional dependencies be the complete set of attributes *attr* in it.
3. Remove all the RHS attributes from the minimal key *(mkey)*
4. Find Closure for this minimal key *mkey*. If the resultant closure is equal to *attr*, exit and return the minimal key as candidate key. If not, proceed forward.
5. Find the remaining set of attribute *(after removal of minimal key from attr)* 
6. Find all possible combination of this remaining set of 1,2,3... attributes at a time
7. For each of the combinations do the following
	- Append the combination to the minimal key
	- Find the closure using this new set of attributes
	- If resultant closure is equal to the complete set of attributes, append the new set to the list of all keys
	- Break the loop based on 4 conditions a)If candidate key is required and we have got one key; b)If all combinations are considered; c)If number of attributes for permutation becomes greater than the actual attributes in the set; d)All attributes are used in the combination
8. Depending on the type return the key i.e.
	- If type='c', return only the first key
	- If type='s', return all the keys