# CS224W 文献阅读路线

这份清单来自本地 `slides/` 目录下 20 份 CS224W PDF 的文本扫描。这里的“文献”包括 slides 中明确出现的论文、书籍、survey、方法出处和重要背景论文；不等同于官方 syllabus 的必读列表。

我把它分成两层：

- **新人主线**：按学习逻辑排序，优先读这些就能搭起领域骨架。
- **完整来源索引**：按 lecture/slide 文件列出出现过的文献，方便回到课件定位。

对于 slides 只给了作者年份或 venue、无法唯一确定题名的条目，我放在最后的“需核对”部分，不把猜测写成确定结论。

## 如何使用这份清单

如果你是第一次系统看 graph ML，建议按下面节奏读：

1. 先读主线里的每个阶段，理解“问题是什么”和“为什么需要下一个方法”。
2. 每个阶段只精读 1-3 篇核心论文，其余先看摘要、图和实验设置。
3. 看 lecture 时，用“完整来源索引”回查原论文，不要一开始就被所有引用淹没。
4. 做 project 前再回到专题选读：知识图谱、推荐、社区、motif、图生成、几何深度学习各选一条线深入。

## 一条新人主线

### 阶段 0：图和网络科学直觉

目标：先知道图为什么特殊：节点没有固定顺序，局部连接能产生全局结构，边的模式本身就携带信息。

优先阅读：

- Easley and Kleinberg, *Networks, Crowds, and Markets*, 2010。读网络效应、搜索、信息传播、博弈相关章节即可，不必全书通读。
- Granovetter, *The Strength of Weak Ties*, 1973。理解弱连接为什么对社区之间的信息流重要。
- Brin and Page, *The Anatomy of a Large-Scale Hypertextual Web Search Engine*, 1998。理解 PageRank 如何把链接结构变成节点重要性。
- Broder et al., *Graph Structure in the Web*, 2000。看 Web 图的 bow-tie 结构，建立大规模真实图的直觉。

### 阶段 1：传统节点/图表示学习

目标：理解 GNN 出现前，人们如何把图结构变成向量。

优先阅读：

- Perozzi, Al-Rfou and Skiena, *DeepWalk: Online Learning of Social Representations*, KDD 2014。
- Grover and Leskovec, *node2vec: Scalable Feature Learning for Networks*, KDD 2016。
- Tang et al., *LINE: Large-scale Information Network Embedding*, WWW 2015。
- Qiu et al., *Network Embedding as Matrix Factorization: Unifying DeepWalk, LINE, PTE, and node2vec*, WSDM 2018。
- Shervashidze et al., *Weisfeiler-Lehman Graph Kernels*, JMLR 2011。

读法：先把 DeepWalk/node2vec 看成“在图上造句子再做 word2vec”；再看 LINE 的一阶/二阶相似性；最后用 Qiu et al. 理解这些方法背后的矩阵分解视角。图级任务则从 graphlet kernel 和 WL kernel 建立 baseline 思维。

### 阶段 2：GNN 基础

目标：掌握 message passing：每层从邻居聚合信息，然后更新自身表示。

优先阅读：

- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。
- Hamilton, Ying and Leskovec, *Inductive Representation Learning on Large Graphs*, NeurIPS 2017。
- Velickovic et al., *Graph Attention Networks*, ICLR 2018。
- Gilmer et al., *Neural Message Passing for Quantum Chemistry*, ICML 2017。
- Battaglia et al., *Relational inductive biases, deep learning, and graph networks*, 2018。

读法：GCN 是最简洁的谱/空间桥梁；GraphSAGE 解决 inductive 和邻居采样；GAT 把邻居权重学出来；MPNN/Graph Networks 给出统一抽象。

### 阶段 3：GNN 表达能力、深度和训练规模

目标：理解 GNN 不是“堆层数就好”，它有表达能力、过平滑、采样、计算冗余和泛化问题。

优先阅读：

- Xu et al., *How Powerful Are Graph Neural Networks?*, ICLR 2019。
- Xu et al., *Representation Learning on Graphs with Jumping Knowledge Networks*, ICML 2018。
- You, Ying and Leskovec, *Design Space for Graph Neural Networks*, NeurIPS 2020。
- You, Gomes-Selman, Ying and Leskovec, *Identity-aware Graph Neural Networks*, AAAI 2021。
- Chiang et al., *Cluster-GCN: An Efficient Algorithm for Training Deep and Large Graph Convolutional Networks*, KDD 2019。
- Huang et al., *Combining Label Propagation and Simple Models Out-performs Graph Neural Networks*, ICLR 2021。

读法：GIN 解释“什么样的聚合函数更有表达力”；JK/GeniePath 解释多跳 receptive field 怎么控制；Design Space 帮你把 GNN 当成可系统调参的模型族；Cluster-GCN/HAG/SGC/C&S 是工业规模训练和简化模型的关键。

### 阶段 4：知识图谱

目标：理解多关系图中 entity/relation 的建模，以及为什么 KG completion 常见设定是给定 `(head, relation)` 预测 `tail`。

优先阅读：

- Schlichtkrull et al., *Modeling Relational Data with Graph Convolutional Networks*, ESWC 2018。
- Bordes et al., *Translating Embeddings for Modeling Multi-relational Data*, NeurIPS 2013。
- Lin et al., *Learning Entity and Relation Embeddings for Knowledge Graph Completion*, AAAI 2015。
- Yang et al., *Embedding Entities and Relations for Learning and Inference in Knowledge Bases*, ICLR 2015。
- Trouillon et al., *Complex Embeddings for Simple Link Prediction*, ICML 2016。
- Sun et al., *RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space*, ICLR 2019。
- Hamilton et al., *Embedding Logical Queries on Knowledge Graphs*, NeurIPS 2018。
- Ren et al., *Query2box: Reasoning over Knowledge Graphs in Vector Space Using Box Embeddings*, ICLR 2020。

读法：先看 TransE/TransR 的几何打分，再看 DistMult/ComplEx/RotatE 如何修复对称性、反对称性、反演等关系模式；最后看 GQE/Query2Box，从单条 triple completion 过渡到复杂逻辑查询。

### 阶段 5：推荐系统、社区和 motif

目标：把图学习落到三个常见结构任务：用户-物品排序、社区检测、子图模式发现。

优先阅读：

