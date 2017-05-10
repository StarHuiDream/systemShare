//
//  STBaseModel.m
//  openURLSysTemApp
//
//  Created by StarHui on 09/05/17.
//  Copyright © 2017年 StarHui. All rights reserved.
//

#import "STBaseModel.h"
#import <objc/runtime.h>

@interface STBaseModel()

//<NSCopying>

@end

@implementation STBaseModel


- (id)deepCopyAllPropertyValue {
    id newObjec = [[[self class] alloc] init];
    unsigned int outCount = 0, i = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *char_f = property_getName(property);
        NSString *propertyName = @(char_f);
        id propertyValue = [self valueForKey:(NSString *)propertyName];
        //数组拷贝
        if ([propertyValue isKindOfClass:[NSArray class]]) {
            NSUInteger arrayCount = [propertyValue count];
            NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:arrayCount];
            for (NSInteger a = 0; a < arrayCount; a++) {
                id objcInArray = propertyValue[a];
                if ([objcInArray respondsToSelector:@selector(deepCopyAllPropertyValue)]) {
                    id newObjecInArray = [objcInArray deepCopyAllPropertyValue];
                    [newArray addObject:newObjecInArray];
                }
            }
            propertyValue = newArray;
            //字典拷贝
        } else if ([propertyValue isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            NSArray *keys = [propertyValue allKeys];
            for (NSInteger a = 0; a < keys.count; a++) {
                NSString *key = keys[a];
                id value = propertyValue[key];
                id newValue;
                if ([value respondsToSelector:@selector(deepCopyAllPropertyValue)]) {
                    newValue = [value deepCopyAllPropertyValue];
                } else if ([value respondsToSelector:@selector(mutableCopy)]) {
                    newValue = [value mutableCopy];
                } else {
                    newValue = [value copy];
                }
                dict[key] = newValue;
            }
            propertyValue = dict;
            //自定义对象拷贝
        } else if ([propertyValue respondsToSelector:@selector(deepCopyAllPropertyValue)]) {
            propertyValue = [propertyValue deepCopyAllPropertyValue];
        }
        
        [newObjec setValue:propertyValue forKey:propertyName];
    }
    free(properties);
    return newObjec;
}


//- (id)copyWithZone:(nullable NSZone *)zone{
//   
////    return (id)self;
//    id newObjec = [[[self class] alloc] init];
//    unsigned int outCount = 0, i = 0;
//    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
//    for (i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        const char *char_f = property_getName(property);
//        NSString *propertyName = @(char_f);
//        id propertyValue = [self valueForKey:(NSString *)propertyName];
//        //数组拷贝
//        if ([propertyValue isKindOfClass:[NSArray class]]) {
//            NSUInteger arrayCount = [propertyValue count];
//            NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:arrayCount];
//            for (NSInteger a = 0; a < arrayCount; a++) {
//                id objcInArray = propertyValue[a];
//                if ([objcInArray respondsToSelector:@selector(deepCopyAllPropertyValue)]) {
//                    id newObjecInArray = [objcInArray deepCopyAllPropertyValue];
//                    [newArray addObject:newObjecInArray];
//                }
//            }
//            propertyValue = newArray;
//            //字典拷贝
//        } else if ([propertyValue isKindOfClass:[NSDictionary class]]) {
//            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//            NSArray *keys = [propertyValue allKeys];
//            for (NSInteger a = 0; a < keys.count; a++) {
//                NSString *key = keys[a];
//                id value = propertyValue[key];
//                id newValue;
//                if ([value respondsToSelector:@selector(deepCopyAllPropertyValue)]) {
//                    newValue = [value deepCopyAllPropertyValue];
//                } else if ([value respondsToSelector:@selector(mutableCopy)]) {
//                    newValue = [value mutableCopy];
//                } else {
//                    newValue = [value copy];
//                }
//                dict[key] = newValue;
//            }
//            propertyValue = dict;
//            //自定义对象拷贝
//        } else if ([propertyValue respondsToSelector:@selector(deepCopyAllPropertyValue)]) {
//            propertyValue = [propertyValue deepCopyAllPropertyValue];
//        }
//        
//        [newObjec setValue:propertyValue forKey:propertyName];
//    }
//    free(properties);
//    return newObjec;
//
//}

@end
