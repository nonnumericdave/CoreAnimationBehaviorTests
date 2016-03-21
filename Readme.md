## CoreAnimationBehaviorDetails
Testing the finer details of CALayer's presentationLayer property.

### Description
It occurred to me that the presentationLayer property of CALayer could not possibly be consistent with the render tree on iOS if, in fact, animation rendering occurs out-of-process.  I mean, how could the presentationLayer not be out-of-date, with regards to the animation rendering, unless there was some type of synchronization going on.  With that said, I crafted up a few quick tests in an attempt to infer what the presentationLayer is, and more importantly, how it works.  What I discovered was, that is some cases, the presentationLayer is completely unreliable.

### Requirements
This project was designed and built against Xcode 7.2.1.

### Usage
Look at the LLDB output window from within Xcode to obtain the details about the animations that are occurring.
