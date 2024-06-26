# Prepare the data for the categorical runtime
cat_data <- data.frame(
  nIndividuals = c(1250, 2500, 5000),
  runtime = c(573.757, 921.05100, 1951.995, 1571.24, 2151.103, 3565.347, 4268.588, 10295.285, 19015.465, 103.34, 225.89, 366.18),
  Software = rep(c("BOLT-LMM", "REGENIE", "SAIGE", "PLINK2"), each = 3),
  Type = rep("Categorical", 12)
)

# Prepare the data for the continuous runtime
cont_data <- data.frame(
  nIndividuals = c(1250, 2500, 5000),
  runtime = c(572.153, 1183.144, 2628.689, 5182.296, 5328.045, 6148.966, 8870.7, 26492.221, 82033.679, 4.64, 7.32, 11.883),
  Software = rep(c("BOLT-LMM", "REGENIE", "SAIGE", "PLINK2"), each = 3),
  Type = rep("Continuous", 12)
)
#Convert y axis from seconds to hours
cat_data$runtime <- cat_data$runtime / 3600
cont_data$runtime <- cont_data$runtime / 3600


# Combine the data
data <- rbind(cat_data, cont_data)

# Load the ggplot2 library
library(ggplot2)

# Plot
ggplot(data, aes(x = nIndividuals, y = runtime, color = Software, group = interaction(Software, Type), linetype = Type)) + 
  geom_line() + 
  geom_point() + 
  scale_color_manual(values = c("BOLT-LMM" = "green", "REGENIE" = "blue", "SAIGE" = "red", "PLINK2" = "purple")) + 
  theme_minimal() + 
  labs(x = "# Individuals", y = "Runtime (hours)", title = "LMM Runtime by Type") + 
  scale_linetype_manual(values = c("Categorical" = "solid", "Continuous" = "dashed")) + 
  theme(text = element_text(size = 16),  # Default text size for all text elements
        axis.title = element_text(size = 18),  # Axis titles
        axis.text = element_text(size = 16),  # Axis text
        legend.title = element_text(size = 16),  # Legend title
        legend.text = element_text(size = 14),  # Legend items
        plot.title = element_text(size = 20, face = "bold"))  # Plot title