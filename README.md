
#Extinction is Forever - To become extinct is to be gone forever

#Inspiration
Extinction of a species happen when a species declines in numbers gradually but steadily until it disappear completely. The process of extinction usually take a very long time over a period of million years. Although it can be a natural event, the rate of extinction has speed up unnaturally mostly since 1900 and is most likely directly related to the increase of human population. According to Endangered Species Act (ESA), species becomes endangered when they are near extinction due to fast loss or small population (not large enough to survive). A threatened species is likely to become endangered within the foreseeable future. The major culprits of species extinction are destruction of habitats, changes in natural living conditions, hunting, fishing, pollution, insufficient reproduction rate, invasive species, conflicts between wildlife and humans. However there is conflicted endangered/threatened species status between countries it can be difficult to navigate between websites. What I want to achieve is to have a comprehensive list of animals in danger of extinction, their status, general information, where they are localized and why they are endangered.

#Data Selection
I used the ECOS (the Environmental Council of the States) API data because it was the most complete data I could find online, mostly for the endangered species in the United States. I also decided to use the ESA status to determine the endangered status of the species and for simplicity I used only species of concern, threatnened and extinct.

#Data cleaning
The API data was fairly clean. However I had to remove some html tags in some texts, modify some common names missing so the user can differentiate the species ("No common name"), there where also images duplicate of species with sometimes a different id number and I had to convert the polygon data to be readable in leaflet.

#Visualizations
I created a dashboard to contain all the information of each species: information, picture and map location and for some species the cause why they are endangered.
I also incorporate treemaps per countries and per states in the united states.

#What I learned
First, It's hard to find the data you are looking for!
Second, most endangered or threatened species are localized in very little territories which could be an explanation why they are endangered.
Third, it is sometimes difficult to get information on the species and understanding why they are declining and this is due to the lack of knowledge on these species.

#What's next!
First, find polygon data for species with missing polygon data in ecos api from other sites
Second, include other databases to get more details about the species with missing information
