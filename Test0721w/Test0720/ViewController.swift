//
//  ViewController.swift
//  Test0720
//
//  Created by 楊采庭 on 2017/7/21.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var bottonView: UIView!
    
    @IBOutlet weak var pickImageButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func addPicture(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = self
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }

}

