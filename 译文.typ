////////////////////////////////////////////////////////////////////
///////////////////////////  Settings  ////////////////////////////
////////////////////////////////////////////////////////////////////
#import "@preview/fletcher:0.5.5" as fletcher: diagram, node, edge
#show link: set text(red)

// 定理环境
#import "@preview/theorion:0.4.1": *  // Theorem environment
// #import cosmos.fancy: *
// #import cosmos.rainbow: *
// #import cosmos.clouds: *
#show: show-theorion

// 引用
#set quote(block: true)

#show quote: block.with(  // code block
  fill: luma(220),  // background color
  inset: 9pt
)  // distance between text and the edge


// 地区
#set text(lang: "zh", region: "cn")
#set text(size: 12pt)

// 正文字体
#set text(font: (
  (name: "libertinus serif"),
  "Noto Serif CJK SC"
))

// 数学字体
#show math.equation: set text(font: (
  (name: "New Computer Modern Math", covers: "latin-in-cjk"), // 西文
  "Noto Serif CJK SC", // 中文
))

// Paragraph indent

// Enable justification
#set par(justify: true)

// Set the separator between term list and content
#set terms(separator: [*:* ])

// 列表样式
#set enum(numbering: "(i)")

////////////////////////////////////////////////////////////////////
////////////////////////////  Title  ///////////////////////////////
////////////////////////////////////////////////////////////////////
// Title
#align(center, text(25pt)[
  *抽象代数 II 翻译作业*
])

// Author and date
#grid(
  columns: (1fr),
  align(left)[
    #text(15pt)[
译者：*秦宇轩* \
学号：*10230325* \
班级：*数学与应用数学 2 班* \
选择材料：*《模的基本概念和同态同构定理》*（即翻译材料 2）\
翻译原则：直译，最大程度地保留原文件面貌，诸编号均与原文件同。

  ]],
)



///////////////////////////////////////////////////////////////////
////////////////////////  Table of Contents  //////////////////////
///////////////////////////////////////////////////////////////////
\
#line(length: 100%)
\

#set par(first-line-indent: (amount: 2em, all: true))
/ 命题 2.7: 令 $T: attach(bold("Mod"), bl: R,) -> bold("Ab")$ 是加性函子，协变性任意。则

+ 若 $0: A -> B$ 是零映射，即对于任意 $a in A$，作用为 $a |-> 0$ 的映射，则 $T(0) = 0$.
+ $T({0}) = {0}$.
#proof[
+ 因为 $T$ 是加性函子，同态集之间的函数 $T_(A B)$ 自然是个同态，因此它保持恒同映射，也就是说，$T(0) = 0$.
+ 若 $A$ 是左 $R$-模，则 $0 = 1_A$ 当且仅当 $A = {0}$【充分性显然，至于必要性，如果 $1_A = 0$，则对任意 $a in A$，有 $a = 1_A (a) = 0 (a) = 0$，所以 $A = {0}$】。由 (i)，我们得到 $T(1_({0})) = T(0) = 0$，所以 $T({0}) = {0}$.
]

我们现在要说明，许多适用于交换群和向量空间的构造，都能被推广到任意环上的左模。如果某个左 $R$-模 $S$ 被包含在一个更大的左 $R$-模 $M$ 中，而且满足对任意 $s, s' in S$、$r in R$，$s + s'$ 和 $r s$ 在 $S$ 中各自的取值与在 $M$ 中各自的取值相同，我们就说 $S$ 是个*子模*。

/ 定义: 设 $M$ 是左 $R$-模，则 $M$ 的子模 $N$ 定义为 $M$ 的一个关于数乘封闭的加性子群：对任意 $n in N$ 和 $r in R$ 有 $r n in N$. 对右模有类似定义。

/ 例子 2.8: 
+ $ZZ$-模（即交换群）的子模就是子群，向量空间的子模就是子空间。

