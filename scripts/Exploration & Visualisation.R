## exploration

pacman::p_load(dplyr, ggplot2, lubridate, cropcircles, ggimage, showtext, gridExtra)

asylum <- policy_df("https://www.publicwhip.org.uk/policy.php?id=1087") |>
  mutate(description = "Make seeking asylum more difficult",
         policy_type = "Home Office",
         political_leaning = "Right")
lgbtq_rights <- policy_df("https://www.publicwhip.org.uk/policy.php?id=826") |>
  mutate(description = "More rights for LGBTQ+ people",
         policy_type = "Social",
         political_leaning = "Left")
nhs_funding <- policy_df("https://www.publicwhip.org.uk/policy.php?id=6771") |>
  mutate(description = "Increase funding to NHS",
         policy_type = "Health",
         political_leaning = "Left")
transparency <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6667")
climate_action <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6667")
welfare_cuts <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6670") |>
  mutate(description = "Decrease Welfare Benefits",
         policy_type = "Health",
         political_leaning = "Right")
school_autonomy <- policy_df("https://www.publicwhip.org.uk//policy.php?id=1074") |>
  mutate(description = "Less regulation of schools",
         policy_type = "Education",
         political_leaning = "Right")
union_regulation <- policy_df("https://www.publicwhip.org.uk/policy.php?id=6731") |>
  mutate(description = "More regulation of trade unions",
         policy_type = "Business",
         political_leaning = "Right")
pro_liberty <- policy_df("https://www.publicwhip.org.uk/policy.php?id=825")
raise_minwage <- policy_df("https://www.publicwhip.org.uk/policy.php?id=6729") |>
  mutate(description = "Increase minimum wage",
         policy_type = "Business",
         political_leaning = "Left")
disability_benefits <- policy_df("https://www.publicwhip.org.uk/policy.php?id=6673") |>
  mutate(description = "Increase disability benefits",
         policy_type = "Health",
         political_leaning = "Left")
against_abortion <- policy_df("https://www.publicwhip.org.uk//policy.php?id=813") |>
  mutate(description = "Reducing rights to abortion & euthanasia",
         policy_type = "Health",
         political_leaning = "Right")
increase_vat <- policy_df("https://www.publicwhip.org.uk//policy.php?id=1110") |>
  mutate(description = "Increase VAT rate",
         policy_type = "Taxes",
         political_leaning = "Left")
increase_tax_free_allowance <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6680") |>
  mutate(description = "Increase income tax tax-free allowance",
         policy_type = "Taxes",
         political_leaning = "Left")
reduce_corportation_tax <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6679") |>
  mutate(description = "Reduce the rate of corporation tax",
         policy_type = "Taxes",
         political_leaning = "Right")
alcohol_tax <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6694") |>
  mutate(description = "Higher taxes on alcholic drinks",
         policy_type = "Taxes",
         political_leaning = "Left")
bank_tax <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6733") |>
  mutate(description = "Higher taxes on banks",
         policy_type = "Taxes",
         political_leaning = "Left")
human_rights <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6703") |>
  mutate(description = "Increase human rights & equality",
         policy_type = "Social",
         political_leaning = "Left")
higher_rate_tax <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6681") |>
  mutate(description = "Increase higher rate of income tax",
         policy_type = "Taxes",
         political_leaning = "Left")
restrict_protest <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6915") |>
  mutate(description = "More restrictions to freedom to protest",
         policy_type = "Home Office",
         political_leaning = "Right")
lower_fuel_tax <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6693") |>
  mutate(description = "Lower taxes on fuel",
         policy_type = "Taxes",
         political_leaning = "Right")
domestic_abuse_action <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6776") |>
  mutate(description = "Action to stop domestic abuse",
         policy_type = "Social",
         political_leaning = "Left")
bankers_bonus <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6685") |>
  mutate(description = "In favour of a banker's bonus tax",
         policy_type = "Taxes",
         political_leaning = "Left")
energy_prices <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6689") |>
  mutate(description = "Regulation to make energy prices more affordable",
         policy_type = "Business",
         political_leaning = "Left")
