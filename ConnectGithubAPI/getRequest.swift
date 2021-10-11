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

func getJSON() {
        // Enter your response here
    let myCompletionHandler: ([[String: Any]]) -> Void = {finished in
            print("We have completed function)")
        
    }

        var session = URLSession.shared
        // /repos/aetrix27/ConnectGithubAPI/pulls
        var baseURL = "https://api.github.com/repos/Aetrix27/ConnectGithubAPI/pulls/\(pullRequestNum)"
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
                var noMoreElems = true
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
            do{
                let product = try JSONDecoder().decode(PullList.self, from: data)
            
                pullRequestInfo.append(["id":String(product.id),"body":product.body, "title":product.title])
            } catch{
                print(error)
            }
            
            //JSONEncoder().encode(photos)

            //sends models
            //JSONEncoder().encode(photos)

            // Don't forget to notify the caller here
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else {
                print("Failed to convert data into array of dictionaries")
               
                return
            }
            
            for item in json {
                   if let size = item["Pull request"] as? [String:Any] {
                    print(size["Pull request"]!)
                   }
               }
     
            myCompletionHandler(json)

        }.resume()
    


        pullRequestNum += 1
        print(pullRequestNum)
    
    }
    


