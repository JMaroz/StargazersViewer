# StargazersViewer
Flutter application for retrieve the stargazers of a Github repository. 

## Data Layer
Its responsibility is to deal directly with the raw data from different data sources like webserver, database etc. 
The raw data then will be mapped or converted into models using some serialization methods to serialize/deserialize data like Json from and to.
An example is the github_apis and github repository packages.
The first wrap the call to the webserver to search and fetch the content. 
The second provide a simple structure for the presentation layer 

## Presentation Layer
This layer contains: The Blocs and The UI

The pattern of the Bloc is to separate those interactions (like user inputs) as Events, the bloc will process that event and return/emit results back to the UI as States.
The UI part then can listen to the states (stream of states) and do actions, build widgets or anything upon those states.

