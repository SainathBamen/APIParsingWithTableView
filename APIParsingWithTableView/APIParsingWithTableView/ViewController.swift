//
//  ViewController.swift
//  APIParsingWithTableView
//
//  Created by sainath bamen on 05/02/23.
//

import UIKit

class ViewController: UIViewController {
    var data = [ToDo]()

    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        fecthingData(URL: "https://jsonplaceholder.typicode.com/todos") { result in
            self.data = result
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
        }
    }

    
    func fecthingData(URL url:String, completion:@escaping ([ToDo]) -> Void){

        let url = URL(string: url)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { data, response, error in
            if data != nil && error == nil{
                do{
                    let parsingData  = try JSONDecoder().decode([ToDo].self, from: data!)
                    completion(parsingData)
                }
                catch{
                    print("Parsing Error")
                    
                }
                
                
            }else{
                
            }
        }
        dataTask.resume()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row].title
       
    
        
       
        
        return cell!
    }
    
    
}


