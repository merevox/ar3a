{extends file="parent:frontend/account/sidebar.tpl"}

{if $sUserLoggedIn || $showSidebar}
    <div class="account--menu is--rounded{if {config name=useSltCookie} || $sOneTimeAccount} is--personalized{/if}">
        {block name="frontend_account_menu"}
            {if !$sOneTimeAccount}
                {* Sidebar navigation headline *}
                {block name="frontend_account_menu_title"}
                    {if {config name=useSltCookie} && $userInfo}
                        <span class="navigation--headline">
                            {block name="frontend_account_menu_greeting"}
                                {s name="AccountGreetingBefore"}{/s}
                                {$userInfo['firstname']}
                                {s name="AccountGreetingAfter"}{/s}
                            {/block}
                        </span>
                    {else}
                        <span class="navigation--headline">
                            {s name="AccountHeaderNavigation"}{/s}
                        </span>
                    {/if}
                {/block}

                {* Sidebar menu container *}
                <div class="account--menu-container">

                    {block name="frontend_account_menu_container"}
                        {* Sidebar navigation *}
                        <ul class="sidebar--navigation navigation--list is--level0 show--active-items">
                            {block name="frontend_account_menu_list"}

                                {* Link to the account overview page *}
                                {block name="frontend_account_menu_link_overview"}
                                    {block name="frontend_account_menu_link_overview_SltCookie"}
                                        {if {config name=useSltCookie} && !$userInfo && $inHeader}
                                            <li class="navigation--entry">
                                                <span class="navigation--signin">
                                                    <a href="{url module='frontend' controller='account'}#hide-registration"
                                                       class="blocked--link btn is--primary navigation--signin-btn{if $register} registration--menu-entry entry--close-off-canvas{/if}"
                                                       data-collapseTarget="#registration"
                                                       data-action="close">
                                                        {s name="AccountLogin"}{/s}
                                                    </a>
                                                </span>
                                            </li>
                                            <p class="AccountOr">{s name="AccountOr"}{/s}</p>
                                            <li class="navigation--entry">
                                                <span class="navigation--signin">
                                                    <a href="{url module='frontend' controller='account'}#show-registration"
                                                       class="blocked--link btn is--primary navigation--signin-btn{if $register} registration--menu-entry entry--close-off-canvas{/if}"
                                                       data-collapseTarget="#registration"
                                                       data-action="open">
                                                        {s name="RevoxAccountRegister"}Registrieren{/s}
                                                    </a>
                                                </span>
                                            </li>
                                        {/if}
                                    {/block}

                                    {block name="frontend_account_menu_link_overview_link"}
                                        <div class="account--icon-holder" {if !$sUserLoggedIn}style="display: none;"{/if}>
                                            <div class="account--icon">
                                                <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/bearbeiten.png">
                                            </div>
                                            <div>
                                                <li class="navigation--entry">
                                                    <a href="{url module='frontend' controller='account'}" title="{s name="AccountLinkOverview"}{/s}" class="navigation--link{if {controllerName|lower} == 'account' && $sAction == 'index'} is--active{/if}">
                                                        {s name="AccountLinkOverview"}{/s}
                                                    </a>
                                                </li>
                                            </div>
                                        </div>
                                    {/block}
                                {/block}

                                {* Link to the account profile page *}
                                {block name="frontend_account_menu_link_profile"}
                                    <div class="account--icon-holder"  {if !$sUserLoggedIn}style="display: none;"{/if}>
                                        <div class="account--icon">
                                            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/bestehen.png">
                                        </div>
                                        <div>
                                            <li class="navigation--entry">
                                                <a href="{url module='frontend' controller='account' action=profile}" title="{s name="AccountLinkProfile"}{/s}" class="navigation--link{if {controllerName|lower} == 'account' && $sAction == 'profile'} is--active{/if}" rel="nofollow">
                                                    {s name="AccountLinkProfile"}{/s}
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                {/block}

                                {* Link to the user addresses *}
                                {block name="frontend_account_menu_link_addresses"}
                                    {if $inHeader}
                                        {block name="frontend_account_menu_link_addresses_inHeader"}
                                            <div class="account--icon-holder" {if !$sUserLoggedIn}style="display: none;"{/if}>
                                                <div class="account--icon">
                                                    <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/buch.png">
                                                </div>
                                                <div>
                                                    <li class="navigation--entry">
                                                        <a href="{url module='frontend' controller='address' action='index' sidebar=''}" title="{s name="AccountLinkAddresses"}{/s}" class="navigation--link{if {controllerName} == 'address'} is--active{/if}" rel="nofollow">
                                                            {s name="AccountLinkAddresses"}{/s}
                                                        </a>
                                                    </li>
                                                </div>
                                            </div>
                                        {/block}
                                    {else}
                                        {block name="frontend_account_menu_link_addresses_notInHeader"}
                                            <li class="navigation--entry">
                                                <a href="{url module='frontend' controller='address' action='index'}" title="{s name="AccountLinkAddresses"}My addresses{/s}" class="navigation--link{if {controllerName} == 'address'} is--active{/if}" rel="nofollow">
                                                    {s name="AccountLinkAddresses"}My addresses{/s}
                                                </a>
                                            </li>
                                        {/block}
                                    {/if}
                                {/block}

                                {* Link to the user payment method settings *}
                                {block name="frontend_account_menu_link_payment"}
                                    <div class="account--icon-holder" {if !$sUserLoggedIn}style="display: none;"{/if}>
                                        <div class="account--icon">
                                            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/brieftasche.png">
                                        </div>
                                        <div>
                                            <li class="navigation--entry">
                                                <a href="{url module='frontend' controller='account' action='payment'}" title="{s name="AccountLinkPayment"}{/s}" class="navigation--link{if $sAction == 'payment'} is--active{/if}" rel="nofollow">
                                                    {s name="AccountLinkPayment"}{/s}
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                {/block}

                                {* Link to the user orders *}
                                {block name="frontend_account_menu_link_orders"}
                                    <div class="account--icon-holder" {if !$sUserLoggedIn}style="display: none;"{/if}>
                                        <div class="account--icon">
                                            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/box.png">
                                        </div>
                                        <div>
                                            <li class="navigation--entry">
                                                <a href="{url module='frontend' controller='account' action='orders'}" title="{s name="AccountLinkPreviousOrders"}{/s}" class="navigation--link{if $sAction == 'orders'} is--active{/if}" rel="nofollow">
                                                    {s name="AccountLinkPreviousOrders"}{/s}
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                {/block}

                                {* Link to the user downloads *}
                                {block name="frontend_account_menu_link_downloads"}
                                    <span class="navigation--headline"  {if $sUserLoggedIn}style="display: none;"{/if}>
                                        {s name="RevoxAccountLinkNavigation"}Revox Business{/s}
                                    </span>
                                    <div class="account--icon-holder" {if $sUserLoggedIn}style="display: none;"{/if}>
                                        <div class="account--icon">
                                            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/plus.png">
                                        </div>
                                        <div>
                                            <li class="navigation--entry">
                                                <a href="https://www.revox-directqpartner.com/"  target="_blank" title="" class="navigation--link{if $sAction == 'orders'} is--active{/if}" rel="nofollow">
                                                    {s name="RevoxAccountLinkNavigationB2b"}Direct-Q-Partner Portal{/s}
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                    <div class="account--icon-holder" {if $sUserLoggedIn}style="display: none;"{/if}>
                                        <div class="account--icon">
                                            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/plus.png">
                                        </div>
                                        <div>
                                            <li class="navigation--entry">
                                                <a href="https://support-revox.de/" target="_blank" title="" class="navigation--link{if $sAction == 'orders'} is--active{/if}" rel="nofollow">
                                                    {s name="RevoxAccountLinkNavigationSupport"}Revox Support{/s}
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                    <div class="account--icon-holder"  {if $sUserLoggedIn}style="display: none;"{/if}>
                                        <div class="account--icon">
                                            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/plus.png">
                                        </div>
                                        <div>
                                            <li class="navigation--entry">
                                                <a href="https://www.revox-academy.com/" target="_blank" title="" class="navigation--link{if $sAction == 'orders'} is--active{/if}" rel="nofollow">
                                                    {s name="RevoxAccountLinkNavigationAcademy"}Revox Academy{/s}
                                                </a>
                                            </li>
                                        </div>
                                    </div>
                                {/block}


                                {* Link to the user product notes *}
                                {block name="frontend_account_menu_link_notes"}

                                {/block}

                                {* Link to the partner statistics *}
                                {block name="frontend_account_menu_link_partner_statistics"}
                                    {if $sUserLoggedIn && !$inHeader}
                                        {action module='frontend' controller="account" action="partnerStatisticMenuItem"}
                                    {/if}
                                {/block}

                                {* Logout action *}
                                {block name="frontend_account_menu_link_logout"}
                                    {if {config name=useSltCookie} && $userInfo}
                                        <li class="navigation--entry">
                                            {block name="frontend_account_menu_logout_personalized_link"}
                                                <a href="{url controller='account' action='logout'}" title="{s name="AccountLogout"}{/s}"
                                                   class="navigation--link link--logout navigation--personalized">
                                                    {block name="frontend_account_menu_logout_personalized"}

                                                        {block name="frontend_account_menu_logout_personalized_link_user_info"}
                                                            <span class="navigation--logout-personalized blocked--link">

                                                                {block name="frontend_account_menu_logout_personalized_link_not_user"}
                                                                    <span class="logout--not-user blocked--link">{s name="AccountNot"}{/s}</span>
                                                                {/block}

                                                                {block name="frontend_account_menu_logout_personalized_link_user_name"}
                                                                    <span class="logout--user-name blocked--link">{$userInfo['firstname']}?</span>
                                                                {/block}
                                                        </span>
                                                        {/block}

                                                        {block name="frontend_account_menu_logout_personalized_logout_text"}
                                                            <span class="navigation--logout blocked--link">{s name="AccountLogout"}{/s}</span>
                                                        {/block}
                                                    {/block}
                                                </a>
                                            {/block}
                                        </li>
                                    {elseif $sUserLoggedIn}
                                        {block name="frontend_account_menu_link_logout_standard"}
                                            <li class="navigation--entry">
                                                {block name="frontend_account_menu_link_logout_standard_link"}
                                                    <a href="{url module='frontend' controller='account' action='logout'}" title="{s name='AccountLinkLogout2'}{/s}" class="navigation--link link--logout" rel="nofollow">
                                                        {block name="frontend_account_menu_link_logout_standard_link_icon"}
                                                            <i class="icon--logout"></i>
                                                        {/block}

                                                        {block name="frontend_account_menu_link_logout_standard_link_text"}
                                                            <span class="navigation--logout logout--label">{s name="AccountLinkLogout2"}{/s}</span>
                                                        {/block}
                                                    </a>
                                                {/block}
                                            </li>
                                        {/block}
                                    {/if}
                                {/block}
                            {/block}
                        </ul>
                    {/block}
                </div>
            {else}
                {* Sidebar menu container *}
                <div class="account--menu-container">
                    <ul class="sidebar--navigation navigation--list is--level0 show--active-items">
                        {block name="frontend_account_menu_logout_onetimeaccount"}
                            <li class="navigation--entry">
                                {block name="frontend_account_menu_logout_onetimeaccount_link"}
                                    <a href="{url controller='account' action='abort'}" title="{s name="OneTimeOrderAbort"}{/s}"
                                       class="navigation--link link--logout navigation--personalized link--abort">
                                        {block name="frontend_account_menu_logout_onetimeaccount_link_text"}
                                            <span class="navigation--logout blocked--link">{s name="OneTimeOrderAbort"}{/s}</span>
                                        {/block}
                                    </a>
                                {/block}
                            </li>
                        {/block}
                    </ul>
                </div>
            {/if}
        {/block}
    </div>
{/if}
