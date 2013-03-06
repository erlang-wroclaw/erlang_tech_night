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
    print_line(Port),
    file:close(Port),
    ok.

print_line(Port) ->
    case file:read_line(Port) of
        {ok, Line} ->
            WordsWithNewlines = string:tokens(Line, " "),
            Words = lists:filter(fun(Word) ->
                        Word /= "\n"
                end, WordsWithNewlines),
            N = erlang:length(Words),
            io:format("~p~n", [N]),
            print_line(Port);
        eof ->
            ok
    end.

