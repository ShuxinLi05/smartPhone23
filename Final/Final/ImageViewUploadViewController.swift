//
//  ImageViewUploadViewController.swift
//  Final
//
//  Created by shuxin on 4/22/23.
//

import UIKit
import CoreLocation

class ImageViewUploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var txtTitle: UITextField!
    
    var uploadProtocol: UploadImageProtocol?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    @IBAction func takePic(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Take a picture", message: "Something", preferredStyle: .alert)
                
                let carmeraAction = UIAlertAction(title: "Camera", style: .default) { action in
                    if UIImagePickerController.isSourceTypeAvailable(.camera){
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = UIImagePickerController.SourceType.camera
                        imagePicker.allowsEditing = false
                        self.present(imagePicker, animated: true)
                    }
                    
                }
                let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { action in
                    if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
                        imagePicker.allowsEditing = false
                        self.present(imagePicker, animated: true)
                    }
                    
                    
                }
                let cancel = UIAlertAction(title: "Cancel", style: .default) { action in
                    print("Cancel")
                    
                }
                
                actionSheet.addAction(carmeraAction)
                actionSheet.addAction(photoLibraryAction)
                actionSheet.addAction(cancel)
                
                self.present(actionSheet, animated: true)
                
                locationManager.requestLocation()
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                imgView.image = image
            }
            
            picker.dismiss(animated: true)
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print(error)
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else {return}
            
            let lat = location.coordinate.latitude
            let lng = location.coordinate.longitude
            
            //lblLocation.text = "\(location)"
            
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
                guard let place = placemarks?.first else {return}
                if place.name != nil {
                    address += place.name! + ", "
                }
                if place.locality != nil {
                    address += place.locality! + ", "
                }
                if place.subLocality != nil {
                    address += place.subLocality! + ", "
                }
                if place.country != nil {
                    address += place.country! + ", "
                }
                if place.postalCode != nil {
                    address += place.postalCode! + ", "
                }
                self.lblLocation.text = "\(address)"
                print(address)
            }
        }
    
    @IBAction func uploadAction(_ sender: Any) {
        guard let img = imgView.image else {return}
                guard let location = lblLocation.text else {return}
                guard let title = txtTitle.text else {return}
                
                
                uploadProtocol?.uploadedImageDelegate(img: img, locationImg: location, titleImg: title)
                
                self.tabBarController?.selectedIndex = 0
    }
}