+ ${0}$ 和 $M$ 都是模 $M$ 的子模。若 $M$ 的子模 $N subset.eq M$ 满足 $N != M$，则称其为*真子模*。此时记为 $N subset.neq M$.

+ 若将环 $R$ 视为自身的左模，则它的子模就是一个左理想；当 $I$ 是真左理想时，它也是真子模。类似地，若将环 $R$ 视为自身的右模，则它的子模就是右理想。

+ 若 $R$ 是交换环，$M$ 是 $R$-模且 $r in R$，则
  $ r M = {r m: m in M} $
  是 $M$ 的子模。这个例子有如下推广：若 $J$ 是环 $R$ 的理想，且 $M$ 是 $R$-模，则
  $ J M = {sum_i j_i m_i: j_i in J " 且 " m_i in M} $
  是 $M$ 的子模。

+ 若 $S$ 和 $T$ 均是左模 $M$ 的子模，则
  $ S + T = {s + t: s in S " 且 " t in T} $
  是个包含 $S$ 和 $T$ 的 $M$-子模。

+ 若 $(S_i)_(i in I)$ 是左 $R$-模的一族子模，则 $inter.big_(i in I) S_i$ 仍是 $M$ 的子模。

+ 若左 $R$-模 $S$ 满足存在 $s in S$ 使得 $S = {r s: r in R}$，则称其为*循环的*。若 $M$ 是 $R$-模，且 $m in M$，则定义 *$m$ 生成的循环子模* $chevron.l m chevron.r$ 为：
  $ chevron.l m chevron.r = {r m: r in R}. $
  更一般地，若 $X$ 是 $R$-模 $M$ 的子集，则定义 $X$ 中元素的全体 *$R$-线性组合*为
  $ chevron.l X chevron.r = {sum_("有限") r_i x_i: r_i in R " 且 " x_i in X}. $
  我们称 $chevron.l X chevron.r$ 为 *$X$ 生成的子模*。第 66 页的练习 2.10 指出：$chevron.l X chevron.r = inter.big_(X subset.eq S) S$.


/ 定义: 如果左 $R$-模 $M$ 可由有限集生成，也就是说，存在有限子集 $X = {x_1, ..., x_n}$ 使得 $M = chevron.l X chevron.r$，则称 $M$ 为*有限生成的*。

/ 定义: 设 $N$ 是左 $R$-模 $M$ 的子模，则定义它们的商模为商群 $M slash N$【回忆：$M$ 是交换群且 $N$ 是子群】，并配备如下数乘
  $ r(m + N) = r m + N. $
  *自然投影*#footnote[原文作 “The natural map”，因汉语无冠词，此处据文义略去 “The” 不翻，并补译为 “投影”] $pi: M -> M slash N$ 定义为 $m |-> m + N$，容易看出这是个 $R$-映射。

商模定义中的数乘确是良定义的：若 $m + N = m' + N$，则 $m - m' in N$。所以 $r(m - m') in N$（因为 $N$ 是子模），$r m - r m' in N$，而且 $r m + N = r m' + N$. 

/ 例子 2.9: 设 $N subset.eq M$ 是个仅仅是个加性子群，而非子模，则交换群 $M slash N$ 并不是 $R$-模。譬如域 $k$ 上的向量空间 $V$。若 $a in k$ 且 $v in V$，则 $a v = 0$ 当且仅当 $a = 0$ 或 $v = 0$【若 $a != 0$，则 $0 = a^(-1)(a v) = (a^(-1) a) v = v$】。现在考虑 $QQ$，它是自身上的向量空间，但 $QQ slash ZZ$ 并不是 $QQ$ 上的向量空间【注意在 $QQ slash ZZ$ 中有 $2 (1/2 + ZZ) = ZZ$，但诸因子均不为零】。

/ 例子 2.10:
+ 回忆：环 $R$ 的加性子群 $J subset.eq R$ 是*双边理想*，若对任意 $x in J$ 及 $r in R$ 蕴含 $r x in J$ 且 $x r in J$. 若 $R = "Mat"_2 (k)$，即域 $k$ 上的 $2 times 2$ 矩阵环，则 $I = {mat(a, 0; b, 0;): a, b in k}$ 即是左理想，且 $I' = {mat(a, b; 0, 0;): a, b in k}$ 是右理想，但是它们都不是双边理想。

+ 若 $J$ 是 $R$ 的左（右）理想，则 $R slash J$ 是左（右）$R$-模。若 $J$ 是双边理想，则 $R slash J$ 还是个环，乘法为
  $ (r + J)(s + J) = r s + J. $
  这个乘法确是良定义的，若 $r + J = r' + J$ 且 $s + J = s' + J$，则 $r s + J = r' s' + J$，因为
  $ r s - r' s' = r s + r' s - r' s' = (r - r')s + r'(s - s') in J. $

