@rem ------------------- batch setting -------------------
@rem setting batch file
@rem ref : https://www.tutorialspoint.com/batch_script/batch_script_if_else_statement.htm
@rem ref : https://poychang.github.io/note-batch/

@echo off
setlocal
setlocal enabledelayedexpansion

@rem ------------------- execute script -------------------

docker rm -f bind9
docker run -d ^
    -p 53:53 ^
    -p 53:53/udp ^
    -e TZ=UTC ^
    -v %cd%\bind\named.conf.options:/etc/bind/named.conf.options ^
    -v %cd%\bind\named.conf.local:/etc/bind/named.conf.local ^
    -v %cd%\bind\zone.d:/etc/bind/zone.d ^
    --name bind9 ^
    ubuntu/bind9
