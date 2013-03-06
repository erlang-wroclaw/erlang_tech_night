-module(word_count).
-compile(export_all).

list_data_dir(DataPath) ->
    {ok, List} = file:list_dir(DataPath),
    List.

