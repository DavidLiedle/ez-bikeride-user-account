<?php
/**
 * File containing the Gpx Client interface.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

namespace EzSystems\GpxFieldTypeBundle\Gpx;

interface GpxClientInterface {

    /**
     * Returns the embed version of a GPX file rendered on a map from its $url
     *
     * @param string $statusUrl
     *
     * @return string
     */
    public function getEmbed($gpxFileUrl);

} // End of interface GpxClientInterface
