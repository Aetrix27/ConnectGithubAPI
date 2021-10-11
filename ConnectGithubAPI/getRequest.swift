//
//  getRequest.swift
//  ConnectGithubAPI
//
//  Created by David Guerrero on 10/2/21.
//


import Foundation


func getJSON(completionHandler: @escaping ([[String: Any]]) -> Void) {
    class PullList: Codable {
        //var user: Dictionary<String, Dictionary<String, String>>
        var id: Int?
        //var title: String = ""
        var body: String?
    }
    // Enter your response here
    let session = URLSession.shared
    // /repos/aetrix27/ConnectGithubAPI/pulls
    var pullRequestNum = 1
    let baseURL = "https://api.github.com/repos/Aetrix27/ConnectGithubAPI/pulls/\(pullRequestNum)"
    let url = URL(string: baseURL)!
    let request = URLRequest(url: url)
    
    /*
       request.httpMethod = "GET"
       // Set up header with API Token.
       request.allHTTPHeaderFields = [
         "Accept": "application/json",
         "Content-Type": "application/json",
         "Authorization": "Bearer \(token)",
         "Host": "api.producthunt.com"
       ]
*/
    
    
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
        do{
            let product = try JSONDecoder().decode(PullList.self, from: data)
            print("ID")
            print(product.id)
            print("body")
            print(product.body)
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
                   print(size["Pull request"])
               }
           }
    
        completionHandler(json)
    }.resume()
}

let myCompletionHandler: ([[String: Any]]) -> Void = { login in
    print(login)
  
}


