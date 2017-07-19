<?php
/**
 * File containing the CreateGpxContentType class.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

namespace EzSystems\GpxFieldTypeBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class CreateGpxContentTypeCommand extends ContainerAwareCommand
{
    protected function configure()
    {
        $this
            ->setName('ezsystems:gpx-fieldtype:create-contenttype')
            ->setDescription('Creates a new Content Type with a Gpx field');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $repository = $this->getContainer()->get('ezpublish.api.repository');
        $userService = $repository->getUserService();
        $permissionResolver = $repository->getPermissionResolver();
        $user = $userService->loadUserByLogin('admin');
        $permissionResolver->setCurrentUserReference($user);

        $contentTypeService = $repository->getContentTypeService();

        $contentTypeGroup = $contentTypeService->loadContentTypeGroupByIdentifier('Content');

        // Content type create struct
        $createStruct = $contentTypeService->newContentTypeCreateStruct('gpx');
        $createStruct->mainLanguageCode = 'eng-GB';
        $createStruct->nameSchema = '<gpx>';
        $createStruct->names = [
            'eng-GB' => 'Gpx'
        ];
        $createStruct->descriptions = [
            'eng-GB' => 'Reference to a GPX file',
        ];

        // Gpx FieldDefinition
        $gpxFieldDefinitionCreateStruct = $contentTypeService->newFieldDefinitionCreateStruct('gpx', 'ezgpx');
        $gpxFieldDefinitionCreateStruct->names = ['eng-GB' => 'Gpx'];
        $gpxFieldDefinitionCreateStruct->descriptions = ['eng-GB' => 'The Gpx'];
        $gpxFieldDefinitionCreateStruct->fieldGroup = 'content';
        $gpxFieldDefinitionCreateStruct->position = 10;
        $gpxFieldDefinitionCreateStruct->isTranslatable = true;
        $gpxFieldDefinitionCreateStruct->isRequired = true;
        $gpxFieldDefinitionCreateStruct->isSearchable = false;

        // Add the field definition to the type create struct
        $createStruct->addFieldDefinition($gpxFieldDefinitionCreateStruct);

        try {
            $contentTypeDraft = $contentTypeService->createContentType($createStruct, [$contentTypeGroup]);
            $contentTypeService->publishContentTypeDraft($contentTypeDraft);
            $contentType = $contentTypeService->loadContentTypeByIdentifier('gpx');
            $output->writeln("Created ContentType 'gpx' with ID {$contentType->id}");
        } catch (\eZ\Publish\API\Repository\Exceptions\InvalidArgumentException $e) {
            $output->writeln('An error occured creating the content type: ' . $e->getMessage());
        }
    }
}
