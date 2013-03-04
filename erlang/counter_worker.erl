-module(counter_worker).
-compile(export_all).

start_link(From, Path, Filename) ->
    spawn(fun() -> init(From, Path, Filename) end).

init(From, Path, Filename) ->
    File = filename:join(Path, Filename),
    {ok, Port} = file:open(File, read),
    count_world(From, File, Port, 0).

terminate(From, File, Port, Count) ->
    file:close(Port),
    io:format("~p: ~p~n", [File, Count]),
    From ! {count, Count}.

count_world(From, File, Port, N) ->
    case file:read_line(Port) of
        {ok, Line} ->
            Words = string:tokens(Line, " "),
            Count = erlang:length(Words),
            count_world(From, File, Port, N+Count);
        eof ->
            terminate(From, File, Port, N)
    end.