- Rendle et al., *BPR: Bayesian Personalized Ranking from Implicit Feedback*, UAI 2009。
- Ying et al., *Graph Convolutional Neural Networks for Web-Scale Recommender Systems*, KDD 2018。
- He et al., *LightGCN: Simplifying and Powering Graph Convolution Network for Recommendation*, SIGIR 2020。
- Blondel et al., *Fast Unfolding of Communities in Large Networks*, J. Stat. Mech. 2008。
- Yang and Leskovec, *Community-Affiliation Graph Model for Overlapping Network Community Detection*, ICDM 2012。
- Yang and Leskovec, *Overlapping Community Detection at Scale: A Nonnegative Matrix Factorization Approach*, WSDM 2013。
- Milo et al., *Network Motifs: Simple Building Blocks of Complex Networks*, Science 2002。
- Ying et al., *Neural Subgraph Matching*, 2020。

读法：BPR 给推荐排序的 loss；PinSAGE/LightGCN 说明为什么用户-物品交互图可以做 message passing；Louvain/AGM/BigCLAM 是社区发现从非重叠到重叠的主线；motif/subgraph matching 则把任务从节点/边扩展到小结构。

### 阶段 6：图生成与几何深度学习

目标：理解图不只是输入，也可以是输出；以及“图”如何与集合、点云、分子、物理系统、流形统一起来。

优先阅读：

- You et al., *GraphRNN: Generating Realistic Graphs with Deep Auto-regressive Models*, ICML 2018。
- You et al., *Graph Convolutional Policy Network for Goal-Directed Molecular Graph Generation*, NeurIPS 2018。
- Sanchez-Gonzalez et al., *Learning to Simulate Complex Physics with Graph Networks*, ICML 2020。
- Bronstein et al., *Geometric Deep Learning: Going beyond Euclidean data*, 2017。
- Bronstein et al., *Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges*, 2021/2022。
- Zaheer et al., *Deep Sets*, NeurIPS 2017。
- Satorras et al., *E(n) Equivariant Graph Neural Networks*, ICML 2021。
- Fuchs et al., *SE(3)-Transformers: 3D Roto-Translation Equivariant Attention Networks*, NeurIPS 2020。

读法：GraphRNN 学会“生成一张图”；GCPN 把生成和目标优化结合；物理模拟展示 Graph Networks 的科学建模能力；几何深度学习把 permutation invariance/equivariance、群、流形、3D 对称性串起来。

## 核心必读清单

### 1. PageRank 原始论文

**Brin and Page, *The Anatomy of a Large-Scale Hypertextual Web Search Engine*, 1998**

- 解决的问题：如何在 Web 图中评估网页重要性。
- 核心思想：随机游走加 teleport，把链接投票转成稳态分布。
- 阅读重点：PageRank 方程、阻尼因子、链接图中的 authority 直觉。
- 后续连接：lecture 04 的 PageRank、random walk、node embedding 矩阵视角。

### 2. DeepWalk

**Perozzi, Al-Rfou and Skiena, *DeepWalk: Online Learning of Social Representations*, KDD 2014**

- 解决的问题：无监督学习节点 embedding。
- 核心思想：用随机游走产生节点序列，把节点当 word，用 Skip-gram 学 embedding。
- 阅读重点：random walk window、负采样、同质性假设。
- 后续连接：node2vec、metapath2vec、matrix factorization 解释。

### 3. node2vec

**Grover and Leskovec, *node2vec: Scalable Feature Learning for Networks*, KDD 2016**

- 解决的问题：DeepWalk 的随机游走策略太固定。
- 核心思想：用参数 `p` 和 `q` 在 BFS-like 与 DFS-like 游走间插值，分别偏向 homophily 与 structural equivalence。
- 阅读重点：二阶随机游走、alias sampling、不同任务下 `p/q` 的含义。
- 后续连接：struc2vec、role embedding。

### 4. LINE

**Tang et al., *LINE: Large-scale Information Network Embedding*, WWW 2015**

- 解决的问题：大规模图上高效学节点 embedding。
- 核心思想：分别保留一阶相似性和二阶相似性。
- 阅读重点：objective 怎么对应 edge reconstruction 和 context distribution。
- 后续连接：Qiu et al. 的统一矩阵分解视角。

### 5. DeepWalk/LINE/node2vec 的矩阵分解视角

**Qiu et al., *Network Embedding as Matrix Factorization: Unifying DeepWalk, LINE, PTE, and node2vec*, WSDM 2018**

- 解决的问题：为什么 random-walk embedding 有效。
- 核心思想：这些方法隐式分解不同形式的图统计矩阵。
- 阅读重点：DeepWalk 对 PMI 矩阵的近似、window size 与高阶 proximity 的关系。
- 后续连接：从 shallow embedding 过渡到 GNN。

### 6. WL Graph Kernel

**Shervashidze et al., *Weisfeiler-Lehman Graph Kernels*, JMLR 2011**

- 解决的问题：如何比较整张图。
- 核心思想：用 WL color refinement 迭代聚合邻居标签，把每轮标签计数作为图特征。
- 阅读重点：1-WL 的递归标签更新、subtree kernel。
- 后续连接：GIN 的表达能力分析。

### 7. GCN

**Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017**

- 解决的问题：半监督节点分类中如何利用图结构和节点特征。
- 核心思想：用归一化邻接矩阵做邻居特征传播，再线性变换和非线性。
- 阅读重点：`D^{-1/2} A D^{-1/2}`、self-loop、两层 GCN 为什么够用。
- 后续连接：GraphSAGE、SGC、C&S。

### 8. GraphSAGE

**Hamilton, Ying and Leskovec, *Inductive Representation Learning on Large Graphs*, NeurIPS 2017**

- 解决的问题：训练时没见过的新节点/新图如何得到 embedding。
- 核心思想：学习聚合函数，而不是直接为每个节点学一个向量。
- 阅读重点：mean/LSTM/pool aggregator、邻居采样、inductive setting。
- 后续连接：大规模 GNN 训练、PinSAGE。

### 9. GAT

**Velickovic et al., *Graph Attention Networks*, ICLR 2018**

- 解决的问题：邻居贡献不应总是平均或按度归一化。
- 核心思想：用 attention 学习每条邻边的权重。
- 阅读重点：masked self-attention、多头 attention、局部归一化。
- 后续连接：Graph Transformer、PinSAGE 的 importance pooling。

### 10. Message Passing Neural Networks

**Gilmer et al., *Neural Message Passing for Quantum Chemistry*, ICML 2017**

