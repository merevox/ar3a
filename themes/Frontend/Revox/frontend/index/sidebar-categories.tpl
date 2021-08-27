{extends file="parent:frontend/index/sidebar-categories.tpl"}

{* Maincategories left *}
{function name=categories level=0}
    <ul class="sidebar--navigation categories--navigation navigation--list{if !$level} is--drop-down{/if} is--level{$level}{if $level > 1} navigation--level-high{/if} is--rounded" role="menu">
        {block name="frontend_index_categories_left_before"}{/block}

        {foreach $categories as $category}

            {block name="frontend_index_categories_left_entry"}
                {* Variable zur Durchnummerierung der Bilder *}
                {if !$lfdnr}
                    {assign var="lfdnr" value=0}
                {/if}
                {* *}
                <li class="navigation--entry{if $category.flag} is--active{/if}{if $category.subcategories} has--sub-categories{/if}{if $category.childrenCount} has--sub-children{/if}" role="menuitem">
                    <a class="navigation--link{if $category.flag} is--active{/if}{if $category.subcategories} has--sub-categories{/if}{if $category.childrenCount} link--go-forward{/if}"
                        href="{$category.link}"
                        data-categoryId="{$category.id}"
                        data-fetchUrl="{url module=widgets controller=listing action=getCategory categoryId={$category.id}}"
                        title="{$category.description|escape}"
                        {if $category.external && $category.externalTarget}target="{$category.externalTarget}"{/if}>
                        <div class="kategorie-text">{$category.description}</div>

                        {if $category.childrenCount}
                            <span class="is--icon-right">
                                <i class="icon--arrow-right"></i>
                            </span>
                        {/if}

                        <div class="category-small-picture">
                            <img srcset="{link file=$sAdvancedMenu[$lfdnr].media.thumbnails[3].sourceSet}" alt="{$sBanner.description|escape}" />
                        </div>
                        {* Der laufenden Nummer zur Bildanzeige wird ein Wert hinzugerechnet *}
                        {math assign="lfdnr" equation="x + y" x=$lfdnr y=1}
                    </a>
                    {block name="frontend_index_categories_left_entry_subcategories"}

                    {/block}
                </li>
            {/block}

        {/foreach}
        {block name="frontend_index_categories_left_after"}
			{if !$sShopname|strstr:"purSonic"}
            <div class="sidebar--social">
                <div class="RevoxSidebarSocialHeader">{s namespace='frontend/index/menu_left' name="RevoxIndexSidebarSocial"}Folgen Sie uns auf:{/s}</div>
                <a href="https://www.facebook.com/pg/RevoxOfficialSite/" target="_blank" title="{s namespace='frontend/index/menu_left' name="RevoxIndexSidebarSocialFacebook"}Revox Facebook Account{/s}"><img class="RevoxSidebarSocialImage" src="{link file='themes/Frontend/Revox/frontend/_public/src/img/icons/social-media-icons/Icon_FB.svg'}" title="{s namespace='frontend/index/menu_left' name="RevoxIndexSidebarSocialFacebook"}{/s}"></a>
                <a href="https://www.instagram.com/revox_official/" target="_blank" ttitle="{s namespace='frontend/index/menu_left' name="RevoxIndexSidebarSocialInstagram"}Revox Instagram Account{/s}"><img class="RevoxSidebarSocialImage" src="{link file='themes/Frontend/Revox/frontend/_public/src/img/icons/social-media-icons/Icon_Insta.svg'}" title="{s namespace='frontend/index/menu_left' name="RevoxIndexSidebarSocialInstagram"}{/s}"></a>
                <a href="https://www.youtube.com/user/RevoxOfficialSite/" target="_blank" ttitle="{s namespace='frontend/index/menu_left' name="RevoxIndexSidebarSocialYoutube"}Revox Youtube Channel{/s}"><img class="RevoxSidebarSocialImage" src="{link file='themes/Frontend/Revox/frontend/_public/src/img/icons/social-media-icons/Icon_Youtube.svg'}" title="{s namespace='frontend/index/menu_left' name="RevoxIndexSidebarSocialYoutube"}{/s}"></a>
            </div>
			{/if}
        {/block}
    </ul>
{/function}

{if $sCategories}
    {call name=categories categories=$sCategories}
{elseif $sMainCategories}
    {call name=categories categories=$sMainCategories}
{/if}
