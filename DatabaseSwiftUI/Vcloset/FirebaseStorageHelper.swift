//
//  FirebaseStorageHelper.swift
//  Vcloset
//
//  Created by Hruthvik Raj on 2022/06/09.
//

import Foundation
import Firebase
import FirebaseStorage

class FirebaseStorageHelper {
    static private let cloudStorage = Storage.storage()
    
    class func asyncDownloadToFilesystem(relativePath: String, handler: @escaping (_ fileUrl: URL) -> Void) {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileUrl = docsUrl.appendingPathComponent(relativePath)
        
        
        if FileManager.default.fileExists(atPath: fileUrl.path) {
            handler(fileUrl)
            return
        }
        
        let storageRef = cloudStorage.reference(withPath: relativePath)
        
        storageRef.write(toFile: fileUrl) { url, error in
            guard let localUrl = url else {
                print("Firebase storage: Error downloading file with relativePath: \(relativePath)")
                return
            }
            
            handler(localUrl)
        }.resume()
    }
}