corp_tax_incentives <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6691") |>
  mutate(description = "In favour of tax incentives for corporations investing in assets",
         policy_type = "Business",
         political_leaning = "Right")
protest_parliament <- policy_df("https://www.publicwhip.org.uk//policy.php?id=629") |>
  mutate(description = "Unrestricted protest near parliament",
         policy_type = "Social",
         political_leaning = "Left")
against_gambling <- policy_df("https://www.publicwhip.org.uk//policy.php?id=810") |>
  mutate(description = "Against permissiveness of gambling",
         policy_type = "Social",
         political_leaning = "Left")
legal_aid <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6707") |>
  mutate(description = "Restrict scope of legal aid",
         policy_type = "Social",
         political_leaning = "Right")
tax_avoidance <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6690") |>
  mutate(description = "Measures to reduce tax avoidance",
         policy_type = "Taxes",
         political_leaning = "Left")
smoking_ban <- policy_df("https://www.publicwhip.org.uk//policy.php?id=811") |>
  mutate(description = "In favour of banning smoking",
         policy_type = "Health",
         political_leaning = "Left")
free_uni <- policy_df("https://www.publicwhip.org.uk//policy.php?id=367") |>
  mutate(description = "In favour of free university",
         policy_type = "Education",
         political_leaning = "Left")
anti_trans <- policy_df("https://www.publicwhip.org.uk//policy.php?id=809") |>
  mutate(description = "Against recognition of trans identities",
         policy_type = "Social",
         political_leaning = "Right")
environ_protect <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6766") |>
  mutate(description = "Keep environmental protection on withdrawal from EU",
         policy_type = "Home Office",
         political_leaning = "Left")
capital_gains <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6754") |>
  mutate(description = "Reduce capital gains tax",
         policy_type = "Taxes",
         political_leaning = "Right")
aviation_emission <- policy_df("https://www.publicwhip.org.uk//policy.php?id=794") |>
  mutate(description = "For limiting aviation pollution",
         policy_type = "Business",
         political_leaning = "Left")
occup_pensions <- policy_df("https://www.publicwhip.org.uk//policy.php?id=1109") |>
  mutate(description = "Promoting occupational pensions",
         policy_type = "Business",
         political_leaning = "Left")
drug_legalise <- policy_df("https://www.publicwhip.org.uk//policy.php?id=812") |>
  mutate(description = "Against the legalisation of drugs",
         policy_type = "Health",
         political_leaning = "Right")
welfare_rise <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6674") |>
  mutate(description = "Believe welfare benefits should rise with prices",
         policy_type = "Health",
         political_leaning = "Left")
inheritance_tax <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6730") |>
  mutate(description = "Increase inheritance tax and/or lower tax-free limits",
         policy_type = "Taxes",
         political_leaning = "Left")
royal_mail <- policy_df("https://www.publicwhip.org.uk//policy.php?id=1105") |>
  mutate(description = "Believe Royal Mail should be privatised",
         policy_type = "Business",
         political_leaning = "Right")
letting_agent <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6718") |>
  mutate(description = "Stronger regulation of letting agent fees",
         policy_type = "Business",
         political_leaning = "Left")
rail_fares <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6692") |>
  mutate(description = "Believe rail fares should be lower",
         policy_type = "Transport",
         political_leaning = "Left")
mansion_tax <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6711") |>
  mutate(description = "In favour of a mansion tax",
         policy_type = "Taxes",
         political_leaning = "Left")
strike_rights <- policy_df("https://www.publicwhip.org.uk//policy.php?id=1021") |>
  mutate(description = "Believe workers have the right to strike",
         policy_type = "Social",
         political_leaning = "Left")



devolution_scotland <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6709")
devolution_wales <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6708")
devolution_ni <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6789")
local_councils <- policy_df("https://www.publicwhip.org.uk//policy.php?id=6695")

policy_viz(disability_benefits)
policy_viz(local_councils)
policy_viz(devolution_scotland)
policy_viz(devolution_wales)
policy_viz(devolution_ni)

