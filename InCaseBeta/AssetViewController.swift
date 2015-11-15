//
//  AssetViewController.swift
//  InCaseBeta
//  Created by Javid Beykzadeh on 11/5/15.
//  Copyright © 2015 JavidCode. All rights reserved.
//

import UIKit

class AssetViewController: UIViewController, UITextFieldDelegate,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descTextfield: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
    This value is either passed by `AssetTableViewController` in `prepareForSegue(_:sender:)`
    or constructed as part of adding a new asset.
    */
    var asset: Asset?
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        // Handle the text field’s user input through delegate callbacks.
        nameTextField.delegate = self
        
        // Set up views if editing an existing Asset.
        if let asset = asset {
            navigationItem.title = asset.name
            nameTextField.text   = asset.name
            descTextfield.text   = asset.desc
            photoImageView.image = asset.photo
        }
        
        // Enable the Save button only if the text field has a valid Meal name.
        checkValidAssetName()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidAssetName()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // Disable the Save button while editing.
        saveButton.enabled = false
    }
        
        func checkValidAssetName() {
            // Disable the Save button if the text field is empty.
            let text = nameTextField.text ?? ""
            saveButton.enabled = !text.isEmpty
        }
        
        // MARK: UIImagePickerControllerDelegate
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            // The info dictionary contains multiple representations of the image, and this uses the original.
            let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
            
            // Set photoImageView to display the selected image.
            photoImageView.image = selectedImage
            
            // Dismiss the picker.
            dismissViewControllerAnimated(true, completion: nil)
        }
        // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
   
    
    
    
    
        // This method lets you configure a view controller before it's presented.
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if saveButton === sender {
                let name = nameTextField.text ?? ""
                let desc = descTextfield.text
                let photo = photoImageView.image
               
                // Set the asset to be passed to AssetTableViewController after the unwind segue.
                asset = Asset(name: name, desc: desc, photo: photo)
            }
        }
        
        
        
        // MARK: Actions
        
        @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
            // Hide the keyboard.
            nameTextField.resignFirstResponder()
            
            // UIImagePickerController is a view controller that lets a user pick media from their photo library.
            let imagePickerController = UIImagePickerController()
            
            // Only allow photos to be picked, not taken.
            imagePickerController.sourceType = .PhotoLibrary
            
            // Make sure ViewController is notified when the user picks an image.
            imagePickerController.delegate = self
            
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
}


