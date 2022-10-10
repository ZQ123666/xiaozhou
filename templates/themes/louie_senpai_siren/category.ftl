<#--
    @package Akina
-->
<#include "header.ftl">
<@header title="分类：${category.name!} - ${blog_title!}">
    <#if (settings.patternimg!true) && (settings.category_patternimg?? && settings.category_patternimg!='')>
        <div class="pattern-center">
            <div class="pattern-attachment-img" style="background-image: url('${settings.category_patternimg!}')"> </div>
            <header class="pattern-header">
                <h1 class="cat-title">分类：${category.name!}</h1>
                <span class="cat-des">${category.description!}</span>
            </header>
        </div>
    <#else>
        <div class="blank"></div>
    </#if>
</@header>

<div id="primary" class="content-area">
    <main id="main" class="site-main" role="main">
        <#if posts?? && posts.content?size gt 0>
            <#if !(settings.patternimg!true) || !(settings.category_patternimg?? && settings.category_patternimg!='')>
                <header class="page-header">
                    <h1 class="cat-title">${category.name!}</h1>
                    <span class="cat-des">
                        ${category.description!}
                    </span>
                </header><!-- .page-header -->
            </#if>
            <#-- Start the Loop -->
            <#list posts.content as post>
                <#include "tpl/content.ftl">
            </#list>
            <div class="clearer"></div>
        <#else>
            <#include "tpl/content-none.ftl">
        </#if>
    </main><!-- #main -->
    <@paginationTag method="categoryPosts" page="${posts.number}" total="${posts.totalPages}" display="3" slug="${category.slug!}">
        <#if (settings.pagenav_style!'ajax') == 'ajax'>
            <div id="pagination">
                <#if pagination.hasNext>
                    <a href="${pagination.nextPageFullPath!}" class="">下一页</a>
                <#else>
                    <span>没有更多文章了</span>
                </#if>
            </div>
        <#else>
            <nav class="navigator">
                <#if pagination.hasPrev>
                    <a href="${pagination.prevPageFullPath!}"><i class="iconfont">&#xe679;</i></a>
                </#if>
                <#if pagination.hasNext>
                    <a href="${pagination.nextPageFullPath!}"><i class="iconfont">&#xe6a3;</i></a>
                </#if>
            </nav>
        </#if>
    </@paginationTag>
</div><!-- #primary -->
<#include "footer.ftl">
