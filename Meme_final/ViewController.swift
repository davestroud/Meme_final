//
//  ViewController.swift
//  Meme_final
//
//  Created by greymatter-home on 10/23/15.
//  Copyright © 2015 greymatter-home. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var topToolBar: UIToolbar!
    @IBOutlet weak var bottomToolBar: UIToolbar!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    var meme: UIImage!
    
    func save() ->Meme {
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextField.text, originalImage: imagePickerView.image!, memedImage: generateMemedImage())
        return meme
    }
    
    func generateMemedImage() -> UIImage {
        navigationController?.setToolbarHidden(true, animated: true)
        navigationController?.setNavigationBarHidden(true, animated: true)
        UIGraphicsBeginImageContext(view.frame.size)
        view.drawViewHierarchyInRect(view.frame, afterScreenUpdates: true)
        
        let memedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.setToolbarHidden(false, animated: true)
        return memedImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        let memeTextAttributes = [
            NSStrokeColorAttributeName : UIColor.blackColor(),
            NSForegroundColorAttributeName : UIColor.whiteColor(),
            NSFontAttributeName : UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSStrokeWidthAttributeName : NSNumber(float: -3.0)]
        
        setupTextField(topTextField, text: " TOP ", delegate: self, attributes: memeTextAttributes, alignment: NSTextAlignment.Center)
        setupTextField(bottomTextField, text: " BOTTOM", delegate: self, attributes: memeTextAttributes, alignment: NSTextAlignment.Center)
    }
    
    func setupTextField (textField: UITextField, text: String, delegate: UITextFieldDelegate, attributes: [String : NSObject], alignment: NSTextAlignment) {
        textField.text = text
        textField.delete(delegate)
        textField.defaultTextAttributes = attributes
        textField.textAlignment = alignment
    }
    
    
}

