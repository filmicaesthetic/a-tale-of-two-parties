## Using TheyWorkForYou and PublicWhip data to try to 
## measure how parties vote on particular policies, how it's changed over time,
## and where they land on the political spectrum

pacman::p_load(rvest, dplyr, httr, janitor, stringr, tidyr)

# PublicWhip root url
root <- "https://www.publicwhip.org.uk/"

## Higher funding for the NHS - policy on PublicWhip
url <- "https://www.publicwhip.org.uk/policy.php?id=6771"

## get list of votes on this policy

policy_votes <- function(url, root) {
  
  votes <- url |>
    read_html() |>
    html_nodes("table.votes") |>
    html_table()
  
  votes <- votes[[1]] |>
    row_to_names(1)
  
  links <- url |>
    read_html() |>
    html_nodes("table.votes") |>
    html_elements("a") |>
    html_attr("href")
  
  votes$PolicyLink <- paste0(root, links)
  
  votes <- votes |>
    mutate(`Policy vote` = str_squish(gsub(" \\(.*\\)", "", toupper(`Policy vote`))),
           Date = as.Date(str_squish(Date), "%e %b %Y")) |>
    filter(grepl("MINORITY|MAJORITY", `Policy vote`) == TRUE,
           House == "Commons")
  
  return(votes)
  
}

party_vote <- function(url, policy_vote) {
  
  vote_count <- url |>
    read_html() |>
    html_nodes("table") |>
    html_table()
  
  vote_count <- vote_count[[1]] |>
    row_to_names(1)
  
  # remove Aye + No from column header
  colnames(vote_count) <- gsub(" \\(.*\\)", "", colnames(vote_count))
  
  vote_count <- vote_count |>
    filter(Party %in% c("Lab", "Con", "LDem", "SNP", "PC", "Green")) |>
    mutate(Minority = as.numeric(str_squish(gsub(" \\(.*\\)", "", toupper(Minority)))),
           Majority = as.numeric(str_squish(gsub(" \\(.*\\)", "", toupper(Majority)))),
           Both = as.numeric(str_squish(gsub(" \\(.*\\)", "", toupper(Both))))) |>
    rowwise() |>
    mutate(Abstain = round(((Majority + Minority + Both) / as.numeric(gsub("%", "", Turnout))) * (100 - as.numeric(gsub("%", "", Turnout))) )) |>
    select(-Turnout) |>
    pivot_longer(cols = -Party, names_to = "Vote", values_to = "Vote Count") |>
    mutate(Vote = toupper(Vote),
           Vote = ifelse(policy_vote == Vote, "FOR", "OTHER"))
  
  return(vote_count)
  
}

policy_df <- function(url, root = "https://www.publicwhip.org.uk/") {
  
  nested <- policy_votes(url, root) |>
    rowwise() |>
    mutate(party_vote_df = list(party_vote(PolicyLink, `Policy vote`)))
  
  policy_vote_df <- nested |>
    unnest(party_vote_df)
  
  return(policy_vote_df)
  
}

