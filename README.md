# QiaoBa
1.该方法属于自创野路子，技术成本较低，利用bat脚本在配合Springcloud实现灰度发布
2.原理很简单等第一个容器启动完成并注册进eureka后，再去更新第二个容器，在黑与白直接平滑过度
3.配合erurka服务下线快速感知配置，将影响降低
    参考链接：https://www.jianshu.com/p/153bafe78ae7
    参考链接：https://yq.aliyun.com/articles/693725