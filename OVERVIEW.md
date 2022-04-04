# Here is a brief look at hardware setup for my future reference

Running these on `Acer-Laptop`, `Main-PC`, `RPI-4`, & `RPI-Zero` with `Arch`, `Arch`, `Manjaro-ARM64` & `Pi-OS` respectively
Most of these should work on x86_64 and ARMv8 too

`Acer-Laptop` has all storage attached and runs anything that needs access to media
`Main-PC` not dedicated for server. My main PC
`RPI-4` runs anything without direct media access
`RPI-Zero` runs adguard, ddns and other critical ops


## Storage scenario

`Acer-Laptop` has three partitions which are mounted under `/drives` in individual directories. /drives is then mounted at `/mnt/merger` by mergerfs.

`RPI-4` has one partition mounted `/mnt/Pi_Storage`.

`Main-PC` mounts smb shares from these to `/lab`