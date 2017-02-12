//
//  ViewController.swift
//  FilesDropView_Demo
//
//  Created by 陈圣晗 on 2017/2/12.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import Cocoa
import FilesDropView

class ViewController: NSViewController {

    @IBOutlet weak var filesDropView: FilesDropView?

    override func viewDidLoad() {
        super.viewDidLoad()

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
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

