{extends file="parent:frontend/index/footer.tpl"}

{* Vat info *}
{block name='frontend_index_footer_vatinfo'}
    <a class="toplink" href="#top">{s name="revoxShoptoTop"}nach Oben{/s}</a>
{/block}

{block name="frontend_index_shopware_footer"}
    {block name="frontend_index_shopware_footer_copyright"}

    {/block}
	
	{foreach $mediameetsMarketingSuite as $marketing}
		{assign var="aktshop" value=$marketing.shopId}
	{/foreach}

    {block name="frontend_index_shopware_footer_logo"}
	 	{s name="RevoxFooterPaymentlogos"}
		<div class="payment" id="footerdesktop">
			<div class="payment-description"><p>Sicheres bezahlen: </p></div>
			<div class="payment-images">
				<div><img src="https://studioart-revox.com/themes/Frontend/Revox/frontend/_public/src/img/icons/visa.webp" alt=""></div>
				<div><img src="https://studioart-revox.com/themes/Frontend/Revox/frontend/_public/src/img/icons/mastercard.webp" alt=""></div>
				<div><img src="https://studioart-revox.com/themes/Frontend/Revox/frontend/_public/src/img/icons/paypal.webp" alt=""></div>
				<div><img src="https://studioart-revox.com/themes/Frontend/Revox/frontend/_public/src/img/icons/vorkasse.webp" alt=""></div>
				<div><img src="https://studioart-revox.com/themes/Frontend/Revox/frontend/_public/src/img/icons/revox-powerpay-rechnung-ratenzahlung.webp" alt=""></div>
			</div>
		</div>
		{/s}
    {/block}
{/block}