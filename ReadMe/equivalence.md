## equivalence(...)
> This function checks wether the two given FD's are equivalent or not
### Input Variables
1. **fd1**: Set of 1st function dependency
2. **fd2**: Set of 2nd function dependency
### Approach
1. Find the list of attributes of the RHS of both *fd1* and *fd2*
2. If they are same check whether *fd1* is a subset of *fd2* and vice-versa *(using a check_subset() defined in function.r)*
	- If Yes, fd1 and fd2 are equivalent
	- If No, fd1 and fd2 are not equivalent