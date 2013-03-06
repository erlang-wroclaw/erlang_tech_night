-module(word_count_short).
-compile(export_all).

start() ->
    start("../data").

start(DataPath) ->
    {ok, List} = file:list_dir(DataPath),
    io:format("(pid:~p) Start counting. Number of files ~p~n", [self(), erlang:length(List)]),
    CountPerFile = rpc:pmap({?MODULE, worker}, [DataPath], List),
    io:format("(pid:~p) Sum: ~p~n", [self(), lists:sum(CountPerFile)]).

worker(Filename, Path) ->
    File = filename:join(Path, Filename),
    {ok, Data} = file:read_file(File),
    Count = erlang:length([ Word || Word <- binary:split(Data, [<<"\n">>, <<" ">>], [global]), Word /= <<>> ]),
    io:format("(pid:~p) ~p: ~p~n", [self(), File, Count]),
    Count.

