*here we bring data into the fasom structure from a gdx file created by GDXmerge
*%1 is the name of the array to fill data into
*%2 is the array set dependency
* files to merge is name of files that were merged in the GDX
alias(universalset1,universalset2,*);
*merge in a parameter

$ifthen not settype %1
         parameter %1m(files_to_merge,%2)  merged version of array %1;
         execute_load '%wheretopassfiles%merged.gdx' ,%1m=%1;
         loop(files_to_merge,
            loop((%2)$%1m(files_to_merge,%2),
                   %1(%2)=%1m(files_to_merge,%2)));
$endif
*merge in a set

$ifthen settype %1
         set %1m(files_to_merge,%2)  merged version of array %1;
         execute_load '%wheretopassfiles%merged.gdx' ,%1m=%1;
         loop(files_to_merge,
            loop((%2)$%1m(files_to_merge,%2),
                   %1(%2)=yes));
$endif



*display %1;
