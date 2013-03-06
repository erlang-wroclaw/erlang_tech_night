-module(word_count).
-compile(export_all).

start() ->
    start("../data").

start(DataPath) ->
    [ File | _ ] = list_data_dir(DataPath),
    file(File, DataPath).

list_data_dir(DataPath) ->
    {ok, List} = file:list_dir(DataPath),
    List.

file(Filename, Path) ->
    File = filename:join(Path, Filename),
    {ok, Port} = file:open(File, read),
    Count = count(Port, 0),
    io:format("~p: ~p~n", [File, Count]),
    file:close(Port),
    ok.

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

