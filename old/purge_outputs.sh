OUTPUT_FILER=/lustre/${USER}/outputs/
echo Purging files in $OUTPUT_FILER
find $OUTPUT_FILER -type f | xargs rm