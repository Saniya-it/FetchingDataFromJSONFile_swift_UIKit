//
//  Product ViewController.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya
//

import UIKit


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




class Product_ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
   
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var stockLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    var article: Articles?
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = article?.title
        
//        descriptionLabel.text = article?.description
//        descriptionLabel.numberOfLines = 0

        
        
//        priceLabel.text = "price: \((product?.price)!)"
//        discountLabel.text = "discount: \((product?.discountPercentage)!)"
//        stockLabel.text = "stock: \((product?.stock)!)"
//        brandLabel.text = "brand: \((product?.brand)!)"
//        categoryLabel.text = "category: \((product?.category)!)"
        
        
        
        
//        let urlString = (article?.images)!{
//            let urlImage = URL(string: urlString)
//            print(urlImage!)
//            imageView?.downloaded(from: urlImage!)
//
//        }
        
        
          
//        let urlImage = URL(string: urlString[0])
//                    print(urlImage!)
//                    imageView?.downloaded(from: urlImage!)
        
    }
}

//extension Product_ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return arrayOfImages.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
//        if let vc = cell.viewWithTag(111) as? UIImageView {
//            vc.image = arrayOfImages[indexPath.row]
//
//
//
//
//
//        } else if let ab = cell.viewWithTag(222) as? UIImageView {
//
//        }
//
//
//    }
//
//
//}
