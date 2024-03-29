{extends file="parent:frontend/detail/image.tpl"}

{block name="frontend_detail_image"}

    {* Product image - Thumbnails *}
    {block name='frontend_detail_image_thumbs'}
        {include file="frontend/detail/images.tpl"}
    {/block}

    {* Product image - Gallery *}
    {block name="frontend_detail_image_box"}
        <div class="image-slider--container{if !$sArticle.image} no--image{/if}{if !count($sArticle.images)} no--thumbnails{/if}">
            <div class="image-slider--slide">

                {block name='frontend_detail_image_default_image_slider_item'}
                    <div class="image--box image-slider--item">

                        {block name='frontend_detail_image_default_image_element'}

                            {$alt = $sArticle.articleName|escape}

                            {if $sArticle.image.description}
                                {$alt = $sArticle.image.description|escape}
                            {/if}

                            <span class="image--element"
                                  {if $sArticle.image}
                                   data-img-large="{$sArticle.image.thumbnails[2].source}"
                                   data-img-small="{$sArticle.image.thumbnails[4].source}"
                                   data-img-original="{$sArticle.image.source}"
                                  {/if}
                                   data-alt="{$alt}">

                                {$imageMediaClasses = 'image--media'}

                                {if $sArticle.image.extension == 'svg'}
                                    {$imageMediaClasses = $imageMediaClasses|cat:' image--svg'}
                                {/if}

                                {block name='frontend_detail_image_default_image_media'}
                                    <span class="{$imageMediaClasses}">
                                        {if isset($sArticle.image.thumbnails)}
                                            {block name='frontend_detail_image_default_picture_element'}
                                                <img srcset="{$sArticle.image.thumbnails[4].sourceSet}"
                                                      src="{$sArticle.image.thumbnails[4].source}"
                                                      alt="{$alt}"
                                                      itemprop="image" />
                                            {/block}
                                        {else}
                                            {block name='frontend_detail_image_fallback'}
                                                <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$alt}" itemprop="image" />
                                            {/block}
                                        {/if}
                                    </span>
                                {/block}
                            </span>
                        {/block}
                    </div>
                {/block}

                {foreach $sArticle.images as $image}
                    {block name='frontend_detail_images_image_slider_item'}
                        <div class="image--box image-slider--item">

                            {block name='frontend_detail_images_image_element'}

                                {$alt = $sArticle.articleName|escape}

                                {if $image.description}
                                    {$alt = $image.description|escape}
                                {/if}

                                {$imageMediaClasses = 'image--media'}

                                {if $image.extension == 'svg'}
                                    {$imageMediaClasses = $imageMediaClasses|cat:' image--svg'}
                                {/if}

                                <span class="image--element"
                                      data-img-large="{$image.thumbnails[2].source}"
                                      data-img-small="{$image.thumbnails[4].source}"
                                      data-img-original="{$image.source}"
                                      data-alt="{$alt}">

                                    {block name='frontend_detail_images_image_media'}
                                        <span class="{$imageMediaClasses}">
                                            {if isset($image.thumbnails)}
                                                {block name='frontend_detail_images_picture_element'}
                                                    <img srcset="{$image.thumbnails[4].sourceSet}" alt="{$alt}" itemprop="image" />
                                                {/block}
                                            {else}
                                                {block name='frontend_detail_images_fallback'}
                                                    <img src="{link file='frontend/_public/src/img/no-picture.jpg'}" alt="{$alt}" itemprop="image" />
                                                {/block}
                                            {/if}
                                        </span>
                                    {/block}
                                </span>
                            {/block}
                        </div>
                    {/block}
                {/foreach}
            </div>
        </div>
    {/block}

    {* Product image - Dot navigation *}
    {block name='frontend_detail_image_box_dots'}
        {if $sArticle.images}
            <div class="image--dots image-slider--dots panel--dot-nav">
                <a href="#" class="dot--link">&nbsp;</a>
                {foreach $sArticle.images as $image}
                    <a href="#" class="dot--link">&nbsp;</a>
                {/foreach}
            </div>
        {/if}
    {/block}
{/block}
