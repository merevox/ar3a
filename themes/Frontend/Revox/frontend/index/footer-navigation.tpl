{extends file="parent:frontend/index/footer-navigation.tpl"}

{block name="frontend_index_footer_column_service_hotline"}
    <div class="footer--column column--menu is--first block">
        {block name="frontend_index_footer_column_service_menu_headline"}
            <div class="column--headline">{s name="revoxShopNavi1"}Revox{/s}</div>
        {/block}

        {block name="frontend_index_footer_column_service_menu_content"}
            <nav class="column--navigation column--content">
                <ul class="navigation--list" role="menu">
                    {block name="frontend_index_footer_column_service_menu_before"}{/block}
                    {foreach $sMenu.bottom as $item}

                        {block name="frontend_index_footer_column_service_menu_entry"}
                            <li class="navigation--entry" role="menuitem">
                                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                                    <span itemprop="name">&#187;&nbsp;{$item.description}</span>
                                </a>

                                {* Sub categories *}
                                {if $item.childrenCount > 0}
                                    <ul class="navigation--list is--level1" role="menu">
                                        {foreach $item.subPages as $subItem}
                                            <li class="navigation--entry" role="menuitem">
                                                <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                                                    {$subItem.description}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </li>
                        {/block}
                    {/foreach}

                    {block name="frontend_index_footer_column_service_menu_after"}{/block}
                </ul>
            </nav>
        {/block}
    </div>
{/block}

{block name="frontend_index_footer_column_service_menu"}
    <div class="footer--column column--menu block">
        {block name="frontend_index_footer_column_information_menu_headline"}
            <div class="column--headline">{s name="revoxShopNavi2"}Feedback & Service{/s}</div>
        {/block}

        {block name="frontend_index_footer_column_information_menu_content"}
            <nav class="column--navigation column--content">
                <ul class="navigation--list" role="menu">
                    {block name="frontend_index_footer_column_information_menu_before"}{/block}
                    {foreach $sMenu.bottom2 as $item}

                        {block name="frontend_index_footer_column_information_menu_entry"}
                            <li class="navigation--entry" role="menuitem">
                                <a class="navigation--link" href="{if $item.link}{$item.link}{else}{url controller='custom' sCustom=$item.id title=$item.description}{/if}" title="{$item.description|escape}"{if $item.target} target="{$item.target}"{/if}>
                                    <span itemprop="name">&#187;&nbsp;{$item.description}</span>
                                </a>

                                {* Sub categories *}
                                {if $item.childrenCount > 0}
                                    <ul class="navigation--list is--level1" role="menu">
                                        {foreach $item.subPages as $subItem}
                                            <li class="navigation--entry" role="menuitem">
                                                <a class="navigation--link" href="{if $subItem.link}{$subItem.link}{else}{url controller='custom' sCustom=$subItem.id title=$subItem.description}{/if}" title="{$subItem.description|escape}"{if $subItem.target} target="{$subItem.target}"{/if}>
                                                    {$subItem.description}
                                                </a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}

                            </li>
                        {/block}
                    {/foreach}
                    {block name="frontend_index_footer_column_information_menu_after"}{/block}
                </ul>
            </nav>
        {/block}
    </div>
{/block}

{block name="frontend_index_footer_column_information_menu"}
    <div class="footer--column column--newsletter block">
        {block name="frontend_index_footer_column_newsletter_headline"}
            <div class="column--headline">{s name="sFooterNewsletterHead"}Newsletter{/s}</div>
        {/block}

        {block name="frontend_index_footer_column_newsletter_content"}
            <div class="column--content" data-newsletter="true">
                <p class="column--desc">
                    {s name="sFooterNewsletter"}Abonnieren Sie den kostenlosen Newsletter und verpassen Sie keine Neuigkeit oder Aktion mehr von {config name=shopName}.{/s}
                </p>

                {block name="frontend_index_footer_column_newsletter_form"}
                    <form class="newsletter--form" action="{url controller='newsletter'}" method="post">
                        <input type="hidden" value="1" name="subscribeToNewsletter" />

                        {block name="frontend_index_footer_column_newsletter_form_field_wrapper"}
                            <div class="content">
                                {block name="frontend_index_footer_column_newsletter_form_field"}
                                    <input type="email" name="newsletter" class="newsletter--field" placeholder="{s name="IndexFooterNewsletterValue"}{/s}" />
                                    {if {config name="newsletterCaptcha"} !== "nocaptcha"}
                                        <input type="hidden" name="redirect">
                                    {/if}
                                {/block}

                                {block name="frontend_index_footer_column_newsletter_form_submit"}
                                    <button type="submit" class="newsletter--button btn">
                                        <i class="icon--mail"></i> <span class="button--text">{s name='IndexFooterNewsletterSubmit'}{/s}</span>
                                    </button>
                                {/block}
                            </div>
                        {/block}

                        {* Data protection information *}
                        {block name="frontend_index_footer_column_newsletter_privacy"}
                            {if {config name=ACTDPRTEXT} || {config name=ACTDPRCHECK}}
                                {$hideCheckbox=false}

                                {* If a captcha is active, the user has to accept the privacy statement on the newsletter page *}
                                {if {config name=newsletterCaptcha} !== "nocaptcha"}
                                    {$hideCheckbox=true}
                                {/if}

                                {include file="frontend/_includes/privacy.tpl" hideCheckbox=$hideCheckbox}
                            {/if}
                        {/block}
                    </form>
                {/block}
            </div>
        {/block}
    </div>
{/block}

