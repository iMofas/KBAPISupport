//
//  KBAPIRequest.m
//  KBAPISupport
//
//  Created by Kirill byss Bystrov on 3/17/16.
//  Copyright © 2016 Kirill byss Bystrov. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "KBAPIRequest.h"

@implementation KBAPIRequest

@dynamic URLString;

- (NSURL *) URL {
	NSString *URLString = self.URLString;
	return (URLString ? [[NSURL alloc] initWithString:URLString] : nil);
}

- (KBAPIRequestMethod) HTTPMethodType {
	return KBAPIRequestMethodGET;
}

- (NSString *) HTTPMethod {
	switch (self.HTTPMethodType) {
		case KBAPIRequestMethodHEAD:
			return @"HEAD";
	  case KBAPIRequestMethodGET:
			return @"GET";
		case KBAPIRequestMethodPOST:
			return @"POST";
		case KBAPIRequestMethodPUT:
			return @"PUT";
		case KBAPIRequestMethodPATCH:
			return @"PATCH";
		case KBAPIRequestMethodDELETE:
			return @"DELETE";
		case KBAPIRequestMethodCustom:
			return @"";
			
	  default:
			return @"GET"; // well, we need _some_ default
	}
}

- (NSString *) bodyString {
	return nil;
}

- (NSData *) bodyData {
	return [self.bodyString dataUsingEncoding:NSUTF8StringEncoding];
}

- (NSDictionary <NSString *, NSString *> *) additionalHeaders {
	return nil;
}

@end
