//
//  CellViewController.swift
//  ConnectGithubAPI
//
//  Created by David Guerrero on 9/27/21.
//

import UIKit

class CellViewController: UIViewController {
    
    var index: Int?

    @IBOutlet var selectedPullRequestLabel: UILabel!
    
    var selectedPullRequest : String?
    
    override func viewWillAppear(_ animated: Bool) {
        selectedPullRequestLabel.text = selectedPullRequest
    }
     
     // this is a convenient way to create this view controller without a imageURL

//    init(index: Int?) {
//          self.index = index
//          super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
