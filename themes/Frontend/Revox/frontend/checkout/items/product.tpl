{extends file="parent:frontend/checkout/items/product.tpl"}

{* Product information column *}
    {block name='frontend_checkout_cart_item_name'}
        <div class="column--product">
            {* Product image *}
            {block name='frontend_checkout_cart_item_image'}
                <div class="panel--td column--image">
                    <div class="table--media">
                        {block name="frontend_checkout_cart_item_image_container"}
                            <div class="table--media-outer">
                                {block name="frontend_checkout_cart_item_image_container_outer"}
                                    <div class="table--media-inner">
                                        {block name="frontend_checkout_cart_item_image_container_inner"}

                                            {$image = $sBasketItem.additional_details.image}
                                            {$desc = $sBasketItem.articlename|escape}

                                            {if $image.thumbnails[0]}
                                                <a href="{$detailLink}" title="{$sBasketItem.articlename|strip_tags|escape}" class="table--media-link"
                                                    {if {config name=detailmodal} && {controllerAction|lower} === 'confirm'}
                                                   data-modalbox="true"
                                                   data-content="{url controller="detail" action="productQuickView" ordernumber="{$sBasketItem.ordernumber}" fullPath}"
                                                   data-mode="ajax"
                                                   data-width="750"
                                                   data-sizing="content"
                                                   data-title="{$sBasketItem.articlename|strip_tags|escape}"
                                                   data-updateImages="true"
                                                   {/if}>

                                                    {if $image.description}
                                                        {$desc = $image.description|escape}
                                                    {/if}

                                                    <img srcset="{$image.thumbnails[0].sourceSet}" alt="{$desc}" title="{$desc|truncate:160}" />
                                                </a>
                                            {else}
                                                <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$desc}" title="{$desc|truncate:160}" />
                                            {/if}
                                        {/block}
                                    </div>
                                {/block}
                            </div>
                        {/block}
                    </div>
                </div>
            {/block}

            {* Product information *}
            {block name='frontend_checkout_cart_item_details'}
                <div class="panel--td table--content">

                    {* Product name *}
                    {block name='frontend_checkout_cart_item_details_title'}

                        <a class="content--title" href="{$detailLink}" title="{$sBasketItem.articlename|strip_tags|escape}"
                            {if {config name=detailmodal} && {controllerAction|lower} === 'confirm'}
                               data-modalbox="true"
                               data-content="{url controller="detail" action="productQuickView" ordernumber="{$sBasketItem.ordernumber}" fullPath}"
                               data-mode="ajax"
                               data-width="750"
                               data-sizing="content"
                               data-title="{$sBasketItem.articlename|strip_tags|escape}"
                               data-updateImages="true"
                            {/if}>
                            {$sBasketItem.articlename|strip_tags|truncate:60}
                        </a>
                    {/block}

                    {* Product SKU number *}
                    {block name='frontend_checkout_cart_item_details_sku'}
                        <p class="content--sku content">
                            {s name="CartItemInfoId"}{/s} {$sBasketItem.ordernumber}
                        </p>
                    {/block}

                    {* Product delivery information *}
                    {block name='frontend_checkout_cart_item_delivery_informations'}
                        {if {config name=BasketShippingInfo} && $sBasketItem.shippinginfo}
                            {include file="frontend/plugins/index/delivery_informations.tpl" sArticle=$sBasketItem}
                        {/if}
                    {/block}

                    {* Additional product information *}
                    {block name='frontend_checkout_cart_item_details_inline'}{/block}
                </div>
            {/block}
        </div>
    {/block}