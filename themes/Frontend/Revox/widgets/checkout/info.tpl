{extends file="parent:widgets/checkout/info.tpl"}

{* Merkzettel wird ausgeblendet *}
{block name="frontend_index_checkout_actions_notepad"}
    {* Search form *}
    {block name='frontend_index_search'}
        <li class="navigation--entry entry--search" role="menuitem" data-search="true" aria-haspopup="true"{if $theme.focusSearch && {controllerName|lower} == 'index'} data-activeOnStart="true"{/if} data-minLength="{config name="MinSearchLenght"}">
            {s namespace="frontend/index/search" name="IndexTitleSearchToggle" assign="snippetIndexTitleSearchToggle"}{/s}
            <a class="btn entry--link entry--trigger" href="#show-hide--search" title="{$snippetIndexTitleSearchToggle|escape}">
                <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/suche.png">

                {block name='frontend_index_search_display'}
                    <span class="search--display">{s namespace='frontend/index/search' name="IndexSearchFieldSubmit"}{/s}</span>
                {/block}
            </a>

            {* Include of the search form *}
            {block name='frontend_index_search_include'}
                {include file="frontend/index/search.tpl"}
            {/block}
        </li>
    {/block}
{/block}

{* My account entry *}
{block name="frontend_index_checkout_actions_my_options"}
    <li class="navigation--entry entry--account{if {config name=useSltCookie} || $sOneTimeAccount} with-slt{/if}"
        role="menuitem"
        data-offcanvas="true"
        data-offCanvasSelector=".account--dropdown-navigation">
        {block name="frontend_index_checkout_actions_account"}
            <a href="{url controller='account'}"
               title="{"{if $userInfo}{s name="AccountGreetingBefore" namespace="frontend/account/sidebar"}{/s}{$userInfo['firstname']}{s name="AccountGreetingAfter" namespace="frontend/account/sidebar"}{/s} - {/if}{s namespace='frontend/index/checkout_actions' name='IndexLinkAccount'}{/s}"|escape}"
               class="btn is--icon-left entry--link account--link{if $userInfo} account--user-loggedin{/if}">
                <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/benutzer.png">
            </a>
        {/block}

        {if {config name=useSltCookie} || $sOneTimeAccount}
            {block name="frontend_index_checkout_actions_account_navigation"}
                <div class="account--dropdown-navigation">

                    {block name="frontend_index_checkout_actions_account_navigation_smartphone"}
                        <div class="navigation--smartphone">
                            <div class="entry--close-off-canvas">
                                <a href="#close-account-menu"
                                   class="account--close-off-canvas"
                                   title="{s namespace='frontend/index/menu_left' name="IndexActionCloseMenu"}{/s}">
                                    {s namespace='frontend/index/menu_left' name="RevoxIndexActionCloseMenu"}Schliessen{/s} <i class="icon--cross"></i>
                                </a>
                            </div>
                        </div>
                    {/block}

                    {block name="frontend_index_checkout_actions_account_menu"}
                        {include file="frontend/account/sidebar.tpl" showSidebar=true inHeader=true}
                    {/block}
                </div>
            {/block}
        {/if}
    </li>
{/block}

{* Cart entry *}
{block name="frontend_index_checkout_actions_cart"}
    <li class="navigation--entry entry--cart" role="menuitem">
        {s namespace="frontend/index/checkout_actions" name="IndexLinkCart" assign="snippetIndexLinkCart"}{/s}
        <a class="btn is--icon-left cart--link" href="{url controller='checkout' action='cart'}" title="{$snippetIndexLinkCart|escape}">
            <span class="cart--display">
                {if $sUserLoggedIn}
                    {s name='IndexLinkCheckout' namespace='frontend/index/checkout_actions'}{/s}
                {else}
                    {s namespace='frontend/index/checkout_actions' name='IndexLinkCart'}{/s}
                {/if}
            </span>

            <span class="badge is--primary is--minimal cart--quantity{if $sBasketQuantity < 1} is--hidden{/if}">{$sBasketQuantity}</span>

            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/supermarkt.png">
        </a>
        <div class="ajax-loader">&nbsp;</div>
    </li>
{/block}