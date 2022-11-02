
# load packages
pacman::p_load(dplyr, ggplot2, lubridate, cropcircles, ggimage, showtext, gridExtra, tidyr, magick, zoo, stringr)

# load classified policy vote data
all_pol <- read.csv("all_labelled_policies.csv")

# font setup
font_add_google("Manrope", "Manrope")
showtext_auto()
gfont <- "Manrope"

all_pol_perc <- all_pol |>
  mutate(Date = year(Date) + (0.25 * (4 - quarter(Date)))) |>
  group_by(Date, Party, Vote, political_leaning) |>
  summarise(`Vote Count` = sum(`Vote.Count`, na.rm = TRUE)) |>
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

# specify party colours
con_col <- "#0087DC"
lab_col <- "#E4003B"

# create palette for plot
all_pm_pal <- c("L" = lab_col,
                "C" = con_col,
                "CL" = "#65b1e0",
                "N" = "#636363",
                "X" = "#d1d1d1")
#
# Labour data
#

# https://en.wikipedia.org/wiki/Labour_Party_(UK)

# data related to Labour's performance in general elections
lab_elections <- data.frame(Date = c("1997-05-01", "2001-06-07", "2005-05-05", "2010-05-06", "2015-05-07", "2017-06-08", "2019-12-12"),
                            label = c("General Election", "General Election", "General Election", "General Election", "General Election", "General Election", "General Election"),
                            vote_perc = c("43.2%", "40.7%", "35.2%", "29.0%", "30.4%", "40.0%", "32.1%"),
                            vote_seats = c("418 MPs", "412 MPs", "403 MPs", "258 MPs", "232 MPs", "262 MPs", "202 MPs"),
                            seat_no = c(418, 412, 403, 258, 232, 262, 202)) |>
  mutate(Date = year(as.Date(Date)) + (0.25 * (quarter(as.Date(Date)) - 1)))

# data related to Labour's position in government
lab_position <- data.frame(start_date = c("1997-01-01", "2010-05-06"),
                           end_date = c("2010-05-06", "2022-11-01"),
                           label = c("GOVERNING", "OPPOSITION"),
                           col = c("L", "N")) |>
  mutate(mid_date = as.character(as.Date(start_date) + as.numeric(as.Date(end_date) - as.Date(start_date)) / 2),
         start_date = year(as.Date(start_date)) + (0.25 * (quarter(as.Date(start_date)) - 1)),
         end_date = year(as.Date(end_date)) + (0.25 * (quarter(as.Date(end_date)) - 1)),
         mid_date = year(as.Date(mid_date)) + (0.25 * (quarter(as.Date(mid_date)) - 1)))

# data relating to the leader of the Labour party
lab_leaders <- data.frame(Party = c("Lab", "Lab", "Lab", "Lab", "Lab"),
                          start_date = c("1997-01-01", "2007-06-24", "2010-09-25", "2015-09-12", "2020-04-04"),
                          end_date = c("2007-06-24", "2010-05-11", "2015-05-08", "2020-04-04", "2022-11-01"),
                          pm = c("L", "L", "N", "N", "N"),
                          leader_name = c("Blair", "Brown", "Miliband", "Corbyn", "Starmer"),
                          leader_img = c("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8e/Tony_Blair_2010_%28cropped%29.jpg/220px-Tony_Blair_2010_%28cropped%29.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/Gordon_Brown_%282008%29.jpg/220px-Gordon_Brown_%282008%29.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Official_portrait_of_Rt_Hon_Edward_Miliband_MP_crop_2.jpg/220px-Official_portrait_of_Rt_Hon_Edward_Miliband_MP_crop_2.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Official_portrait_of_Jeremy_Corbyn_crop_2%2C_2020.jpg/220px-Official_portrait_of_Jeremy_Corbyn_crop_2%2C_2020.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/3/33/Official_portrait_of_Keir_Starmer.jpg/220px-Official_portrait_of_Keir_Starmer.jpg")) |>
  mutate(leader_img = circle_crop(leader_img),
         start_date = year(as.Date(start_date)) + (0.25 * (quarter(as.Date(start_date)) - 1)),
         end_date = year(as.Date(end_date)) + (0.25 * (quarter(as.Date(end_date)) - 1)))


