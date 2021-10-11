//
//  getRequest.swift
//  ConnectGithubAPI
//
//  Created by David Guerrero on 10/2/21.
//


import Foundation

var pullRequestInfo = [Dictionary<String, String>]()

var noMoreElems : Bool = false
var pullRequestNum = 1

func getJSON(completionHandler: @escaping ([[String: Any]]) -> Void) {
        // Enter your response here
    //for item in 0...pullRequestNum{
        var session = URLSession.shared
        // /repos/aetrix27/ConnectGithubAPI/pulls
        var baseURL = "https://api.github.com/repos/Aetrix27/ConnectGithubAPI/pulls"
        var url = URL(string: baseURL)!
        var request = URLRequest(url: url)
        
        session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            //    check if there's an error
            if let error = error {
                print("There was an error:", error.localizedDescription)
                return
            }

            //    check the status code of the response
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }

            guard httpResponse.statusCode == 200 else {
                print("Status code not OK")
                return
            }

            //    decode data into JSON
            guard let data = data else {
              print("No data object")
              return
            }

            //let stringFromData = String(data: data, encoding: .utf8)!
            //print("JSON", stringFromData)
            
            // JSON stuff
            //JSONSerialization.data(withJSONObject: <#T##Any#>, options: <#T##JSONSerialization.WritingOptions#>)
            //receiving models
            // pull request array,
            //user, title, body keys and set up token
            // Don't forget to notify the caller here
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                print("Failed to convert data into array of dictionaries")
               
                return
            }
            pullRequestNum = (json[0]["number"]! as? Int)!
            for item in 0...pullRequestNum-1 {
                var cur_id: String = String(format: "%@", json[item]["id"] as! CVarArg)
                var body: String = json[item]["body"] as! String
                var title: String = json[item]["title"] as! String
                //var token: String = json[item]["temp_clone_token"] as! String

                pullRequestInfo.append(["title":title,"id":cur_id,"body":body])
            }

            for item in json {
                   if let size = item["Pull request"] as? [String:Any] {
                    print(size["Pull request"]!)
                   }
               }
            /*
            do{
                let product = try JSONDecoder().decode(PullList.self, from: json[0])
             
                for item in 0...pullRequestNum {
                    pullRequestInfo.append(["id":String(item.id),"body":item.body, "title":item.title])
                }
                
            } catch{
                print(error)
            }
            */
     
            completionHandler(json)

        }.resume()
    //}
    
}
    


let myCompletionHandler: ([[String: Any]]) -> Void = {finished in
        print("We have completed function)")
    
}
