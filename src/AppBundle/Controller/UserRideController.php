<?php

namespace AppBundle\Controller;

use eZ\Bundle\EzPublishCoreBundle\Controller;
use eZ\Publish\Core\Repository\Values\Content\Location;

class UserRideController extends Controller
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

    public function newAction(Request $request)
    {
        // create a task and give it some dummy data for this example
          $task = new Task();
        $task->setTask('Write a blog post');
        $task->setDueDate(new \DateTime('tomorrow'));

        $form = $this->createFormBuilder($task)
              ->add('task', TextType::class)
              ->add('dueDate', DateType::class)
              ->add('save', SubmitType::class, array('label' => 'Create Post'))
              ->getForm();

        return $this->render('default/new.html.twig', array(
              'form' => $form->createView(),
          ));
    }
} // End of class RideController extends Controller
