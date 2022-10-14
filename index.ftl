<#include "module/macro.ftl"/>
<@head title="${blog_title!}"/>

<body class="bg-[#f9f9f9] dark:bg-neutral-800">
<div class="flex flex-col lg:flex-row">
    <@header/>
    <div class="w-full h-screen lg:pl-[330px] px-[40px] lg:px-0 mt-[-60px] lg:mt-0">
        <div class="lg:max-w-[1000px] mx-auto h-screen relative">
            <div class="flex flex-col lg:flex-row justify-center content-center items-center h-screen lg:space-x-16 lg:mx-[20px]">
                <div class="avatar mb-6 lg:mb-0">
                    <div class="w-72 h-72 bg-cover bg-no-repeat bg-center animation-morph"
                         style="background-image: url('${user.avatar!}'); box-shadow: inset 0px 0px 0px 9px rgb(255 255 255 / 30%); border-radius: 60% 40% 30% 70% / 60% 30% 70% 40%;"></div>
                </div>
                <div class="resume space-y-6">
                    <div class="name text-center lg:text-left">
                        <h1 class="text-6xl subpixel-antialiased font-black font-sans dark:text-white">${user.nickname!}</h1>
                    </div>
                    <div class="info text-center lg:text-left">
                        <p class="text-767676">${user.description!}</p>
                        <p class="text-767676">
                            <a id="rainbow" href=''>🌈 获取中...</a>
                        </p>
                    </div>
                    <div class="social hidden lg:block dark:text-767676">
                        <ul class="flex space-x-4">
                            <#if settings.github?? && settings.github != ''>
                                <li>
                                    <a href="${settings.github}" title="github" target="_blank"><i class="ri-github-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.coolapk?? && settings.coolapk != ''>
                                <li>
                                    <a href="${settings.coolapk}" title="coolapk" target="_blank"><svg t="1662047160326" class="icon text-2xl" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="915" width="32" height="32"><path d="M270.4 350.08c45.066667-23.52 98.72-23.04 146.88-10.4 58.133333 18.453333 106.186667 57.92 151.146667 97.76-14.986667 15.253333-33.493333 26.346667-50.986667 38.4-34.24-27.573333-68.106667-58.293333-110.773333-72.053333-42.666667-13.44-93.44-11.36-129.386667 17.653333-39.466667 30.186667-54.346667 86.666667-36.533333 132.8 22.186667 57.173333 90.186667 86.88 148.213333 71.68 59.466667-14.506667 102.72-62.666667 136.586667-110.88 35.626667-50.613333 65.333333-104.96 97.44-157.76 6.88-10.24 13.653333-23.626667 27.146666-25.76 14.613333-4.213333 28.586667 5.493333 34.24 18.56 54.773333 98.186667 110.88 195.626667 163.253334 295.093333 10.506667 15.093333 5.493333 38.293333-12.106667 45.44-16.8 8.586667-31.68-5.92-44.64-14.666666-63.36-47.36-127.946667-93.173333-190.026667-142.186667 16.906667-11.733333 33.44-24 50.186667-35.946667 25.386667 14.613333 47.573333 33.866667 72.16 49.653334-22.453333-41.226667-45.12-82.4-67.786667-123.573334-43.146667 62.4-76 132.64-129.6 187.36-34.346667 35.2-75.68 66.88-124.8 77.173334-42.24 8.533333-87.84 6.4-127.093333-12.64-60.213333-28.053333-102.24-91.626667-102.933333-158.293334-3.573333-69.013333 37.653333-136.96 99.413333-167.413333z" fill="#000000" p-id="917"></path></svg></a>
                                </li>
                            </#if>
                            <#if settings.weibo?? && settings.weibo != ''>
                                <li>
                                    <a href="${settings.weibo}" title="weibo" target="_blank"><i class="ri-weibo-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.wechat?? && settings.wechat != ''>
                                <li>
                                    <a href="${settings.wechat}" title="wechat" target="_blank"><i class="ri-wechat-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.qq?? && settings.qq != ''>
                                <li>
                                    <a href="//wpa.qq.com/msgrd?v=3&uin=${settings.qq!}&site=qq&menu=yes" title="qq" target="_blank"><i class="ri-qq-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.bilibili?? && settings.bilibili != ''>
                                <li>
                                    <a href="${settings.bilibili}" title="bilibili" target="_blank"><i class="ri-bilibili-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.netease_cloud_music?? && settings.netease_cloud_music != ''>
                                <li>
                                    <a href="${settings.netease_cloud_music}" title="netease_cloud_music" target="_blank"><i class="ri-netease-cloud-music-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.steam?? && settings.steam != ''>
                                <li>
                                    <a href="${settings.steam}" title="steam" target="_blank"><i class="ri-steam-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.rss?? && settings.rss != ''>
                                <li>
                                    <a href="${settings.rss}" title="rss" target="_blank"><i class="ri-rss-line text-2xl"></i></a>
                                </li>
                            </#if>
                            <#if settings.email?? && settings.email != ''>
                                <li>
                                    <a href="${settings.email}" title="email" target="_blank"><i class="ri-mail-line text-2xl"></i></a>
                                </li>
                            </#if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<@footer/>
<script>
    fetch('https://api.eatrice.top')
    .then(response => response.json())
    .then(data => {
        var rainbow = document.getElementById('rainbow');
        rainbow.innerHTML = data.Content;
        rainbow.href = "https://rainbow.eatrice.top/?ID=" + data.ID;
    })
    .catch(console.error)
</script>
</body>
</html>