policy_viz(welfare_cuts)
policy_viz(climate_action)
policy_viz(asylum)
policy_viz(lgbtq_rights)
policy_viz(nhs_funding)
policy_viz(transparency)
policy_viz(school_autonomy)
policy_viz(union_regulation)
policy_viz(pro_liberty)
policy_viz(raise_minwage)

policy_viz <- function(asylum) {
  
  asylum_perc <- asylum |>
    mutate(Date = year(Date)) |>
    group_by(Date, Party, Vote) |>
    summarise(`Vote Count` = sum(`Vote Count`, na.rm = TRUE)) |>
    pivot_wider(id_cols = c(Date, Party), names_from = "Vote", values_from = "Vote Count") |>
    rowwise() |>
    mutate(sum = sum(FOR, OTHER, na.rm = TRUE)) |>
    mutate(FOR = ifelse(is.na(OTHER), 0, FOR / sum),
           OTHER = ifelse(is.nan(OTHER), 1, OTHER / sum)) |>
    select(-sum) |>
    pivot_longer(cols = c(FOR, OTHER), names_to = "Vote", values_to = "Vote Perc") |>
    mutate(Vote = factor(Vote, levels = c("OTHER", "FOR")))
  
  pal <- c("FOR" = "#24853e",
           "OTHER" = "grey")
  
  asylum_perc |>
    ggplot(aes(x = Date, y = `Vote Perc`)) +
    geom_col(aes(fill = Vote), width = 1) +
    scale_fill_manual(values = pal) +
    facet_wrap(~Party, ncol = 1) +
    theme_minimal() +
    theme()
  
}


all_pol <- rbind(asylum, lgbtq_rights, nhs_funding, welfare_cuts, union_regulation, raise_minwage, disability_benefits, school_autonomy,
                 against_abortion, increase_vat, increase_tax_free_allowance, reduce_corportation_tax, alcohol_tax, bank_tax, human_rights,
                 restrict_protest, lower_fuel_tax, domestic_abuse_action, bankers_bonus, energy_prices, corp_tax_incentives, protest_parliament,
                 against_gambling, legal_aid, tax_avoidance, smoking_ban, free_uni, anti_trans, environ_protect, capital_gains, aviation_emission,
                 occup_pensions, drug_legalise, welfare_rise, inheritance_tax, royal_mail, letting_agent, rail_fares, mansion_tax, strike_rights)

write.csv(all_pol, "all_labelled_policies.csv", row.names = FALSE)

all_pol_perc <- all_pol |>
  mutate(Date = year(Date)) |>
  group_by(Date, Party, Vote, political_leaning) |>
  summarise(`Vote Count` = sum(`Vote Count`, na.rm = TRUE)) |>
  pivot_wider(id_cols = c(Date, Party, political_leaning), names_from = "Vote", values_from = "Vote Count") |>
  rowwise() |>
  mutate(sum = sum(FOR, OTHER, na.rm = TRUE)) |>
  mutate(FOR = ifelse(is.na(OTHER), 0, FOR / sum),
         OTHER = ifelse(is.nan(OTHER), 1, OTHER / sum)) |>
  select(-sum) |>
  pivot_longer(cols = c(FOR, OTHER), names_to = "Vote", values_to = "Vote Perc") |>
  mutate(Vote = factor(Vote, levels = c("OTHER", "FOR"))) |>
  complete(Date, Party, political_leaning, Vote) |>
  mutate(`Vote Perc` = ifelse(is.na(`Vote Perc`), 0, `Vote Perc`))



pal <- c("Con" = "#0087DC",
         "Lab" = "#E4003B")

lab_elections <- data.frame(Date = c(1997, 2001, 2005, 2010, 2015, 2017, 2019),
                        label = c("General Election", "General Election", "General Election", "General Election", "General Election", "General Election", "General Election"),
                        vote_perc = c("43.2%", "40.7%", "35.2%", "29.0%", "30.4%", "40.0%", "32.1%"),
                        vote_seats = c("418 seats", "412 seats", "403 seats", "258 seats", "232 seats", "262 seats", "202 seats"),
                        seat_no = c(418, 412, 403, 258, 232, 262, 202))

