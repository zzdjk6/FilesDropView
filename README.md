# FilesDropView

[![CI Status](http://img.shields.io/travis/zzdjk6@126.com/FilesDropView.svg?style=flat)](https://travis-ci.org/zzdjk6@126.com/FilesDropView)
[![Version](https://img.shields.io/cocoapods/v/FilesDropView.svg?style=flat)](http://cocoapods.org/pods/FilesDropView)
[![License](https://img.shields.io/cocoapods/l/FilesDropView.svg?style=flat)](http://cocoapods.org/pods/FilesDropView)
[![Platform](https://img.shields.io/cocoapods/p/FilesDropView.svg?style=flat)](http://cocoapods.org/pods/FilesDropView)

## How to use

1. create an IBOutlet `weak var filesDropView: FilesDropView?`, or create the view with code.

2. setup callbacks

    You can use `onFilesDropped` shorcut callback only, or do more customize with other callbacks.


    ```swift
    // Basic shortcut
    filesDropView?.onFilesDropped = { filePathList in
        print("FilesDropView::onFilesDropped")
        dump(filePathList)
    }

    // More complex callback
    filesDropView?.onDraggingEnterd = { sender in
        print("FilesDropView::onDraggingEnterd")
        dump(sender)
        return .every
    }

    filesDropView?.onDraggingEnded = { sender in
        print("FilesDropView::onDraggingEnded")
        dump(sender)
    }

    filesDropView?.onDraggingUpdated = { sender in
        print("FilesDropView::onDraggingUpdated")
        dump(sender)
        return .every
    }
    ```

3. done

## Requirements

* Swfit 3
* XCode 8.2.1 or later (tested on XCode 8.2.1)

## Installation

FilesDropView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FilesDropView"
```

## Author

zzdjk6@126.com, zzdjk6@gmail.com

## License

FilesDropView is available under the MIT license. See the LICENSE file for more info.
