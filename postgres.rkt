#lang racket/base
(require racket/contract/base
         db/base
         openssl)
(provide/contract
 [postgresql-connect
           (->* (#:user "postgres"
            #:database "antash")
            #:socket "/var/run/postgresql"
           #:port 5432)]
[postgresql-guess-socket-path
(-> path-string?)])
     
(query-exec pgc
            "select * from websitedaddy")
