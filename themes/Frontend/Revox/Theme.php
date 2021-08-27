<?php

namespace Shopware\Themes\Revox;

use Shopware\Components\Form as Form;

class Theme extends \Shopware\Components\Theme
{
    protected $extend = 'Responsive';

    protected $name = <<<'SHOPWARE_EOD'
Offizielles Revox Theme
SHOPWARE_EOD;
	
	protected $injectBeforePlugins =  true;

    protected $description = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    protected $author = <<<'SHOPWARE_EOD'
Michael Elijas
SHOPWARE_EOD;

    protected $license = <<<'SHOPWARE_EOD'

SHOPWARE_EOD;

    public function createConfig(Form\Container\TabContainer $container)
    {
		  $fieldset = $this->createFieldSet(
			  'background_settings',
			  'Background Settings'
		  );

		  $mediaField1 = $this->createMediaField(
			  'shopsite_background_picture_desktop',
			  'Shopsite Background Picture Desktop / Landscape',
			  ''
		  );

		  $mediaField2 = $this->createMediaField(
			  'shopsite_background_picture_mobil',
			  'Shopsite Background Picture Mobil / Portrait',
			  ''
		  );

		  $fieldset->addElement($mediaField1);
		  $fieldset->addElement($mediaField2);

		  $tab = $this->createTab(
			'revox_pursonic',
			'Revox & Pursonic'
		  );

		  $tab->addElement($fieldset);

		  $container->addTab($tab);
	}

    /* @var array Defines the files which should be compiled by the javascript compressor */
    protected $javascript = array(
        "src/js/jquery.search.js",
        "src/js/listingflading.js",
    );
}