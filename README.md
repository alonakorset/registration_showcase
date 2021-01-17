IOS 14 and higher is required for the app, as elements were used in the app that are only available from iOS 14.

# Architecture
The project was implemented with the help of the SwiftUI framework. The MVVM architecture was used. Only one model was created that is used by both screens / views. However, each view has its own ViewModel.

# Key Classes
All model classes belong in the folder "Models".

The "Screens" folder contains the classes for implementing all screens. There is a corresponding folder for each screen.

Each screen has a "View" and a "ViewModel" class. These and other classes belonging to a screen can be found in the same folder.

The auxiliary classes are located in the "Utils" folder. *BorderedViewModifier* is used for layout and sets a colored outline around the text fields and buttons.
The *Validator* class implements the acceptance criteria for user data.

*UserDataManager* class should be used to save / load the user data. Depending on the requirements, they would then be saved in *UserDefaults* / *CoreData* etc.

# Testing
UnitTests were written to test the functional logic. The functions of the validator were tested. The tests for the ViewModel can also be written, however, the current implementation does not provide any tests for ViewModels.

UITest was written to test a positive user flow.
