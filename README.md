# MarvelDemo
Demo iOS App for Hitting the Marvel API

Some things to consider:

- The API documentation flags every field in the response as "Optional"; I found that it's not really the case (for example a character with no description usually has an empty String for the field instead of NULL) but I still chose to make every field in the models an Optional, which results in more verbose code but is safer. In a real world application I would discuss with the Backend Team about optionality.
- I chose to use Nuke as the Image Caching library because I am familiar with it and it's a good stable solution. I am adding it to the project using Swift Package manager as it's the simplest solution, and it's built-in into Xcode 11
- I have used this website https://www.json4swift.com to generate the models from the JSON, which I have cleaned up later.
- Error handling is limited to updating the screens' title with the error message; with more time I would have implemented a system that allows to retry requests.
