//
//  UploadImageProtocol.swift
//  InstaWithoutDBAndCloud
//
//  Created by Selina Liu on 4/20/23.
//

import Foundation
import UIKit

protocol UploadImageProtocol {
    func uploadedImageDelegate(img : UIImage, locationImg: String, title: String)
}
