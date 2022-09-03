<#macro head title>
    <!doctype html>
    <html lang="zh">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <#if (settings.sub_title?? && settings.sub_title != '')>
            <title>${title!} - ${settings.sub_title}</title>
        <#else>
            <title>${title!}</title>
        </#if>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
        <meta name="format-detection" content="telephone=no"/>
        <meta name="renderer" content="webkit">
        <meta name="theme-color" content="${settings.google_color!'#fff'}">
        <meta name="author" content="${user.nickname!}"/>
        <meta name="keywords" content="${meta_keywords!}"/>
        <meta name="description" content="${meta_description!}"/>
        <#if options.blog_favicon?? && options.blog_favicon != ''>
            <link rel="apple-touch-icon" sizes="180x180" href="${options.blog_favicon}">
            <link rel="icon" type="image/png" sizes="32x32" href="${options.blog_favicon}">
            <link rel="icon" type="image/png" sizes="16x16" href="${options.blog_favicon}">
            <link rel="manifest" href="${options.blog_favicon}">
        </#if>
        <link href="${theme_base!}/source/css/style.css" rel="stylesheet">
        <link href="${theme_base!}/source/css/moon-menu.css" rel="stylesheet">
        <link href="${theme_base!}/source/css/github-badge.css" rel="stylesheet">
        <link href="${theme_base!}/source/css/hr.css" rel="stylesheet">
        <link rel="preload" href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" as="style" onload="this.onload=null;this.rel='stylesheet'">
        <noscript><link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"></noscript>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.css"/>
        <link href="https://lf3-cdn-tos.bytecdntp.com/cdn/expire-1-M/highlight.js/11.4.0/styles/github.min.css" type="text/css" rel="stylesheet" />
        <link type='text/css' rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css"/>
        <#if settings.font == 'oppo-sans'>
            <style>
                @font-face {
                    font-family: "OPPOSans-Ver2-Regular";
                    src: url(https://code.oppo.com/content/dam/oppo/common/fonts/font2/new-font/OPPOSansOS2-5000-Regular.woff2) format("woff2"),
                    url(https://code.oppo.com/content/dam/oppo/common/fonts/font2/new-font/OPPOSansOS2-5000-Regular.woff) format("woff"),
                    url(https://code.oppo.com/content/dam/oppo/common/fonts/font2/new-font/OPPOSansOS2-5000-Regular.ttf) format("truetype"),
                    url(https://code.oppo.com/content/dam/oppo/common/fonts/font2/new-font/OPPOSansOS2-5000-Regular.eot) format("embedded-opentype");
                    font-weight: 400;
                    font-style: normal;
                    font-display: swap;
                }

                html {
                    font-family: "OPPOSans-Ver2-Regular", ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
                }
            </style>
        </#if>
        <#if settings.font == 'Mi-Sans'>
        <link rel="stylesheet" href="https://font.sec.miui.com/font/css?family=MiSans:200,300,400,450,500,600,650,700:Chinese_Simplify,Latin&amp;display=swap" as="style">
        <style>
            html {
                font-family: MiSans, serif, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, "Noto Sans", sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
            }
        </style>
        </#if>
        <#if settings.font == 'system'>
            <style>
                @font-face {
                    font-family: Emoji;
                    src: local("Apple Color Emojiji"), local("Segoe UI Emoji"), local("Segoe UI Symbol"), local("Noto Color Emoji");
                    unicode-range: U+1F000-1F644, U+203C-3299;
                }
                html {
                    font-family: system-ui, —apple-system, Segoe UI, Rototo, Emoji, Helvetica, Arial, sans-serif;
                }
            </style>
        </#if>
        <style>
            .hljs {
                background: #f6f8fa;
            }
        </style>
        <@global.head />
    </head>
</#macro>

<#macro header>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script async src="//busuanzi.ibruce.info/busuanzi/2.3/busuanzi.pure.mini.js"></script>
    <header class="hidden fixed w-[300px] px-16 h-screen space-y-16 lg:flex flex-col justify-center content-start bg-white" style="padding-left: 2.3rem; padding-right: 2.3rem">
        <div class="logo">
            <a href="${blog_url!}" title="${blog_title!}">
                <img src="${blog_logo!}" alt="${blog_title!}">
            </a>
        </div>
        <div class="nav">
            <ul class="text-767676 space-y-2">
                <@menuTag method="list">
                    <#list menus?sort_by('priority') as menu>
                        <li>
                            <a class="hover:text-black block w-full hover:tracking-wider duration-300"
                               href="${menu.url!}">${menu.name!} </a>
                        </li>
                    </#list>
                </@menuTag>
            </ul>
        </div>
        <div class="search flex justify-start text-767676 text-lg space-x-3">
            <form method="get" action="/search" role="search" class="flex justify-start content-center">
                <input autocomplete="off" class="border-b border-stone-300 focus:outline-none focus:border-b w-full"
                       type="search"
                       name="keyword" placeholder="Search" required>
                <button type="submit">
                    <i class="ri-search-2-line"></i>
                </button>
            </form>
        </div>
        <div class="copyright text-767676">
            <p>
                <a class="text-black" href="${blog_url!}">${blog_title!}</a>
            </p>
            <p>
               Copyright © 2018-${.now?string("yyyy")}
            </p>
            <p>
                Powered by <a href="https://halo.run/" target="_blank" class="text-black">Halo</a>&nbsp;&&nbsp;<a href="https://github.com/liaocp666/halo-theme-daisy" target="_blank" class="text-black">Daisy</a>
            </p>
            <br>
            <p>
                <a class="text-black" href="https://icp.gov.moe/?keyword=20220922" target="_blank">萌ICP备20220922号</a>
            </p>
            <p>
                <a class="text-black" href="http://beian.miit.gov.cn" target="_blank">${settings.icp!}</a>
            </p>
            <p>
                <a class="text-black" href="http://www.beian.gov.cn" target="_blank">${settings.public_security_record!}</a>
            </p>
            <br>
            <div class="github-badge">
                <a style="color: #fff" rel="license" href="https://www.upyun.com/?utm_source=lianmeng&utm_medium=referral" target="_blank" title="又拍云提供 CDN 加速 / 云存储">
                <span class="badge-subject pr-8 mr-1">Storage</span>
                <span class="badge-value bg-blue">又拍云</span>
                </a>
            </div>
            <div class="github-badge">
                <a style="color: #fff" rel="license" href="https://cloud.tencent.com/" target="_blank" title="本站运行于腾讯云轻量服务器">
                <span class="badge-subject pr-8 mr-1">Host</span>
                <span class="badge-value bg-brightgreen">腾讯云</span>
                </a>
            </div>
            <div class="github-badge">
                <a style="color: #fff" rel="license" title="本站访客量">
                <span class="badge-subject pr-8 mr-1">访客</span>
                <span class="badge-value bg-red" id="busuanzi_value_site_uv"></span>
                </a>
            </div>
            <div class="github-badge">
                <a style="color: #fff" rel="license" title="本站访问量">
                <span class="badge-subject pr-8 mr-1">访问</span>
                <span class="badge-value bg-orange" id="busuanzi_value_site_pv"></span>
                </a>
            </div>
            <div class="github-badge">
                <a style="color: #fff" rel="license" title="本站运行时间">
                <span class="badge-subject pr-8 mr-1">运行</span>
                <span class="badge-value bg-blueviolet" id="span_dt_dt"></span>
                </a>
            </div>
        </div>
    </header>
    <#if settings.time_statistics??>
        <script type="text/javascript">
            // 建站时间统计
            function show_date_time() {
                if ($("#span_dt_dt").length > 0) {
                    window.setTimeout("show_date_time()", 1000);
                    BirthDay = new Date("${settings.time_statistics!}");
                    today = new Date();
                    timeold = (today.getTime() - BirthDay.getTime());
                    sectimeold = timeold / 1000;
                    secondsold = Math.floor(sectimeold);
                    msPerDay = 24 * 60 * 60 * 1000;
                    e_daysold = timeold / msPerDay;
                    daysold = Math.floor(e_daysold);
                    e_hrsold = (e_daysold - daysold) * 24;
                    hrsold = Math.floor(e_hrsold);
                    e_minsold = (e_hrsold - hrsold) * 60;
                    minsold = Math.floor((e_hrsold - hrsold) * 60);
                    seconds = Math.floor((e_minsold - minsold) * 60);
                    span_dt_dt.innerHTML = daysold + "天" + hrsold + "小时" + minsold + "分" + seconds + "秒";
                }
            }
            show_date_time();
        </script>
    </#if>
    <header class="lg:hidden bg-white sticky top-0">
        <div class="flex justify-between p-4">
            <div class="logo">
                <a href="${blog_url!}" title="${blog_title!}">
                    <img src="${blog_logo!}" alt="${blog_title!}">
                </a>
            </div>
            <div class="menu">
                <a onclick="toggleNav()">
                    <i class="ri-menu-3-line"></i>
                </a>
            </div>
        </div>
        <div class="mobile-nav right-0 bg-white h-full w-full" id="mobileNav" style="display: none">
            <ul class="text-767676 space-y-6 py-6">
                <@menuTag method="list">
                    <#list menus?sort_by('priority') as menu>
                        <li>
                            <a class="hover:text-black block w-full hover:tracking-wider duration-300 text-center"
                               href="${menu.url!}"
                               target="${menu.target!}">${menu.name!} </a>
                        </li>
                    </#list>
                </@menuTag>
            </ul>
        </div>
    </header>
</#macro>

<#macro navigation>
    <div class="bg-white p-4 hover:shadow-lg duration-300 mb-12">
        <nav aria-label="Page navigation">
            <ul class="flex justify-between list-style-none space-x-3">
                <@paginationTag method="archives" page="${posts.number}" total="${posts.totalPages}" display="3">
                    <li class="page-item">
                        <#if pagination.hasPrev>
                            <a class="page-link relative block py-1.5 px-3 rounded border-0 bg-transparent outline-none transition-all duration-300 rounded text-gray-800 hover:text-gray-800 hover:bg-gray-200 focus:shadow-none"
                               href="${pagination.prevPageFullPath!}">上一页</a>
                        </#if>
                    </li>
                    <li>
                                    <span class="page-link relative block py-1.5 px-3 rounded border-0 outline-none transition-all duration-300 rounded text-gray-800 text-gray-800 bg-gray-200 shadow-none">
                                        ${posts.number + 1} / ${posts.totalPages}
                                    </span>
                    </li>

                    <li class="page-item">
                        <#if pagination.hasNext>
                            <a class="page-link relative block py-1.5 px-3 rounded border-0 bg-transparent outline-none transition-all duration-300 rounded text-gray-800 hover:text-gray-800 hover:bg-gray-200 focus:shadow-none"
                               href="${pagination.nextPageFullPath!}">下一页</a>
                        </#if>
                    </li>
                </@paginationTag>
            </ul>
        </nav>
    </div>
</#macro>

<#macro footer>
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fancyapps/ui@4.0/dist/fancybox.umd.js"></script>
    <script src="https://lf6-cdn-tos.bytecdntp.com/cdn/expire-1-M/highlight.js/11.4.0/highlight.min.js" type="application/javascript"></script>
    <script src="${theme_base!}/source/js/daisy.js"></script>
    <script src="${theme_base!}/source/js/svg3dTagCloud.js"></script>
    <script src="${theme_base!}/source/js/moment.js"></script>
    <script src="${theme_base!}/source/js/echarts.min.js"></script>
    <script src="${theme_base!}/source/js/category-echart.js"></script>
    <@global.footer />
    <script>
        hljs.highlightAll();
        loadHotPost(5, '${blog_url!}', '${settings.api_authorization!}')
        lightBox('.markdown-body img', 'post')
        generateCatalog()
        var url = location.href;
        var urlstatus = false;
        $(".nav li a").each(function () {
            if ((url + '/').indexOf($(this).attr('href').replace('.html', '')) > -1 && $(this).attr('href').replace('.html', '') != '/') {
                $(this).addClass('text-black font-semibold tracking-wide');
                urlstatus = true;
            } else {
                $(this).removeClass('text-black font-semibold tracking-wide');
            }
        });
        if (!urlstatus) {
            $(".nav li a").eq(0).addClass('text-black font-semibold tracking-wide');
        }
    </script>
    <#if settings.init_click == 'open'>
    <script src="https://lf6-cdn-tos.bytecdntp.com/cdn/expire-1-M/instantclick/3.1.0/instantclick.min.js" type="application/javascript" data-no-instant></script>
    <script>
        InstantClick.on('change', function (isInitialLoad) {
            if (isInitialLoad) {
                return
            }
            if (typeof _hmt !== 'undefined') {
                _hmt.push(['_trackPageview', location.pathname + location.search]);
            }
        });
        InstantClick.init()
    </script>
    <script>
        var moonMenuListener = function() {
            var contentHeight = $("#main").height() - window.innerHeight;
            if (contentHeight <= 0) return;
            var readHeight = window.pageYOffset - $("#main").offset().top;
            var percent = Math.round(readHeight / contentHeight * 100);
            if (percent > 100) percent = 100;
            if (!percent) {
                percent = 0;
                $('.moon-menu-text').css('display', 'none');
                $('.moon-dot').css('display', '');
            } else {
                $('.moon-menu-text').css('display', 'block');
                $('.moon-menu-text').html(percent + '%');
                $('.moon-dot').css('display', 'none');
            }
            var length = 196;
            $('.moon-menu-border').css('strokeDasharray', percent * length / 100 + ' ' + length);
        };
        $(window).on('load', function () {
            moonMenuListener();
        });
        $(window).on('scroll', function () {
            moonMenuListener();
        });
        $('.moon-menu-button').on('click', function () {
            $('.moon-menu-icon').toggleClass('active');
            $('.moon-menu-items').toggleClass('item-ani');
            $('.moon-menu-items').toggleClass('active');
            if ($('.moon-menu-items').hasClass('active')) {
                $('.moon-menu-item').css('opacity', '0.9');
                $('.moon-dot circle')[0].setAttribute("cx", "-0.8rem");
                $('.moon-dot circle')[0].setAttribute("cy", "0");
                $('.moon-dot circle')[2].setAttribute("cx", "0.8rem");
                $('.moon-dot circle')[2].setAttribute("cy", "0");
            } else {
                $('.moon-menu-item').css('opacity', '0');
                $('.moon-dot circle')[0].setAttribute("cx", "0");
                $('.moon-dot circle')[0].setAttribute("cy", "-0.8rem");
                $('.moon-dot circle')[2].setAttribute("cx", "0");
                $('.moon-dot circle')[2].setAttribute("cy", "0.8rem");
            }
        });
        function back2Top() {
            window.scroll({ top: 0, behavior: 'smooth' });
        }
        function back2Bottom() {
            window.scroll({ top: $("#main").height(), behavior: 'smooth' });
        }
        function toSearchBox() {
            openSearchPanel()
            $('.searchbox-input').focus()
            this.makeMenuInvisible()
        }
    </script>
    <script>
        var entries = [
            <@tagTag method="list">
                <#list tags as tag>
                    {label: "${tag.name!}", url: "${tag.fullPath!}"},
                </#list>
            </@tagTag>
        ];

        var settings = {
            entries: entries,//数据
            width: 250,//宽度
            height: 250,//高度
            radius: '65%',
            radiusMin: 75,
            bgDraw: false,//是否显示背景
            opacityOver: 1.00,
            opacityOut: 0.05,
            opacitySpeed: 6,
            fov: 800,
            speed: 0.5,//旋转的速度
            fontFamily: 'Oswald, Arial, sans-serif',
            fontSize: '15',//默认字体大小
            fontColor: '#009688',//默认字体颜色
            fontWeight: 'normal',//bold
            fontStyle: 'normal',//italic
            fontStretch: 'normal',//wider, narrower, ultra-condensed, extra-condensed, condensed, semi-condensed, semi-expanded, expanded, extra-expanded, ultra-expanded
            fontToUpperCase: true,
        };
        $('#tags-ball').html('');
        $('#tags-ball').svg3DTagCloud(settings);
    </script>
    <script>
        var calendarChart = echarts.init(document.getElementById('post-calendar'));
        // calculate range.
        var startDate = moment().subtract(1, 'years');
        var endDate = moment();
        var rangeArr = '["' + startDate.format('YYYY-MM-DD') + '", "' + endDate.format('YYYY-MM-DD') + '"]';
        rangeArr = JSON.parse(rangeArr);
        console.log(rangeArr);
        // post and count map.
        var dateMap = new Map();
        <@postTag method="archive" type="year">
            <#list archives as archive>
                <#list archive.posts?sort_by("createTime")?reverse as post>
                    var date = "${post.createTime?string('YYYY-MM-dd')?js_string}";
                    var count = dateMap.get(date);
                    dateMap.set(date, count == null || count == undefined ? 1 : count + 1);
                </#list>
            </#list>
        </@postTag>
        console.log(dateMap);
        // loop the data for the current year, generating the number of post per day
        var i = 0;
        var datePosts = '[';
        var dayTime = 3600 * 24 * 1000;
        for (var time = startDate; time <= endDate; time += dayTime) {
            var date = moment(time).format('YYYY-MM-DD');
            datePosts = (i === 0 ? datePosts + '["' : datePosts + ', ["') + date + '", '
                    + (dateMap.has(date) ? dateMap.get(date) : 0) + ']';
            i++;
        }
        datePosts += ']';
        datePosts = JSON.parse(datePosts);
        console.log(datePosts);
        var option = {
            title: {
                top: 10,
                text: '文章日历',
                subtext: '数据来源于 Halo',
                textStyle: {
                    color: '#464646',
                    fontSize: 20,
                }
            },
            tooltip: {
                padding: 10,
                backgroundColor: '#555',
                borderColor: '#777',
                borderWidth: 1,
                formatter: function (obj) {
                    var value = obj.value;
                    return '<div style="font-size: 14px;">' + value[0] + '：' + value[1] + '</div>';
                }
            },
            legend: {
                textStyle: {
                    color: '#999'
                }
            },
            visualMap: {
                show: true,
                showLabel: true,
                categories: [0, 1, 2, 3, 4],
                calculable: true,
                inRange: {
                    symbol: 'rect',
                    color: ['#ebedf0', '#c6e48b', '#7bc96f', '#239a3b', '#196127'],
                },
                itemWidth: 15,
                itemHeight: 15,
                orient: 'horizontal',
                right: 15,
                top: 0,
                textStyle: {
                    color: '#999'
                }
            },
            calendar: [{
                left: 30,
                right: 15,
                top: 90,
                range: rangeArr,
                cellSize: ['auto', '20'],
                splitLine: {
                    show: false
                },
                itemStyle: {
                    color: '#ebedf0',
                    borderColor: '#fff',
                    borderWidth: 2
                },
                yearLabel: {
                    show: false
                },
                monthLabel: {
                    nameMap: 'en',
                    fontSize: 11,
                    color: '#bebebe'
                },
                dayLabel: {
                    formatter: '{start}  1st',
                    nameMap: 'cn',
                    fontSize: 11,
                    color: '#bebebe'
                }
            }],
            series: [{
                type: 'heatmap',
                coordinateSystem: 'calendar',
                calendarIndex: 0,
                data: datePosts
            }]
        };
        calendarChart.setOption(option);
    </script>
    <script data-no-instant>
        InstantClick.on('change', function() {
            console.log("???");
            var categoryRadar = {
                <@categoryTag method="list">
                    <#list categories as category>
                        '${category.name!}': '${category.postCount!}',
                    </#list>
                </@categoryTag>
            };
            var values = Object.values(categoryRadar), keys = Object.keys(categoryRadar);
            if (keys.length < 3) {
                $("#category-echarts").remove();
            }
            var maxNum = Math.ceil(Math.max.apply(Math, _toConsumableArray(values)) / 5) * 5;
            var categoryChart = echarts.init(document.getElementById("category-echarts"));
            var option = {
                title: {
                    top: 10,
                    text: '文章分类雷达图',
                    subtext: '数据来源于 Halo',
                    textStyle: {
                        color: '#464646',
                        fontSize: 20,
                    }
                },
                tooltip: {
                    trigger: "item",
                    textStyle: {
                        align: "center",
                    },
                },
                radar: [{
                    indicator: (function () {
                        var indicators = [];
                        for (var i = 0; i < keys.length; i++) {
                            indicators.push({ text: keys[i], max: maxNum });
                        }
                        return indicators;
                    })(),
                    name: {
                        textStyle: {
                            color: "#999"
                        },
                    },
                    center: ["50%", "60%"],
                    radius: "60%"
                }],
                series: [{
                    type: "radar",
                    itemStyle: {
                        color: "rgb(123,234,185)",
                    },
                    lineStyle: {
                        color: "rgb(123,234,185)",
                    },
                    areaStyle: {
                        color: "rgb(123,234,185)",
                    },
                    data: [{
                        value: values,
                        name: "文章分类数量",
                    }]
                }]
            };
            console.log("?");
            categoryChart.setOption(option);
        });
        InstantClick.init();
    </script>
    <script>
        var calendarChart = echarts.init(document.getElementById('post-calendar'));
        var categoryChart = echarts.init(document.getElementById("category-echarts"));
        window.onresize = function() {
            calendarChart.resize();
            categoryChart.resize();
        };
    </script>
    </#if>
</#macro>

<#macro widgetRecentComments>
    <div class="widget bg-white w-full p-8 hover:shadow-lg duration-300">
        <div class="widget-title text-black font-bold mb-2">
            <p>最新评论</p>
        </div>
        <div class="widget-hr border-b border-gray-300 w-full mb-4">
        </div>
        <div class="widget-content text-767676">
            <@commentTag method="latest" top="5">
                <ul>
                    <#list comments.content as comment>
                        <li class="py-1 flex justify-start w-full space-x-1">
                            <div class="truncate block">
                                <i class="ri-arrow-right-s-fill"></i>
                                <a class="hover:text-black"
                                   title="${comment.content!}"
                                   href="${comment.post.fullPath!}#comment">${comment.author!}
                                    ：${comment.content!}</a>
                            </div>
                        </li>
                    </#list>
                </ul>
            </@commentTag>
        </div>
    </div>
</#macro>

<#macro widgetCatalog>
    <div class="widget bg-white w-full p-8 hover:shadow-lg duration-300" id="catalog-widget">
        <div class="widget-title text-black font-bold mb-2">
            <p>文章目录</p>
        </div>
        <div class="widget-hr border-b border-gray-300 w-full mb-4">
        </div>
        <div class="widget-content text-767676">
            <ul id="catalog">

            </ul>
        </div>
    </div>
</#macro>

<#macro widgetHotPost>
    <div class="widget bg-white w-full p-8 hover:shadow-lg duration-300">
        <div class="widget-title text-black font-bold mb-2">
            <p>热门文章</p>
        </div>
        <div class="widget-hr border-b border-gray-300 w-full mb-4">
        </div>
        <div class="widget-content text-767676">
            <ul id="hotPosts">
                <li class="text-center">Loading……</li>
            </ul>
        </div>
    </div>
</#macro>

<#macro widgetNewPost>
    <div class="widget bg-white w-full p-8 hover:shadow-lg duration-300">
        <div class="widget-title text-black font-bold mb-2">
            <p>最新文章</p>
        </div>
        <div class="widget-hr border-b border-gray-300 w-full mb-4">
        </div>
        <div class="widget-content text-767676">
            <ul id="newPosts">
                <@postTag method="latest" top="5">
                    <#list posts as post>
                        <li class="py-1 w-full flex justify-start space-x-1">
                            <i class="ri-arrow-right-s-fill"></i>
                            <a href="${post.fullPath!}">${post.title!}</a>
                        </li>
                    </#list>
                </@postTag>
            </ul>
        </div>
    </div>
</#macro>

<#macro widgetLinks>
    <div class="widget bg-white w-full p-8 hover:shadow-lg duration-300">
        <div class="widget-title text-black font-bold mb-2">
            <p>友情链接</p>
        </div>
        <div class="widget-hr border-b border-gray-300 w-full mb-4">
        </div>
        <div class="widget-content text-767676">
            <@linkTag method="listTeams">
                <#list teams as team>
                    <ul>
                        <#if team.team == "Friends">
                            <#list team.links as link>
                                <li class="py-1 flex justify-start w-full space-x-1">
                                    <div class="truncate block">
                                        <i class="ri-arrow-right-s-fill"></i>
                                        <a class="hover:text-black" href="${link.url!}"
                                           target="_blank">${link.name!}</a>
                                    </div>
                                </li>
                            </#list>
                        </#if>
                    </ul>
                </#list>
            </@linkTag>
        </div>
    </div>
</#macro>

<#--  右下角悬浮球  -->
<#macro moonMenu>
    <div class="moon-menu" id="moonMenu">
        <div class="moon-menu-items">
            <span class="moon-menu-item" onclick="back2Top()" style="opacity: 0;">
                <i class="ri-arrow-up-line" aria-hidden="true"></i>
            </span>
            <span class="moon-menu-item" onclick="back2Bottom()" style="opacity: 0;">
                <i class="ri-arrow-down-line" aria-hidden="true"></i>
            </span>
            <span class="moon-menu-item" onclick="toSearchBox()" style="opacity: 0;">
                <i class="fa fa-search" aria-hidden="true"></i>
            </span>
        </div>
        <div class="moon-menu-button" onclick="moonButton()">
            <svg class="moon-menu-bg">
            <circle class="moon-menu-cricle" cx="50%" cy="50%" r="44%"></circle>
            <circle class="moon-menu-border" cx="50%" cy="50%" r="48%" style="stroke-dasharray: 0, 196;"></circle>
            <g class="moon-dot">
                <circle r="0.2rem" cx="0" cy="-0.8rem"></circle>
                <circle r="0.2rem"></circle>
                <circle r="0.2rem" cx="0" cy="0.8rem"></circle>
            </g>
            </svg>
            <div class="moon-menu-content">
                <div class="moon-menu-icon" style="display: block;"></div>
                <div class="moon-menu-text" style="display: none;">1%</div>
            </div>
        </div>
    </div>
</#macro>

<#macro widgetTagsCloud>
    <div class="widget bg-white w-full p-8 hover:shadow-lg duration-300">
        <div class="widget-title text-black font-bold mb-2">
            <p>标签云</p>
        </div>
        <div class="widget-hr border-b border-gray-300 w-full mb-4">
        </div>
        <div id="tags-ball">加载中...</div>
    </div>
</#macro>