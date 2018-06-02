#lang scribble/manual
@require[@for-label[racket]]

@title{語}
@author{zaoqi}

@defmodule[lang #:lang #:packages ("lang")]

@define-syntax-rule[(重名詞法 名 原) @define-syntax-rule[(名 . 參) (原 . 參)]]

@重名詞法[述化 defproc]
@重名詞法[語 racket]
@重名詞法[述 defform]
@重名詞法[述/子 defform/subs]
@重名詞法[述值 defthing]

@section{形式}
@述[(#%式 式 甲 ...)]{等價與使用@語[S化.用]和@語[S式->]。使用一個@語[:S式？]@語[式]。可以寫作@語[{式 甲 ...}]。}
@述值[頂:S表 :S表？]
@述[(#%頂 名)]{頂層的物。}
@述[(化 形 ...)]{等價與使用@語[S化.用]。}

@section{物}
@subsection{結構/值}
@subsubsection{結構/值 化}
@語[(->S化 '<形> '((#%頂 <名>) . <形>))]

@subsection{述}
@述化[(等？ [甲 (非 :S誤？)] [乙 (非 :S誤？)]) :<集_S陰_S陽>？]{返回@語[甲]是否等於@語[乙]。}
@述化[(算 [:S物 :S物？] [:S表 :S表？]) :S物？]
@述化[(取 [:S名 名？]) :S物？]{獲取一個包}
@述化[(或 [甲 :S物？] [乙 :S物？]) :S物？]{一般是@語[甲]，可以是@語[乙]。}
@述值[!引 :S式？ #:value (->S式 (->S化 '(:S表 :S物) ':S物))]

@subsubsection{S陰-S陽}
@述化[(:<集_S陰_S陽>？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(:S陰？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述值[其:S陰 :S陰？]
@述化[(:S陽？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述值[其:S陽 :S陽？]
@述化[(<集_S陰_S陽>.若 [:<集_S陰_S陽> :<集_S陰_S陽>？] [甲 :S物？] [乙 :S物？]) :S物？]{若@語[:<集_S陰_S陽>]是@語[其:S陽]，則返回@語[乙]，否則返回@語[丙]。}

@subsubsection{列}
@述化[(:S列？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(:S列/連？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(->S列/連 [首 :S物？] [尾 :S物？]) :S列/構？]
@述化[(S列/連.首 [:S列/連 :S列/連？]) :S物？]
@述化[(S列/連.尾 [:S列/連 :S列/連？]) :S物？]
@述化[(:S列/空？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述值[其:S列/空 :S列/空？ #:value ()]

@subsubsection{名}
@述化[(:S名？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(:S名/文？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(:S名/構？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(->S名/構 [:S名 :S物？] [:S列 :S物？]) :S名/構？]{@語[:S名]一般是@語[:S名]。@語[:S列]一般是@語[:S列]。}
@述化[(S名/S構.:S名 [:S名/構 :S名/構？]) :S物？]
@述化[(S名/S構.:S列 [:S名/構 :S名/構？]) :S物？]

@subsubsection{表}
@述化[(:S表？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述值[空:S表 :S表？]
@述化[(S表.增 [:S表 :S表？] [名 :S物？] [:S物 :S物？]) :S表？]{原來沒有，是增。}
@述化[(S表.改 [:S表 :S表？] [名 :S物？] [:S化 (-> :S物？ :S物？)]) :S表？]
@述化[(S表.取 [:S表 :S表？] [名 :S物？]) :S物？]
@述化[(S表.含？ [:S表 :S表？] [名 :S物？]) :<集_S陰_S陽>？]
@述化[(S表.删 [:S表 :S表？] [名 :S物？]) :S表？]{必須有，才能刪。}
@述化[(S表->S列 [:S表 :S表？]) (listof (list/c any/c any/c))]

@subsubsection{集}
@述化[(:S集？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述值[空:S集 :S集？]
@述化[(S集.增 [:S集 :S集？] [:S物 :S物？]) :S集？]{原來沒有，是增。}
@述化[(S集.含？ [:S集 :S集？] [:S物 :S物？]) :<集_S陰_S陽>？]
@述化[(S集.删 [:S集 :S集？] [:S物 :S物？]) :S集？]{必須有，才能刪。}
@述化[(S集->S列 [:S集 :S集？]) (listof any/c)]

@subsubsection{化}
@述化[(:S化？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(->S化 [形 :S物？] [:S物 :S物？]) :S化？]{@語[形]類似Scheme，不是@語[:S列]的當成@racket[symbol?]。}
@述化[(S化.形 [:S化 :S化？]) :S物？]
@述化[(S化.:S物 [:S化 :S化？]) :S物？]
@述化[(S化.用 [:S化 :S化？] [形 :S物？]) :S物？]{如果@語[形]和@語[:S物]不能匹配，這個@語[:S誤]是@語[形]產生的。}

@subsubsection{式}
@述化[(:S式？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(->S式 [:S化 :S物？]) :S式？]{@語[化]一般是@語[(-> :S表？ :S物？ ... :S物？)]。}
@述化[(S式-> [:S式 :S式？]) :S物？]

@subsubsection{構}
@述化[(:S構？ [:S物 (非 :S誤？)]) :<集_S陰_S陽>？]
@述化[(->S構 [:S名 :S物？] [:S列 :S物？]) :S構？]{@語[:S名]一般是@語[:S名]，@語[:S列]一般是@語[:S列]。}
@述化[(S構.:S名 [:S構 :S構？]) :S物？]
@述化[(S構.:S列 [:S構 :S構？]) :S物？]

@subsubsection{誤}
@述化[(:S誤？ [:S物 :S物？]) :<集_S陰_S陽>？]
@述化[(->S誤 [:S物 :S物？]) :S誤？]
@述化[(S誤-> [:S誤 :S誤？]) :S物？]

@section{誤}
@subsection{無}
替換：在進行0或更多次替換後，可以把沒有結果（需要無限的時間的）的任意個@語[:S物]替換爲@語[(->S誤 (->S構 {!引 誤/界/無} <未定義>))]，@語[<未定義>]是任意的@語[:S物]。

實現應該儘量避免無限的運行下去。

實現應該儘量避免無用的替換。
@subsection{化}
內置的任何@語[:S化]產生的@語[:S誤]是@語[(->S誤 (->S構 {!引 誤/界/化} ((->S化 '(:S列) ':S列) <:S名> <式> <位:S名>)))]，
@語[<:S名>]是它的名稱，@語[<式>]是它的參數，@語[<位:S名>]是產生@語[:S誤]的參數的名稱。

@section{類Racket語法}
每個vector和symbol會被轉換爲一個@語[:S名]。

WIP