- 解决的问题：分子图性质预测中的图神经网络统一形式。
- 核心思想：message function、update function、readout function 三段式。
- 阅读重点：edge features 如何参与 message，graph-level readout 如何做。
- 后续连接：Graph Networks、分子生成、科学应用。

### 11. Graph Networks

**Battaglia et al., *Relational inductive biases, deep learning, and graph networks*, 2018**

- 解决的问题：把不同图神经网络、物理推理和关系推理放进一个统一框架。
- 核心思想：显式建模 node/edge/global attributes，并用共享函数更新。
- 阅读重点：relational inductive bias 是什么，为什么图适合对象关系建模。
- 后续连接：物理模拟、几何深度学习。

### 12. GIN


- 解决的问题：GNN 到底能区分哪些图结构。
- 核心思想：message passing GNN 的表达力最多到 1-WL；sum aggregation 加 MLP 可以达到 1-WL 级别。
- 阅读重点：mean/max/sum 聚合的区别、injective multiset function。
- 后续连接：ID-GNN、position-aware GNN、subgraph GNN。

### 13. Jumping Knowledge Networks

**Xu et al., *Representation Learning on Graphs with Jumping Knowledge Networks*, ICML 2018**

- 解决的问题：不同节点需要不同范围的邻域信息，深层 GNN 容易过平滑。
- 核心思想：从不同层跳接组合表示，让模型自适应选择 receptive field。
- 阅读重点：concat/max/LSTM 聚合层输出的区别。
- 后续连接：deep GNN design、Design Space。

### 14. Design Space for GNNs

**You, Ying and Leskovec, *Design Space for Graph Neural Networks*, NeurIPS 2020**

- 解决的问题：GNN 架构选择太散，缺少系统比较。
- 核心思想：把层内设计、层间连接、图级 pooling、训练 trick 拆成设计维度。
- 阅读重点：message/aggregation/update、skip connection、batch norm、dropout、层数。
- 后续连接：课程后半关于 GNN 工程实践的多处内容。

### 15. R-GCN

**Schlichtkrull et al., *Modeling Relational Data with Graph Convolutional Networks*, ESWC 2018**

- 解决的问题：多关系图/KG 上如何做 node classification 和 link prediction。
- 核心思想：每种 relation 使用不同的消息变换，并用 basis/block decomposition 控制参数量。
- 阅读重点：relation-specific transformation、inverse relation、decoder。
- 后续连接：TransE/TransR 与 KG completion。

### 16. TransE

**Bordes et al., *Translating Embeddings for Modeling Multi-relational Data*, NeurIPS 2013**

- 解决的问题：给 KG triple `(h, r, t)` 打分，补全缺失实体。
- 核心思想：让 `h + r` 接近 `t`。
- 阅读重点：margin ranking loss、负采样、1-to-N/N-to-1 关系的局限。
- 后续连接：TransR、RotatE。

### 17. TransR

**Lin et al., *Learning Entity and Relation Embeddings for Knowledge Graph Completion*, AAAI 2015**

- 解决的问题：实体空间和关系空间不一定相同。
- 核心思想：每个 relation 有自己的投影矩阵，把 entity embedding 投到 relation-specific space 后再做 translation。
- 阅读重点：`M_r` 的形状、`h_r = M_r h`、`t_r = M_r t`、打分函数。
- 后续连接：你问过的“给定 head 和 relation 怎么预测 tail”：训练时遍历 candidate tail，比较 `score(h, r, t)`。

### 18. DistMult / ComplEx / RotatE

**Yang et al., *Embedding Entities and Relations for Learning and Inference in Knowledge Bases*, ICLR 2015**<br>
**Trouillon et al., *Complex Embeddings for Simple Link Prediction*, ICML 2016**<br>
**Sun et al., *RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space*, ICLR 2019**

- 解决的问题：不同 KG 关系有对称、反对称、反演、组合等模式。
- 核心思想：DistMult 用双线性对角打分；ComplEx 用复数空间表达反对称；RotatE 把 relation 看成复平面旋转。
- 阅读重点：每个模型能/不能表达的 relation pattern。
- 后续连接：KG reasoning。

### 19. PinSAGE

**Ying et al., *Graph Convolutional Neural Networks for Web-Scale Recommender Systems*, KDD 2018**

- 解决的问题：Pinterest 级别 item graph 推荐。
- 核心思想：random-walk 采样邻居、importance pooling、mini-batch training。
- 阅读重点：item-item graph 如何构造，为什么不是全邻居聚合。
- 后续连接：GraphSAGE 和推荐系统结合。

### 20. LightGCN

**He et al., *LightGCN: Simplifying and Powering Graph Convolution Network for Recommendation*, SIGIR 2020**

- 解决的问题：推荐系统中 GCN 的 feature transform 和 nonlinear activation 是否必要。
- 核心思想：只保留邻居传播和层间 embedding 加权求和。
- 阅读重点：为什么 user-item bipartite graph 上简化反而更好。
- 后续连接：BPR loss、NGCF、SGC。

### 21. Louvain

**Blondel et al., *Fast Unfolding of Communities in Large Networks*, J. Stat. Mech. 2008**

- 解决的问题：大图上高效做非重叠社区发现。
- 核心思想：局部移动节点提升 modularity，然后把社区压缩成 super-node 递归。
- 阅读重点：modularity gain、两阶段循环。
- 后续连接：图聚类、Cluster-GCN、你问过的单细胞图聚类。

### 22. AGM / BigCLAM

**Yang and Leskovec, *Community-Affiliation Graph Model for Overlapping Network Community Detection*, ICDM 2012**<br>
**Yang and Leskovec, *Overlapping Community Detection at Scale: A Nonnegative Matrix Factorization Approach*, WSDM 2013**

- 解决的问题：真实网络中一个节点常属于多个社区。
- 核心思想：AGM 用 community affiliation 生成边；BigCLAM 把隶属关系放松成非负强度矩阵 `F`，用 likelihood 学出来。
- 阅读重点：`P(u, v) = 1 - exp(-F_u^T F_v)` 的含义。
- 后续连接：NOCD 用 GNN 生成 `F`。

### 23. Network Motifs

**Milo et al., *Network Motifs: Simple Building Blocks of Complex Networks*, Science 2002**

