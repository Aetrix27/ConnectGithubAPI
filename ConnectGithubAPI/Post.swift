/// A product retrieved from the Product Hunt API.
import Foundation

struct Post {
   // Various properties of a post that we either need or want to display
    enum PostKeys: String, CodingKey {
        // first three match our variable names for our Post struct
        case id
        case name
        case tagline
        // these three need to be mapped since they're named differently on the API compared to our struct
        case request_name = "request_name"


    }
}

// Have a matching decodable array in our struct for the array of posts we get back from the API
//struct PostList: Decodable {
//   var posts: [Post]
//}

//let previewImageURL:  = <#initializer#>URL