lab_pm_pal <- c("Y" = "#E4003B",
                "N" = "#636363")

#
# Conservative data
#

# https://en.wikipedia.org/wiki/Conservative_Party_(UK)

# data related to Conservative's performance in general elections
con_elections <- data.frame(Date = c("1997-05-01", "2001-06-07", "2005-05-05", "2010-05-06", "2015-05-07", "2017-06-08", "2019-12-12"),
                            label = c("General Election", "General Election", "General Election", "General Election", "General Election", "General Election", "General Election"),
                            vote_perc = c("30.7%", "31.7%", "32.4%", "36.1%", "36.8%", "42.3%", "43.6%"),
                            vote_seats = c("165 MPs", "166 MPs", "198 MPs", "306 MPs", "330 MPs", "317 MPs", "365 MPs"),
                            seat_no = c(165, 166, 198, 306, 330, 317, 365)) |>
  mutate(Date = year(as.Date(Date)) + (0.25 * (quarter(as.Date(Date)) - 1)))

# data relating to the leader of the Conservative party
con_leaders <- data.frame(Party = c("Con", "Con", "Con", "Con", "Con", "Con", "Con"),
                          start_date = c("1997-06-19", "2001-09-13", "2003-11-06", "2005-12-06", "2010-05-06", "2016-07-11", "2019-09-05"),
                          end_date = c("2001-09-13", "2003-11-03", "2005-10-07", "2010-05-06", "2016-07-11", "2019-06-07", "2022-09-05"),
                          pm = c("N", "N", "N", "N", "C", "C", "C"),
                          leader_name = c("Hague", "Duncan Smith", "Howard", "Cameron", "Cameron", "May", "Johnson"),
                          leader_img = c("https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/William_Hague_Foreign_Secretary_%282010%29.jpg/444px-William_Hague_Foreign_Secretary_%282010%29.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Official_portrait_of_Sir_Iain_Duncan_Smith_MP_crop_2.jpg/450px-Official_portrait_of_Sir_Iain_Duncan_Smith_MP_crop_2.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Official_portrait_of_Lord_Howard_of_Lympne_crop_2.jpg/450px-Official_portrait_of_Lord_Howard_of_Lympne_crop_2.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/David_Cameron_official.jpg/450px-David_Cameron_official.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/David_Cameron_official.jpg/450px-David_Cameron_official.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/1/18/Theresa_May_%282016%29_%28cropped%29.jpg/429px-Theresa_May_%282016%29_%28cropped%29.jpg",
                                         "https://upload.wikimedia.org/wikipedia/commons/thumb/7/76/Boris_Johnson_official_portrait_%28cropped%29.jpg/426px-Boris_Johnson_official_portrait_%28cropped%29.jpg")) |>
  mutate(leader_img = circle_crop(leader_img),
         start_date = year(as.Date(start_date)) + (0.25 * (quarter(as.Date(start_date)) - 1)),
         end_date = year(as.Date(end_date)) + (0.25 * (quarter(as.Date(end_date)) - 1))) |>
  rbind(data.frame(Party = "Con",
                   start_date = "2022.5",
                   end_date = "2022.75",
                   pm = "C",
                   leader_name = " ",
                   leader_img = NA))

