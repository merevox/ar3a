{extends file="parent:frontend/checkout/confirm.tpl"}

{block name="frontend_checkout_confirm_product_table_content"}
    <div class="panel has--border">
        <div class="panel--body is--rounded">

            {* Product table header *}
            {block name='frontend_checkout_confirm_confirm_head'}
                {include file="frontend/checkout/confirm_header.tpl"}
            {/block}

            {block name='frontend_checkout_confirm_item_before'}{/block}

            {* Basket items *}
            {block name='frontend_checkout_confirm_item_outer'}
                {* Bonusprogramm *}
                  {*assign var="quantitytotal" value=0*}
                {* /Bonusprogramm *}
                {foreach $sBasket.content as $sBasketItem}
                    {* Bonusprogramm *}
                      {if ($sBasketItem.articleID == 38) || ($sBasketItem.articleID == 39)}
                        {math assign="quantitytotal" equation="a + b" a=$quantitytotal b=$sBasketItem.quantity}
                      {/if}
                    {* /Bonusprogramm *}
                    {block name='frontend_checkout_confirm_item'}
                        {include file='frontend/checkout/confirm_item.tpl' isLast=$sBasketItem@last}
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
                    <a class="item--link" href="https://revox.com/zubehoer/halterung/90/audiobar-tv-staender" class="table--media-link" data-modalbox="true" data-content="https://revox.com/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="STUDIOART TV Ständer" data-updateimages="true">
                  {elseif $Locale == "de_CH"}
                    <a class="item--link" href="https://revox.com/ch/zubehoer/halterung/89/audiobar-tv-staender" class="table--media-link" data-modalbox="true" data-content="https://revox.com/ch/detail/productQuickView/ordernumber/1.410.201.02." data-mode="ajax" data-width="750" data-sizing="content" data-title="STUDIOART TV Ständer" data-updateimages="true">
                  {else}
                    <a class="item--link" href="https://revox.com/europe/zubehoer/halterung/90/audiobar-tv-staender" class="table--media-link" data-modalbox="true" data-content="https://revox.com/europe/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="STUDIOART TV Ständer" data-updateimages="true">
                  {/if}
                <img src="https://revox.com/media/image/ac/2c/e3/transporttasche1_1920x1920.png" alt="STUDIOART Transporttasche" title="STUDIOART TV Ständer">
                <span class="cart--badge">
                <span>GRATIS!</span>
                </span>
                </a>
                </div>
                </div>
                </div>
                </div>
                <div class="panel--td table--content">
                  {if $Locale == "de_DE"}
                    <a class="content--title" href="https://revox.com/zubehoer/halterung/90/audiobar-tv-staender" class="content--title" data-modalbox="true" data-content="https://revox.com/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="STUDIOART TV Ständer" data-updateimages="true">
                  {elseif $Locale == "de_CH"}
                    <a class="content--title" href="https://revox.com/ch/zubehoer/halterung/89/audiobar-tv-staender" class="content--title" data-modalbox="true" data-content="https://revox.com/ch/detail/productQuickView/ordernumber/1.410.201.02." data-mode="ajax" data-width="750" data-sizing="content" data-title="STUDIOART TV Ständer" data-updateimages="true">
                  {else}
                    <a class="content--title" href="https://revox.com/europe/zubehoer/halterung/90/audiobar-tv-staender" class="content--title" data-modalbox="true" data-content="https://revox.com/europe/detail/productQuickView/ordernumber/141020102" data-mode="ajax" data-width="750" data-sizing="content" data-title="STUDIOART TV Ständer" data-updateimages="true">
                  {/if}
                {$quantitytotal}x STUDIOART TV Ständer
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
                GRATIS!
                </div>
                <div class="panel--td column--actions block">

                </div>
                </div>
                {/if}
            {/block}



            {block name='frontend_checkout_confirm_item_after'}{/block}

            {* Table footer *}
            {block name='frontend_checkout_confirm_confirm_footer'}
                {include file="frontend/checkout/confirm_footer.tpl"}
            {/block}
        </div>
    </div>
{/block}