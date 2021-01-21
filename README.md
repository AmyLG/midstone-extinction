
#Extinction is Forever - To become extinct is to be gone forever

#Inspiration
Extinction of a species happen when a species declines in numbers gradually but steadily until it disappear completely. The process of extinction usually take a very long time over a period of million of years. Although it can be a natural event, the rate of extinction has speed up unnaturally mostly since 1900 and is directly related to the increase of human population. According to Endangered Species Act (ESA), species becomes endangered when they are near extinction due to fast loss or small population (not large enough to survive). A threatened species is likely to become endangered within the foreseeable future. The major culprits of species extinction are destruction of habitats, Changes in natural living conditions, hunting, fishing, pollution, insufficient reproduction rate, invasive species, conflicts between wildlife and humans. However due to the number of endangered/threatened and conflicted species status between countries it can be difficult to obtain the information you are looking for easily. What I want to achieve is to have a comprehensive list of animals in danger of extinction, their status, who and where they are localized and why they are endangered.

#Data Selection
I used the ECOS (the Environmental Council of the States) API data because it was the most complete data I could find online, mostly for the endangered species in the United States.

#Data cleaning
The API data was fairly clean. However I had to remove some html tags in some texts, modify some common names missing so the user can differentiate the species ("No common name") and I had to convert the polygon data

#Visualizations
I created a dashboard to contain all the information of each species: information, picture and map location.
This is it for now but with more information to add I will most likely make the model better and add tree maps for comparison of animal groups per countries or continents and demonstrate if any specific group are more at risk.

#Project Screenshot



#What I learned
First, It's hard to find the data you are looking for!
Second, most endangered or threatened species are localized in very little territories which can explain why they are endangered and the major culprit is probably habitat loss.
Third, it is sometimes extremely difficult to get information on the species and understanding why they are declining and this is just because there is not enough study on these species.

#Next step
First, find polygon data for species with missing polygon data in ecos api from other sites
Second, include other websites to get more details about the species with missing information
Third, make treemaps of species group per country
