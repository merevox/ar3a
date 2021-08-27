{extends file="parent:frontend/detail/config_variant.tpl"}

{block name='frontend_detail_configurator_variant_group_option_label'}
    <label for="group[{$option.groupID}][{$option.optionID}]" style="background-color: {$option.attributes.core->get("color")};" class="option--label{if !$sArticle.notification && !$option.selectable} is--disabled{/if}">
        {if $option.selected == 1}
        <img src="themes/Frontend/Revox/frontend/_public/src/img/icons/check.png">
        {/if}
        {if $option.media}
            {$media = $option.media}

            {block name='frontend_detail_configurator_variant_group_option_label_image'}

            {/block}
        {else}
            {block name='frontend_detail_configurator_variant_group_option_label_text'}

            {/block}
        {/if}
    </label>
{/block}