# data related to Conservative's position in government
con_position <- data.frame(start_date = c("1997-05-01", "2010-05-06", "2015-05-07", "2017-06-08", "2019-12-12"),
                           end_date = c("2010-05-06", "2015-06-07", "2017-06-08", "2019-12-12", "2022-11-01"),
                           label = c("OPPOSITION", "GOVERNING (W/ LIB DEM)", "GOVERNING", "GOV (W/ DUP)", "GOVERNING"),
                           col = c("N", "CL", "C", "CL", "C")) |>
  mutate(mid_date = as.character(as.Date(start_date) + as.numeric(as.Date(end_date) - as.Date(start_date)) / 2),
         start_date = year(as.Date(start_date)) + (0.25 * (quarter(as.Date(start_date)) - 1)),
         end_date = year(as.Date(end_date)) + (0.25 * (quarter(as.Date(end_date)) - 1)),
         mid_date = year(as.Date(mid_date)) + (0.25 * (quarter(as.Date(mid_date)) - 1)))


# policy win data
policy_wins <- data.frame(all_pol) |>
  group_by(Date, Subject, PolicyLink) |>
  mutate(largest_party_for = ifelse(Vote.Count == max(Vote.Count), Party, NA)) |>
  arrange(Date, Subject, -Vote.Count) |>
  fill(largest_party_for, .direction = "down") |>
  group_by(Date, Subject, political_leaning, largest_party_for) |>
  summarise(win = sum(as.numeric(Policy.vote == "MAJORITY"))) |>
  mutate(win = ifelse(win > 0, 1, 0),
         qdate = year(Date) + (0.25 * (quarter(Date) - 1)),
         Date = year(Date)) |>
  group_by(Date, political_leaning) |>
  mutate(yr_id = 1:n()) |>
  mutate(x = Date + ((((yr_id - 1) + 4) %% 4) / 4),
         y = 1.05 + (((yr_id - 1) %/% 4) / 24)) |>
  mutate(col = ifelse(win == 0, "X",
                      ifelse(political_leaning == "Left", "N", "N"))) |>
  mutate(y = ifelse(political_leaning == "Left", -1 * y, y))


# policy win data
policy_wins_q <- data.frame(all_pol) |>
  group_by(Date, Subject, PolicyLink) |>
  mutate(largest_party_for = ifelse(Vote.Count == max(Vote.Count), Party, NA)) |>
  arrange(Date, Subject, -Vote.Count) |>
  fill(largest_party_for, .direction = "down") |>
  group_by(Date, Subject, political_leaning, largest_party_for) |>
  summarise(win = sum(as.numeric(Policy.vote == "MAJORITY"))) |>
  mutate(win = ifelse(win > 0, 1, 0),
         Date = year(Date) + (0.25 * (quarter(Date) - 1))) |>
  group_by(Date, political_leaning) |>
  mutate(yr_id = 1:n()) |>
  mutate(x = Date,
         y = 1.05 + (((yr_id - 1)) / 24)) |>
  mutate(col = ifelse(win == 0, "X",
                      ifelse(largest_party_for == "Lab", "L",
                             ifelse(largest_party_for == "Con", "C", "N")))) |>
  mutate(y = ifelse(political_leaning == "Left", -1 * y, y))

leftright <- policy_wins |>
  mutate(win = ifelse(political_leaning == "Left", win * -1, win)) |>
  group_by(qdate) |>
  summarise(movement = sum(win) / 100) |>
  mutate(movement = cumsum(movement)) |>
  rename(Date = qdate)

leftright_pc <- policy_wins |>
  group_by(Date, political_leaning) |>
  summarise(win = sum(win)) |>
  group_by(political_leaning) |>
  mutate(cumsum_win = cumsum(win)) |>
  pivot_wider(id_cols = Date, names_from = political_leaning, values_from = cumsum_win) |>
  ungroup()

leftright_pc <- fill(leftright_pc, Left, .direction = "down")
leftright_pc <- fill(leftright_pc, Right, .direction = "down")

leftright_pc <- leftright_pc |>
  mutate(Total = Left + Right,
         movement = (Right - Left) / Left)

rel_size <- 3

caption <- "N O T E S   \n\n
On Public Whip, a Policy is a set of votes that represent a view on a particular issue. Policies are maintained through a Wiki, so are managed by the Public Whip community.\n
For this visualisation, I have only used policies which can easily be classified as politically left (in favour of higher taxes, welfare support, government regulation of\n
business, social equality, and progressive social views) or right (in favour of lower taxes, individual freedom, less business regulation, privatisation, and traditional social views)\n
\nData: Public Whip (Vote & Policies), Wikipedia (Leaders & General Election Results)\n\n"

