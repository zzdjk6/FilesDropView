//
//  FilesDropView.swift
//

import Cocoa

public class FilesDropView: NSView {

    // Shortcut
    public typealias OnFilesDroppedClosure = (_ filePathList: [String]) -> Void
    public var onFilesDropped: OnFilesDroppedClosure?

    // Normal Complex Callback
    public typealias OnDraggingEnteredClosure              = (_ sender : NSDraggingInfo) -> NSDragOperation
    public typealias OnDraggingUpdatedClosure              = (_ sender : NSDraggingInfo) -> NSDragOperation
    public typealias OnDraggingEndedClosure                = (_ sender : NSDraggingInfo?) -> Void
    public typealias OnDraggingExitedClosure               = (_ sender : NSDraggingInfo?) -> Void
    public typealias OnPrepareForDragOperationClosure      = (_ sender : NSDraggingInfo) -> Bool
    public typealias OnPerformDragOperationClosure         = (_ sender : NSDraggingInfo) -> Bool
    public typealias OnConcludeDragOperationClosure        = (_ sender : NSDraggingInfo?) -> Void
    public typealias OnUpdateDraggingItemsForDragClosure   = (_ sender : NSDraggingInfo?) -> Void
    public typealias OnWantsPeriodicDraggingUpdatesClosure = () -> Bool

    public var onDraggingEnterd               : OnDraggingEnteredClosure?
    public var onDraggingUpdated              : OnDraggingUpdatedClosure?
    public var onDraggingEnded                : OnDraggingEndedClosure?
    public var onDraggingExited               : OnDraggingExitedClosure?
    public var onPrepareForDragOperation      : OnPrepareForDragOperationClosure?
    public var onPerformDragOperation         : OnPerformDragOperationClosure?
    public var onConcludeDragOperation        : OnConcludeDragOperationClosure?
    public var onUpdateDraggingItemsForDrag   : OnUpdateDraggingItemsForDragClosure?
    public var onWantsPeriodicDraggingUpdates : OnWantsPeriodicDraggingUpdatesClosure?

    // MARK: - Init

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }

    private func commonInit() {
        wantsLayer = true
        register(forDraggedTypes: [NSFilenamesPboardType, NSURLPboardType])
    }

    // MARK: - Managing a Dragging Session Before an Image Is Released

    public override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        if let onDraggingEnterd = onDraggingEnterd {
            return onDraggingEnterd(sender)
        }

        return .every
    }

    public override func wantsPeriodicDraggingUpdates() -> Bool {
        if let onWantsPeriodicDraggingUpdates = onWantsPeriodicDraggingUpdates {
            return onWantsPeriodicDraggingUpdates()
        }

        return true
    }

    public override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        if let onDraggingUpdated = onDraggingUpdated {
            return onDraggingUpdated(sender)
        }

        return .every
    }

    public override func draggingEnded(_ sender: NSDraggingInfo?) {
        onDraggingEnded?(sender)
    }

    public override func draggingExited(_ sender: NSDraggingInfo?) {
        onDraggingExited?(sender)
    }

    // MARK: - Managing a Dragging Session After an Image Is Released

    public override func prepareForDragOperation(_ sender: NSDraggingInfo) -> Bool {
        if let onPrepareForDragOperation = onPrepareForDragOperation {
            return onPrepareForDragOperation(sender)
        }

        return true
    }

    public override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        if let onPerformDragOperation = onPerformDragOperation {
            return onPerformDragOperation(sender)
        }

        guard let pathList = sender
            .draggingPasteboard()
            .propertyList(forType: PASTEBOARD_TYPE) as? [String] else { return false }

        onFilesDropped?(pathList)

        return true
    }

    public override func concludeDragOperation(_ sender: NSDraggingInfo?) {
        onConcludeDragOperation?(sender)
    }

    // MARK: - Updating Dragging Images
    public override func updateDraggingItemsForDrag(_ sender: NSDraggingInfo?) {
        onUpdateDraggingItemsForDrag?(sender)
    }
}

fileprivate let PASTEBOARD_TYPE = "NSFilenamesPboardType"