我们继续把交换群和向量空间中的定义推广到模上。

/ 定义: 若 $f: M -> N$ 是左 $R$-模之间的 $R$-映射，则定义
  / $f$ 的核: $ker f = {m in M: f(m) = 0}$；
  / $f$ 的像: $im f = {n in N: exists m in M " 使得 " n = f(m)}$；
  / $f$ 的余核: $"coker" f = N slash im f$.

$ker f$ 是 $M$ 的子模、$im f$ 是 $N$ 的子模这两点都是常规验证。

/ 定理 2.11（第一同构定理）: 若 $f: M -> N$ 是左 $R$-模之间的 $R$-映射，则有如下 $R$-同构：
  $ phi: M slash ker f -> im f $
  在对象层面定义为：
  $ phi: m + ker f |-> f(m). $
#proof[
视 $M$ 和 $N$ 均只为交换群，则群的第一同构定理告诉我们 $phi: M slash ker f -> im f$ 是交换群间良定义的同构。但进一步，$phi$ 还是一个 $R$-映射：若 $r in R$ 且 $m in M$，则 $phi(r(m + N)) = phi(r m + N) = f(r m)$；因为 $f$ 是 $R$-映射，然而 $f(r m) = r f (m) = r phi(m + N)$，此即为所求。

#align(center, diagram({
   node((-1, -1), [$M$])
   node((-1, 1), [$M slash ker f$])
   node((1, -1), [$N$])
   node((1, 1), [$im f$])
   edge((-1, -1), (-1, 1), [$"nat"$], label-side: right, "->")
   edge((-1, -1), (1, -1), [$f$], label-side: left, "->")
   edge((-1, 1), (1, 1), [$phi$], label-side: right, "-->")
   edge((1, -1), (1, 1), [$"inc"$], label-side: left, "<-")
   edge((-1, -1), (1, 1), "->")
}))
]

第二、第三同构定理都是第一同构定理的推论。

/ 定理 2.12（第二同构定理）: 若 $S$ 和 $T$ 都是左 $R$-模 $M$ 的子模，则有如下 $R$-同构：
  $ S slash (S inter T) -> (S + T) slash T. $
#proof[
  若 $pi: M -> M slash T$ 是自然投影，则 $ker pi = T$；定义 $f = pi|_S$ 使得 $f: S -> M slash T$. 则对于
  $ ker f = S inter T "  且  " im f = (S + T) slash T, $
  这是因为 $(S + T) slash T$ 由 $M slash T$ 中全体有代表元在 $S$ 中的余集组成。此时可用第一同构定理。
]

/ 定义: 若 $T subset.eq S subset.eq M$ 是左 $R$-模 $M$ 的子模塔，则定义*余集扩大* $e: M slash T -> M slash S$ 为：
  $ e: m + T |-> m + S $
  （$e$ 确是良定义的，因为若 $m + T = m' + T$，则 $m - m' in T subset.eq S$ 且 $m + S = m' + S$）。

/ 定理 2.13（第三同构定理）: 若 $T subset.eq S subset.eq M$ 是左 $R$-模 $M$ 的子模塔，则余集扩大 $e: M slash T -> M slash S$ 诱导如下 $R$-同构：
  $ (M slash T) slash (S slash T) -> M slash S. $
