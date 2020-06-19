# PAS instance

Utilizing the PAS-install this Dockerfile creates an actual instance.
Just the instance, it does nothing from an application point of view.
This is the basis for creating applicative containers.

# health

This container has the health feature of 12.2 turned on.
probe http://...:8899/health