- 解决的问题：真实网络是否有显著高频的小子图模式。
- 核心思想：把真实图中的小子图计数和随机图 null model 比较。
- 阅读重点：motif 显著性、Z-score、不同网络类别的 motif 差异。
- 后续连接：frequent subgraph mining、NeuroMatch/SPMiner。

### 24. GraphRNN

**You et al., *GraphRNN: Generating Realistic Graphs with Deep Auto-regressive Models*, ICML 2018**

- 解决的问题：如何生成 realistic graph。
- 核心思想：把图生成转成节点序列和边序列的自回归生成。
- 阅读重点：node ordering、BFS ordering、graph-level likelihood。
- 后续连接：分子图生成、现代 diffusion graph generation。

### 25. Geometric Deep Learning

**Bronstein et al., *Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges*, 2021/2022**

- 解决的问题：把 CNN、GNN、Transformer、流形和等变网络放进统一几何框架。
- 核心思想：结构先验来自 domain 的 symmetry 和 invariance/equivariance。
- 阅读重点：permutation invariance、group equivariance、locality、scale separation。
- 后续连接：Deep Sets、Spherical CNN、SE(3)-Transformer、EGNN。

## 专题选读

### 图基础与网络分析

- Granovetter, *The Strength of Weak Ties*, 1973。
- Broder et al., *Graph Structure in the Web*, 2000。
- Easley and Kleinberg, *Networks, Crowds, and Markets*, 2010。
- Brin and Page, *The Anatomy of a Large-Scale Hypertextual Web Search Engine*, 1998。

### 传统图表示学习与 graph kernel

- Shervashidze et al., *Efficient Graphlet Kernels for Large Graph Comparison*, AISTATS 2009。
- Shervashidze et al., *Weisfeiler-Lehman Graph Kernels*, JMLR 2011。
- Perozzi et al., *DeepWalk: Online Learning of Social Representations*, KDD 2014。
- Tang et al., *LINE: Large-scale Information Network Embedding*, WWW 2015。
- Grover and Leskovec, *node2vec: Scalable Feature Learning for Networks*, KDD 2016。
- Dong et al., *metapath2vec: Scalable Representation Learning for Heterogeneous Networks*, KDD 2017。
- Ribeiro et al., *struc2vec: Learning Node Representations from Structural Identity*, KDD 2017。
- Chen et al., *HARP: Hierarchical Representation Learning for Networks*, AAAI 2018。
- Abu-El-Haija et al., *Watch Your Step: Learning Graph Embeddings Through Attention*, 2017。
- Ivanov and Burnaev, *Anonymous Walk Embeddings*, ICML 2018。
- Qiu et al., *Network Embedding as Matrix Factorization: Unifying DeepWalk, LINE, PTE, and node2vec*, WSDM 2018。
- Goyal and Ferrara, *Graph Embedding Techniques, Applications, and Performance: A Survey*, 2018。

### GNN 基础、理论与架构

- Bruna et al., *Spectral Networks and Locally Connected Networks on Graphs*, ICLR 2014。
- Duvenaud et al., *Convolutional Networks on Graphs for Learning Molecular Fingerprints*, NeurIPS 2015。
- Battaglia et al., *Interaction Networks for Learning about Objects, Relations and Physics*, NeurIPS 2016。
- Dai, Dai and Song, *Discriminative Embeddings of Latent Variable Models for Structured Data*, 2016。
- Defferrard, Bresson and Vandergheynst, *Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering*, NeurIPS 2016。
- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。
- Gilmer et al., *Neural Message Passing for Quantum Chemistry*, ICML 2017。
- Vaswani et al., *Attention Is All You Need*, NeurIPS 2017。
- Bronstein et al., *Geometric Deep Learning: Going beyond Euclidean data*, 2017。
- Monti et al., *Geometric Deep Learning on Graphs and Manifolds Using Mixture Model CNNs*, CVPR 2017。
- Hamilton, Ying and Leskovec, *Inductive Representation Learning on Large Graphs*, NeurIPS 2017。
- Velickovic et al., *Graph Attention Networks*, ICLR 2018。
- Xu et al., *Representation Learning on Graphs with Jumping Knowledge Networks*, ICML 2018。
- Ying et al., *Hierarchical Graph Representation Learning with Differentiable Pooling*, NeurIPS 2018。
- Zhang et al., *An End-to-End Deep Learning Architecture for Graph Classification*, AAAI 2018。
- Battaglia et al., *Relational inductive biases, deep learning, and graph networks*, 2018。
- Liu et al., *GeniePath: Graph Neural Networks with Adaptive Receptive Paths*, AAAI 2019。
- Xu et al., *How Powerful Are Graph Neural Networks?*, ICLR 2019。
- You et al., *Position-aware Graph Neural Networks*, ICML 2019。
- Hu et al., *Strategies for Pre-training Graph Neural Networks*, ICLR 2020。
- Ying et al., *GNNExplainer: Generating Explanations for Graph Neural Networks*, NeurIPS 2019。
- You et al., *Design Space for Graph Neural Networks*, NeurIPS 2020。
- You et al., *Identity-aware Graph Neural Networks*, AAAI 2021。

### 可扩展 GNN、鲁棒性与预训练

- Wu et al., *Simplifying Graph Convolutional Networks*, ICML 2019。
- Chiang et al., *Cluster-GCN: An Efficient Algorithm for Training Deep and Large Graph Convolutional Networks*, KDD 2019。
- Jia et al., *Redundancy-Free Computation for Graph Neural Networks*, KDD 2020。
- Karypis and Kumar, *A Fast and High Quality Multilevel Scheme for Partitioning Irregular Graphs*, SIAM 1998。
- Huang et al., *Combining Label Propagation and Simple Models Out-performs Graph Neural Networks*, ICLR 2021。
- Zügner, Akbarnejad and Günnemann, *Adversarial Attacks on Neural Networks for Graph Data*, KDD 2018。
- Sagawa et al., *Distributionally Robust Neural Networks for Group Shifts*, ICML 2020。
- Hendrycks et al., *Using Pre-Training Can Improve Model Robustness and Uncertainty*, ICML 2019。
- Mikolov et al., *Distributed Representations of Words and Phrases and their Compositionality*, NeurIPS 2013。

### 知识图谱与 KG reasoning

