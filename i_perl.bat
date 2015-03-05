rem set file_src=DateTime-Format-Strptime-1.56.tar.gz
REM set file_src=DateTime-TimeZone-1.83.tar.gz
REM set file_src=DBD-DB2-1.85.tar.gz
set file_src=%1
call ptar -x -f %file_src%
perl -e "if ($ARGV[0]=~ /(.*)([.]tar[.]gz|[.]tgz)$/){print $1}" %file_src% > tmpFile
set /p dir_name= < tmpFile
del tmpFile
echo %dir_name%
cd %dir_name%
perl Makefile.PL
dmake
dmake test
dmake install
cd ..
