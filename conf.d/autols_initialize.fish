# fish uses lazy-loading for functions, meaning fish function will not be sourced
# before the first time they are used.
# the call to _autols here, is simply to ensure that it is automatically sourced
# whenever a fish shell process is started.
_autols
