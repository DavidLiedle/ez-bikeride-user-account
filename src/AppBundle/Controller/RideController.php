<?php

namespace AppBundle\Controller;

use eZ\Bundle\EzPublishCoreBundle\Controller;
use eZ\Publish\Core\Repository\Values\Content\Location;

class RideController extends Controller
{
    /**
   * Action used to display a ride
   *  - Adds the list of all related Points of interest to the response.
   *
   * @param Location $location
   * @param $viewType
   * @param bool $layout
   * @param array $params
   * @return mixed
   */
  public function viewRideWithPOIAction(Location $location,
                                         $viewType,
                                         $layout = false,
                                         array $params = array())
  {
      $repository = $this->getRepository();
      $contentService = $repository->getContentService();
      $currentLocation = $location;
      $currentContent = $contentService->loadContentByContentInfo($currentLocation->getContentInfo());
      $pointOfInterestListId = $currentContent->getFieldValue('pois');
      $pointOfInterestList = array();

      foreach ($pointOfInterestListId->destinationContentIds as $pointId) {
          $pointOfInterestList[$pointId] = $contentService->loadContent($pointId);
      } // End of foreach( $pointOfInterestListId->destinationContentIds as $pointId )

    return $this->get('ez_content')
                ->viewLocation($location->id,
                               $viewType,
                               $layout,
                               array('pointOfInterestList' => $pointOfInterestList) + $params);
  }
} // End of class RideController extends Controller