#proof[
读者可自行验证 $ker e = S slash T$ 且 $im e = M slash S$，此时可用第一同构定理。
]

若 $f: M -> N$ 是左 $R$-模之间的映射且 $S subset.eq N$，则读者可自行检验 $f^(-1)(S) = {m in M: f(m) in S}$ 是包含 $f^(-1)({0}) = ker f$ 的 $M$-子模。

/ 定理 2.14（对应定理）: 若 $T$ 是左 $R$-模 $M$ 的子模，则 $phi: S |-> S slash T$ 是双射：
  $ phi: {"中间子模 " T subset.eq S subset.eq M} -> {M slash T " 的子模"}. $
  
  进一步有：$T subset.eq S subset.eq S'$ 当且仅当在 $M slash T$ 中有 $S slash T subset.eq S' slash T$.
#proof[
因为模都是加性交换群，所以子模都是子群，因此群的对应定理告诉我们 $phi$ 是保含入的单射：在 $M$ 中有 $S subset.eq S'$ 当且仅当在 $M slash T$ 中有 $S slash T subset.eq S' slash T$. 进一步，$phi$ 还是满的：若 $S^* subset.eq M slash T$，则存在唯一一个满足 $S^* = S slash T$ 的子模 $S supset.eq T$. 本证明剩下的部分就是群版本证明的重复，只需要验证子模的像与原像都还是子模就行。
]

能应用对应定理的时候，我们通常不显式指出，而是悄悄地直接用了：对 $M slash T$ 的子模 $S^*$ 而言，存在唯一一个中间子模 $S$ 满足 $S^* = S slash T$.

下面是一个环论版本的对应定理。

/ 定理 2.15（环的对应定理）: 若 $I$ 是环 $R$ 的双边理想，则 $phi: J |-> J slash I$ 是双射：
  $ phi: {"中间左理想 " I subset.eq J subset.eq R} -> {R slash I " 的左理想"}. $
  进一步，在 $R$ 中有 $I subset.eq J subset.eq J'$ 当且仅当在 $R slash I$ 中有 $J slash I subset.eq J' slash I$.
#proof[
读者可自行补充一个类似于定理 2.14 的证明。
]

/ 命题 2.16: 左 $R$-模 $M$ 是循环模当且仅当存在左理想 $I$，使得 $M tilde.equiv R slash I$.
#proof[
若 $M$ 是循环模，则存在 $m in M$ 使得 $M = chevron.l m chevron.r$. 定义 $f: R -> M$ 为 $f(r) = r m$. 则因 $M$ 循环，有 $f$ 满，且它的核是 $R$ 的子模，即 $ker f$ 等于某个左理想 $I$. 则由第一同构定理有 $R slash I tilde.equiv M$.

反过来，$R slash I$ 确是循环的，它有生成元 $m = 1 + I$.
]

/ 定义: 若左 $R$-模 $M != {0}$ 没有非零真子模，即 ${0}$ 和 $M$ 是 $M$ 仅有的子模，则称 $M$ 为*单模*（或*不可约模*）。

/ 推论 2.17: 左 $R$-模 $M$ 单当且仅当存在极大左理想 $I$ 使得 $M tilde.equiv R slash I$.
#proof[
由对应定理立得。
]

举个例子：交换群 $G$ 单，当且仅当存在素数 $p$ 使得 $G$ 是 $p$ 阶循环群。极大左理想的存在性保证了单模的存在性。

\
\
#align(right)[译完。]
#line(length: 100%)
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\
\

= 翻译说明
本文件为吉林大学数学与应用数学专业课 “抽象代数 II” 的翻译作业，以下是本文件的基本信息：

- 排版引擎：Typst `0.14.0`；
- 本文件源代码俱开源于 `https://github.com/YuxuanQin/jilin-univ-algebra-II`

我承诺本译文均由本人独立完成。


