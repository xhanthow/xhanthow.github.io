<!DOCTYPE html>



  


<html class="theme-next mist use-motion" lang="zh-Hans">
<head>
  <meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta name="theme-color" content="#222">









<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
















  
  
  <link href="/lib/fancybox/source/jquery.fancybox.css?v=2.1.5" rel="stylesheet" type="text/css" />







<link href="/lib/font-awesome/css/font-awesome.min.css?v=4.6.2" rel="stylesheet" type="text/css" />

<link href="/css/main.css?v=5.1.2" rel="stylesheet" type="text/css" />


  <meta name="keywords" content="HTTP基本知识," />








  <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?v=5.1.2" />






<meta name="description" content="那一天我二十一岁，在我一生的黄金时代，我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云。
——《黄金时代》

TCP/IP分层:
分为4层:应用层、传输层、网络层和数据链路层(这里要区分OSI分层模式)
应用层:决定了向用户提供应用服务时通信的活动，FTP、DNS、HTTP都属于应用层。
传输层:对上层应用层，提供处于网络连接中的两台计算机之间的数据传输。TCP、UDP都属于传输层。">
<meta property="og:type" content="article">
<meta property="og:title" content="图解HTTP——了解web及网络基础">
<meta property="og:url" content="https://xhanthow.github.io/https://xhanthow.github.io">
<meta property="og:site_name" content="敲音乐听代码">
<meta property="og:description" content="那一天我二十一岁，在我一生的黄金时代，我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云。
——《黄金时代》

TCP/IP分层:
分为4层:应用层、传输层、网络层和数据链路层(这里要区分OSI分层模式)
应用层:决定了向用户提供应用服务时通信的活动，FTP、DNS、HTTP都属于应用层。
传输层:对上层应用层，提供处于网络连接中的两台计算机之间的数据传输。TCP、UDP都属于传输层。">
<meta property="og:image" content="http://oc8wh8qu5.bkt.clouddn.com/%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82%E6%B5%81%E7%A8%8B%E5%9B%BE.png">
<meta property="og:image" content="http://oc8wh8qu5.bkt.clouddn.com/%E4%B8%89%E6%AC%A1%E6%8F%A1%E6%89%8B.png">
<meta property="og:image" content="http://oc8wh8qu5.bkt.clouddn.com/%E5%90%84%E5%8D%8F%E8%AE%AE%E4%B9%8B%E9%97%B4%E7%9A%84%E5%85%B3%E7%B3%BB.png">
<meta property="og:image" content="http://oc8wh8qu5.bkt.clouddn.com/%E4%BB%A3%E7%90%861.png">
<meta property="og:image" content="http://oc8wh8qu5.bkt.clouddn.com/%E7%BD%91%E5%85%B3.png">
<meta property="og:image" content="http://oc8wh8qu5.bkt.clouddn.com/%E9%9A%A7%E9%81%931.png">
<meta property="og:updated_time" content="2017-09-29T01:43:59.000Z">
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="图解HTTP——了解web及网络基础">
<meta name="twitter:description" content="那一天我二十一岁，在我一生的黄金时代，我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云。
——《黄金时代》

TCP/IP分层:
分为4层:应用层、传输层、网络层和数据链路层(这里要区分OSI分层模式)
应用层:决定了向用户提供应用服务时通信的活动，FTP、DNS、HTTP都属于应用层。
传输层:对上层应用层，提供处于网络连接中的两台计算机之间的数据传输。TCP、UDP都属于传输层。">
<meta name="twitter:image" content="http://oc8wh8qu5.bkt.clouddn.com/%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82%E6%B5%81%E7%A8%8B%E5%9B%BE.png">



<script type="text/javascript" id="hexo.configurations">
  var NexT = window.NexT || {};
  var CONFIG = {
    root: '/',
    scheme: 'Mist',
    version: '5.1.2',
    sidebar: {"position":"left","display":"hide","offset":12,"offset_float":12,"b2t":false,"scrollpercent":false,"onmobile":false},
    fancybox: true,
    tabs: true,
    motion: {"enable":true,"async":false,"transition":{"post_block":"fadeIn","post_header":"slideDownIn","post_body":"slideDownIn","coll_header":"slideLeftIn"}},
    duoshuo: {
      userId: '0',
      author: '博主'
    },
    algolia: {
      applicationID: 'ANWSBTFQ1I',
      apiKey: '68faa2cbf95d999bd0a884a374d1b0f3',
      indexName: 'anthow_blog',
      hits: {"per_page":10},
      labels: {"input_placeholder":"what do you want?","hits_empty":"We didn't find any results for the search: ${query}","hits_stats":"${hits} results found in ${time} ms"}
    }
  };
