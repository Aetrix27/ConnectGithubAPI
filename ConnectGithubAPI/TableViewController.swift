//
//  TableViewController.swift
//  ConnectGithubAPI
//
//  Created by David Guerrero on 9/26/21.
//

import UIKit

var VCList : [UIViewController] = []

struct PullRequest {
    
    
}


class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    let requestSegueIdentifier = "ShowCellSegue"   //New
    var newViewBody : String=""

    //structs
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == requestSegueIdentifier,
            let destination = segue.destination as? CellViewController,
            let pullRequestIndex = table.indexPathForSelectedRow?.row
        {
            for item in pullRequestInfo[pullRequestIndex].values{
                newViewBody += item + "\n"
            }
            destination.selectedPullRequest = newViewBody
            newViewBody = ""

        }
    }
    
    func tableView(_ tableView:UITableView, didSelectRowAt indexPath: IndexPath){
        //print(indexPath[1])
        //let cellViewVC = CellViewController(index: indexPath[1])
        //let cellViewVC = storyboard?.instantiateViewController(identifier: "tableViewVC\(indexPath[1])") as! CellViewController
        //selectedPullRequest = pullRequestsArray[indexPath.row]
        //cellViewVC.PullRequest = selectedPullRequest

        //VCList.append(cellViewVC)
        //present(cellViewVC, animated:true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequestInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        cell.textLabel?.text = "\((pullRequestInfo[indexPath.row]["title"])!)"
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }


}
