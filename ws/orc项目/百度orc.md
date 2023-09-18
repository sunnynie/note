- 百度地址 https://cloud.baidu.com/
- 云账号 onceinfo0831/Zz12341234
- 控制台：https://console.bce.baidu.com/ai/#/ai/ocr/package/index
- 私有化部署文档：https://ai.baidu.com/ai-doc/OCR/Kkus8qobv

- paddle 目录结构
.
├── lc
│   ├── finger   //指纹
│   └── license  //证书
└── package      //主包名
    ├── Applications
    │   └── VIS_IMG_OCR_GPU_SIGNET_NEW_ARCH_10862  // 镜像文件
    │       ├── data
    │       ├── init
    │       └── start
    ├── BasicServices //基础服务
    │   └── c-offline-security-server //离线安全服务器
    │       ├── conf
    │       ├── gcc
    │       └── start
    ├── ClusterExecutor // 集群执行器
    │   ├── packages
    │   └── playbooks
    │       └── roles
    │           ├── common
    │           │   └── tasks
    │           ├── common_in
    │           │   └── tasks
    │           ├── custom_task
    │           │   └── tasks
    │           ├── install
    │           │   └── tasks
    │           ├── lu_auth_server
    │           │   └── tasks
    │           ├── remove
    │           │   └── tasks
    │           ├── status
    │           │   └── tasks
    │           └── xvision_install
    │               └── tasks
    ├── DockerPackages   //镜像包
    │   └── docker
    ├── EasyTroubleShoot  //故障排查 
    │   ├── conf
    │   ├── easy_troubleshoot
    │   │   ├── shell_tools
    │   │   └── tools
    │   ├── faqs
    │   ├── lib
    │   ├── scripts
    │   │   ├── python
    │   │   └── shell
    │   └── tools
    │       └── finger
    ├── EnvironmentCheck  //环境监测
    │   └── scripts
    ├── ImageFiles    //图片文件
    ├── Install       //安装
    │   ├── conf
    │   ├── groups     //分组
    │   │   ├── auth_server    //权限服务器
    │   │   ├── basic_batch     //基础神经网络
    │   │   ├── basic_external_k8s
    │   │   ├── basic_k8s
    │   │   ├── basic_kubectl
    │   │   ├── basic_xvision
    │   │   ├── ceph
    │   │   ├── k8s_deploy_tool
    │   │   ├── kube_master
    │   │   ├── kube_node
    │   │   ├── kube_node_gpu
    │   │   ├── mars_chart_standard
    │   │   └── xvision_deploy_tool
    │   ├── key
    │   ├── languages
    │   │   └── locale
    │   │       └── cn
    │   │           └── LC_MESSAGES
    │   ├── lib
    │   ├── modules   //模块
    │   │   ├── apiserver
    │   │   ├── app
    │   │   ├── auth-manage-service
    │   │   ├── basic
    │   │   ├── ceph-client
    │   │   ├── ceph-server
    │   │   ├── c-offline-security-server
    │   │   ├── controller-manager
    │   │   ├── curl
    │   │   ├── cvpaas-dynomite
    │   │   ├── cvpaas-elasticsearch
    │   │   ├── docker
    │   │   ├── docker-registry
    │   │   ├── edgeboard-base
    │   │   ├── etcd
    │   │   ├── flannel
    │   │   ├── helm
    │   │   ├── jdk8
    │   │   ├── kubectl
    │   │   ├── kubelet
    │   │   ├── kube-proxy
    │   │   ├── license-server
    │   │   ├── mysql
    │   │   ├── mysql-client
    │   │   ├── nfs-client
    │   │   ├── nfs-server
    │   │   ├── nvidia
    │   │   ├── nvidia-k8s-plugin
    │   │   ├── offline-security-server
    │   │   ├── op
    │   │   ├── openresty
    │   │   ├── redis
    │   │   └── scheduler
    │   ├── op-tool
    │   └── tools
    ├── Libs
    ├── OpDevTools     //开发工具
    │   └── openresty
    │       ├── conf
    │       │   ├── upstream
    │       │   └── vhost
    │       └── start
    └── Software        //软件
        └── nvidia
            ├── driver
            │   └── 460.27
            ├── nvidia-docker-1.0
            └── nvidia-docker-2.0
                ├── x86_64-centos-7
                ├── x86_64-centos-8
                ├── x86_64-ubuntu-14
                ├── x86_64-ubuntu-16
                └── x86_64-ubuntu-18
- 获取指纹
  - 提权 chmod +x get_machine_finger_en
  - 运行 ./get_machine_finger_en 
  - 执行后结果在/tmp目录，文件名为secfile_xx格式的文件即为指纹文件，后面的XX 是机器名
  - 如果是多台机子，将指纹指纹放在同一个目录下，创建压缩包 tar cvzf ../finger.tar.gz ./*,在上级目录生成名字为finger.tar.gz的压缩包
  - 尽量用root 账号采集指纹文件，部署应用和采集指纹的账号需要一致，压缩包解压之后就只有指纹文件，没有其他的文件和文件夹