</script>



  <link rel="canonical" href="https://xhanthow.github.io/https://xhanthow.github.io"/>





  <title>图解HTTP——了解web及网络基础 | 敲音乐听代码</title>
  





  <script type="text/javascript">
    var _hmt = _hmt || [];
    (function() {
      var hm = document.createElement("script");
      hm.src = "https://hm.baidu.com/hm.js?98a46a959815687857bc4ec6db84e333";
      var s = document.getElementsByTagName("script")[0];
      s.parentNode.insertBefore(hm, s);
    })();
  </script>




</head>

<body itemscope itemtype="http://schema.org/WebPage" lang="zh-Hans">

  
  
    
  

  <div class="container sidebar-position-left page-post-detail">
    <div class="headband"></div>

    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader">
      <div class="header-inner"><div class="site-brand-wrapper">
  <div class="site-meta ">
    

    <div class="custom-logo-site-title">
      <a href="/"  class="brand" rel="start">
        <span class="logo-line-before"><i></i></span>
        <span class="site-title">敲音乐听代码</span>
        <span class="logo-line-after"><i></i></span>
      </a>
    </div>
      
        <p class="site-subtitle">敲音乐听代码</p>
      
  </div>

  <div class="site-nav-toggle">
    <button>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
      <span class="btn-bar"></span>
    </button>
  </div>
</div>

<nav class="site-nav">
  

  
    <ul id="menu" class="menu">
      
        
        <li class="menu-item menu-item-home">
          <a href="/" rel="section">
            
              <i class="menu-item-icon fa fa-fw fa-home"></i> <br />
            
            首页
          </a>
        </li>
      
        
        <li class="menu-item menu-item-about">
          <a href="/about/" rel="section">
            
              <i class="menu-item-icon fa fa-fw fa-user"></i> <br />
            
            关于
          </a>
        </li>
      
        
        <li class="menu-item menu-item-tags">
          <a href="/tags/" rel="section">
            
              <i class="menu-item-icon fa fa-fw fa-tags"></i> <br />
            
            标签
          </a>
        </li>
      
        
        <li class="menu-item menu-item-categories">
          <a href="/categories/" rel="section">
            
              <i class="menu-item-icon fa fa-fw fa-th"></i> <br />
            
            分类
          </a>
        </li>
      
        
        <li class="menu-item menu-item-archives">
          <a href="/archives/" rel="section">
            
              <i class="menu-item-icon fa fa-fw fa-archive"></i> <br />
            
            归档
          </a>
        </li>
      

      
        <li class="menu-item menu-item-search">
          
            <a href="javascript:;" class="popup-trigger">
          
            
              <i class="menu-item-icon fa fa-search fa-fw"></i> <br />
            
            搜索
          </a>
        </li>
      
    </ul>
  

  
    <div class="site-search">
      
  
  <div class="algolia-popup popup search-popup">
    <div class="algolia-search">
      <div class="algolia-search-input-icon">
        <i class="fa fa-search"></i>
      </div>
      <div class="algolia-search-input" id="algolia-search-input"></div>
    </div>

    <div class="algolia-results">
      <div id="algolia-stats"></div>
      <div id="algolia-hits"></div>
      <div id="algolia-pagination" class="algolia-pagination"></div>
    </div>

    <span class="popup-btn-close">
      <i class="fa fa-times-circle"></i>
    </span>
  </div>




    </div>
  
