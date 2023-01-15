//
//  ViewController.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya
//

import UIKit

class ViewController: UITableViewController {
    
    
    let reuseIdentifier = "PhoneCell"
    
    var myProducts : [Products]? {
        didSet {
            DispatchQueue.main.async { [self] in
            tableView.reloadData()
        }
        }
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
        let phoneManager = PhoneManager()
        
        phoneManager.fetchPhones { (products) in
            
//            DispatchQueue.main.async {
//                [self] in
//                self.navigationItem = movie.title
        
            DispatchQueue.main.async{ [self] in
                self.navigationItem.title = "Products"
                
            }
            self.myProducts  = products.products
//            print(products.products)
//            print(products.limit)
//            print(products.skip)
            //print(products.total)
             
        
        }
    }
    
    func configureTableView() {
        tableView.backgroundColor = .lightGray
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? Product_ViewController {
            destination.product = myProducts![(tableView.indexPathForSelectedRow?.row)!]
        }
    }

}

extension ViewController {
     
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (myProducts?.count)!
//
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as!
//        CustomCollectionViewCell
//    }
//
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myProducts?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        
         let product = myProducts?[indexPath.row]
        //cell.textLabel?.text = "\(product.title) -- \(product.id )"
        cell.textLabel?.text = product?.title
         
        return cell
    }
}