{block name="frontend_index_footer_column_newsletter"}
    <div class="footer--column column--menu is--last block">
        <div class="column--headline">{s name="RevoxFooterSocialHeadline"}Social Media{/s}</div>
        <div class="column--content">
            <div class="footer--social">
                <p name="RevoxSozialFollower">{s name="RevoxFooterSocial"}Folgen Sie uns:{/s}</p>
				{s name="RevoxFooterSocialLogos"}
                <a href="https://www.facebook.com/RevoxOfficialSite" target="_blank" title="Facebook"><img class="RevoxFooterSocialImage" src="{link file='themes/Frontend/Revox/frontend/_public/src/img/icons/social-media-icons/Icon_FB.svg'}"></a>
                <a href="https://www.youtube.com/user/RevoxOfficialSite" target="_blank" title="Youtube"><img class="RevoxFooterSocialImage" src="{link file='themes/Frontend/Revox/frontend/_public/src/img/icons/social-media-icons/Icon_Youtube.svg'}"></a>
                <a href="https://www.instagram.com/revox_official/" target="_blank" title="Instagram"><img class="RevoxFooterSocialImage" src="{link file='themes/Frontend/Revox/frontend/_public/src/img/icons/social-media-icons/Icon_Insta.svg'}"></a>
				{/s}
            </div>
        </div>

	{if !$baseUrl|strstr:"/world"}
		{if !$baseUrl|strstr:"/europe"}
			{if !$sShopname|strstr:"purSonic"}
			<div class="sub_language">
				<div data-modalbox="true" data-mode="local" data-targetselector="a" data-width="400" data-height="600" data-title="{s name="revoxlanguageandcountry"}Sprache auswählen:{/s}" data-content="
					<div style='margin-top: 60px;' class='footer_language'>
						<div>
							<a href='{if $baseUrl|strstr:"/en"}{$baseUrl|replace:"/en":""}{else}{$baseUrl}{/if}'>
								<div style='width: 15%; display: flex; margin-left: 100px;'>
									<img src='/themes/Frontend/Revox/frontend/_public/src/img/icons/germany.png' style='height:18px;'>
									<p style='color: black; font-size: 17px; margin-left: 15px;' id='languagebutton'>{s name="revoxDElanguage"}Deutsch{/s}</p>
								</div>
							</a>
						</div>
						<div>
							<a href='{if $baseUrl|strstr:"/en"}{$baseUrl}{else}/en{$baseUrl}{/if}'>
								<div style='width: 15%; display: flex; margin-left: 100px;'>
									<img src='/themes/Frontend/Revox/frontend/_public/src/img/icons/gb.png' style='height:18px;'>
									<p style='color: black; font-size: 17px; margin-left: 15px;' id='languagebutton'>{s name="revoxGBlanguage"}Englisch{/s}</p>
								</div>
							</a>
						</div>
					</div>
					
					">
					<li class="sub_language">
						<div class="sub_language_header"><p>{s name="RevoxFooterLanguage"}Sprache{/s}:</p></div>
						{if ($Locale == "de_DE") or ($Locale	== "de_CH")}
						  <a href="#" style="display:flex;">
									<img src="/themes/Frontend/Revox/frontend/_public/src/img/icons/germany.png">
							<i class="icon--arrow-down"></i>
								</a>
						{else}
						  <a href="#" style="display:flex;">
									<img src="/themes/Frontend/Revox/frontend/_public/src/img/icons/gb.png">
							<i class="icon--arrow-down"></i>
								</a>
						{/if}
					</li>
				</div>
			</div>
			{/if}
		{/if}
	{/if}
    </div>
{/block}