</nav>



 </div>
    </header>

    <main id="main" class="main">
      <div class="main-inner">
        <div class="content-wrap">
          <div id="content" class="content">
            

  <div id="posts" class="posts-expand">
    

  

  
  
  

  <article class="post post-type-normal" itemscope itemtype="http://schema.org/Article">
  
  
  
  <div class="post-block">
    <link itemprop="mainEntityOfPage" href="https://xhanthow.github.iohttps://xhanthow.github.io">

    <span hidden itemprop="author" itemscope itemtype="http://schema.org/Person">
      <meta itemprop="name" content="anthow">
      <meta itemprop="description" content="">
      <meta itemprop="image" content="/images/headPic.jpg">
    </span>

    <span hidden itemprop="publisher" itemscope itemtype="http://schema.org/Organization">
      <meta itemprop="name" content="敲音乐听代码">
    </span>

    
      <header class="post-header">

        
        
          <h1 class="post-title" itemprop="name headline">图解HTTP——了解web及网络基础</h1>
        

        <div class="post-meta">
          <span class="post-time">
            
              <span class="post-meta-item-icon">
                <i class="fa fa-calendar-o"></i>
              </span>
              
                <span class="post-meta-item-text">发表于</span>
              
              <time title="创建于" itemprop="dateCreated datePublished" datetime="2016-08-21T12:12:24+08:00">
                2016-08-21
              </time>
            

            

            
          </span>

          
            <span class="post-category" >
            
              <span class="post-meta-divider">|</span>
            
              <span class="post-meta-item-icon">
                <i class="fa fa-folder-o"></i>
              </span>
              
                <span class="post-meta-item-text">分类于</span>
              
              
                <span itemprop="about" itemscope itemtype="http://schema.org/Thing">
                  <a href="/categories/网络/" itemprop="url" rel="index">
                    <span itemprop="name">网络</span>
                  </a>
                </span>

                
                
              
            </span>
          

          
            
              <span class="post-comments-count">
              <span class="post-meta-divider">|</span>
              <span class="post-meta-item-icon">
                <i class="fa fa-comment-o"></i>
              </span>
              
                <a href="https://xhanthow.github.io#SOHUCS" itemprop="discussionUrl">
                  <span id="changyan_count_unit" class="post-comments-count hc-comment-count" data-xid="https://xhanthow.github.io" itemprop="commentsCount"></span>
                </a>
              
            
          

          
          

          
            <span class="post-meta-divider">|</span>
            <span class="page-pv">本文被瞅了
            <span class="busuanzi-value" id="busuanzi_value_page_pv" ></span>次
            </span>
          

          

          

        </div>
      </header>
    

    
    
    
    <div class="post-body" itemprop="articleBody">

      
      

      
        <blockquote>
