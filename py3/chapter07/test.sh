#!/bin/bash

function runtest () {
    echo '===========' "$@" '==========='
    python "$@" &
    sleep 1
    python client.py localhost
    kill %1
    wait %1 2>/dev/null || true
    #kill $(lsof | grep 'TCP.*1060' | awk '{print$2}')
}

runtest server_simple.py localhost
runtest server_threaded.py localhost
runtest server_async.py localhost
runtest server_legacy1.py localhost
runtest server_legacy2.py localhost
runtest server_asyncio1.py localhost
runtest server_asyncio2.py localhost