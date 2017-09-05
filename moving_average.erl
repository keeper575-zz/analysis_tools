-module(moving_average).

-export(
    [
    get_MA/1
    ]).

get_avg(List) ->
    lists:sum(List)/length(List).

%% avg moving over a week

get_moving_avg_and_next_list(List) ->
    {[get_avg(List)], tl(List)}.

get_MA(List) ->
    get_MA([], List).

get_MA(MAList, List) ->
MovingAvg =
    case get_moving_avg_and_next_list(List) of
        {MA, []} -> lists:append(MAList, MA);
	{MA, NewList} -> get_MA(lists:append(MAList, MA), NewList)
    end,
MovingAvg.