<p>那一天我二十一岁，在我一生的黄金时代，我有好多奢望。我想爱，想吃，还想在一瞬间变成天上半明半暗的云。</p>
<p>——《黄金时代》</p>
</blockquote>
<h3 id="TCP-IP分层"><a href="#TCP-IP分层" class="headerlink" title="TCP/IP分层:"></a>TCP/IP分层:</h3><ul>
<li>分为4层:应用层、传输层、网络层和数据链路层(<strong><a href="https://zh.wikipedia.org/wiki/OSI%E6%A8%A1%E5%9E%8B" target="_blank" rel="external">这里要区分OSI分层模式<7层或5层></7层或5层></a></strong>)<ul>
<li>应用层:决定了向用户提供应用服务时通信的活动，FTP、DNS、HTTP都属于应用层。</li>
<li>传输层:对上层应用层，提供处于网络连接中的两台计算机之间的数据传输。TCP、UDP都属于传输层。</li>
<li>网络层:网络层用来处理在网络上流动的数据包。数据包是网络传输的最小数据单位。多台计算机连接传输时，网络层也负责在多条线路中选择一条传输线路。</li>
<li>数据链路层（网络接口层）:用来处理连接网络的硬件部分。</li>
</ul>
</li>
</ul>
<a id="more"></a>
<h3 id="一般的请求流程图"><a href="#一般的请求流程图" class="headerlink" title="一般的请求流程图:"></a>一般的请求流程图:</h3><p><img src="http://oc8wh8qu5.bkt.clouddn.com/%E7%BD%91%E7%BB%9C%E8%AF%B7%E6%B1%82%E6%B5%81%E7%A8%8B%E5%9B%BE.png" alt="客户端和服务端的通信图"></p>
<h3 id="常见的协议"><a href="#常见的协议" class="headerlink" title="常见的协议:"></a>常见的协议:</h3><ul>
<li>ARP协议:一种用以解析地址的协议，根据通信方的IP地址就可以反查出对应的MAC地址。</li>
<li><p>TCP协议:位于传输层，提供可靠的字节流服务。</p>
<ul>
<li><p>三次握手:使用TCP的标志(flag)——<code>SYN(synchronize)</code>和<code>ACK(acknowledgement)</code><br>具体过程:发送端首先发送一个带SYN标志的数据包给对方。接收端收到后，回传一个带有SYN/ACK标志的数据包以示传达确认信息。最后，发送端再回传一个带ACK标志的数据包，代表“握手”结束。若在握手过程中某个阶段莫名中断，TCP协议会再次以相同你给的顺序发送相同的数据包。</p>
</li>
<li><p><strong>三次握手流程图:</strong><br><img src="http://oc8wh8qu5.bkt.clouddn.com/%E4%B8%89%E6%AC%A1%E6%8F%A1%E6%89%8B.png" alt="三次握手"></p>
</li>
</ul>
</li>
<li><p>DNS服务:提供域名到IP之间的解析。</p>
</li>
</ul>
<h3 id="各协议和HTTP协议的关系"><a href="#各协议和HTTP协议的关系" class="headerlink" title="各协议和HTTP协议的关系:"></a>各协议和HTTP协议的关系:</h3><p><img src="http://oc8wh8qu5.bkt.clouddn.com/%E5%90%84%E5%8D%8F%E8%AE%AE%E4%B9%8B%E9%97%B4%E7%9A%84%E5%85%B3%E7%B3%BB.png" alt="各协议和HTTP协议的关系"></p>
<h3 id="代理："><a href="#代理：" class="headerlink" title="代理："></a>代理：</h3><p><img src="http://oc8wh8qu5.bkt.clouddn.com/%E4%BB%A3%E7%90%861.png" alt="代理示意图"><br>代理服务器的基本行为就是接收客户端发送的请求后转发给其他服务器。代理不改变请求的URI，会直接发送给前方持有资源的目标服务器。持有资源实体的服务器被称为源服务器，从源服务器返回的响应经过代理服务器后再传给客户端。<br>HTTP通信的过程中，可级联多台代理服务器。请求和响应的转发会经过数台类似锁链一样连接起来的代理服务器。转发时，需要附加Via首部字段以标记出经过的主机信息。</p>
<ul>
<li><p><strong>缓存代理</strong><br>代理转发响应时，缓存代理（Caching Proxy）会预先将资源的副本（缓存）保存在代理服务器上。当代理再次接收到相同资源的请求时，就可以不从源服务器那里获取资源，而是将之前缓存的资源作为响应返回。</p>
</li>
<li><p><strong>透明代理</strong><br>转发请求或响应时，不对报文做任何加工的代理类型被称为透明代理（Transparent Proxy）。反之，对报文内容进行加工的代理被称为非透明代理。</p>
</li>
</ul>
<h3 id="网关"><a href="#网关" class="headerlink" title="网关"></a>网关</h3><p><img src="http://oc8wh8qu5.bkt.clouddn.com/%E7%BD%91%E5%85%B3.png" alt="网关"><br>网关的工作机制和代理十分相似。而网关能使通信线路上的服务器提供非HTTP协议服务。<br>利用网关可以提高通信的安全性，因为可以在客户端与网关之间的通信线路上加密以确保连接的安全。比如，网关可以连接数据库，使用<code>SQL</code>语句查询数据。</p>
<h3 id="隧道"><a href="#隧道" class="headerlink" title="隧道"></a>隧道</h3><p><img src="http://oc8wh8qu5.bkt.clouddn.com/%E9%9A%A7%E9%81%931.png" alt="隧道"><br>隧道可按要求建立起一条与其他服务器的通信线路。届时使用<code>SSL</code>等加密手段进行加密。隧道的目的是确保客户端能与服务器进行安全的通信。隧道本身不会去解析HTTP请求。也就是说，请求保持原样中转给之后的服务器。隧道会在通信双方断开连接时结束。</p>
<blockquote>
<p>乱入：<a href="http://vc2tea.com/whats-shadowsocks/" target="_blank" rel="external">ss翻墙原理</a></p>
</blockquote>

      
    </div>
    
    
    

    

    

    

    <footer class="post-footer">
      
        <div class="post-tags">
          
            <a href="/tags/HTTP基本知识/" rel="tag"># HTTP基本知识</a>
          
        </div>
      

      
      
      

      
        <div class="post-nav">
          <div class="post-nav-next post-nav-item">
            
          </div>

          <span class="post-nav-divider"></span>

          <div class="post-nav-prev post-nav-item">
            
              <a href="https://xhanthow.github.io" rel="prev" title="从字节码中看清++i和i++的本质">
                从字节码中看清++i和i++的本质 <i class="fa fa-chevron-right"></i>
              </a>
            
          </div>
        </div>
      

      
      
    </footer>
  </div>
  
  
  
  </article>



    <div class="post-spread">
      
    </div>
  </div>


          </div>
          


          
  <div class="comments" id="comments">
    
      <div id="SOHUCS"></div>
    

  </div>



        </div>
        
          
  
  <div class="sidebar-toggle">
    <div class="sidebar-toggle-line-wrap">
      <span class="sidebar-toggle-line sidebar-toggle-line-first"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-middle"></span>
      <span class="sidebar-toggle-line sidebar-toggle-line-last"></span>
    </div>
  </div>

  <aside id="sidebar" class="sidebar">
    
    <div class="sidebar-inner">

      

      
        <ul class="sidebar-nav motion-element">
          <li class="sidebar-nav-toc sidebar-nav-active" data-target="post-toc-wrap" >
            文章目录
          </li>
          <li class="sidebar-nav-overview" data-target="site-overview">
            站点概览
          </li>
        </ul>
      

      <section class="site-overview sidebar-panel">
        <div class="site-author motion-element" itemprop="author" itemscope itemtype="http://schema.org/Person">
          
            <img class="site-author-image" itemprop="image"
              src="/images/headPic.jpg"
              alt="anthow" />
          
            <p class="site-author-name" itemprop="name">anthow</p>
            <p class="site-description motion-element" itemprop="description">Some Notes</p>
        </div>

        <nav class="site-state motion-element">

          
            <div class="site-state-item site-state-posts">
            
              <a href="/archives/">
            
                <span class="site-state-item-count">9</span>
                <span class="site-state-item-name">日志</span>
              </a>
            </div>
          

          
            
            
            <div class="site-state-item site-state-categories">
              <a href="/categories/index.html">
                <span class="site-state-item-count">6</span>
                <span class="site-state-item-name">分类</span>
              </a>
            </div>
          

          
            
            
            <div class="site-state-item site-state-tags">
              <a href="/tags/index.html">
                <span class="site-state-item-count">8</span>
                <span class="site-state-item-name">标签</span>
              </a>
            </div>
          

        </nav>

        

        <div class="links-of-author motion-element">
          
            
              <span class="links-of-author-item">
                <a href="https://github.com/xhanthow" target="_blank" title="GitHub">
                  
                    <i class="fa fa-fw fa-globe"></i>GitHub</a>
              </span>
            
              <span class="links-of-author-item">
                <a href="http://weibo.com/anthow" target="_blank" title="Weibo">
                  
                    <i class="fa fa-fw fa-globe"></i>Weibo</a>
              </span>
            
          
        </div>

        
        

        
        

        


      </section>

      
      <!--noindex-->
        <section class="post-toc-wrap motion-element sidebar-panel sidebar-panel-active">
          <div class="post-toc">

            
              
            

            
              <div class="post-toc-content"><ol class="nav"><li class="nav-item nav-level-3"><a class="nav-link" href="#TCP-IP分层"><span class="nav-number">1.</span> <span class="nav-text">TCP/IP分层:</span></a></li><li class="nav-item nav-level-3"><a class="nav-link" href="#一般的请求流程图"><span class="nav-number">2.</span> <span class="nav-text">一般的请求流程图:</span></a></li><li class="nav-item nav-level-3"><a class="nav-link" href="#常见的协议"><span class="nav-number">3.</span> <span class="nav-text">常见的协议:</span></a></li><li class="nav-item nav-level-3"><a class="nav-link" href="#各协议和HTTP协议的关系"><span class="nav-number">4.</span> <span class="nav-text">各协议和HTTP协议的关系:</span></a></li><li class="nav-item nav-level-3"><a class="nav-link" href="#代理："><span class="nav-number">5.</span> <span class="nav-text">代理：</span></a></li><li class="nav-item nav-level-3"><a class="nav-link" href="#网关"><span class="nav-number">6.</span> <span class="nav-text">网关</span></a></li><li class="nav-item nav-level-3"><a class="nav-link" href="#隧道"><span class="nav-number">7.</span> <span class="nav-text">隧道</span></a></li></ol></div>
            

          </div>
        </section>
      <!--/noindex-->
      

      

    </div>
  </aside>


        
      </div>
    </main>

    <footer id="footer" class="footer">
      <div class="footer-inner">
        <div class="copyright">&copy; <span itemprop="copyrightYear">2017</span>
  <span class="with-love">
    <i class="fa fa-user"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">anthow</span>

  
