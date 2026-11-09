# probability-notes

《概率论与数理统计》的讲义式笔记。版式照 `probability.cls` 走，一章一个 `.tex` 文件，用 XeLaTeX 编译成 PDF。

作者：不胖只是圆。

## 编译

```bash
latexmk -xelatex -interaction=nonstopmode -file-line-error \
  -output-directory=build Probability_zh.tex
```

只需要 XeLaTeX（中文走 `ctex` + `fandol`，不用额外装中文字体）。产物在 `build/`，已被 `.gitignore` 排除。

编好的 PDF 建议放 [Releases](https://github.com/NotFatJustRound/probability-notes/releases)。

## 目录结构

```text
probability-notes/
├── Probability_zh.tex   入口：标题、目录、\input 各章
├── probability.cls      版式与四色盒子（定义/定理/命题/例题）
├── chapters_zh/         章源文件，chap_0x.tex
├── build/               编译产物，不进 Git
├── notes/               旧 markdown 版，已归档
└── README.md
```

`probability.cls` 里放全部导言区：纸张、字体、配色、四个环境、编号规则。章文件里只有 `\section` / `\subsection` 和正文，换版式改 cls，不碰章。

## 进度

对照西湖大学本科《概率论与数理统计》（16 讲 / 48 学时）排的章：

| # | 章节 | 大纲讲次 | 状态 |
|---|---|---|---|
| 01 | 随机事件与概率 | 1–2 | 待写 |
| 02 | 一维随机变量及其分布 | 3–4 | 待写 |
| 03 | 多维随机变量 | 7–8 | 初稿 |
| 04 | 随机变量的数字特征 | 5–6 | 待写 |
| 05 | 条件分布、大数定律与中心极限定理 | 9 | 待写 |
| 06 | 参数估计 | 10–11 | 待写 |
| 07 | 假设检验 | 12–14 | 待写 |
| 08 | 回归分析 | 15–16 | 待写 |

章号按写作排，不完全跟讲次走：数字特征在课上排在多维之前（第 5、6 讲），但题里要用多维的语言，先写多维更顺手，所以它排到 04。要按讲次重排也只是一次文件改名的事。

## 怎么写一章

新建 `chapters_zh/chap_0x.tex`，开头一个 `\section`，再按小节奏展开，然后回 `Probability_zh.tex` 加一行 `\input`。正文只用四个环境：

- `definition`：定义，橙色框
- `theorem`：定理，紫色框
- `proposition`：命题（结论＋要点），蓝色框
- `example`：例题，绿色框

编号自动按「章.节.序号」出，例如 `3.1.2`，不用手写。

正文的写法约定：先讲清“这件事为什么值得看”，再给形式化的东西，最后指出坑在哪。绕一步才做得出的例题要写出来，只套公式的可以省。

## 挑错

发现笔误、错式、编译错误，开 issue，写清楚：

- 哪一章、哪一节
- 页码或小节编号
- 原文那行 / 出错的那条命令

页数会随改动漂，所以章节编号比页码可靠，两个都给最好。

## 说明

早期用 markdown 写，现改为 LaTeX 讲义体，旧文件留在 `notes/` 只作对照，不再更新。
