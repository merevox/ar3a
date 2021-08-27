{extends file="parent:frontend/checkout/cart.tpl"}

{* Eintrag zum Bonusprogramm *}
{* Product table content *}
{block name='frontend_checkout_cart_panel'}
    <div class="panel has--border">
        <div class="panel--body is--rounded">

            {* Product table header *}
            {block name='frontend_checkout_cart_cart_head'}
                {include file="frontend/checkout/cart_header.tpl"}
            {/block}

            {* Basket items *}
			{if !$baseUrl|strstr:"/europe"}
            {* Bonusprogramm *}
              {*assign var="quantitytotal" value=0*}{*Bonusprogramm deaktiviert durch ausblenden der Variable*}
            {* /Bonusprogramm *}
			{/if}
            {foreach $sBasket.content as $sBasketItem}
                {* Bonusprogramm *}
                  {if ($sBasketItem.articleID == 39) || ($sBasketItem.articleID == 38)}
                    {math assign="quantitytotal" equation="a + b" a=$quantitytotal b=$sBasketItem.quantity}
                  {/if}
                {* /Bonusprogramm *}
                {block name='frontend_checkout_cart_item'}
                    {include file='frontend/checkout/cart_item.tpl' isLast=$sBasketItem@last}
                {/block}
            {/foreach}
            {if $quantitytotal > 0}
            <div class="table--tr block-group row--premium-product is--last-row">
              <div class="table--column column--product block">
              <div class="panel--td column--image">
              <div class="table--media">
              <div class="table--media-outer">
              <div class="table--media-inner">
                {if $Locale == "de_DE"}
                  <a class="item--link" href="https://revox.com/zubehoer/halterung/90/audiobar-tv-staender" class="table--media-link" title="{s name='RevoxBonusProducttv'}STUDIOART TV Ständer{/s}">
                {elseif $Locale == "de_CH"}
                  <a class="item--link" href="https://revox.com/ch/zubehoer/halterung/89/audiobar-tv-staender" class="table--media-link" title="{s name='RevoxBonusProducttv'}STUDIOART TV Ständer{/s}">
                {else}
                  <a class="item--link" href="https://revox.com/europe/zubehoer/halterung/90/audiobar-tv-staender" class="table--media-link" title="{s name='RevoxBonusProducttv'}STUDIOART TV Ständer{/s}">
                {/if}
              <img src="https://revox.com/media/image/a5/11/7a/Revox-STUDIOART-TV-Standfuss_800x800.png" alt="{s name='RevoxBonusProduct'}STUDIOART TV Ständer{/s}" title="{s name='RevoxBonusProducttv'}STUDIOART TV Ständer{/s}">
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
                  <a class="content--title" href="https://revox.com/zubehoer/halterung/90/audiobar-tv-staender" class="content--title" title="{s name='RevoxBonusProducttv'}STUDIOART TV Ständer{{/s}">
                {elseif $Locale == "de_CH"}
                  <a class="content--title" href="https://revox.com/ch/zubehoer/halterung/89/audiobar-tv-staender" class="content--title" title="{s name='RevoxBonusProducttv'}STUDIOART TV Ständer{{/s}">
                {else}
                  <a class="content--title" href="https://revox.com/europe/zubehoer/halterung/90/audiobar-tv-staender" class="content--title" title="{s name='RevoxBonusProducttv'}STUDIOART TV Ständer{{/s}">
                {/if}
              {$quantitytotal}x {s name='RevoxBonusProducttv'}STUDIOART TV Ständer{{/s}
              </a>
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

            {* Product table footer *}
            {block name='frontend_checkout_cart_cart_footer'}
                {include file="frontend/checkout/cart_footer.tpl"}
            {/block}
        </div>
    </div>
{/block}
{*/Bonusprogramm*}

{* Benefit and services footer *}
{block name="frontend_checkout_footer"}

{/block}