- Min et al., *Distant Supervision for Relation Extraction with an Incomplete Knowledge Base*, NAACL 2013。
- Bordes et al., *Translating Embeddings for Modeling Multi-relational Data*, NeurIPS 2013。
- Guu et al., *Traversing Knowledge Graphs in Vector Space*, EMNLP 2015。
- Lin et al., *Learning Entity and Relation Embeddings for Knowledge Graph Completion*, AAAI 2015。
- Yang et al., *Embedding Entities and Relations for Learning and Inference in Knowledge Bases*, ICLR 2015。
- Trouillon et al., *Complex Embeddings for Simple Link Prediction*, ICML 2016。
- Paulheim, *Knowledge Graph Refinement: A Survey of Approaches and Evaluation Methods*, Semantic Web 2017。
- Schlichtkrull et al., *Modeling Relational Data with Graph Convolutional Networks*, ESWC 2018。
- Hamilton et al., *Embedding Logical Queries on Knowledge Graphs*, NeurIPS 2018。
- Sun et al., *RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space*, ICLR 2019。
- Ren et al., *Query2box: Reasoning over Knowledge Graphs in Vector Space Using Box Embeddings*, ICLR 2020。

### 推荐系统

- Rendle et al., *BPR: Bayesian Personalized Ranking from Implicit Feedback*, UAI 2009。
- Wu et al., *Sampling Matters in Deep Embedding Learning*, ICCV 2017。
- Ying et al., *Graph Convolutional Neural Networks for Web-Scale Recommender Systems*, KDD 2018。
- Wang et al., *Neural Graph Collaborative Filtering*, SIGIR 2019。
- Wu et al., *Simplifying Graph Convolutional Networks*, ICML 2019。
- He et al., *LightGCN: Simplifying and Powering Graph Convolution Network for Recommendation*, SIGIR 2020。

### 社区发现

- Granovetter, *The Strength of Weak Ties*, 1973。
- Onnela et al., *Structure and Tie Strengths in Mobile Communication Networks*, 2007。
- Blondel et al., *Fast Unfolding of Communities in Large Networks*, J. Stat. Mech. 2008。
- Yang and Leskovec, *Community-Affiliation Graph Model for Overlapping Network Community Detection*, ICDM 2012。
- Yang and Leskovec, *Overlapping Community Detection at Scale: A Nonnegative Matrix Factorization Approach*, WSDM 2013。
- Shchur and Günnemann, *Overlapping Community Detection with Graph Neural Networks*, KDD 2019。

### Motif、子图匹配与 frequent subgraph mining

- Milo et al., *Network Motifs: Simple Building Blocks of Complex Networks*, Science 2002。
- Milo et al., *Superfamilies of Evolved and Designed Networks*, Science 2004。
- Ying et al., *Neural Subgraph Matching*, 2020。
- Ying, Fu et al., *Representation Learning for Frequent Subgraph Mining*, arXiv 2024。

说明：SPMiner 在 slides 中作为 frequent subgraph mining 的 embedding 方法出现；后续公开论文题名为 *Representation Learning for Frequent Subgraph Mining*。由于这篇论文时间晚于课程 slide 版本，文档中把它标作方法对应的后续正式论文。

### 图生成与科学应用

- Zitnik et al., *Modeling Polypharmacy Side Effects with Graph Convolutional Networks*, Bioinformatics 2018。
- You et al., *GraphRNN: Generating Realistic Graphs with Deep Auto-regressive Models*, ICML 2018。
- You et al., *Graph Convolutional Policy Network for Goal-Directed Molecular Graph Generation*, NeurIPS 2018。
- Sanchez-Gonzalez et al., *Learning to Simulate Complex Physics with Graph Networks*, ICML 2020。
- Stokes et al., *A Deep Learning Approach to Antibiotic Discovery*, Cell 2020。

### 几何深度学习 guest lecture

- Zaheer et al., *Deep Sets*, NeurIPS 2017。
- Santoro et al., *A Simple Neural Network Module for Relational Reasoning*, NeurIPS 2017。
- Kipf et al., *Neural Relational Inference for Interacting Systems*, ICML 2018。
- Wang et al., *Dynamic Graph CNN for Learning on Point Clouds*, ACM TOG 2019。
- Kazi et al., *Differentiable Graph Module*, MICCAI 2020。
- Velickovic et al., *Pointer Graph Networks*, NeurIPS 2020。
- Levie et al., *CayleyNets: Graph Convolutional Neural Networks with Complex Rational Spectral Filters*, IEEE Transactions on Signal Processing 2018。
- Cohen et al., *Spherical CNNs*, ICLR 2018。
- Fuchs et al., *SE(3)-Transformers: 3D Roto-Translation Equivariant Attention Networks*, NeurIPS 2020。
- Satorras et al., *E(n) Equivariant Graph Neural Networks*, ICML 2021。
- Masci et al., *Geodesic Convolutional Neural Networks on Riemannian Manifolds*, CVPR 2015。
- de Haan et al., *Gauge Equivariant Mesh CNNs*, ICLR 2021。
- Bronstein et al., *Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges*, 2021/2022。

## 按 lecture 的完整来源索引

### 01-intro

出现的文献和方法出处：

- Ying et al., *Graph Convolutional Neural Networks for Web-Scale Recommender Systems*, KDD 2018。
- Zitnik et al., *Modeling Polypharmacy Side Effects with Graph Convolutional Networks*, Bioinformatics 2018。
- Stokes et al., *A Deep Learning Approach to Antibiotic Discovery*, Cell 2020。
- You et al., *Graph Convolutional Policy Network for Goal-Directed Molecular Graph Generation*, NeurIPS 2018。
- Sanchez-Gonzalez et al., *Learning to Simulate Complex Physics with Graph Networks*, ICML 2020。

用途：用多个应用例子说明 graph ML 的任务范围：推荐、药物副作用、抗生素发现、分子生成、物理模拟。

### 02-tradition-ml

出现的文献和方法出处：

- Pržulj et al., Bioinformatics 2004。课件只给作者/期刊/年份，题名需核对。
- Shervashidze et al., *Efficient Graphlet Kernels for Large Graph Comparison*, AISTATS 2009。
- Shervashidze et al., *Weisfeiler-Lehman Graph Kernels*, JMLR 2011。

用途：传统图特征、graphlet、graph kernel、WL kernel。

### 03-nodeemb

出现的文献和方法出处：

