{extends file="parent:frontend/index/index.tpl"}

{* Shop header *}
{block name='frontend_index_navigation'}
	{assign var="s100" value=$smarty.get.s100}
    <header class="header-main">
        {* Include the top bar navigation *}
        {block name='frontend_index_top_bar_container'}

        {/block}

        {block name='frontend_index_header_navigation'}
            <div class="container header--navigation">
                {* Logo container *}
                {block name='frontend_index_logo_container'}
                    {include file="frontend/index/logo-container.tpl"}
                {/block}
            </div>
			{if $baseUrl <> "/summer-time-promotion"}
				<div class="header-main-shopnavigation">
					{* Importiertes Maincategories navigation top *}
					<nav class="navigation-main" {if $baseUrl|strstr:"world" || $sShopname|strstr:"purSonic"}style="margin-right:0px;"{/if}>
						<div class="container" data-menu-scroller="false" data-listSelector=".navigation--list.container" data-viewPortSelector=".navigation--list-wrapper">
							{block name="frontend_index_navigation_categories_top_include"}
								{include file='frontend/index/main-navigation.tpl'}
							{/block}
						</div>
					</nav>

					{* Shop navigation *}
					{block name='frontend_index_shop_navigation'}
						{include file="frontend/index/shop-navigation.tpl"}
					{/block}

					{block name='frontend_index_container_ajax_cart'}
						<div class="container--ajax-cart" data-collapse-cart="true"{if $theme.offcanvasCart} data-displayMode="offcanvas"{/if}></div>
					{/block}
				</div>
			{/if}
        {/block}
    </header>

    {* Maincategories navigation top *}
    {block name='frontend_index_navigation_categories_top'}

    {/block}
{/block}

{* Breadcrumb *}
{block name='frontend_index_breadcrumb'}

{/block}

{* Footer *}

{block name="frontend_index_footer"}

{if $baseUrl <> "/summer-time-promotion"}

    {* Vat info *}
    {block name='frontend_index_footer_vatinfo'}
        <div class="footer--vat-info">
            <p class="vat-info--text">
                {if $sOutputNet}
                    {s name='FooterInfoExcludeVat' namespace="frontend/index/footer"}{/s}
                {else}
                    {s name='FooterInfoIncludeVat' namespace="frontend/index/footer"}{/s}
                {/if}
            </p>
        </div>
    {/block}
	<div class="footer-company-message">
		{s name='RevoxFooterCompanyMessage' namespace="frontend/index/footer"}{/s}
	</div>
    <footer class="footer-main">
		<div class="sellerhiglights">
			{s name='RevoxFooterSellerHighlights' namespace="frontend/index/footer"}
				<img src="themes/Frontend/Revox/frontend/_public/src/img/icons/lkw.png"><span>kostenloser Versand</span>
				<img src="themes/Frontend/Revox/frontend/_public/src/img/icons/geld.png"><span>14 Tage Rückgaberecht</span>
				<img src="themes/Frontend/Revox/frontend/_public/src/img/icons/schild.png"><span>2 Jahre Garantie</span>
			{/s}
		</div>
        <div class="container">
            {block name="frontend_index_footer_container"}
                {include file='frontend/index/footer.tpl'}
            {/block}
        </div>
    </footer>
	
{/if}
	
{/block}

