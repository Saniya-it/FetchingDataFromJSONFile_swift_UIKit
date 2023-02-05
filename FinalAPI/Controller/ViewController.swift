//
//  ViewController.swift
//  FinalAPI
//
//  Created by Dauletkhanova Saniya
//

import UIKit

class ViewController: UITableViewController {
    
    
    let reuseIdentifier = "PhoneCell"
    
    var myArticles : [Articles]? {
        didSet {
            DispatchQueue.main.async { [self] in
            tableView.reloadData()
                
            }
        }
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        tableView.register(PhoneCell.self, forCellReuseIdentifier: reuseIdentifier)
        // Do any additional setup after loading the view.
        let phoneManager = PhoneManager()
        
        phoneManager.fetchPhones { (articles) in
        
            DispatchQueue.main.async{
                [self] in
                self.navigationItem.title = "Articles"
            
                let titleLabel = UILabel()
                titleLabel.text = "Articles"
                titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
                titleLabel.sizeToFit()
                self.navigationItem.titleView = titleLabel
            }
            self.myArticles  = articles.articles
        }
    }
    
    func configureTableView() {
        tableView.backgroundColor = .white
        tableView.tableFooterView = UIView()
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? Product_ViewController {
            destination.article = myArticles![(tableView.indexPathForSelectedRow?.row)!]
        }
    }

}

extension ViewController {
      
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArticles?.count ?? 0
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PhoneCell
        let product = myArticles?[indexPath.row]
        cell.setData(product: product!)
        return cell
    }

}

class PhoneCell: UITableViewCell {

  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()

  let articleImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(articleImageView)
    contentView.addSubview(titleLabel)

    NSLayoutConstraint.activate([
      articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      articleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      articleImageView.widthAnchor.constraint(equalToConstant: 40),
      articleImageView.heightAnchor.constraint(equalToConstant: 40),

      titleLabel.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

  func setData(product: Articles) {
      titleLabel.text = product.title
      titleLabel.numberOfLines = 0
      titleLabel.lineBreakMode = .byWordWrapping
      if let image = product.urlToImage {
          articleImageView.downloaded(from: image )
      } else {
          print("error")
          return
      }

  }
}





