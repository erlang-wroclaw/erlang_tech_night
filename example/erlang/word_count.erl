-module(word_count).
-compile(export_all).

start() ->
    start("../data").

start(DataPath) ->
    {ok, List} = file:list_dir(DataPath),
    CountPerFile = lists:map(fun(Filename) ->
                file(Filename, DataPath)
        end, List),
    Sum = lists:sum(CountPerFile),
    io:format("Sum: ~p~n", [Sum]).

file(Filename, Path) ->
    File = filename:join(Path, Filename),
    {ok, Port} = file:open(File, read),
    Count = count(Port, 0),
    file:close(Port),
    io:format("~p: ~p~n", [File, Count]),
    Count.

count(Port, Count) ->
    case file:read_line(Port) of
        {ok, Line} ->
            WordsWithNewlines = string:tokens(Line, " "),
            Words = lists:filter(fun(Word) ->
                        Word /= "\n"
                end, WordsWithNewlines),
            N = erlang:length(Words),
            count(Port, Count+N);
        eof ->
            Count
    end.

