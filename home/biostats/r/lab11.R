lengths = c(47.12, 48.07, 46.75, 48.34, 46.81, 48.15, 47.12, 50.26, 46.67, 50.12, 
            47.43, 46.34, 46.44, 46.94, 46.64, 48.36, 41.90, 39.63, 38.10, 42.01, 
            42.18, 37.97, 41.93, 40.66, 38.79, 43.09, 37.87, 38.23, 41.47, 39.16, 
            38.87, 41.69, 37.40, 37.78, 39.78, 38.20, 38.01, 40.57, 38.07, 36.78, 
            35.12, 37.02, 36.82, 36.52, 36.66, 36.11, 35.68, 36.43, 36.03, 35.45, 
            34.57, 38.13, 34.63, 37.10);
sp = c("Hb", "Hb", "Hb", "Hb", "Hb", "Hb", "Hb", "Hb", "Hb", "Hb", "Hb", "Hb",
       "Hb", "Hb", "Hb", "Hb", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr",
       "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcr",
       "Hcr", "Hcr", "Hcr", "Hcr", "Hcr", "Hcy", "Hcy", "Hcy", "Hcy", "Hcy", "Hcy",
       "Hcy", "Hcy", "Hcy",  "Hcy", "Hcy", "Hcy", "Hcy", "Hcy", "Hcy");
data = data.frame(length=lengths, species = sp) ;
print(data);

fit = aov(length ~ species, data=data) ;
print(fit) ;
summary(fit) ;