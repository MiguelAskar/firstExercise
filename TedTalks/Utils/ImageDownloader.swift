//
//  ImageDownloader.swift
//  Contacts
//
//  Created by Camilo Andres Morales Perez on 26/07/21.
//

import UIKit

struct ImageDownloader {

    static let downloadQueue: DispatchQueue = {
        let queue = DispatchQueue(label: "com.globant.academy.imagedownload", qos: .default, attributes: .concurrent)
        return queue
    }()

    static func downloadImage(from url: URL, completion: @escaping (UIImage?) -> ()) {
        downloadQueue.async {
            guard let imageData = try? Data(contentsOf: url, options: .uncached) else { return }
            DispatchQueue.main.async {
                completion(UIImage(data: imageData))
            }
        }
    }
    
}
