{extends file="parent:frontend/checkout/finish.tpl"}

{block name='frontend_checkout_finish_items'}
    <div class="finish--table product--table">
        <div class="panel has--border">
            <div class="panel--body is--rounded">

                {* Table header *}
                {block name='frontend_checkout_finish_table_header'}
                    {include file="frontend/checkout/finish_header.tpl"}
                {/block}

                {* Article items *}
				
                {foreach $sBasket.content as $key => $sBasketItem}
                   
                    {block name='frontend_checkout_finish_item'}
                        {include file='frontend/checkout/finish_item.tpl' isLast=$sBasketItem@last}
                    {/block}
                {/foreach}
                
                {* Table footer *}
                {block name='frontend_checkout_finish_table_footer'}
                    {include file="frontend/checkout/finish_footer.tpl"}
                {/block}
            </div>
        </div>
    </div>
{/block}
