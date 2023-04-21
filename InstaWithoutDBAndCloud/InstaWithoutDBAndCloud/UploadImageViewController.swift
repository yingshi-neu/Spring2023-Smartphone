//
//  UploadImageViewController.swift
//  InstaWithoutDBAndCloud
//
//  Created by Selina Liu on 4/20/23.
//

import UIKit
import CoreLocation

class UploadImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate,CLLocationManagerDelegate {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var lblLocation: UILabel!
    
    var uploadProtocol: UploadImageProtocol?
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        //whenever i use this app, i will ask the user for authorization
        locationManager.requestWhenInUseAuthorization()
        //more accurate, battery goes faster
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    //here is the protocol func
    @IBAction func uploadAction(_ sender: Any) {
        guard let img = imgView.image else {return}
        guard let location = lblLocation.text else {return}
        guard let imgTitle = txtTitle.text else {return}
        
        uploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, title: imgTitle)
    }
    
    
    @IBAction func takePicAction(_ sender: Any) {
        
        //location function
        locationManager.requestLocation()
        
        let actionSheet = UIAlertController(title: "Take A Picture", message: "Please select the below options", preferredStyle: .alert)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) {
            action in
            //if photo library has no access, the following up action should not be available
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                //start the imagePicker for later use in func didFinishPickingMediaWithInfo, imagePicker is like a portfolio created by Apple
                let imagePicker = UIImagePickerController()
                //anything change in ImagePicker is handling by me
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.camera
                imagePicker.allowsEditing = false
                //present the imagePicker
                self.present(imagePicker, animated: true)
            }
        }
        //get the value from library
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) {
            action in
            //if photo library has no access, the following up action should not be available
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //start the imagePicker for later use in func didFinishPickingMediaWithInfo, imagePicker is like a portfolio created by Apple
                let imagePicker = UIImagePickerController()
                //anything change in ImagePicker is handling by me
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                imagePicker.allowsEditing = false
                //present the imagePicker
                self.present(imagePicker, animated: true)
            }

        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) {
            action in print("Cancel")
        }
        
        actionSheet.addAction(cameraAction)
        actionSheet.addAction(photoLibraryAction)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
        
    }
    
    //after taking a picture/click "use photo",this func get caught
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        //take the image from this array and cast it as an UIImage
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //after casting it to image, the selection of picture will be presented
            imgView.image = image
            //uploadedImages.append(image)
        }
        picker.dismiss(animated: true)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //since this return a bunch of location information, but we only need the last one
        guard let location = locations.last else {return}
        getAddressFromLocation(location: location)
    }
    
    
    func getAddressFromLocation(location: CLLocation){
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location) { placemarks, error in
            
            if error != nil {
                print(error)
                return
            }
            
            var address = ""
            //getting the first address
            guard let place = placemarks?.first else {return}
            if place.name != nil {
                address += place.name!
            }
            
//            if place.locality != nil {
//                address += place.locality!
//            }
            
            self.lblLocation.text = address
            
            print(address)
        }
       
    }
}
