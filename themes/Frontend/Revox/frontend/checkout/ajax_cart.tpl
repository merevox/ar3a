{extends file="parent:frontend/checkout/ajax_cart.tpl"}

{block name='frontend_checkout_ajax_cart_buttons_offcanvas_inner'}
    <a href="#close-categories-menu" class="close--off-canvas">
        {s name="RevoxAjaxCartContinueShopping"}Schliessen{/s} <i class="icon--cross"></i>
    </a>
{/block}

{block name='frontend_checkout_ajax_cart_open_checkout_inner'}
    {s name="AjaxCartLinkConfirm" assign="snippetAjaxCartLinkConfirm"}{/s}
    <a href="{if {config name=always_select_payment}}{url controller='checkout' action='shippingPayment'}{else}{url controller='checkout' action='confirm'}{/if}" class="btn is--primary button--checkout is--icon-right" title="{$snippetAjaxCartLinkConfirm|escape}">
        <i class="icon--arrow-right"></i>
        {s name='RevoxAjaxCartLinkConfirm'}Kasse{/s}
    </a>
{/block}

{block name='frontend_checkout_ajax_cart_open_checkout_inner_disabled'}
    {s name="AjaxCartLinkConfirm" assign="snippetAjaxCartLinkConfirm"}{/s}
    <span class="btn is--disabled is--primary button--checkout is--icon-right" title="{$snippetAjaxCartLinkConfirm|escape}">
        <i class="icon--arrow-right"></i>
        {s name='RevoxAjaxCartLinkConfirm'}{/s}
    </span>
{/block}

{block name='frontend_checkout_ajax_cart_open_basket'}
    {s name="AjaxCartLinkBasket" assign="snippetAjaxCartLinkBasket"}{/s}
    <a href="{url controller='checkout' action='cart'}" class="btn button--open-basket is--icon-right" title="{$snippetAjaxCartLinkBasket|escape}">
        <i class="icon--arrow-right"></i>
        {s name='RevoxAjaxCartLinkBasket'}Warenkorb{/s}
    </a>
{/block}

{*Eintrag zum Bonusprogramm*}
{block name='frontend_checkout_ajax_cart_item_container'}
    <div class="item--container">
        {block name='frontend_checkout_ajax_cart_item_container_inner'}
            {if $sBasket.content}
				{if !$baseUrl|strstr:"/europe"}
					{* Bonusprogramm *}
					{*assign var="quantitytotal" value=0*} {*Bonusprogramm deaktiviert durch ausblenden der Variable*}
					{* /Bonusprogramm *}
				{/if}
                {foreach $sBasket.content as $sBasketItem}
                    {* Bonusprogramm *}
                    {if ($sBasketItem.articleID == 39) || ($sBasketItem.articleID == 38)}
                      {math assign="quantitytotal" equation="a + b" a=$quantitytotal b=$sBasketItem.quantity}
                    {/if}
                    {* /Bonusprogramm *}
                    {block name='frontend_checkout_ajax_cart_row'}
                        {include file="frontend/checkout/ajax_cart_item.tpl" basketItem=$sBasketItem}
                    {/block}
                {/foreach}
            {else}
                {block name='frontend_checkout_ajax_cart_empty'}
                    <div class="cart--item is--empty">
                        {block name='frontend_checkout_ajax_cart_empty_inner'}
                            <span class="cart--empty-text">{s name='AjaxCartInfoEmpty'}{/s}</span>
                        {/block}
                    </div>
                {/block}
            {/if}
            {* Bonusprogramm *}
            {if $quantitytotal > 0}
            <div class="cart--item is--premium-article">
              <div class="thumbnail--container">
                <img src="https://revox.com/media/image/a5/11/7a/Revox-STUDIOART-TV-Standfuss_800x800.png" alt="STUDIOART TV Ständer" title="STUDIOART TV Ständer" class="thumbnail--image">
                <span class="cart--badge"><span class="badge--free">GRATIS!</span></span>
              </div>
              <div class="action--container">

              </div>
              {if $Locale == "de_DE"}
                <a class="item--link" href="https://revox.com/zubehoer/halterung/90/audiobar-tv-staender" title="STUDIOART TV Ständer">
              {elseif $Locale == "de_CH"}
                <a class="item--link" href="https://revox.com/ch/zubehoer/halterung/90/audiobar-tv-staender" title="STUDIOART TV Ständer">
              {else}
                <a class="item--link" href="https://revox.com/europe/zubehoer/halterung/90/audiobar-tv-staender" title="STUDIOART TV Ständer">
              {/if}
                <span class="item--quantity">{$quantitytotal}×</span>
                <span class="item--name">STUDIOART TV-Ständer</span>
                <span class="item--price">GRATIS!*</span>
              </a>
            </div>
            {/if}
            {* /Bonusprogramm *}
        {/block}
    </div>
{/block}