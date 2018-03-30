#lang scribble/manual
@require[@for-label[racket]]

@title{語}
@author{zaoqi}

@defmodule[zaoqil #:lang]

@define-syntax-rule[(重名詞法 名 原) @define-syntax-rule[(名 . 參) (原 . 參)]]

@重名詞法[述機 defproc]
@重名詞法[語 racket]
@重名詞法[述 defform]
@重名詞法[述/子 defform/subs]
@重名詞法[述值 defthing]

這裏使用racket語法。
這裏是一般的類型。

@述機[(等？ [甲 物？] [乙 物？]) 陰陽？]{返回@語[甲]是否等於@語[乙]。}

@述機[(首-尾？ [甲 物？]) 陰陽？]{返回@語[甲]是否是@語[(首-尾 之首 之尾)]。}
@述機[(首-尾 [首 物？] [尾 列？]) 首尾？]{沒有強制類型限制。}
@述機[(首-尾.首 [甲 首尾？]) 物？]{若@語[甲]是@語[(首-尾 之首 之尾)]，返回@語[之首]。}
@述機[(首-尾.尾 [甲 首尾？]) 物？]{若@語[甲]是@語[(首-尾 之首 之尾)]，返回@語[之尾]。}
@述機[(空？ [甲 物？]) 陰陽？]{返回@語[甲]是否是@語[()]。}
@述值[空 空？ #:value ()]
@述值[列 機？ #:value [入 甲 甲]]

@述機[(文？ [甲 物？]) 陰陽？]{返回@語[甲]是否是字符。}

@述機[(名/文？ [甲 物？]) 陰陽？]
@述機[(名/文 [列 (列 文？)]) 名-文？]{沒有強制類型限制。}
@述機[(名/文-1 [甲 名/文？]) (列 文？)]
@述機[(名/構？ [甲 物？]) 陰陽？]
@述機[(名/構 [名 名？] [列 列？]) 陰陽？]{沒有強制類型限制。}
@述機[(名/構.名 [甲 名/構？]) 名？]
@述機[(名/構.列 [甲 名/構？]) 列？]
@述機[(名？ [甲 物？]) 陰陽？]

@述機[(映？ [甲 物？]) 陰陽？]
@述值[映/空 映？]{空映射。}
@述機[(映.增 [映 映？] [名 物？] [物 物？]) 映？]
@述機[(映.改 [映 映？] [名 物？] [者 (-> 物？ 物？)]) 映？]
@述機[(映.增-改 [映 映？] [名 物？] [物 物？]) 映？]{返回創建或修改了的映射。}
@述機[(映.取 [映 映？] [名 物？]) 物？]
@述機[(映.含？ [映 映？] [名 物？]) 陰陽？]
@述機[(映.删 [映 映？] [名 物？]) 映？]{必須有}
@述機[(映→列 [映 映？]) (listof (cons/c any/c any/c))]

@述[(！式 甲 ...)]{使用一個@語[引機？]或@語[譯機？]。可以寫作@語[[甲 ...]]。}

@述機[(機？ [甲 物？]) 陰陽？]
@述機[(機 [形 物？] [物 未算？]) 機？]{返回一個等價的@語[機？]。}
@述機[(用 [機 機？] [形 列？]) 物？]{
 用@語[形]應用@語[機]。
 @語[(算 (機.物 機) 境)]。
 @語[境]只包含用@語[機.形]和@語[形]得到的。
}
@述機[(機.形 [機 機？]) 物？]{
 類似Scheme。
}
@述機[(機.物 [-機 機？]) 未算？]
@述/子[{入 形 物}
     ([形 (甲 ...)
       (甲 ...+ . 之尾)
       甲])]{
 返回一個等價的@語[機？]。類似Scheme，有詞法作用域。
}

@述值[陰 陰陽？]
@述值[陽 陰陽？]
@述機[(若 [甲 陰陽？] [乙 物？] [丙 物？]) 物？]{若@語[甲]是@語[陽]，則返回@語[乙]，否則返回@語[丙]。}

@述機[(引-機？ [甲 物？]) 陰陽？]
@述機[(引-機 [機 (-> 映？ 未算？ ... 物？)]) 引機？]{
 沒有強制類型限制。
 first-class的宏和特殊形式。
}
@述機[(引-機-1 [甲 引機？]) (-> 映？ 未算？ ... 物？)]{@語[引-機]的反函數。}

@述值[引 引機？ #:value (引機 {入 (境 物) 物})]

@述[(！界 名)]{空境中的值。內置的值。}

@述機[(誤？ [甲 值？]) 陰陽？]
@述機[(誤 [甲 值？]) 誤？]{
 內置的函數可以產生@語[(誤 (構 (列→名 (列 [引 界] [引 誤] [引 -名])) -列))]。
 @語[-名]是函數的名字。
 @語[-列]一般是參數。}
@述機[(誤-1 [甲 誤？]) 物？]

@述機[(算 [未算 未算？] [境 映？]) 物？]

@述[{境.命名-今 名 物}]{把現在的環境命名爲@語[名]，返回@語[物]。}
@述[{境.改 新境 物}]
@述值[境/空 映？]

@述[{命名 ((標識符 之物) ...) 物}]{@racket[letrec]}

@述機[(構？ [甲 物？]) 陰陽？]{返回@語[甲]是否是@語[(構 名 列)]。}
@述機[(構 [名 名？] [列 列？]) 構？]{沒有強制類型限制。}
@述機[(構.名 [甲 構？]) 物？]{若@語[甲]是@語[(構 名 列)]，返回@語[名]。}
@述機[(構.列 [甲 構？]) 物？]{若@語[甲]是@語[(構 名 列)]，返回@語[列]。}

@述機[(取 [名 名？]) 物]{獲取一個包}
