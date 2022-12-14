# load packages
pacman::p_load(dplyr, ggplot2, lubridate, cropcircles, ggimage, showtext, gridExtra, tidyr, magick)

# policy left / right classification

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

# combine all policies into one dataframe
all_pol <- rbind(asylum, lgbtq_rights, nhs_funding, welfare_cuts, union_regulation, raise_minwage, disability_benefits, school_autonomy,
                 against_abortion, increase_vat, increase_tax_free_allowance, reduce_corportation_tax, alcohol_tax, bank_tax, human_rights,
                 restrict_protest, lower_fuel_tax, domestic_abuse_action, bankers_bonus, energy_prices, corp_tax_incentives, protest_parliament,
                 against_gambling, legal_aid, tax_avoidance, smoking_ban, free_uni, anti_trans, environ_protect, capital_gains, aviation_emission,
                 occup_pensions, drug_legalise, welfare_rise, inheritance_tax, royal_mail, letting_agent, rail_fares, mansion_tax, strike_rights)

# save data
write.csv(all_pol, "data/all_labelled_policies.csv", row.names = FALSE)