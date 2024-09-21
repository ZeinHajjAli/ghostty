import SwiftUI

/// Custom subclass of NSHostingView which sinks events so that we can
/// stop the window from receiving events originating from within this view.
class EventSinkHostingView<Content: View>: NSHostingView<Content> {
    override var acceptsFirstResponder: Bool {
        return true
    }

    override func becomeFirstResponder() -> Bool {
        return true
    }

    override func acceptsFirstMouse(for event: NSEvent?) -> Bool {
        return true
    }

    override func mouseDown(with event: NSEvent) {
        // Do nothing
    }

    override func mouseDragged(with event: NSEvent) {
        // Do nothing
    }

    override func mouseUp(with event: NSEvent) {
        // Do nothing
    }

    override var mouseDownCanMoveWindow: Bool {
        return false
    }
}
