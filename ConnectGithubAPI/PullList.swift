//
//  PullList.swift
//  ConnectGithubAPI
//
//  Created by David Guerrero on 10/10/21.
//

class PullList: Codable {
    var id : String
    var title: String
    var body: String
    init(id: String, //👈
           title: String,
           body: String) {
          
        self.id = id
        self.title = title
        self.body = body
      }
    //var user: Dictionary<String, Dictionary<String, String>>
   
}
