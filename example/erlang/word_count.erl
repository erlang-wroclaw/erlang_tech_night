-module(word_count).
-compile(export_all).

start() ->
    start("../data").

start(DataPath) ->
    {ok, List} = file:list_dir(DataPath),
    CountPerFile = lists:map(fun(Filename) ->
                worker_init(Filename, DataPath)
        end, List),
    Sum = lists:sum(CountPerFile),
    io:format("Sum: ~p~n", [Sum]).

worker_init(Filename, Path) ->
    File = filename:join(Path, Filename),
    {ok, Port} = file:open(File, read),
    worker(Port, File, 0).

worker_terminate(Port, Count) ->
    file:close(Port),
    Count.

worker(Port, File, Count) ->
    case file:read_line(Port) of
        {ok, Line} ->
            WordsWithNewlines = string:tokens(Line, " "),
            Words = lists:filter(fun(Word) ->
                        Word /= "\n"
                end, WordsWithNewlines),
            N = erlang:length(Words),
            worker(Port, File, Count+N);
        eof ->
            io:format("~p: ~p~n", [File, Count]),
            worker_terminate(Port, Count)
    end.

