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


Poll - Question - Vote IP1
                  Vote IP2
                  Vote IP3
       Question - Vote IP1


Poll - Question - Vote IP1
       Question - Vote IP3

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
           - Voter id

Voter - IP
      - id