</div>


  <div class="powered-by">由 <a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a> 强力驱动</div>



  <span class="post-meta-divider">|</span>



  <div class="theme-info">主题 &mdash; <a class="theme-link" target="_blank" href="https://github.com/iissnan/hexo-theme-next">NexT.Mist</a> v5.1.2</div>




        
<div class="busuanzi-count">
  <script async src="https://dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js"></script>

  
    <span class="site-uv">
      <i class="fa fa-user"></i>已有
      <span class="busuanzi-value" id="busuanzi_value_site_uv"></span>
      人溜了进来
    </span>
  

  
    <span class="site-pv">
      <i class="fa fa-eye"></i>被监视了
      <span class="busuanzi-value" id="busuanzi_value_site_pv"></span>
      次
    </span>
  
</div>








        
      </div>
    </footer>

    
      <div class="back-to-top">
        <i class="fa fa-arrow-up"></i>
        
      </div>
    

  </div>

  

<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>









  












  
  <script type="text/javascript" src="/lib/jquery/index.js?v=2.1.3"></script>

  
  <script type="text/javascript" src="/lib/fastclick/lib/fastclick.min.js?v=1.0.6"></script>

  
  <script type="text/javascript" src="/lib/jquery_lazyload/jquery.lazyload.js?v=1.9.7"></script>

  
  <script type="text/javascript" src="/lib/velocity/velocity.min.js?v=1.2.1"></script>

  
  <script type="text/javascript" src="/lib/velocity/velocity.ui.min.js?v=1.2.1"></script>

  
  <script type="text/javascript" src="/lib/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>


  


  <script type="text/javascript" src="/js/src/utils.js?v=5.1.2"></script>

  <script type="text/javascript" src="/js/src/motion.js?v=5.1.2"></script>


  
  

  <script type="text/javascript" src="/js/src/scrollspy.js?v=5.1.2"></script>
