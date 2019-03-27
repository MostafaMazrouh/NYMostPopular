

NYTimesPopular uses the api from NYTimes to get the most popular news.

Clone this reposetore on your computer and hit run.

This project uses MVVM arctucture, MostPopularViewModel is resonsable for providing data to other ViewControllers. 

It uses delegates rather than binders to update the UI with data for the sake of simplicity.

MostPopularCell also calls the view model because the cell has full responsibility of what is displayed on it. 
