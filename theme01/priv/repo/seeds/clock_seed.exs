alias Gotham.Repo
alias Gotham.Export.Clock

Repo.insert! %Clock{
    time: DateTime.truncate(DateTime.utc_now, :second),
    status: true,
    user_id: 1
}

Repo.insert! %Clock{
    time: DateTime.truncate(DateTime.utc_now, :second),
    status: false,
    user_id: 2
}

Repo.insert! %Clock{
    time: DateTime.truncate(DateTime.utc_now, :second),
    status: true,
    user_id: 3
}