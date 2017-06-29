<?php
namespace AppBundle\Controller;

use eZ\Publish\API\Repository\Values\Content\Query;
use eZ\Publish\API\Repository\Values\Content\Query\Criterion;
use eZ\Publish\Core\MVC\Symfony\Controller\Controller;
use eZ\Publish\API\Repository\Values\Content\Query\SortClause;
use eZ\Publish\Core\Pagination\Pagerfanta\ContentSearchAdapter;
use Pagerfanta\Pagerfanta;
use Symfony\Component\HttpFoundation\Request;

class HomepageController extends Controller
{
    public function getAllRidesAction(Request $request)
    {
        $repository = $this->getRepository();
        $locationService = $repository->getLocationService();
        $contentService = $repository->getContentService();
        $rootLocationId = $this->getConfigResolver()->getParameter('content.tree_root.location_id');
        $rootLocation = $locationService->loadLocation($rootLocationId);
        $currentLocationId = 2;
        $currentLocation = $locationService->loadLocation($currentLocationId);
        $currentContent = $contentService->loadContentByContentInfo($currentLocation->contentInfo);
        $query = new Query();
        $query->query = new Criterion\LogicalAnd(
      array(
        new Criterion\Subtree($rootLocation->pathString),
        new Criterion\Visibility(Criterion\Visibility::VISIBLE),
        new Criterion\ContentTypeIdentifier(array('ride')),
      )
    );
        $query->sortClauses = array(
      new SortClause\DatePublished(Query::SORT_ASC),
    );
        $pager = new Pagerfanta(
      new ContentSearchAdapter($query, $this->getRepository()->getSearchService())
    );
    //FIXME : get $limit value from a custom parameter
    $limit = 10;
        $pager->setMaxPerPage($limit);
        $pager->setCurrentPage($request->get('page', 1));

        return $this->render(
      'list/rides.html.twig',
      array(
        'location' => $currentLocation,
        'content' => $currentContent,
        'pagerRides' => $pager,
      )
    );
    }
}
