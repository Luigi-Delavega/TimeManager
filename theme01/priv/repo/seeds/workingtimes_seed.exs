alias Gotham.Repo
alias Gotham.Export.Workingtimes

Repo.insert! %Workingtimes{
    start: "monday",
    end: "monday",
    user_id: 1
}

Repo.insert! %Workingtimes{
    start: "monday",
    end: "monday",
    user_id: 2
}

Repo.insert! %Workingtimes{
    start: "monday",
    end: "monday",
    user_id: 2
}