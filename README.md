# erlang_tech_night

### Cyryl

* Erlang the movie
* history of Erlang
 * why the need for another language

* thinking functional
 * benefits of knowing functional language for OOP programmers

* sample OOP program

### Fabian
* rewriting OOP example in Erlang
* Q&A

# slides

    cd slides
    mdpress -s cypress slides.md

# demo

## .net

 use `--path=../../../../data` for launch from debug

demo program:
 1. get directory as parameter
 2. for each file in the directory:
 2.1 split into words
 2.2 count words
 3. display count per file

reference output:
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\1ws4910.txt: 18368
 > --CUT--
 > C:\Users\cplotnicki\dev\erlang_tech_night\data\nkrnn11.txt: 371870

 > all words in all files: 4740653

## erlang

### console #1

    $ cd example/erlang/
    $ git checkout <milestone-sha1> -- word_count.erl

### console #2

    $ cd example/erlang/
    $ erl
    Erlang R15B01 (erts-5.9.1) [source] [smp:4:4] [async-threads:0] [hipe] [kernel-poll:false]

    Eshell V5.9.1  (abort with ^G)
    1> c(word_count). % after each milestone
    {ok,word_count}
    2> word_count:start(). % except #1 and #2
    ...

### milestones

1. `acbed19a91dee10c1cea96c3db9f213dc42f1302` empty module example
2. `287999f941c405442a0e2fe58bedc4c15ba1c307` list data dir
3. `ba1ec3912c3afe3b23a98498cc140d4d862703bd` print lines + exception
4. `b5726365630e4ad9b2f0fcb57b9c382a60ba54cf` proper eof handling
5. `df9282c164f5a9157ce242e2f8e4a41118be9053` count words for each line
6. `51dd3682a0094ce80672624d641931a4ff5878ac` sum
7. `6c88cdf951013159e6be24badcd36ef4d3060cb2` run on all files + sum
8. `1145054318d0385674603b1093c72c93c1c92070` prepare for processes
9. `78a74306b141214eb0c884f3f3b144aeccde18ec` processes!!!!

