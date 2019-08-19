serial="$(ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}' | tr -d \")"
lastname=$mds_var2
firstname=$mds_var1
firstnamelower="$(tr '[:upper:]' '[:lower:]'<<<${firstname})"
lastnamelower="$(tr '[:upper:]' '[:lower:]'<<<${lastname})"
seriallower="$(tr '[:upper:]' '[:lower:]'<<<${serial})"
shortname="${firstnamelower}.${lastnamelower}"
fullname=${firstname}" "${lastname}

echo "First name is "${firstname}
echo "Last name is "${lastname}
echo "Full Name is "${fullname}
echo "Shortname is "${shortname}
echo "Creating account "${shortname}
echo "admin" | sudo -S dscl . -create /Users/${shortname} UserShell /bin/bash
echo "Giving "${shortname}" the real name "${fullname}"."
sudo dscl . -create /Users/${shortname} RealName "${fullname}"
echo "Assigning UniqueID 1003"
sudo dscl . -create /Users/${shortname} UniqueID 1003
echo "Adding to PrimaryGroup 1000"
sudo dscl . -create /Users/${shortname} PrimaryGroupID 1000
echo "Creating home directory "${shortname}
sudo dscl . -create /Users/${shortname} NFSHomeDirectory /Users/${shortname}
echo "Setting password "
sudo dscl . -passwd /Users/${shortname} PASSWORD
echo "Giving admin rights"
sudo dscl . -append /Groups/admin GroupMembership ${shortname}
sudo dscl . delete /Users/setup
sudo rm -rf /Users/setup
