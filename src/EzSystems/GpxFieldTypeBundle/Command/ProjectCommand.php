<?php
/**
 * File containing the ProjectCommand class.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

namespace EzSystems\GpxFieldTypeBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class ProjectCommand extends ContainerAwareCommand {

  /**
   * Set the name of the command and its description
   * @return void No return
   */
  protected function configure(){

    $this->setName('ezsystems:gpx-fieldtype:create-content')
         ->setDescription('Creates a new Content Item of the Gpx type');

  } // End of protected function configure()

  protected function execute( InputInterface $input, OutputInterface $output ){

    $repository         = $this->getContainer()->get('ezpublish.api.repository');
    $userService        = $repository->getUserService();
    $permissionResolver = $repository->getPermissionResolver();
    $user               = $userService->loadUserByLogin('admin');

    $permissionResolver->setCurrentUserReference($user);

    $contentService = $repository->getContentService();

    // Content create struct
    $createStruct = $contentService->newContentCreateStruct(
      $repository->getContentTypeService()
                 ->loadContentTypeByIdentifier('gpx'),
      'eng-GB'
    );

    $createStruct->setField('gpx',
                            'https://master-7rqtwti-oefgq6mvzxavw.us.platform.sh/assets/maps/St_Louis_Zoo_sample.gpx',
                            'eng-GB'
                          );

    try {

      $contentDraft = $contentService->createContent(
        $createStruct,
        [$repository->getLocationService()->newLocationCreateStruct(2)]
      );
      $content = $contentService->publishVersion($contentDraft->versionInfo);
      $output->writeln("Created Content 'gpx' with ID {$content->id}");

    } catch (\Exception $e) {

      $output->writeln( 'An error occurred creating the content item: ' . $e->getMessage() );
      $output->writeln( $e->getTraceAsString() );

    }

  } // End of protected function execute( InputInterface $input, OutputInterface $output )

} // End of class ProjectCommand extends ContainerAwareCommand
