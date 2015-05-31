NSTextView+LineNumberView
=========================

Add line numbers to an instance of NSTextView.

![Screenshot](https://raw.githubusercontent.com/yichizhang/NSTextView-LineNumberView/master/screenshot.png)

Example
========

```swift

import Cocoa

// Your view controller
class ViewController: NSViewController {

    // The text view you wish to add line number view to
    @IBOutlet var mainTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainTextView.lnv_setUpLineNumberView()
    }
}

```