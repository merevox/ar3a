{extends file="parent:frontend/index/shop-navigation.tpl"}

{* Menu (Off canvas left) trigger *}
{block name='frontend_index_offcanvas_left_trigger'}
    <li class="navigation--entry entry--menu-left" role="menuitem" {if $baseUrl|strstr:"world" || $sShopname|strstr:"purSonic"}style="position:unset;"{/if}>
        <a class="entry--link entry--trigger btn is--icon-left" href="#offcanvas--left" data-offcanvas="true" data-offCanvasSelector=".sidebar-main">
            <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/burger.png">
            <p>{s namespace='frontend/index/menu_left' name="IndexLinkMenu"}{/s}</p>
        </a>
    </li>
{/block}

{* Search form *}
{block name='frontend_index_search'}

{/block}

{foreach $mediameetsMarketingSuite as $marketing}
	{assign var="aktshop" value=$marketing.shopId}
{/foreach}

{* Cart entry *}
{block name='frontend_index_checkout_actions'}
	{* Include of the cart *}
	{if !$baseUrl|strstr:"world" && !$sShopname|strstr:"purSonic"}
    	{block name='frontend_index_checkout_actions_include'}
        	{action module=widgets controller=checkout action=info}
        {/block}
	{/if}
	{if !$baseUrl|strstr:"/world" && !$baseUrl|strstr:"/europe" && !$sShopname|strstr:"purSonic"}
			<li class="navigation--entry entry--language" role="menuitem">
				<div class="language--dropdown">
					<div data-modalbox="true" data-mode="local" data-targetselector="a" data-width="400" data-height="600" data-title="Sprache auswählen:" data-content="
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
							</div>">

						{if ($Locale == "de_DE") or ($Locale	== "de_CH")}
							<button class="entry--link entry--trigger btn is--icon-left language--link">
								<img src="/themes/Frontend/Revox/frontend/_public/src/img/icons/germany.png" >
							</button>
						{else}
							<button class="entry--link entry--trigger btn is--icon-left language--link">
								<img src="/themes/Frontend/Revox/frontend/_public/src/img/icons/gb.png">
							</button>
						{/if}
					</div>			
				</div>
				<div class="ajax-loader">&nbsp;</div>
			</li>
	{/if}
{/block}