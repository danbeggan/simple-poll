## Stage 1 User CRUD

User (Devise)

* Firstname
* Lastname
* Email
* Password

## Stage 2 Poll CRUD

Poll

* String: Name (question)
* User id
* [questions] :validates at least 2

Answer

* String: Name (answer)
* Poll id
* Int: Votes

## Stage 3 Answer Validations

Answer

* Drop: Votes
* [voterecords]

VoteRecord

* Poll id :validates (Poll id & Voter id) can have max 2
* Answer id
* IP

Poll Controller: Session cookie checks whether user has voted in current session

## Stage 4
