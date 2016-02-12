//
//  TestMockAndStub.m
//  MockTest
//
//  Created by Patel, Ashish on 2/11/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MockTest-Swift.h"
#import <OCMock/OCMock.h>

@import LocalAuthentication;


@interface TestMockAndStub : XCTestCase

@end

@implementation TestMockAndStub

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    id mock = OCMClassMock([TweetManager  class]);
    [OCMStub([mock fetchTweet:[OCMArg any]]) andReturn:@"How Are you? First Mock"];
    
    NSString *tweet = [mock fetchTweet:@"user"];
    NSLog(@"Returned Value tu %@", tweet);
}

- (void)testNoArgMethodStub{
    id mock = OCMClassMock([TweetManager class]);
    OCMStub([mock fetchTweetNoArgs]).andReturn(@"Hell Stub");
    NSString *returnValue = [mock fetchTweetNoArgs];
    NSLog(@"Returned Value tu %@", returnValue);
}



- (void)testStaticMock{
    id mock = OCMClassMock([LAContext class]);
    OCMVerifyAll(mock);
    OCMStub([mock canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:[OCMArg anyObjectRef]]).andReturn(NO);
    NSString *stringReturned = [TweetManager fetchTweetWithErrorPointer:mock error:[[NSError alloc] init]];
    NSLog(@"returned string = %@", stringReturned);
}


@end
