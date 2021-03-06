%%% Copyright 2014 Garrett Smith <g@rre.tt>
%%%
%%% Licensed under the Apache License, Version 2.0 (the "License");
%%% you may not use this file except in compliance with the License.
%%% You may obtain a copy of the License at
%%% 
%%%     http://www.apache.org/licenses/LICENSE-2.0
%%% 
%%% Unless required by applicable law or agreed to in writing, software
%%% distributed under the License is distributed on an "AS IS" BASIS,
%%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%% See the License for the specific language governing permissions and
%%% limitations under the License.

-module(lpad_session).

-export([init/1, root/0, abs_path/1]).

init(Root) ->
    application:set_env(lpad, session_root, Root).

root() -> env(session_root).

env(Name) ->
    case application:get_env(lpad, Name) of
        {ok, Val} -> Val;
        undefined -> error({session_env, Name})
    end.

abs_path(Rel) ->
    filename:join(root(), Rel).
