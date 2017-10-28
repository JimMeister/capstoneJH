## ---- echo = FALSE, include = FALSE--------------------------------------
library(capstoneJH)
library(dplyr)
library(ggplot2)
library(readr)

## ----eq_read_example, message = FALSE------------------------------------
filename <- system.file("extdata/earthquakes.tsv.gz", package = "capstoneJH")
data <- readr::read_delim(filename, delim = "\t")

eq_clean_data(data)

## ----eq_timeline_example, fig.width = 7, fig.height = 4------------------
data %>% eq_clean_data() %>%
     filter(COUNTRY %in% c("GREECE", "ITALY"), YEAR > 2000) %>%
     ggplot(aes(x = DATE,
                y = COUNTRY,
                color = as.numeric(TOTAL_DEATHS),
                size = as.numeric(EQ_PRIMARY)
     )) +
     geom_timeline() +
     geom_timeline_label(aes(label = LOCATION_NAME), n_max = 5) +
     theme_timeline() +
     labs(size = "Richter scale value", color = "# deaths")

## ----eq_map_example, fig.width = 7, fig.height = 4-----------------------
data %>% 
  eq_clean_data() %>% 
  dplyr::filter(COUNTRY == "GREECE" & lubridate::year(DATE) >= 1990) %>% 
  dplyr::mutate(popup_text = eq_create_label(.)) %>% 
  eq_map(annot_col = "popup_text")