lab_leaders <- data.frame(Party = c("Lab", "Lab", "Lab", "Lab", "Lab"),
                      start_date = c("1997", "2007", "2010", "2015", "2020"),
                      end_date = c("2007", "2010", "2015", "2020", "2022"),
                      pm = c("Y", "Y", "N", "N", "N"),
                      leader_name = c("Blair", "Brown", "Miliband", "Corbyn", "Starmer"),
                      leader_img = c("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Tony_Blair_2010_%28cropped%29.jpg/220px-Tony_Blair_2010_%28cropped%29.jpg",
                                     "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Gordon_Brown_%282008%29.jpg/220px-Gordon_Brown_%282008%29.jpg",
                                     "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Official_portrait_of_Rt_Hon_Edward_Miliband_MP_crop_2.jpg/220px-Official_portrait_of_Rt_Hon_Edward_Miliband_MP_crop_2.jpg",
                                     "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Official_portrait_of_Jeremy_Corbyn_crop_2%2C_2020.jpg/220px-Official_portrait_of_Jeremy_Corbyn_crop_2%2C_2020.jpg",
                                     "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Official_portrait_of_Keir_Starmer.jpg/220px-Official_portrait_of_Keir_Starmer.jpg")) |>
  mutate(leader_img = circle_crop(leader_img))

font_add_google("Roboto", "Roboto")
showtext_auto()

lab_pm_pal <- c("Y" = "#E4003B",
                "N" = "#636363")

## Labour

lab_plot <- all_pol_perc |>
  filter(Vote == "FOR") |>
  filter(Party %in% c("Lab")) |>
  mutate(`Vote Perc` = ifelse(political_leaning == "Left", `Vote Perc` * -1, `Vote Perc`)) |>
  ggplot(aes(x = Date, y = `Vote Perc`)) +
  geom_area(aes(fill = Party, group = political_leaning), position = position_stack(), alpha = 0.6, fill = "#E4003B") +
  geom_segment(data = lab_elections, aes(x = Date, xend = Date, y = -1.05, yend = 1), color = "#636363") +
  geom_text(data = lab_elections, aes(x = Date, y = -1.1, label = label), vjust = 0, size = 3, hjust = 1, color = "#636363", nudge_x = 0.2) +
  geom_text(data = lab_elections, aes(x = Date, y = -1.1, label = paste0(vote_seats, " | ", vote_perc)), vjust = 0, size = 3, hjust = 1, color = "#E4003B", nudge_x = -0.2) +
  geom_segment(data = lab_leaders, aes(x = as.numeric(start_date) + 0.05, xend = as.numeric(end_date) - 0.05, y = -1.75, yend = -1.75, color = pm), alpha = 0.6, size = 2) +
  geom_image(data = lab_leaders, aes(image = leader_img, x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = -1.75), size = 0.05) +
  geom_text(data = lab_leaders, aes(label = toupper(leader_name), x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = -1.75), size = 3, nudge_y = -0.2, angle = 90, color = "#636363", fontface = "bold") +
  geom_segment(aes(y = 0, yend = 0, x = 1997, xend = 2022), color = "white") +
  geom_rect(data = lab_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.05, xmax = as.numeric(end_date) - 0.05, ymin = -1.75, ymax = -1), alpha = 0.08) +
  geom_rect(data = lab_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.05, xmax = as.numeric(end_date) - 0.05, ymin = -1, ymax = 1), alpha = 0.12) +
  geom_point(data = lab_elections, aes(size = seat_no, y = -1.05), color = "#E4003B") +
  annotate(geom = "text", x = 2022.5, y = -0.05, label = "Vote % for policies indicating\na shift to the political LEFT", hjust = 1, vjust = 0, size = 3.5, lineheight = 0.8) +
  annotate(geom = "text", x = 2022.5, y = 0.05, label = "Vote % for policies indicating\na shift to the political RIGHT", hjust = 0, vjust = 0, size = 3.5, lineheight = 0.8) +
  scale_y_continuous(labels = c("", "100%", "0%", "100%")) +
  labs(title = "Labour") +
  scale_x_continuous(n.breaks = 24) +
  scale_fill_manual(values = lab_pm_pal) +
  scale_size(range = c(2.02, 4.18)) +
  scale_color_manual(values = lab_pm_pal) +
  coord_flip(ylim = c(-2, 1)) +
  theme_minimal() +
  theme(legend.position = "none",
        axis.title = element_blank(),
        plot.title = element_text(face = "bold", hjust = 0.95, color = "#E4003B", size = 25),
        text = element_text(family = "Roboto"),
        panel.grid.minor.y = element_blank())

