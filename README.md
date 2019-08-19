# Creating a user with MDS Variables. 
This script assists with user creation using variables in MDS.

## Instructions
1. Clone down this repo
2. Make sure to setup a user in the MDS configuration. This user will be performing functions to create the other user so will need admin access.
3. Look through the script and update the following lines
  - Line 15: Update with the password for your initial admin account mentioned in step 2.
  - Line 25: Update with the default password you want to have assigned to your variable-created user.
  - Line 28: Update with the shortname of the account you created with MDS (non-variable). Remove this line if you want to keep this account post-setup.
  - Line 29: Same as step 28.
4. Set your MDS varible prompts in MDS. They will want to be something like: 
  - mds_var1 - What is the user's first name?
  - mds_var2 - What is the user's last name/surname?

**Note**: The echo functions don't currently do anything as MDS doesn't provide feedback during script runs. This is for future functionality in the script. Same with the line that reads the serial number.
