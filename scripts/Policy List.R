## list of policies

policy_url <- "https://www.publicwhip.org.uk/policies.php"

policies <- policy_url |>
  read_html() |>
  html_nodes("table.mps") |>
  html_table()

policies <- policies[[1]] |>
  row_to_names(1)

policy_links <- policy_url |>
  read_html() |>
  html_nodes("table.mps") |>
  html_elements("a") |>
  html_attr("href")

policies$PolicyLink <- paste0(root, policy_links)


list_of_policies <- policies |>
  rename(votes_number = `Votes (unedited)`) |>
  mutate(votes_number = as.numeric(str_squish(gsub(" \\(.*\\)", "", votes_number)))) |> 
  arrange(-votes_number)
