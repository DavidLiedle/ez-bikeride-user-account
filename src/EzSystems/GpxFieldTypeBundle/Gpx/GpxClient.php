<?php
/**
 * File containing the Gpx Client.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

namespace EzSystems\GpxFieldTypeBundle\Gpx;

class GpxClient implements GpxClientInterface {

    public function getEmbed( $gpxFileUrl ){

      $ret = 'getEmbedReturnChangeMe';

      // $parts = explode('.', $gpxFileUrl);
      //
      // if( isset( $parts[1] ) && $parts[1] == 'gpx' ){
      //
      //     $response = file_get_contents(
      //         sprintf(
      //             'https://api.gpx.com/1/statuses/oembed.json?id=%s&align=center',
      //             $parts[5]
      //         )
      //     );
      //
      //     $data = json_decode( $response, true );
      //     $ret = $data['html'];
      //
      // } // End of if

      return $ret;

    } // End of public function getEmbed( $statusUrl )

    /**
     * Was
     * return substr(
     *     $statusUrl,
     *     0,
     *     strpos($statusUrl, '/status/')
     * );
     * @param  [type] $statusUrl [description]
     * @return [type]            [description]
     */
    public function getAuthor($statusUrl)
    {
        return "David";
    }
}
