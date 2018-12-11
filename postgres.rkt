#lang racket

(require db)

(define user "antash")
(define database "racket_test")
(define password "pass")

;; connect to postgres
(define pgc (postgresql-connect  #:user user
				 #:database database
				 #:password password))

;; create a test table
(query-exec pgc "create table if not exists test (id serial primary key, name varchar(256))")


;; add entries to table
(query-exec pgc
            "insert into test (name) values($1)"
            "bittu")


;; fetch entries from table
(query-rows pgc "select * from test")