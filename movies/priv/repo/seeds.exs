# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Movies.Repo.insert!(%Movies.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Movies.Repo.insert!(%Movies.Catalogue.Video{title: "Video1", description: "Description1"})
Movies.Repo.insert!(%Movies.Catalogue.Video{title: "Video2", description: "Description2"})
Movies.Repo.insert!(%Movies.Catalogue.Video{title: "Video3", description: "Description3"})
Movies.Repo.insert!(%Movies.Catalogue.Video{title: "Video4", description: "Description4"})
