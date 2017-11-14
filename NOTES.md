Poll Show

Q. What time is it?

[Ans. 1] [Ans. 2]

  | |
  | |    | |
-------------
 Ans. 1 Ans.2


Poll.. 1-Many ..Answers
Answer.. 1-Many ..Votes


Session check - store Poll id in cookie
IP check -


Poll - Answer - Vote IP1
                  Vote IP2
                  Vote IP3
       Answer - Vote IP1


Poll - Answer - Vote IP1
       Answer - Vote IP3

---- DB ----

Poll - Title
     - id
     - User
     - ? From
     - ? To
     - [answers]

Answer - Title
       - id
       - [voterecords]

VoteRecord - Answer id
           - IP