## Conservative

con_elections <- data.frame(Date = c(1997, 2001, 2005, 2010, 2015, 2017, 2019),
                            label = c("General Election", "General Election", "General Election", "General Election", "General Election", "General Election", "General Election"),
                            vote_perc = c("30.7%", "31.7%", "32.4%", "36.1%", "36.8%", "42.3%", "43.6%"),
                            vote_seats = c("165 seats", "166 seats", "198 seats", "306 seats", "330 seats", "317 seats", "365 seats"),
                            seat_no = c(165, 166, 198, 306, 330, 317, 365))

con_leaders <- data.frame(Party = c("Con", "Con", "Con", "Con", "Con", "Con", "Con", "Con"),
                          start_date = c("1997", "2001", "2003", "2005", "2010", "2016", "2019", "2022"),
                          end_date = c("2001", "2003", "2005", "2010", "2016", "2019", "2022", "2022"),
                          pm = c("N", "N", "N", "N", "Y", "Y", "Y", "Y"),
                          leader_name = c("Hague", "Duncan\nSmith", "Howard", "Cameron", "Cameron", "May", "Johnson", "Truss"),
                          leader_img = c("https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/William_Hague_Foreign_Secretary_%282010%29.jpg/444px-William_Hague_Foreign_Secretary_%282010%29.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Official_portrait_of_Sir_Iain_Duncan_Smith_MP_crop_2.jpg/450px-Official_portrait_of_Sir_Iain_Duncan_Smith_MP_crop_2.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Official_portrait_of_Lord_Howard_of_Lympne_crop_2.jpg/450px-Official_portrait_of_Lord_Howard_of_Lympne_crop_2.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/David_Cameron_official.jpg/450px-David_Cameron_official.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/David_Cameron_official.jpg/450px-David_Cameron_official.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Theresa_May_%282016%29_%28cropped%29.jpg/429px-Theresa_May_%282016%29_%28cropped%29.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Boris_Johnson_official_portrait_%28cropped%29.jpg/426px-Boris_Johnson_official_portrait_%28cropped%29.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Liz_Truss_official_portrait.jpg/220px-Liz_Truss_official_portrait.jpg")) |>
  mutate(leader_img = circle_crop(leader_img))

con_pm_pal <- c("Y" = "#0087DC",
                "N" = "#636363")

## Conservative