subtitle <- str_wrap("The chart below tracks the votes of the UK's two largest parties on policies classified as left- or right-wing issues, using data from PublicWhip.co.uk. The curves in the centre tell the story of two changing political parties, while the outer points count the number and outcome of votes on bills in the House of Commons. The dotted white line represents the cumulative shift in the political spectrum since 1997, with 54% more votes going in favour of right-wing policies than left.", 140)

outer_line <- 2.5

policy_win_legend <- data.frame(id = c(1, 2, 3, 4),
                                label = c("Labour-lead majority for favourable vote outcome",
                                          "Other party-lead majority for favourable vote outcome",
                                          "Vote outcome not favourable for policy",
                                          "Conservative-lead majority for favourable vote outcome"),
                                x = c(2024.65, 2024.65, 2024.65, 2024.65),
                                y = c(-outer_line+0.42, -0.96, 0.04, 1.02),
                                col = c("L", "N", "X", "C")
)

# plot
all_pol_perc |>
  filter(Vote == "FOR") |>
  filter(Party %in% c("Lab", "Con")) |>
  mutate(`Vote Perc` = ifelse(political_leaning == "Left", `Vote Perc` * -1, `Vote Perc`)) |>
  mutate(`Vote Perc` = ifelse(Date == 1997 & political_leaning == "Left" & Party == "Con", -0.0000000000001, `Vote Perc`)) |> # plots incorrectly if first value is zero :(
  ggplot(aes(x = Date, y = `Vote Perc`)) +
  #geom_area(data = . %>% filter(Party == "Lab"), fill = lab_col, aes(group = political_leaning), position = position_stack(), alpha = 0.5, fill = "#E4003B") + 
  stat_smooth(data = . %>% filter(Party == "Lab", `Vote Perc` < 0), 
              geom = 'area', method = 'loess', span = 1/3,
              alpha = 1/2, fill = lab_col)  +
  stat_smooth(data = . %>% filter(Party == "Lab", `Vote Perc` > 0), 
              geom = 'area', method = 'loess', span = 1/3,
              alpha = 1/2, fill = lab_col)  +
  #geom_area(data = . %>% filter(Party == "Con"), fill = con_col, aes(group = political_leaning), position = position_stack(), alpha = 0.5, fill = "#E4003B") +
  stat_smooth(data = . %>% filter(Party == "Con", `Vote Perc` < 0), 
              geom = 'area', method = 'loess', span = 1/3,
              alpha = 1/2, fill = con_col)  +
  stat_smooth(data = . %>% filter(Party == "Con", `Vote Perc` > 0), 
              geom = 'area', method = 'loess', span = 1/3,
              alpha = 1/2, fill = con_col)  +
  annotate(geom = "rect", xmin = 2022.9, xmax = 2024.1, ymin = 0.01, ymax = 0.98, fill = "#d1d1d1", alpha = 0.6) +
  annotate(geom = "rect", xmin = 2022.9, xmax = 2024.1, ymin = -0.01, ymax = -0.98, fill = "#d1d1d1", alpha = 0.6) +
  annotate(geom = "rect", xmin = 2022.9, xmax = 2024.1, ymin = -1, ymax = -outer_line+0.4, fill = "#d1d1d1", alpha = 0.6) +
  annotate(geom = "rect", xmin = 2022.9, xmax = 2024.1, ymin = 1, ymax = outer_line-0.4, fill = "#d1d1d1", alpha = 0.6) +
  annotate(geom = "rect", xmin = 2024.3, xmax = 2025, ymin = -outer_line+0.4, ymax = outer_line-0.4, fill = "#d1d1d1", alpha = 0.2) +
  annotate(geom = "segment", x = 2022.9, xend = 2024.1, y = -outer_line, yend = -outer_line, color = "#d1d1d1", alpha = 0.6, size = 4) +
  annotate(geom = "segment", x = 2022.9, xend = 2024.1, y = -outer_line+0.15, yend = -outer_line+0.15, color = "#d1d1d1", alpha = 0.6, size = 4) +
  annotate(geom = "segment", x = 2022.9, xend = 2024.1, y = -outer_line+0.3, yend = -outer_line+0.3, color = "#d1d1d1", alpha = 0.6, size = 4) +
  annotate(geom = "segment", x = 2022.9, xend = 2024.1, y = outer_line, yend = outer_line, color = "#d1d1d1", alpha = 0.6, size = 4) +
  annotate(geom = "segment", x = 2022.9, xend = 2024.1, y = outer_line-0.15, yend = outer_line-0.15, color = "#d1d1d1", alpha = 0.6, size = 4) +
  annotate(geom = "segment", x = 2022.9, xend = 2024.1, y = outer_line-0.3, yend = outer_line-0.3, color = "#d1d1d1", alpha = 0.6, size = 4) +
  geom_point(data = policy_win_legend, aes(x=x, y=y, color = col), size = 2, alpha = 0.5) +
  geom_text(data = policy_win_legend, aes(x=x, y=y, label=str_wrap(label,36)), hjust=0, vjust = 0.5, size = 2.2*rel_size, nudge_y = 0.05, family = gfont, lineheight = 0.1*rel_size) +
  geom_segment(data = lab_elections, aes(x = Date, xend = Date, y = -outer_line+0.15, yend = outer_line-0.15), color = "#636363", alpha = 0.5) +
  geom_point(data = policy_wins_q, aes(x = x, y = y, color = col), size = 1.4, alpha = 0.5, shape = 16) +
  #geom_text(data = lab_elections, aes(x = Date, y = -outer_line-0.15, label = label), family = gfont, vjust = 0, size = 3 * rel_size, hjust = 1, color = "#636363", nudge_x = 0.2) +
  geom_text(data = lab_elections, aes(x = Date, y = -outer_line+0.15, label = paste0(vote_seats)), vjust = 0.5, size = 3 * rel_size, hjust = 0, color = "#E4003B", family = gfont, nudge_x = 0.35, angle = 90) +
  geom_segment(data = lab_leaders, aes(x = as.numeric(start_date) + 0.02, xend = as.numeric(end_date) - 0.02, y = -outer_line+0.3, yend = -outer_line+0.3, color = pm), alpha = 0.6, size = 4) +
  #geom_image(data = lab_leaders, aes(image = leader_img, x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = -outer_line+0.3), size = 0.04) +
  geom_text(data = lab_leaders, aes(label = toupper(leader_name), x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = -outer_line+0.3), size = 2.8 * rel_size, angle = 90, family = gfont, color = "#ffffff", fontface = "bold") +
  geom_segment(aes(y = 0, yend = 0, x = 1997, xend = 2022.8), size = 1.2, color = "white") +
  geom_rect(data = lab_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.02, xmax = as.numeric(end_date) - 0.05, ymin = -outer_line+0.3, ymax = -1), alpha = 0.08) +
  #geom_rect(data = lab_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.05, xmax = as.numeric(end_date) - 0.05, ymin = -1, ymax = 1), alpha = 0.12) +
  geom_point(data = lab_elections, aes(size = seat_no, y = -outer_line+0.15), shape = 16, color = "#E4003B", alpha = 0.5) +
  #geom_segment(data = con_elections, aes(x = Date, xend = Date, y = -1, yend = 2.05), color = "#636363") +
  #geom_text(data = con_elections, aes(x = Date, y = outer_line+0.15, label = label), vjust = 0, size = 3 * rel_size, hjust = 0, color = "#636363", family = gfont, nudge_x = 0.2) +
  geom_text(data = con_elections, aes(x = Date, y = outer_line-0.15, label = paste0(vote_seats)), vjust = 0.5, size = 3 * rel_size, hjust = 1, family = gfont, color = "#0087DC", nudge_x = 0.35, angle = 270) +
  geom_segment(data = con_leaders, aes(x = as.numeric(start_date) + 0.02, xend = as.numeric(end_date) - 0.02, y = outer_line-0.3, yend = outer_line-0.3, color = pm), alpha = 0.6, size = 4) +
  #geom_image(data = con_leaders |> group_by(Party, leader_name) |> summarise(leader_img = first(leader_img), start_date = min(start_date), end_date = max(end_date)) , aes(image = leader_img, x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = outer_line-0.3), size = 0.04) +
  geom_text(data = con_leaders, aes(label = toupper(leader_name), x = as.numeric(start_date) + ((as.numeric(end_date) - as.numeric(start_date)) / 2), y = outer_line-0.3), size = 2.8 * rel_size, angle = 270, color = "#ffffff", family = gfont, fontface = "bold") +
  #geom_segment(aes(y = 0, yend = 0, x = 1997, xend = 2022), color = "white") +
  geom_rect(data = con_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.02, xmax = as.numeric(end_date) - 0.05, ymin = outer_line-0.3, ymax = 1), alpha = 0.08) +
  #geom_rect(data = con_leaders, aes(y = as.numeric(start_date), x = as.numeric(end_date), fill = pm, xmin = as.numeric(start_date) + 0.05, xmax = as.numeric(end_date) - 0.05, ymin = -1, ymax = 1), alpha = 0.12) +
  geom_point(data = con_elections, aes(size = seat_no, y = outer_line-0.15), shape = 16, color = "#0087DC", alpha = 0.5) +
  #geom_smooth(data = leftright_pc |> filter(Date < 2008), aes(y = movement), se = FALSE, size = 0.75, color = "#ffffff", linetype = "dotted") +
  stat_smooth(data = leftright_pc, aes(y = movement),
              geom = 'line', linetype = "dotted", 
              method = 'loess', span = 0.3, size = 0.75,
              color = "#ffffff")  +
  geom_segment(data = lab_position, aes(x = start_date + 0.05, xend = end_date - 0.05, y = -outer_line-0, yend = -outer_line-0, color = col), size = 4, alpha = 0.15) +
  geom_text(data = lab_position, aes(x = mid_date, y = -outer_line-0, label = label), angle = 90, vjust = 0.5, color = "#1d1d1d", size = 2.5 * rel_size) +
  geom_segment(data = con_position, aes(x = start_date + 0.05, xend = end_date - 0.05, y = outer_line+0, yend = outer_line+0, color = col), size = 4, alpha = 0.15) +
  geom_text(data = con_position, aes(x = mid_date, y = outer_line+0, label = label), angle = 270, vjust = 0.5, color = "#1d1d1d", size = 2.5 * rel_size) +
  #geom_line(data = leftright_pc |> filter(Date >= 2008), aes(y = movement), size = 0.75, color = "#ffffff", linetype = "dotted") +
  annotate(geom = "text", x = 2023.2, y = -0.05, label = "MP votes (%) for\nLEFT-wing policies", hjust = 1, vjust = 0, size = 3.5 * rel_size, family = gfont, lineheight = 0.8 / rel_size) +
  annotate(geom = "text", x = 2023.2, y = 0.05, label = "MP votes (%) for\nRIGHT-wing policies", hjust = 0, vjust = 0, size = 3.5 * rel_size, family = gfont, lineheight = 0.8 / rel_size) +
  annotate(geom = "text", x = 2023.2, y = -1.05, label = "Votes on LEFT-wing\npolicy bills", hjust = 1, vjust = 0, size = 3.5 * rel_size, family = gfont, lineheight = 0.8 / rel_size) +
  annotate(geom = "text", x = 2023.2, y = 1.05, label = "Votes on RIGHT-wing\npolicy bills", hjust = 0, vjust = 0, size = 3.5 * rel_size, family = gfont, lineheight = 0.8 / rel_size) +
  annotate(geom = "text", x = 2024.3, y = outer_line-0.15, label = "CON", hjust = 0.5, alpha = 0.7, vjust = 0, size = 8 * rel_size, lineheight = 0.8 / rel_size, color = con_col, family = gfont, fontface = "bold") +
  annotate(geom = "text", x = 2024.3, y = -outer_line+0.15, label = "LAB", hjust = 0.5, alpha = 0.7, vjust = 0, size = 8 * rel_size, lineheight = 0.8 / rel_size, color = lab_col, family = gfont, fontface = "bold") +
  annotate(geom = "label", x = 1997.9, y = 0.5, family = gfont, alpha = 0.8, color = "#1d1d1d", size = 2.5 * rel_size, lineheight = 0.8 / rel_size, label = "Cumulative % difference\nbetween successful votes for\nleft- and right-wing policies.") +
  annotate(geom = "text", x = 2023.5, y = outer_line-0.3, label = "Leader", angle = 90, hjust = 0.5, vjust = 0.5, size = 2.5 * rel_size, lineheight = 0.8 / rel_size, color = "#1d1d1d", family = gfont) +
  annotate(geom = "text", x = 2023.5, y = -outer_line+0.3, label = "Leader", angle = 90, hjust = 0.5, vjust = 0.5, size = 2.5 * rel_size, lineheight = 0.8 / rel_size, color = "#1d1d1d", family = gfont) +
  annotate(geom = "text", x = 2023.5, y = outer_line-0.15, label = "Results", angle = 90, hjust = 0.5, vjust = 0.5, size = 2.5 * rel_size, lineheight = 0.8 / rel_size, color = "#1d1d1d", family = gfont) +
  annotate(geom = "text", x = 2023.5, y = -outer_line+0.15, label = "Results", angle = 90, hjust = 0.5, vjust = 0.5, size = 2.5 * rel_size, lineheight = 0.8 / rel_size, color = "#1d1d1d", family = gfont) +
  annotate(geom = "text", x = 2023.5, y = outer_line-0, label = "Position", angle = 90, hjust = 0.5, vjust = 0.5, size = 2.5 * rel_size, lineheight = 0.8 / rel_size, color = "#1d1d1d", family = gfont) +
  annotate(geom = "text", x = 2023.5, y = -outer_line+0, label = "Position", angle = 90, hjust = 0.5, vjust = 0.5, size = 2.5 * rel_size, lineheight = 0.8 / rel_size, color = "#1d1d1d", family = gfont) +
  #annotate(geom = "segment", x = 2001.63, xend = 2001.9, y = -0.16, yend = -0.35, size = 0.4, alpha = 0.8, color = "#1d1d1d") +
  scale_y_continuous(breaks = c(-2, -1, 0, 1, 2), labels = c("", "100%", "0%", "100%", "")) +
  labs(caption = caption, subtitle = subtitle, title = "A Tale of Two Parties - 25 Years of UK Politics") +
  scale_x_continuous(n.breaks = 23) +
  scale_fill_manual(values = all_pm_pal) +
  scale_size(range = c(2.02 * 1.5, 4.18 * 1.5)) +
  scale_color_manual(values = all_pm_pal) +
  coord_flip(ylim = c(-outer_line-0.05, outer_line+0.05), xlim = c(1998, 2024)) +
  theme_minimal() +
  theme(legend.position = "none",
        axis.title = element_blank(),
        axis.text.y = element_text(hjust = 0),
        plot.title = element_text(face = "bold", hjust = 0, color = "#1d1d1d", size = 65, margin = margin(t = 10, b = 10, unit = "pt")),
        plot.subtitle = element_text(lineheight = 0.33, hjust = 0, color = "#1d1d1d", margin = margin(b = 10, unit = "pt")),
        text = element_text(family = gfont, size = 32),
        plot.caption = element_text(lineheight = 0.18, size = 27),
        panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank())

ggsave("outputs/test_plot.jpg", height = 12.5, width = 10)

