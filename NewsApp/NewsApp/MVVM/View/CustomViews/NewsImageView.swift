//
//  NewsImageView.swift
//  NewsApp
//
//  Created by Varshitha VRaj on 29/07/25.
//


import UIKit


class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}

extension UIImageView {
    func loadImage(from urlString: String?, placeholder: UIImage? = UIImage(named: "imagePlaceHolder")) {
        self.image = placeholder

        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }

        // Check cache first
        if let cachedImage = ImageCache.shared.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        // If not found in cache, download the image
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data,
                  error == nil,
                  let downloadedImage = UIImage(data: data) else {
                print("Image load failed: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            // Cache the image
            ImageCache.shared.setObject(downloadedImage, forKey: urlString as NSString)

            DispatchQueue.main.async {
                self?.image = downloadedImage
            }
            
        }.resume()
    }
}
