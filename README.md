# probability-notes

《概率论与数理统计》的讲义式笔记，章序跟着任课老师的课件走。版式照 `probability.cls`，一章一个 `.tex`，用 XeLaTeX 编译成 PDF。

作者：不胖只是圆。

## 来源与版权

内容依据西湖大学本科生课程《概率论与数理统计》的教学大纲（V3.0）与配套课件（Bai Lin，Westlake University，Fall 2026）整理。课件与大纲的著作权归原权利人，本仓库只是把上课的东西重新写了一遍笔记。

笔记正文（`chapters_zh/*.tex`、README、`probability.cls`）以 [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/) 授权，可署名转载、不得商用。细节见 [LICENSE](LICENSE)。

课件里的定理陈述、表格数字和例题数据保留原值，方便对着核答案；推导补全、评注和「本章容易踩的地方」都是笔记自己的话。

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
├── probability.cls      版式与盒子环境（定义/定理/命题/例题/注/证明）
├── chapters_zh/         章源文件，chap_0x.tex
├── build/               编译产物，不进 Git
├── notes/               旧 markdown 版，已归档
├── LICENSE
└── README.md
```

`probability.cls` 里放全部导言区：纸张、字体、配色、环境、编号规则。章文件里只有 `\section` / `\subsection` 和正文，换版式改 cls，不碰章。

## 进度

| # | 章节 | 讲义 | 状态 |
|---|---|---|---|
| 01 | 统计学引论 Introduction to Statistics | Ch 1 | 初稿 |
| 02 | 描述统计 Descriptive Statistics | Ch 2 | 初稿 |
| 03 | 多维随机变量 | 待定 | 初稿（章号待归位） |
| 04 | 随机变量与期望 Random Variables and Expectation | Ch 4 | 初稿 |

`chap_03.tex` 是多维随机变量，写在课件到手之前，位置还没落定。Ch 4 到手后看清了课件的编排：它先讲一元随机变量与期望，多维随机变量排在后面。所以 `chap_03` 将来要往后挪，等对应章课件到手再改名归位；在那之前它仍被编进 PDF，只是章号对不上课程进度。内容上和 Ch 4 的联合分布一节有重叠，归位时要顺手把重复的推导并到一处。

学校那份本科教学大纲（16 讲 / 48 学时）和课件的章节顺序并不完全重合：大纲第 1 讲就是随机事件与古典概型，课件前两章却在讲统计学和描述统计。笔记以课件为准，大纲只当清单用来查漏——具体差在哪，记在 issue #1。

## 怎么写一章

新建 `chapters_zh/chap_0x.tex`，开头一个 `\section`，再按小节奏展开，然后回 `Probability_zh.tex` 加一行 `\input`。正文只用这几个环境：

- `definition`：定义，橙色框
- `theorem`：定理，紫色框
- `proposition`：命题（结论＋要点），蓝色框
- `example`：例题，绿色框
- `remark`：注，灰色框
- `proof`：证明，不编号、不带框，末尾自动出方块

编号自动按「章.节.序号」出，例如 `3.1.2`，不用手写。

正文的写法约定：先讲清“这件事为什么值得看”，再给形式化的东西，最后指出坑在哪。绕一步才做得出的例题要写出来，只套公式的可以省。课件里的例题尽量保留原始数字，方便对答案。

## 挑错

发现笔误、错式、编译错误，开 issue，写清楚：

- 哪一章、哪一节
- 页码或小节编号
- 原文那行 / 出错的那条命令

页数会随改动漂，所以章节编号比页码可靠，两个都给最好。

## 说明

早期用 markdown 写，现改为 LaTeX 讲义体，旧文件留在 `notes/` 只作对照，不再更新。
