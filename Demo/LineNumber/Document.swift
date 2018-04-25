//
//  Document.swift
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

class Document: NSDocument {

    var viewController : ViewController?
    var documentContent : String?

	override init() {
	    super.init()
		// Add your subclass-specific initialization here.
	}

	override func windowControllerDidLoadNib(_ aController: NSWindowController) {
		super.windowControllerDidLoadNib(aController)
		// Add any code here that needs to be executed once the windowController has loaded the document's window.
	}

    override class var autosavesInPlace: Bool {
        get {
            return true
        }
    }

	override func makeWindowControllers() {
		// Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Main"), bundle: nil)
        let windowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier(rawValue: "Document Window Controller")) as! NSWindowController
		self.addWindowController(windowController)
	}

    // more information about what's happening here can be found at
    // http://sketchytech.blogspot.com/2016/09/taming-nsdocument-and-understanding.html
	override func data(ofType typeName: String) throws -> Data {
        // since NSDocument returns a non-optional,
        // we should return something, even if it's nothing
        var data = Data()
        
        if let rawString = self.viewController?.mainTextView.string
        {
            if let rawData = rawString.data(using: .utf8)
            {
                data = rawData
            }
        } else {
            throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        }
        return data
	}

	override func read(from data: Data, ofType typeName: String) throws {
        documentContent = String(decoding: data, as: UTF8.self)
	}


}

