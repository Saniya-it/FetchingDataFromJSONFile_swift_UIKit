//
//  Product ViewController.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya
//

import UIKit
import WebKit


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}




class Product_ViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
   
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    
    var article: Articles?
    var webView: WKWebView!
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = article?.title
        nameLabel.numberOfLines = 0
        nameLabel.lineBreakMode = .byWordWrapping
        
        descriptionLabel.text = article?.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.lineBreakMode = .byWordWrapping
        
        if let urlString = article?.urlToImage {
            let urlImage = URL(string: urlString)
            imageView?.downloaded(from: urlImage!)
        }
        
        if let datePublication = article?.publishedAt {
            priceLabel.text = datePublication
        }
        priceLabel.numberOfLines = 0
        priceLabel.lineBreakMode = .byWordWrapping
        
        if let source = article?.source?.name {
            discountLabel.text = "Source: \(source)"
        }
        discountLabel.numberOfLines = 0
        discountLabel.lineBreakMode = .byWordWrapping
        
        if let link = article?.url {
            
            brandLabel.text = link
            webView = WKWebView(frame: .zero)
            webView.navigationDelegate = self
            brandLabel.isUserInteractionEnabled = true
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(goToLink))
            brandLabel.addGestureRecognizer(tapGesture)
        }
        brandLabel.numberOfLines = 0
        brandLabel.lineBreakMode = .byWordWrapping
        
        addConstraints()

    }
    
    @objc func goToLink() {
          if let link = article?.url {
              let url = URL(string: link)!
              webView.frame = self.view.frame
              self.view.addSubview(webView)
              webView.load(URLRequest(url: url))
        }
    }
    
    func addConstraints() {
        func addConstraints() {
            
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
            
            
            nameLabel.translatesAutoresizingMaskIntoConstraints = false
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            
            
            descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20).isActive = true
            descriptionLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            
        
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            priceLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
            priceLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
            priceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            
        
            discountLabel.translatesAutoresizingMaskIntoConstraints = false
            discountLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20).isActive = true
            discountLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
            discountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
            
            
            brandLabel.translatesAutoresizingMaskIntoConstraints = false
            brandLabel.topAnchor.constraint(equalTo: discountLabel.bottomAnchor, constant: 20).isActive = true
            brandLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
            brandLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        }
    }
}

    


        
        
          

