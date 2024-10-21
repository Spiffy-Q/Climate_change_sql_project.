-- climate change project --
-- 1. What are the yearly trends in CO2 emissions across different countries?

SELECT
 Year, 
 country,
 SUM(CO2_Emissions_MT) AS total_missions
 FROM
 climate_change_impact_on_agriculture_2024
 GROUP BY Year, Country
 ORDER BY Year;

-- 2. How has average temperature changed over the last decade?
  SELECT
   Year,
    AVG(average_temperature_c) AS avg_temperature,
    SUM(CO2_emissions_mt) AS total_emissions
    FROM climate_change_impact_on_agriculture_2024
	WHERE year BETWEEN 2014 AND 2023
    GROUP BY Year 
    ORDER BY Year;
    
-- 3 Which regions are experiencing the highest frequency of extreme weather event
    SELECT 
    region,
    SUM(extreme_weather_events) AS total_extreme_weather
    FROM climate_change_impact_on_agriculture_2024
    GROUP BY Region
    ORDER BY total_extreme_weather DESC;
    
    -- 4 What is the relationship between soil health and crop yield across various regions?
    SELECT 
    Region,
    AVG(soil_health_index),
    AVG(crop_yield_mt_per_ha) 
    FROM climate_change_impact_on_agriculture_2024
    GROUP BY Region, Soil_Health_Index
    ORDER BY Soil_Health_Index DESC;
    
    -- 5 How has irrigation access impacted crop yield?
    
    SELECT 
    `irrigation_access_%`,
    AVG(crop_yield_mt_per_ha) AS Avg_crop_yield,
    COUNT(*) AS records
    FROM climate_change_impact_on_agriculture_2024
    GROUP BY `Irrigation_Access_%`
    ORDER BY `Irrigation_Access_%`;

  -- 6 Which countries have the most extensive adaptation strategies in response to climate change, and how does that affect their economic impact?
  SELECT country,
  COUNT(CASE
        WHEN Adaptation_Strategies = 'drought resistant crop' THEN 1
         WHEN Adaptation_Strategies = 'Water management' THEN 1
          WHEN Adaptation_Strategies = 'organic farming' THEN 1
           WHEN Adaptation_Strategies = 'crop rotation' THEN 1
           ELSE NULL 
           END) AS extensive_adaptations,
           AVG(economic_impact_million_usd) AS Avg_economi_impact
           FROM climate_change_impact_on_agriculture_2024
           WHERE  Adaptation_Strategies != 'No adaptation'
           GROUP BY country
           ORDER BY extensive_adaptations DESC;
           
           -- 7 what are the regional differenes in fertilizer and pesticide usage and how do they impact crop yield and soil health?
           
           SELECT region,
           AVG(Fertilizer_use_kg_per_ha) AS avg_Fertilizer_use,
           AVG(pesticide_use_kg_per_ha) AS avg_pesticide_use,
           AVG(soil_health_index) AS avg_soil_halth,
           AVG(crop_yield_mt_per_ha) AS avg_crop_yield
           FROM climate_change_impact_on_agriculture_2024
           GROUP BY Region
           ORDER BY Region;
           
           

  
     
