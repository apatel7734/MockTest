//
//  TweetManager.swift
//  MockTest
//
//  Created by Patel, Ashish on 2/11/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

import Foundation
import LocalAuthentication

class TweetManager: NSObject {
    
    func fetchTweet(userName: String) -> String{
        return "Hello, \(userName)."
    }
    
    func fetchTweetNoArgs() -> String{
        return "no arg tweet."
    }
    
    static func fetchStaticTweet(laContext: LAContext) -> String{
        var error: NSError?
        
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error){
            return "Can Evaluate."
        }else{
            return "Cannot Evaluate."
        }
    }
    
    static func fetchTweetWithErrorPointer(laContext: LAContext,var error: NSError?) -> String{
        if laContext.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthenticationWithBiometrics, error: &error) {
            return "right"
        }else{
            return "wrong"
        }
    }
}