- Perozzi et al., *DeepWalk: Online Learning of Social Representations*, KDD 2014。
- Grover and Leskovec, *node2vec: Scalable Feature Learning for Networks*, KDD 2016。
- Dong et al., *metapath2vec: Scalable Representation Learning for Heterogeneous Networks*, KDD 2017。
- Abu-El-Haija et al., *Watch Your Step: Learning Graph Embeddings Through Attention*, 2017。
- Tang et al., *LINE: Large-scale Information Network Embedding*, WWW 2015。
- Ribeiro et al., *struc2vec: Learning Node Representations from Structural Identity*, KDD 2017。
- Chen et al., *HARP: Hierarchical Representation Learning for Networks*, AAAI 2018。
- Duvenaud et al., *Convolutional Networks on Graphs for Learning Molecular Fingerprints*, NeurIPS 2015。
- Li et al., 2016。课件只给作者/年份和“general”表述，题名需核对。
- Ivanov and Burnaev, *Anonymous Walk Embeddings*, ICML 2018。

用途：node embedding、heterogeneous embedding、role/structural embedding、graph-level embedding。

### 04-pagerank

出现的文献和方法出处：

- Broder et al., *Graph Structure in the Web*, 2000。
- Brin and Page, *The Anatomy of a Large-Scale Hypertextual Web Search Engine*, 1998。
- Qiu et al., *Network Embedding as Matrix Factorization: Unifying DeepWalk, LINE, PTE, and node2vec*, WSDM 2018。

用途：PageRank、random walk、link analysis、network embedding 的矩阵分解解释。

### 05-message

出现的文献和方法出处：

- Huang et al., *Combining Label Propagation and Simple Models Out-performs Graph Neural Networks*, ICLR 2021。
- Zhu et al., ICML 2013。课件只给短标注，题名需核对。

用途：label propagation、collective classification、Correct and Smooth。

### 06-GNN1

出现的文献和方法出处：

- Bronstein, ICLR 2021 keynote。课件中作为 geometric deep learning 背景引用。
- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。
- Vaswani et al., *Attention Is All You Need*, NeurIPS 2017。

用途：GNN 的 permutation invariance、GCN 直觉、attention 背景。

### 07-GNN2

出现的文献和方法出处：

- Vaswani et al., *Attention Is All You Need*, NeurIPS 2017。
- You, Ying and Leskovec, *Design Space for Graph Neural Networks*, NeurIPS 2020。
- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。
- Hamilton, Ying and Leskovec, *Inductive Representation Learning on Large Graphs*, NeurIPS 2017。
- Velickovic et al., *Graph Attention Networks*, ICLR 2018。
- Ioffe and Szegedy, *Batch Normalization: Accelerating Deep Network Training by Reducing Internal Covariate Shift*, ICML 2015。
- Srivastava et al., *Dropout: A Simple Way to Prevent Neural Networks from Overfitting*, JMLR 2014。
- He et al., *Deep Residual Learning for Image Recognition*, CVPR 2015。
- Veit et al., *Residual Networks Behave Like Ensembles of Relatively Shallow Networks*, arXiv 2016。
- Xu et al., *Representation Learning on Graphs with Jumping Knowledge Networks*, ICML 2018。

用途：GNN layer design、attention aggregation、batch norm/dropout、skip connection、深层 GNN。

### 08-GNN-application

出现的文献和方法出处：

- You, Ying and Leskovec, *Design Space for Graph Neural Networks*, NeurIPS 2020。
- He et al., *Deep Residual Learning for Image Recognition*, CVPR 2015。
- Veit et al., *Residual Networks Behave Like Ensembles of Relatively Shallow Networks*, arXiv 2016。
- Xu et al., *Representation Learning on Graphs with Jumping Knowledge Networks*, ICML 2018。
- You, Gomes-Selman, Ying and Leskovec, *Identity-aware Graph Neural Networks*, AAAI 2021。
- Hamilton, Ying and Leskovec, *Inductive Representation Learning on Large Graphs*, NeurIPS 2017。
- Ying et al., *Graph Convolutional Neural Networks for Web-Scale Recommender Systems*, KDD 2018。
- Xu et al., *How Powerful Are Graph Neural Networks?*, ICLR 2019。
- Ying et al., *Hierarchical Graph Representation Learning with Differentiable Pooling*, NeurIPS 2018。
- Battaglia et al., *Relational inductive biases, deep learning, and graph networks*, 2018。
- Hamilton et al., *Representation Learning on Graphs: Methods and Applications*, 2017。
- Battaglia et al., *Interaction Networks for Learning about Objects, Relations and Physics*, NeurIPS 2016。
- Gilmer et al., *Neural Message Passing for Quantum Chemistry*, ICML 2017。
- Duvenaud et al., *Convolutional Networks on Graphs for Learning Molecular Fingerprints*, NeurIPS 2015。
- Dai et al., *Discriminative Embeddings of Latent Variable Models for Structured Data*, 2016。
- Zhang et al., *An End-to-End Deep Learning Architecture for Graph Classification*, AAAI 2018。
- Kipf et al., *Neural Relational Inference for Interacting Systems*, ICML 2018。
- Bruna et al., *Spectral Networks and Locally Connected Networks on Graphs*, ICLR 2014。
- Defferrard et al., *Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering*, NeurIPS 2016。
- Bronstein et al., *Geometric Deep Learning: Going beyond Euclidean data*, 2017。
- Monti et al., *Geometric Deep Learning on Graphs and Manifolds Using Mixture Model CNNs*, CVPR 2017。
- Hu et al., *Strategies for Pre-training Graph Neural Networks*, ICLR 2020。
- Ying et al., *GNNExplainer: Generating Explanations for Graph Neural Networks*, NeurIPS 2019。

用途：GNN 设计空间、图级任务、pooling、应用和 survey。

### 09-theory

出现的文献和方法出处：

