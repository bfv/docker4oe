define variable has as handle no-undo.
define variable cOut as character no-undo.

create server has.
has:connect("-URL http://localhost:5555/app1/apsv").

run ping.p on server has (output cOut).

message cOut view-as alert-box.

