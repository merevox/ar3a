{extends file="parent:frontend/detail/data.tpl"}

{* Regular price *}
{block name='frontend_detail_data_price_default'}
    {if !$sArticle.no_sale}
		<span class="price--content content--default">
            <meta itemprop="price" content="{$sArticle.price|replace:',':'.'}">
            {if $sArticle.priceStartingFrom}{s name='ListingBoxArticleStartsAt' namespace="frontend/listing/box_article"}{/s} {/if}
			{if $aktshop == 10}{$sArticle.price|currency|replace:'CHF':'CHF '}{else}{$sArticle.price|currency}{/if}{s name="Star" namespace="frontend/listing/box_article"}{/s}
        </span>
    {/if}
{/block}

{* Tax information werden ausgeblendet. Dafür gibt es Highlight Icons*}
{block name='frontend_detail_data_tax'}
    {if !$sArticle.no_sale}
	{if $aktshop <> 9}
		{if ($sArticle.articleID == 1000) || ($sArticle.articleID == 1000)}
			{if $baseUrl|strstr:"/en/ch/"}
				<a href="https://revox.com/en/ch/vorteilaktion">
			{elseif $baseUrl|strstr:"/ch/"}
				<a href="https://revox.com/ch/vorteilaktion">
			{elseif $baseUrl|strstr:"/en/"}
				<a href="https://revox.com/en/vorteilaktion">
			{else}
				<a href="https://revox.com/vorteilaktion">
			{/if}
		{*else}
			{if $baseUrl|strstr:"/en/"}
				<a href="https://revox.com/en/tauschzeit">
			{else}
				<a href="https://revox.com/tauschzeit">
			{/if*}
		{/if}
		<div id="s100-silver-button">
			{if ($sArticle.articleID == 7) || ($sArticle.articleID == 10) || ($sArticle.articleID == 11) || ($sArticle.articleID == 12) || ($sArticle.articleID == 13) || ($sArticle.articleID == 14) || ($sArticle.articleID == 15) || ($sArticle.articleID == 16) || ($sArticle.articleID == 17) || ($sArticle.articleID == 18) || ($sArticle.articleID == 20) || ($sArticle.articleID == 21) || ($sArticle.articleID == 27) || ($sArticle.articleID == 32) || ($sArticle.articleID == 48)}
				{*if ($Locale == "de_DE") || ($Locale == "de_CH")}
					<img src="https://revox.com/media/image/41/d2/46/Revox-Button-TAUSCHZEIT-Angebot-Lautsprecher-Audiosysteme-landingpage.png">
				{else}
					<img src="https://revox.com/media/image/62/a9/9a/EN_Revox-Button-TAUSCHZEIT-Angebot-Lautsprecher-Audiosysteme.png">
				{/if*}
			{elseif ($sArticle.articleID == 1000) || ($sArticle.articleID == 1000)}
				<img src="https://revox.com/media/image/ba/8e/f0/Button-Fussball-klicken_web.png">
			{/if}
		</div>
		</a>
	{/if}
	<div class="sellerhiglights" 
	{if (($sArticle.articleID == 7) || ($sArticle.articleID == 10) || ($sArticle.articleID == 11) || ($sArticle.articleID == 12) || ($sArticle.articleID == 13) || ($sArticle.articleID == 14) || ($sArticle.articleID == 15) || ($sArticle.articleID == 16) || ($sArticle.articleID == 17) || ($sArticle.articleID == 18) || ($sArticle.articleID == 20) || ($sArticle.articleID == 21) || ($sArticle.articleID == 27) || ($sArticle.articleID == 32) || ($sArticle.articleID == 48)) && ($aktshop != 9)}
						style="margin-top: 15px;"
		{/if}
	>
        <div><img src="themes/Frontend/Revox/frontend/_public/src/img/icons/lkw.png"><span>{s name="RevoxDetailLowsend"}kostenloser Versand{/s}</span></div>
{if (($sArticle.articleID == 7) || ($sArticle.articleID == 10) || ($sArticle.articleID == 11) || ($sArticle.articleID == 12) || ($sArticle.articleID == 13) || ($sArticle.articleID == 14) || ($sArticle.articleID == 15) || ($sArticle.articleID == 16) || ($sArticle.articleID == 17) || ($sArticle.articleID == 18) || ($sArticle.articleID == 20) || ($sArticle.articleID == 21) || ($sArticle.articleID == 27) || ($sArticle.articleID == 32) || ($sArticle.articleID == 48)) && ($aktshop != 9)}
        <div><img src="themes/Frontend/Revox/frontend/_public/src/img/icons/geld.png"><span>{s name="RevoxDetailGivebackLarge"}30 Tage Rückgaberecht{/s}</span></div>
{else}
		<div><img src="themes/Frontend/Revox/frontend/_public/src/img/icons/geld.png"><span>{s name="RevoxDetailGiveback"}14 Tage Rückgaberecht{/s}</span></div>
{/if}
		<div
{if (($sArticle.articleID == 38) || ($sArticle.articleID == 39) || ($sArticle.articleID == 7) || ($sArticle.articleID == 10) || ($sArticle.articleID == 11) || ($sArticle.articleID == 12) || ($sArticle.articleID == 13) || ($sArticle.articleID == 14) || ($sArticle.articleID == 15) || ($sArticle.articleID == 16) || ($sArticle.articleID == 17) || ($sArticle.articleID == 18) || ($sArticle.articleID == 20) || ($sArticle.articleID == 21) || ($sArticle.articleID == 27) || ($sArticle.articleID == 32) || ($sArticle.articleID == 48)) && ($aktshop != 9)}
						style="width: 33%;"
		{/if}
		>
		
				{*if ($sArticle.articleID != 28) || (($sArticle.articleID == 28) && ($aktshop == 9))*} 
					{*if ($sArticle.articleID != 7) || ($sArticle.articleID != 10) || ($sArticle.articleID != 11) || ($sArticle.articleID != 12) || ($sArticle.articleID != 13) || ($sArticle.articleID != 14) || ($sArticle.articleID != 15) || ($sArticle.articleID != 16) || ($sArticle.articleID != 17) || ($sArticle.articleID != 18) || ($sArticle.articleID != 20) || ($sArticle.articleID != 21) || ($sArticle.articleID != 27) || ($sArticle.articleID != 32) || ($sArticle.articleID != 48)*} 
						<img src="themes/Frontend/Revox/frontend/_public/src/img/icons/schild.png"><span>{s name="RevoxDetailguarentee"}2 Jahre Garantie{/s}</span>
					{*/if*}
				{*/if*}
		</div>
    </div>
    {/if}
{/block}
  
	{* Unit price *}
    {if $sArticle.purchaseunit}
        {block name='frontend_detail_data_price'}
            <div class='product--price price--unit' style="display: block;">
				{*if ($sArticle.articleID != 28) || ($sArticle.articleID == 28 && $aktshop == 9)} 
				{if ($sArticle.articleID != 7) || ($sArticle.articleID != 10) || ($sArticle.articleID != 11) || ($sArticle.articleID != 12) || ($sArticle.articleID != 13) || ($sArticle.articleID != 14) || ($sArticle.articleID != 15) || ($sArticle.articleID != 16) || ($sArticle.articleID != 17) || ($sArticle.articleID != 18) || ($sArticle.articleID != 20) || ($sArticle.articleID != 21) || ($sArticle.articleID != 27) || ($sArticle.articleID != 32) || ($sArticle.articleID != 48)*} 
				{if !$sArticle.no_sale} 
								{$smarty.block.parent}	
				{/if}
				{*/if}
				{/if*}
            </div>
        {/block}
    {/if}

{* Delivery informations / Versandinformationen werden ausgeblendet*}
{block name="frontend_detail_data_delivery"}

{/block}