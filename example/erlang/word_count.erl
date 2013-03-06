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
    {ok, Line} = file:read_line(Port),
    io:format("~p~n", [Line]),
    print_line(Port).

