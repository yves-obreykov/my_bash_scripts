# my_bash_scripts

A collection of simple Bash scripts I’ve created for fun and learning.

## timer
A simple shell timer.

## start
Opens a terminal with two Vim tabs: one for a “To Do” list and one for a “Done” list, to help manage tasks.

## update
A simple script that updates and upgrades apt installations.

---

## t460_pop_kernel
**Deprecated:** This script was used to handle suspend issues on newer kernels for the ThinkPad T460s.  
It allows easy kernel downgrades after updates, but is no longer recommended.  
The suspend problem can instead be handled by disabling  
`GRUB_CMDLINE_LINUX_DEFAULT="quiet splash intel_iommu=off"` in the GRUB configuration file.
