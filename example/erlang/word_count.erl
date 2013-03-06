-module(word_count).
-compile(export_all).

start() ->
    start("../data").

start(DataPath) ->
    From = self(),
    {ok, List} = file:list_dir(DataPath),
    io:format("(pid:~p) Start counting. Number of files ~p~n", [self(), erlang:length(List)]),
    Pids = lists:map(fun(Filename) ->
                spawn(fun() -> worker_init(From, Filename, DataPath) end)
        end, List),
    loop(erlang:length(Pids), 0).

loop(0, WordCount) ->
    io:format("(pid:~p) Sum: ~p~n", [self(), WordCount]);
loop(Workers, WordCount) ->
    receive
        {count, N} -> loop(Workers-1, WordCount+N)
    end.

worker_init(From, Filename, Path) ->
    File = filename:join(Path, Filename),
    {ok, Port} = file:open(File, read),
    worker(From, Port, File, 0).

worker_terminate(From, Port, File, Count) ->
    file:close(Port),
    io:format("(pid:~p) ~p: ~p~n", [self(), File, Count]),
    From ! {count, Count}.

worker(From, Port, File, Count) ->
    case file:read_line(Port) of
        {ok, Line} ->
            WordsWithNewlines = string:tokens(Line, " "),
            Words = lists:filter(fun(Word) ->
                        Word /= "\n"
                end, WordsWithNewlines),
            N = erlang:length(Words),
            worker(From, Port, File, Count+N);
        eof ->
            worker_terminate(From, Port, File, Count)
    end.

