alias Gotham.Repo
alias Gotham.Export.Clock;

# user's 1 journey

Repo.insert! %Clock{
    status: true,
    time: ~N[2019-12-26 09:30:00],
    user_id: 1
}

Repo.insert! %Clock{
    status: false,
    time: "2019-12-26 12:30:00",
    user_id: 1
}

Repo.insert! %Clock{
    status: true,
    time: "2019-12-26 13:30:00",
    user_id: 1
}

Repo.insert! %Clock{
    status: false,
    time: "2019-12-26 17:30:00",
    user_id: 1
}

# user's 2 journey

Repo.insert! %Clock{
    status: true,
    time: "2019-12-26 09:30:00",
    user_id: 2
}

Repo.insert! %Clock{
    status: false,
    time: "2019-12-26 12:30:00",
    user_id: 2
}

Repo.insert! %Clock{
    status: true,
    time: "2019-12-26 13:30:00",
    user_id: 2
}

Repo.insert! %Clock{
    status: false,
    time: "2019-12-26 17:30:00",
    user_id: 2
}