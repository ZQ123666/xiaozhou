<#--
	@package Akina
-->
<#include "header.ftl">
<@header title="${blog_title!}">
	<div class="blank"></div>
</@header>


<#if settings.head_notice!false && settings.notice_title!=''>
	<div class="notice">
		<i class="iconfont">&#xe66b;</i>
		<div class="notice-content">${settings.notice_title!}</div>
	</div>
</#if>

<#if settings.top_feature!true>
	<#include "layouts/feature.ftl">
</#if>

<div id="primary" class="content-area">
	<main id="main" class="site-main" role="main">
		<h1 class="main-title">Posts</h1>
		<#if posts?? && posts.getTotalElements() gt 0>
			<#--Start the Loop-->
			<#if (settings.post_list_style!'standard') == 'standard'>
				<#list posts.content as post>
					<#include "tpl/content.ftl">
				</#list>
			<#else>
				<#include "tpl/content-thumb.ftl">
			</#if>
		<#else>
			<#include "tpl/content-none.ftl">
		</#if>
	</main><!-- #main -->

	<@paginationTag method="index" page="${posts.number}" total="${posts.totalPages}" display="3">
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