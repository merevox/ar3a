{*extends file="parent:frontend/checkout/confirm.tpl"*}

{block name='frontend_checkout_confirm_product_table'}
  <div class="product--table">
    <div class="panel has--border">
      {* Basket items *}
      {block name='frontend_checkout_confirm_item_outer'}
	  	{if !$baseUrl|strstr:"/europe"}
	  	{* Bonusprogramm *}
          {assign var="quantitytotal" value=0}
        {* /Bonusprogramm *}
		{/if}
        {foreach $sBasket.content as $sBasketItem}
		  {* Bonusprogramm *}
             {if ($sBasketItem.articleID == 52) || ($sBasketItem.articleID == 28)}
                {math assign="quantitytotal" equation="a + b" a=$quantitytotal b=$sBasketItem.quantity}
             {/if}
          {* /Bonusprogramm *}
          {block name='frontend_checkout_confirm_item'}
            {include file='frontend/checkout/includes/confirm_item.tpl' isLast=$sBasketItem@last}
          {/block}
        {/foreach}
		{if $quantitytotal > 0}
                <div class="table--tr block-group row--premium-product is--last-row" style="border-top: 1px solid #dadae5;">
                <div class="table--column column--product block">
                <div class="panel--td column--image">
                <div class="table--media">
                <div class="table--media-outer">
                <div class="table--media-inner">
                  {if $Locale == "de_DE"}
                    <a class="item--link" href="https://revox.com/zubehoer/halterung/22/studioart-transporttasche" class="table--media-link" data-modalbox="true" data-content="https://revox.com/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}" data-updateimages="true">
                  {elseif $Locale == "de_CH"}
                    <a class="item--link" href="https://revox.com/ch/zubehoer/halterung/79/studioart-transporttasche" class="table--media-link" data-modalbox="true" data-content="https://revox.com/ch/detail/productQuickView/ordernumber/1.410.201.02." data-mode="ajax" data-width="750" data-sizing="content" data-title="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}" data-updateimages="true">
                  {else}
                    <a class="item--link" href="https://revox.com/europe/zubehoer/halterung/22/studioart-transporttasche" class="table--media-link" data-modalbox="true" data-content="https://revox.com/europe/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}" data-updateimages="true">
                  {/if}
                <img src="https://revox.com/media/image/ac/2c/e3/transporttasche1_1920x1920.png" alt="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}" title="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}">
                <span class="cart--badge">
                <span>{s name='RevoxBonusProductFree'}GRATIS!{/s}</span>
                </span>
                </a>
                </div>
                </div>
                </div>
                </div>
                <div class="panel--td table--content">
                  {if $Locale == "de_DE"}
                    <a class="content--title" href="https://revox.com/zubehoer/halterung/22/studioart-transporttasche" class="content--title" data-modalbox="true" data-content="https://revox.com/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}" data-updateimages="true">
                  {elseif $Locale == "de_CH"}
                    <a class="content--title" href="https://revox.com/ch/zubehoer/halterung/79/studioart-transporttasche" class="content--title" data-modalbox="true" data-content="https://revox.com/ch/detail/productQuickView/ordernumber/1.410.201.02." data-mode="ajax" data-width="750" data-sizing="content" data-title="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}" data-updateimages="true">
                  {else}
                    <a class="content--title" href="https://revox.com/europe/zubehoer/halterung/22/studioart-transporttasche" class="content--title" data-modalbox="true" data-content="https://revox.com/europe/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="{s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}" data-updateimages="true">
                  {/if}
                {$quantitytotal}x {s name='RevoxBonusProduct'}STUDIOART Transporttasche{/s}111
                </a>
                </div>
                </div>
                <div class="panel--td column--tax-price block is--align-right">
                <div class="column--label tax-price--label">
                Enthaltene MwSt.
                </div>
                </div>
                <div class="panel--td column--total-price block is--align-right">
                <div class="column--label total-price--label">
                Summe
                </div>
                {s name='RevoxBonusProductFree'}GRATIS!{/s}
                </div>
                <div class="panel--td column--actions block">

                </div>
                </div>
                {/if}
      {/block}

      {block name='frontend_checkout_confirm_item_after'}{/block}

      {if !$premsOnePageCheckoutVoucherOnTop}
        {include file='frontend/checkout/includes/additional_features.tpl'}
      {/if}

      {if $useBraintree}
        <form method="post" action="" class="cwbbraintreecwsw-payment-form" id="cwbbraintreecwsw-payment-form" style="display: none;">
          {include file="frontend/checkout/cwbbraintreecwsw/authorization/formContent.tpl"}
        </form>
      {/if}
      {if $useCwbStripe}
        <form method="post" action="" class="cwbstripecwsw-payment-form" id="cwbstripecwsw-payment-form" style="display: none;">
          <div id="cwbstripecwsw-agb-error-message" data-error-message=" {$agbErrorMessage} "style="display: none;"></div>
          {include file="frontend/checkout/cwbstripecwsw/authorization/formContent.tpl"}
        </form>
      {/if}

      {* Table footer *}
      {block name='frontend_checkout_confirm_confirm_footer'}
        {include file="frontend/checkout/confirm_footer.tpl"}
      {/block}

      {if !$premsAgbOnTop}
        {include file='frontend/checkout/includes/agb_and_revocation.tpl'}
      {else}
        <div class="opc--spacer"></div>
      {/if}
    </div>

    {* Table actions *}
    {block name='frontend_checkout_confirm_confirm_table_actions'}
      <div class="table--actions actions--bottom">
        <div class="main--actions">
          {if $sLaststock.hideBasket}
            {block name='frontend_checkout_confirm_stockinfo'}
              {include file="frontend/_includes/messages.tpl" type="error" content="{s namespace='frontend/checkout/confirm' name='ConfirmErrorStock'}{/s}"}
            {/block}
          {elseif ($invalidBillingAddress || $invalidShippingAddress)}
            {block name='frontend_checkout_confirm_addressinfo'}
              {include file="frontend/_includes/messages.tpl" type="error" content="{s namespace='frontend/checkout/confirm' name='ConfirmErrorInvalidAddress'}{/s}"}
            {/block}
          {else}
            {block name='frontend_checkout_confirm_submit'}
              {* Submit order button *}
              {if $sPayment.embediframe || $sPayment.action}
                <button type="submit" class="btn is--primary is--large right is--icon-right" form="confirm--form" data-preloader-button="true">
                  {s namespace='frontend/checkout/confirm' name='ConfirmDoPayment'}{/s}<i class="icon--arrow-right"></i>
                </button>
              {else}
                <button type="submit" class="btn is--primary is--large right is--icon-right" form="confirm--form" data-preloader-button="true">
                  {s namespace='frontend/checkout/confirm' name='ConfirmActionSubmit'}{/s}<i class="icon--arrow-right"></i>
                </button>
              {/if}
            {/block}
          {/if}
        </div>
      </div>
    {/block}
  </div>
{/block}