- Battaglia et al., *Relational inductive biases, deep learning, and graph networks*, 2018。
- Hamilton et al., *Representation Learning on Graphs: Methods and Applications*, 2017。
- Velickovic et al., *Graph Attention Networks*, ICLR 2018。
- Battaglia et al., *Interaction Networks for Learning about Objects, Relations and Physics*, NeurIPS 2016。
- Gilmer et al., *Neural Message Passing for Quantum Chemistry*, ICML 2017。
- Duvenaud et al., *Convolutional Networks on Graphs for Learning Molecular Fingerprints*, NeurIPS 2015。
- Dai et al., *Discriminative Embeddings of Latent Variable Models for Structured Data*, 2016。
- Ying et al., *Hierarchical Graph Representation Learning with Differentiable Pooling*, NeurIPS 2018。
- Zhang et al., *An End-to-End Deep Learning Architecture for Graph Classification*, AAAI 2018。
- You et al., *GraphRNN: Generating Realistic Graphs with Deep Auto-regressive Models*, ICML 2018。
- Kipf et al., *Neural Relational Inference for Interacting Systems*, ICML 2018。
- Xu et al., *How Powerful Are Graph Neural Networks?*, ICLR 2019。
- Xu et al., *Representation Learning on Graphs with Jumping Knowledge Networks*, ICML 2018。
- Liu et al., *GeniePath: Graph Neural Networks with Adaptive Receptive Paths*, AAAI 2019。
- You et al., *Position-aware Graph Neural Networks*, ICML 2019。
- Bruna et al., *Spectral Networks and Locally Connected Networks on Graphs*, ICLR 2014。
- Defferrard et al., *Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering*, NeurIPS 2016。
- Bronstein et al., *Geometric Deep Learning: Going beyond Euclidean data*, 2017。
- Monti et al., *Geometric Deep Learning on Graphs and Manifolds Using Mixture Model CNNs*, CVPR 2017。
- Hu et al., *Strategies for Pre-training Graph Neural Networks*, ICLR 2020。
- Ying et al., *GNNExplainer: Generating Explanations for Graph Neural Networks*, NeurIPS 2019。
- Hornik et al., *Multilayer Feedforward Networks are Universal Approximators*, Neural Networks 1989。
- Cai et al., 1992。课件只给作者/年份，用于 WL/graph isomorphism 理论背景，题名需核对。
- You et al., *Identity-aware Graph Neural Networks*, AAAI 2021。

用途：GNN 表达能力、1-WL、GIN、graph-level representation、理论边界。

### 10-kg

出现的文献和方法出处：

- Schlichtkrull et al., *Modeling Relational Data with Graph Convolutional Networks*, ESWC 2018。
- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。
- Min et al., *Distant Supervision for Relation Extraction with an Incomplete Knowledge Base*, NAACL 2013。
- Bordes et al., *Translating Embeddings for Modeling Multi-relational Data*, NeurIPS 2013。
- Lin et al., *Learning Entity and Relation Embeddings for Knowledge Graph Completion*, AAAI 2015。
- Yang et al., *Embedding Entities and Relations for Learning and Inference in Knowledge Bases*, ICLR 2015。
- Trouillon et al., *Complex Embeddings for Simple Link Prediction*, ICML 2016。
- Sun et al., *RotatE: Knowledge Graph Embedding by Relational Rotation in Complex Space*, ICLR 2019。

用途：R-GCN、relation extraction、KG completion、TransE/TransR/DistMult/ComplEx/RotatE。

### 11-reasoning

出现的文献和方法出处：

- Hamilton et al., *Embedding Logical Queries on Knowledge Graphs*, NeurIPS 2018。
- Ren et al., *Query2box: Reasoning over Knowledge Graphs in Vector Space Using Box Embeddings*, ICLR 2020。
- Guu et al., *Traversing Knowledge Graphs in Vector Space*, EMNLP 2015。

用途：KG 上的一跳/多跳逻辑查询、query embedding、box embedding。

### 12-motifs

出现的文献和方法出处：

- Milo et al., *Network Motifs: Simple Building Blocks of Complex Networks*, Science 2002。
- Milo et al., *Superfamilies of Evolved and Designed Networks*, Science 2004。
- Ying et al., *Neural Subgraph Matching*, 2020。
- Ying, Fu et al., *Representation Learning for Frequent Subgraph Mining*, arXiv 2024。对应 slides 中的 SPMiner 方法线索。

用途：motif 发现、子图匹配、frequent subgraph mining。

### 13-recsys

出现的文献和方法出处：

- Rendle et al., *BPR: Bayesian Personalized Ranking from Implicit Feedback*, UAI 2009。
- Wang et al., *Neural Graph Collaborative Filtering*, SIGIR 2019。
- He et al., *LightGCN: Simplifying and Powering Graph Convolution Network for Recommendation*, SIGIR 2020。
- Ying et al., *Graph Convolutional Neural Networks for Web-Scale Recommender Systems*, KDD 2018。
- Duvenaud et al., *Convolutional Networks on Graphs for Learning Molecular Fingerprints*, NeurIPS 2015。
- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。
- Zhang et al., *An End-to-End Deep Learning Architecture for Graph Classification*, AAAI 2018。
- Wu et al., *Simplifying Graph Convolutional Networks*, ICML 2019。
- Wu et al., *Sampling Matters in Deep Embedding Learning*, ICCV 2017。

用途：implicit feedback ranking、BPR loss、PinSAGE、NGCF、LightGCN、distance weighted sampling。

### 14-communities

出现的文献和方法出处：

- Granovetter, *The Strength of Weak Ties*, 1973。
- Onnela et al., *Structure and Tie Strengths in Mobile Communication Networks*, 2007。
- Blondel et al., *Fast Unfolding of Communities in Large Networks*, J. Stat. Mech. 2008。
- Yang and Leskovec, *Community-Affiliation Graph Model for Overlapping Network Community Detection*, ICDM 2012。
- Yang and Leskovec, *Overlapping Community Detection at Scale: A Nonnegative Matrix Factorization Approach*, WSDM 2013。
- Shchur and Günnemann, *Overlapping Community Detection with Graph Neural Networks*, KDD 2019。

用途：弱连接、Louvain、AGM、BigCLAM、NOCD。

### 15-deep-generation

出现的文献和方法出处：

- You et al., *GraphRNN: Generating Realistic Graphs with Deep Auto-regressive Models*, ICML 2018。
- You et al., *Graph Convolutional Policy Network for Goal-Directed Molecular Graph Generation*, NeurIPS 2018。

用途：图生成、分子图生成、reinforcement learning for molecule optimization。

### 16-advanced

出现的文献和方法出处：

- You, Ying and Leskovec, *Design Space for Graph Neural Networks*, NeurIPS 2020。
- You et al., *Position-aware Graph Neural Networks*, ICML 2019。
- You, Gomes-Selman, Ying and Leskovec, *Identity-aware Graph Neural Networks*, AAAI 2021。
- Bourgain, 1985。课件只给 theorem 和年份，题名需核对。
- Goodfellow et al., *Explaining and Harnessing Adversarial Examples*, ICLR 2015。
- Jia and Liang, *Adversarial Examples for Evaluating Reading Comprehension Systems*, EMNLP 2017。
- Carlini et al., 2018。课件只给作者/年份和 audio adversarial context，题名需核对。
- Zügner et al., *Adversarial Attacks on Neural Networks for Graph Data*, KDD 2018。
- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。

