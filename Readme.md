


NYTimesPopular uses the api from NYTimes to get the most popular news.


-------------------
How to use
--------------
Clone this repository on your computer and hit run.
To run all unit tests and UI tests use the following command: fastlane tests
If you are not familiar with fastlane please check this link: https://github.com/fastlane/fastlane


---------------------
Architecture
---------------
This project uses MVVM arctucture, PopularViewModel is resonsable for providing data to other ViewControllers.

We use the class "Binder" to bind UIElements in the viewcontroller to their counterparts in the viewmodel, by assigning a clusure from the viewcontroller to be excuted when any updates happened in the viewmodel.

DetailsViewController gets its data from its parent  "PopularViewModel", and doesn't need to interact with the viewmodel

"PopularCell" is responsable for displaying its own data rather than "PopularViewController" which is a good practice to separate responsibilities.

PopularModel.swift  file contain all needed model objects. All of the conform to Codable protocol, so that a Coder object can fill it with data super easy.

smallImage, bigImage computed properties in the model object apply to our separation of concern strategy. Thus, the model is responsible to comput and deliver its own data.


------------
Testing
---------
MVVM depends on the viewmodel for dealing with data with complete separation from the UIKit. This makes testing the viewmodel easer with no need to mock any UIElements.

We have two unit tests, on for the viewmodel only method, and one for the coder.

The viewmodel uses dependency injection which makes it possible to test the viewmodel by mocking the network engine protocol.
We use default value for the network engine parameter to keep using it in production code simple. We don't want to trade code simplicity with testing.

We have one UITest ensures that the data transfer is correct from "PopularViewController" to "DetailsViewController".




