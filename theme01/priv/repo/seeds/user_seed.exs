alias Gotham.Repo
alias Gotham.Export.User

Repo.insert! %User{
    username: "John Doe",
    email: "john.doe@gmail.com"
}

Repo.insert! %User{
    username: "Jane Doe",
    email: "jane.doe@gmail.com"
}

Repo.insert! %User{
    username: "Bill Clinton",
    email: "bill.clinton@gmail.com"
}

Repo.insert! %User{
    username: "Elton John",
    email: "elton.john@gmail.com"
}