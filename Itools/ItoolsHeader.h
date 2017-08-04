//
//  ItoolsHeader.h
//  ReactiveCocoaUtils
//
//  Created by PC on 17/7/24.
//  Copyright © 2017年 LongPei. All rights reserved.
//

#ifndef ItoolsHeader_h
#define ItoolsHeader_h

#define UIColorWithCode(_code_)               UIColorWithCodeAlpha(_code_,1)
#define UIColorWithCodeAlpha(_code_, _al_)    [UIColor colorWithRed:((float)((_code_ & 0xFF0000) >> 16))/255.0 \
green:((float)((_code_ & 0x00FF00) >> 8))/255.0 \
blue:((float)(_code_ & 0x0000FF))/255.0 \
alpha:_al_]

#endif /* ItoolsHeader_h */