<script type="text/javascript" src="/js/src/post-details.js?v=5.1.2"></script>


  

  


  <script type="text/javascript" src="/js/src/bootstrap.js?v=5.1.2"></script>



  


  




	





  





  




  
    <script type="text/javascript">
    (function(){
      var appid = 'cyteSCvbs';
      var conf = 'ca2374df249463654cfe9d6c4e98bfad';
      var width = window.innerWidth || document.documentElement.clientWidth;
      if (width < 960) {
      window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="https://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("https://changyan.sohu.com/upload/changyan.js",function(){
        window.changyan.api.config({appid:appid,conf:conf})});
      }
    })();
    </script>
    <script type="text/javascript" src="https://assets.changyan.sohu.com/upload/plugins/plugins.count.js"></script>
  





  




  
  
  
  <link rel="stylesheet" href="/lib/algolia-instant-search/instantsearch.min.css">

  
  
  <script src="/lib/algolia-instant-search/instantsearch.min.js"></script>
  

  <script src="/js/src/algolia-search.js?v=5.1.2"></script>



  

  

  

  

  

  

</body>
</html>
<!-- 背景动画 -->
<script type="text/javascript" src="/js/src/particle.js"></script>
<!-- 页面点击小红心 -->
<script type="text/javascript" src="/js/src/love.js"></script>
