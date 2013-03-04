-module(counter).
-compile(export_all).

start(Path) ->
    {ok, spawn(fun() -> init(Path) end)}.

init(Path) ->
    {ok, FileList} = file:list_dir(Path),
    Acc = [ counter_worker:start_link(self(), Path, File) ||
        File <- FileList ],
    loop( erlang:length(Acc), 0 ).

loop(ProcessCount, N) when ProcessCount > 0 ->
    receive
        {count, Count} ->
            loop(ProcessCount-1, N+Count)
    end;
loop(_, N) ->
    io:format("Sum: ~p~n", [N]).

