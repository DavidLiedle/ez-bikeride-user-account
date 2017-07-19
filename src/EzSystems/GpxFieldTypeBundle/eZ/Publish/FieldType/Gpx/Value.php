<?php
/**
 * File containing the Gpx FieldType Value class.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

namespace EzSystems\GpxFieldTypeBundle\eZ\Publish\FieldType\Gpx;

use eZ\Publish\Core\FieldType\Value as BaseValue;

class Value extends BaseValue
{
    /**
     * Gpx URL.
     *
     * @var string
     */
    public $filename;

    public $url;

    /**
     * The gpx's embed XML, etc.
     *
     * @var array
     */
    public $contents;

    public function __construct($arg = [])
    {
        if (!is_array($arg)) {
            $arg = ['url' => $arg];
        }

        parent::__construct($arg);
    }

    public function __toString()
    {
        return (string)$this->url;
    }

}
