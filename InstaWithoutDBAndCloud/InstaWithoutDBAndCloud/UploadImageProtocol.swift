//
//  ProtocolUploadImage.swift
//  InstaWithoutDBAndCloud
//
//  Created by shuxin on 4/21/23.
//

import Foundation
import UIKit

protocol UploadImageProtocol{
    
    func uploadedImageDelegate(img : UIImage, locationImg : String, titleImg : String)
}
