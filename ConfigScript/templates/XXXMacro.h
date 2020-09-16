//
//  __Prefix__Macro.h
//  __Prefix__Room-iOS
//
//  Created by MOMO on 2020/7/7.
//

#ifndef __Prefix__Macro_h
#define __Prefix__Macro_h


/// @weakify & @strongify
#define metamacro_concat(A, B) A ## B
#define weakify(VAR) \
autoreleasepool {} \
__weak __typeof__(VAR) metamacro_concat(VAR, _weak_) = (VAR)
#define strongify(VAR) \
autoreleasepool {} \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wshadow\"") \
__strong __typeof__(VAR) VAR = metamacro_concat(VAR, _weak_)\
_Pragma("clang diagnostic pop")


#endif /* __Prefix__Macro_h */