con_plot <- all_pol_perc |>
  filter(Vote == "FOR") |>
  filter(Party %in% c("Con")) |>
  mutate(`Vote Perc` = ifelse(political_leaning == "Left", `Vote Perc` * -1, `Vote Perc`)) |>
  mutate(`Vote Perc` = ifelse(Date == 1997 & political_leaning == "Left", -0.0000000000001, `Vote Perc`)) |> # plots incorrectly if first value is zero :(
  ggplot(aes(x = Date, y = `Vote Perc`)) +
  geom_area(aes(group = political_leaning), position = position_stack(), alpha = 0.6, fill = "#0087DC") +
  geom_segment(data = con_elections, aes(x = Date, xend = Date, y = -1, yend = 1.05), color = "#636363") +
  geom_text(data = con_elections, aes(x = Date, y = 1.1, label = label), vjust = 0, size = 3, hjust = 0, color = "#636363", nudge_x = 0.2) +
  geom_text(data = con_elections, aes(x = Date, y = 1.1, label = paste0(vote_seats, " | ", vote_perc)), vjust = 0, size = 3, hjust = 0, color = "#0087DC", nudge_x = -0.2) +
  geom_segment(data = con_leaders, aes(x = as.numeric(start_date) + 0.05, xend = as.numeric(end_date) - 0.05, y = 1.75, yend = 1.75, color = pm), alpha = 0.6, size = 2) +
  geom_image(data = con_leaders, aes(image = leader_img, x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = 1.75), size = 0.05) +
  geom_text(data = con_leaders, aes(label = toupper(leader_name), x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = 1.75), size = 3, nudge_y = 0.2, angle = 270, color = "#636363", fontface = "bold", lineheight = 0.8) +
  geom_segment(aes(y = 0, yend = 0, x = 1997, xend = 2022), color = "white") +
  geom_rect(data = con_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.05, xmax = as.numeric(end_date) - 0.05, ymin = 1.75, ymax = 1), alpha = 0.08) +
  geom_rect(data = con_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.05, xmax = as.numeric(end_date) - 0.05, ymin = -1, ymax = 1), alpha = 0.12) +
  geom_point(data = con_elections, aes(size = seat_no, y = 1.05), color = "#0087DC") +
  annotate(geom = "text", x = 2022.5, y = -0.05, label = "Vote % for policies indicating\na shift to the political LEFT", hjust = 1, vjust = 0, size = 3.5, lineheight = 0.8) +
  annotate(geom = "text", x = 2022.5, y = 0.05, label = "Vote % for policies indicating\na shift to the political RIGHT", hjust = 0, vjust = 0, size = 3.5, lineheight = 0.8) +
  scale_y_continuous(labels = c("100%", "0%", "100%", "")) +
  scale_size(range = c(1.65, 3.65)) +
  labs(title = "Conservative") +
  scale_x_continuous(n.breaks = 24) +
  scale_fill_manual(values = con_pm_pal) +
  scale_color_manual(values = con_pm_pal) +
  coord_flip(ylim = c(-1, 2)) +
  theme_minimal() +
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.text.y = element_blank(),
        plot.title = element_text(face = "bold", hjust = 0.05, color = "#0087DC", size = 25),
        text = element_text(family = "Roboto"),
        panel.grid.minor.y = element_blank())


both <- grid.arrange(lab_plot, con_plot, nrow = 1)

## plot by policy type

all_pol_perc <- all_pol |>
  mutate(Date = year(Date)) |>
  group_by(Date, Party, Vote, political_leaning, policy_type) |>
  summarise(`Vote Count` = sum(`Vote Count`, na.rm = TRUE)) |>
  pivot_wider(id_cols = c(Date, Party, political_leaning, policy_type), names_from = "Vote", values_from = "Vote Count") |>
  rowwise() |>
  mutate(sum = sum(FOR, OTHER, na.rm = TRUE)) |>
  mutate(FOR = ifelse(is.na(OTHER), 0, FOR / sum),
         OTHER = ifelse(is.nan(OTHER), 1, OTHER / sum)) |>
  select(-sum) |>
  pivot_longer(cols = c(FOR, OTHER), names_to = "Vote", values_to = "Vote Perc") |>
  mutate(Vote = factor(Vote, levels = c("OTHER", "FOR"))) |>
  complete(Date, Party, political_leaning, policy_type, Vote) |>
  mutate(`Vote Perc` = ifelse(is.na(`Vote Perc`), 0, `Vote Perc`))



pal <- c("Con" = "#0087DC",
         "Lab" = "#E4003B")

all_pol_perc |>
  filter(Vote == "FOR") |>
  filter(Party %in% c("Con")) |>
  mutate(`Vote Perc` = ifelse(political_leaning == "Left", `Vote Perc` * -1, `Vote Perc`)) |>
  ggplot(aes(x = Date, y = `Vote Perc`)) +
  geom_area(aes(fill = policy_type, group = political_leaning), position = position_stack()) +
  geom_segment(aes(y = 0, yend = 0, x = 1997, xend = 2022), color = "white") +
  #scale_fill_manual(values = pal) +
  coord_flip() +
  facet_wrap(~policy_type, nrow = 1) +
  theme_minimal() +
  theme()

all_pol_perc |>
  filter(political_leaning == "Left",
         Party == "Lab") |>
  rename(vote_perc = `Vote Perc`) |>
  group_by(Party, Vote, Date) |>
  summarise(vote_perc = sum(vote_perc)) |>
  streamgraph("Vote", "vote_perc", "Date")
