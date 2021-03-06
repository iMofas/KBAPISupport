//
//  NSObject+KBMapping.h
//  KBAPISupport
//
//  Created by Kirill Bystrov on 3/31/16.
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

#import <KBAPISupport/KBObject.h>

@protocol KBMappingProperty;
#if __has_include (<KBAPISupport/KBAPISupport+XML.h>)
@class GDataXMLElement;
#endif
@interface NSObject (KBMapping) <KBObject>

+ (NSArray <id <KBMappingProperty>> *_Nullable) mappingProperties;

#if __has_include (<KBAPISupport/KBAPISupport+JSON.h>)
+ (instancetype _Nullable) newInstanceForJSONObject: (id _Nullable) JSONObject mappingContext: (id _Nullable) mappingContext;
#endif

#if __has_include (<KBAPISupport/KBAPISupport+XML.h>)
+ (instancetype _Nullable) newInstanceForXMLObject: (GDataXMLElement *_Nullable) XMLObject mappingContext: (id _Nullable) mappingContext;
#endif

@end

@interface NSObject (KBMappingInitialization)

+ (NSArray <id <KBMappingProperty>> *_Nullable) initializeMappingProperties;

@end

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSValueTransformerName const KBCamelCaseToSnakeCaseStringTransformerName;

@interface NSObject (KBAutoMapping)

@property (nonatomic, readonly, class) BOOL shouldAutomaticallyInitializeMappingProperties;
@property (nonatomic, strong, nullable, class) NSValueTransformer *defaultPropertyNamesTransformer;

+ (BOOL) shouldAutomaticallyMapProperty: (NSString *) propertyKeyPath;
+ (NSString *) sourceKeyPathForKeyPath: (NSString *) keyPath;
+ (id <KBMappingProperty> _Nullable) mappingPropertyForKeyPath: (NSString *) keyPath sourceKeyPath: (NSString *) sourceKeyPath;
+ (Class <KBObject> _Nullable) mappedCollectionItemClassForKeyPath: (NSString *) keyPath;

@end

NS_ASSUME_NONNULL_END
