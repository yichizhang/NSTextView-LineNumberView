//
//  ViewController.swift
//  LineNumber
//
//  Copyright (c) 2015 Yichi Zhang. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a
//  copy of this software and associated documentation files (the "Software"),
//  to deal in the Software without restriction, including without limitation
//  the rights to use, copy, modify, merge, publish, distribute, sublicense,
//  and/or sell copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
//  THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
//  DEALINGS IN THE SOFTWARE.
//

import Cocoa

class ViewController: NSViewController {

	@IBOutlet var mainTextView: NSTextView!
	
    var document: Document? {
        return view.window?.windowController?.document as? Document
    }

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		mainTextView.lnv_setUpLineNumberView()
	}

    override func viewWillAppear() {
        super.viewWillAppear()
        
        if let document = self.document {
            document.viewController = self
            
            if let documentContents = document.documentContent {
                self.mainTextView.string = documentContents
            }
        }
    }
    
	override var representedObject: Any? {
		didSet {
			// Update the view, if already loaded.
		}
    }
        
    
}
