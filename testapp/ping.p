define output parameter cOut as character no-undo.

message "PING CALLED".

cOut = "reply: " + iso-date(now).

