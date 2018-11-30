## check_extraneous(...)
> This function verifies wether the given attribute is extraneous *(left/right)* in the given function dependency set or not
### Input Variables
1. **attr**: Attribute to check extraneous for
2. **row**: Row number of the function dependency under consideration
3. **data**: Complete set of function dependency
4. **side**: Specifies the side of an attribute i.e. left/right(*determinant/dependent*)
### Approach
There are two cases for checking the extraneous attributes <br/>
**Left**
1. Remove the attribute from the LHS of the dependency specified *(to be verified for extraneous attribute)*
2. Find the closure of this new LHS defined using the updated functional dependencies
3. If resultant closure contains the RHS of the dependency specified, return *success*
**Right**
1. Remove the attribute from the RHS of the dependency specified *(to be verified for extraneous attribute)*
2. Update the above dependency in the set of functional dependencies
3. Find the closure of this new LHS defined using the updated functional dependencies
4. If resultant closure contains the RHS of the dependency specified, return *success*

## minimal_cover(...)
> This function returns the minimal cover of the given function dependency set
### Input Variables
1. **data**: Complete set of functional dependency
### Approach
1. Use *combine_fd* function to combine the function dependency with common LHS in the original set
2. Consider each functional dependency in the given set and perform the following steps:
	- Check for extraneous attributes on the LHS, if found remove them.
	- Check for extraneous attributes on the RHS, if found remove them.
	- Combine the similar functional dependencies (if any)
	- Execute the loop until number of functional dependencies is less than the control variable