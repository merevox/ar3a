{extends file="parent:frontend/index/main-navigation.tpl"}

{block name='frontend_index_navigation_categories_top_home'}
    <li class="navigation--entry{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} is--active{/if} is--home" role="menuitem">
        {block name='frontend_index_navigation_categories_top_link_home'}
            <a class="navigation--link is--first{if $sCategoryCurrent == $sCategoryStart && $Controller == 'index'} active{/if}" href="{url controller='index'}" itemprop="url">
                {if $sCategoryContent.parentId <> 1}
                    <span itemprop="name">{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}</span>
                {else}
                    <span style="display:none;"itemprop="name">{s name='IndexLinkHome' namespace="frontend/index/categories_top"}{/s}</span>
                {/if}
            </a>
        {/block}
    </li>
{/block}


{block name='frontend_index_navigation_categories_top_link'}
	<a class="navigation--link{if $sCategory.flag || $baseUrl|strstr:"family"} is--active{/if}" href="{$sCategory.link}" itemprop="url"{if $sCategory.external && $sCategory.externalTarget} target="{$sCategory.externalTarget}"{/if}>
					<span itemprop="name">{$sCategory.description}</span>
	</a>
{/block}