用途：position-aware GNN、ID-GNN、adversarial attack on graph data。

### 17-scalable

出现的文献和方法出处：

- Hamilton, Ying and Leskovec, *Inductive Representation Learning on Large Graphs*, NeurIPS 2017。
- Chiang et al., *Cluster-GCN: An Efficient Algorithm for Training Deep and Large Graph Convolutional Networks*, KDD 2019。
- Jia et al., *Redundancy-Free Computation for Graph Neural Networks*, KDD 2020。
- Wu et al., *Simplifying Graph Convolutional Networks*, ICML 2019。
- Karypis and Kumar, *A Fast and High Quality Multilevel Scheme for Partitioning Irregular Graphs*, SIAM 1998。
- Blondel et al., *Fast Unfolding of Communities in Large Networks*, J. Stat. Mech. 2008。
- Kipf and Welling, *Semi-Supervised Classification with Graph Convolutional Networks*, ICLR 2017。

用途：neighbor sampling、Cluster-GCN、HAG、SGC、METIS/Louvain partition。

### 20-conclusion

出现的文献和方法出处：

- You, Ying and Leskovec, *Design Space for Graph Neural Networks*, NeurIPS 2020。
- Sagawa et al., *Distributionally Robust Neural Networks for Group Shifts*, ICML 2020。
- Hendrycks et al., *Using Pre-Training Can Improve Model Robustness and Uncertainty*, ICML 2019。
- Hu et al., *Strategies for Pre-training Graph Neural Networks*, ICLR 2020。
- Mikolov et al., *Distributed Representations of Words and Phrases and their Compositionality*, NeurIPS 2013。

用途：GNN design recap、OOD/group robustness、pretraining、word2vec 背景。

### 5G-CS224W

出现的文献和方法出处：

- Zaheer et al., *Deep Sets*, NeurIPS 2017。
- Battaglia et al., *Interaction Networks for Learning about Objects, Relations and Physics*, NeurIPS 2016。
- Santoro et al., *A Simple Neural Network Module for Relational Reasoning*, NeurIPS 2017。
- Kipf et al., *Neural Relational Inference for Interacting Systems*, ICML 2018。
- Wang et al., *Dynamic Graph CNN for Learning on Point Clouds*, ACM TOG 2019。课件标为 ACM TOG 2018，正式发表信息常见为 2019。
- Kazi et al., *Differentiable Graph Module*, MICCAI 2020。
- Velickovic et al., *Pointer Graph Networks*, NeurIPS 2020。
- Bruna et al., *Spectral Networks and Locally Connected Networks on Graphs*, ICLR 2014。
- Defferrard et al., *Convolutional Neural Networks on Graphs with Fast Localized Spectral Filtering*, NeurIPS 2016。
- Levie et al., *CayleyNets: Graph Convolutional Neural Networks with Complex Rational Spectral Filters*, IEEE Transactions on Signal Processing 2018。
- Cohen et al., *Spherical CNNs*, ICLR 2018。
- Satorras et al., *E(n) Equivariant Graph Neural Networks*, ICML 2021。
- Fuchs et al., *SE(3)-Transformers: 3D Roto-Translation Equivariant Attention Networks*, NeurIPS 2020。
- Masci et al., *Geodesic Convolutional Neural Networks on Riemannian Manifolds*, CVPR 2015。
- de Haan et al., *Gauge Equivariant Mesh CNNs*, ICLR 2021。
- Bronstein et al., *Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges*, 2021/2022。

用途：从 set、graph、point cloud、manifold、3D equivariant network 统一理解 geometric deep learning。

### Exam_Preparation

未发现独立推荐文献。主要是考试复习内容。

## 课件信息不完整或题名需核对的条目

这些条目在 slides 中出现，但文本不足以唯一确定完整题名，后续引用时建议回到原 slide 或课程网页核对：

- Pržulj et al., Bioinformatics 2004：出现在 graphlet/传统图特征部分；很可能与 graphlet/interactome 建模有关，但 slide 只给短标注。
- Li et al., 2016：出现在 `03-nodeemb` 的 graph embedding 扩展部分；slide 只给作者年份和简短描述。
- Zhu et al., ICML 2013：出现在 label propagation / Correct and Smooth 的 diffusion matrix 说明处；slide 只给短标注。
- Hoshen, 2017；Liu et al., 2018：出现在 attention-based neighborhood aggregation 的 overview bullet 中；slide 未给完整题名。
- Li et al., 2018：出现在 graph-level embedding overview bullet 中；slide 未给完整题名。
- Cai et al., 1992：出现在 GNN/1-WL 理论部分；slide 只给作者年份。
- Bourgain, 1985：出现在 Position-aware GNN 的距离嵌入理论背景；slide 只给 theorem 和年份。
- Carlini et al., 2018：出现在 adversarial examples 的 audio processing 背景；slide 未给完整题名。
- ICML 2007 条目：`14-communities` 中 likelihood 讲解处只显示 venue/year，未显示题名。
- SPMiner：slides 中出现的是方法线索；后续可对应 Ying/Fu et al., *Representation Learning for Frequent Subgraph Mining*, arXiv 2024，但课程 slide 版本早于该正式公开论文。

## 最短阅读路径

如果只想用两周建立 CS224W 主干，按这个顺序读：

1. Brin and Page 1998，理解 PageRank。
2. DeepWalk 2014 和 node2vec 2016，理解 shallow node embedding。
3. WL kernel 2011，理解图结构可区分性的传统基线。
4. GCN 2017、GraphSAGE 2017、GAT 2018，掌握 message passing 三种基本形态。
5. GIN 2019，理解 GNN 表达能力边界。
6. Design Space 2020，建立调 GNN 的系统框架。
7. TransE 2013、TransR 2015、RotatE 2019，掌握 KG completion。
8. BPR 2009、PinSAGE 2018、LightGCN 2020，理解推荐系统中的图学习。
9. Louvain 2008、BigCLAM 2013，理解社区发现。
10. Network Motifs 2002、Neural Subgraph Matching 2020，理解小结构任务。
11. GraphRNN 2018、GCPN 2018，理解图生成。
12. Geometric Deep Learning 2021/2022，最后把不同结构学习方法统一起来。
