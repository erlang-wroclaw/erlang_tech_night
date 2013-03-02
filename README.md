    mdpress -s cypress -v -a slides.md
 .net: use `--path=../../../../data` for launch from debug

demo program:
 1. get directory as parameter
 2. for each file in the directory:
 2.1 split into words
 2.2 count words
 3. display count per file

reference output:
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\1ws4910.txt: 18368  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\1ws5110.txt: 27141  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\adrwn10.txt: 25654  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\1onwr10.txt: 111716  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\brtns10.txt: 15872  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\crito10.txt: 9216  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\fldct10.txt: 15155  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\cndrl10.txt: 21930  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\mcrst11.txt: 66960  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\advsh12.txt: 110063  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\msprs10.txt: 15110  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\mhyde10.txt: 80426  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\dyssy10.txt: 133987  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\mwktm10a.txt: 64138  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\grexp10a.txt: 196090  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\phado10.txt: 46793  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\potww10.txt: 24996  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\ppikg10.txt: 18606  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\pplgy10.txt: 18962  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\pandp12.txt: 130048  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\otoos11.txt: 159694  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\prppr11.txt: 75906  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\pprty10.txt: 163387  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\secad10.txt: 84156  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\sinex10.txt: 8272  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\resur10.txt: 179358  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\sprvr11.txt: 34229  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\spzar10.txt: 122189  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\uspis10.txt: 135490  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\vanya10.txt: 19420  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\tmbn210.txt: 30767  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\tprnc10.txt: 52805  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\vccty10.txt: 59712  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\wwrld10.txt: 34043  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\janey11.txt: 203718  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\ylwlp10.txt: 8709  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\vstil10.txt: 94445  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\pgbev10.txt: 244942  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\2donq10.txt: 388752  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\milnd11.txt: 201363  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\2drvb10.txt: 448844  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\1drvb10.txt: 467351  
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\nkrnn11.txt: 371870  
 
 > all words in all files: 4740653

erlang_tech_night
=================
layout:

Cyryl:
* Erlang the movie
* history of Erlang
 * why the need for another language

* thinking functional
 * benefits of knowing functional language for OOP programmers

* sample OOP program

Fabian:
* rewriting OOP example in Erlang
* Q&A

