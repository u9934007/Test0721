//
//  ViewController.swift
//  Test0720
//
//  Created by 楊采庭 on 2017/7/21.
//  Copyright © 2017年 楊采庭. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate , UIScrollViewDelegate {
    
    @IBOutlet weak var bottonView: UIView!
    
    @IBOutlet weak var pickImageButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var blackView: UIView!
    
    
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: "icon_photo")!
        imageView.tintColor = UIColor.white
        
        pickImageButton.titleLabel?.font = UIFont.asiTextStyle23Font()
        
        pickImageButton.layer.shadowOpacity = 1
        pickImageButton.layer.shadowRadius = 4
        pickImageButton.layer.shadowOffset = CGSize(width: 0, height: 2)
        pickImageButton.layer.shadowColor = UIColor.asiBlack25.cgColor
        pickImageButton.layer.cornerRadius = 2
        
        bottonView.layer.shadowOpacity = 1
        bottonView.layer.shadowRadius = 10
        bottonView.layer.shadowOffset = CGSize(width: 0, height: 0)
        bottonView.layer.shadowColor = UIColor.asiBlack25.cgColor
        

        
    }


    @IBAction func addPicture(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            picker.dismiss(animated: true, completion: {
                
                 //這裡放插入圖片
                self.imageView.image = image
                
                self.imageView.contentMode = UIViewContentMode.scaleAspectFit
                self.imageView.frame = self.scrollView.bounds
                
                if self.imageView.frame.size.height > self.blackView.frame.size.height {
                    
                    self.imageView.frame.size.height = self.blackView.frame.height
                    self.imageView.frame.size.width =  self.imageView.frame.size.width * (self.blackView.frame.size.height/self.imageView.frame.size.height)
                
                }
                
                if self.imageView.frame.size.width > self.blackView.frame.size.width {
                    
                    self.imageView.frame.size.width = self.blackView.frame.width
                    self.imageView.frame.size.height =  self.imageView.frame.size.height * (self.blackView.frame.size.width/self.imageView.frame.size.width)
                    
                }
                
                
                self.initImageInstance()
                
                
            })
        }
    }
    
    func initImageInstance(){

        self.scrollView.frame.size.width = self.imageView.frame.size.width
        self.scrollView.frame.size.height = self.imageView.frame.size.height
        self.scrollView.backgroundColor = UIColor.black
        scrollView.delegate = self
        setZoomScale()
    
        self.scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
    }
    
    func setZoomScale() {
        let imageViewSize = imageView.bounds.size
        let scrollViewSize = scrollView.bounds.size
        let widthScale = scrollViewSize.width / imageViewSize.width
        let heightScale = scrollViewSize.height / imageViewSize.height
        
        let minZoomScale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = minZoomScale
        scrollView.zoomScale = minZoomScale
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    

 
}

