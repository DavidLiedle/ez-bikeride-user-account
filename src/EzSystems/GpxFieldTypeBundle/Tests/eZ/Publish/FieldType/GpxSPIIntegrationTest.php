<?php
/**
 * File contains: EzSystems\GpxFieldTypeBundle\Tests\eZ\Publish\FieldType\GpxSPIIntegrationTest class
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

namespace EzSystems\GpxFieldTypeBundle\Tests\eZ\Publish\FieldType;

use eZ\Publish\Core\FieldType;
use eZ\Publish\SPI\Persistence\Content;
use eZ\Publish\SPI\Persistence\Handler;
use eZ\Publish\SPI\Tests\FieldType\BaseIntegrationTest;
use EzSystems\GpxFieldTypeBundle\eZ\Publish\FieldType\Gpx;
use EzSystems\GpxFieldTypeBundle\Gpx\GpxClientInterface; // TODO: rewire

/**
 * SPI Integration test for legacy storage field types
 *
 * This abstract base test case is supposed to be the base for field type
 * integration tests. It basically calls all involved methods in the field type
 * ``Converter`` and ``Storage`` implementations. Fo get it working implement
 * the abstract methods in a sensible way.
 *
 * The following actions are performed by this test using the custom field
 * type:
 *
 * - Create a new content type with the given field type
 * - Load create content type
 * - Create content object of new content type
 * - Load created content
 * - Copy created content
 * - Remove copied content
 *
 * @group integration
 */
class GpxSPIIntegrationTest extends BaseIntegrationTest
{
    /**
     * @var \EzSystems\GpxFieldTypeBundle\Gpx\GpxClientInterface|\PHPUnit_Framework_MockObject_MockObject
     */
    private $gpxClientMock;

    /**
     * Get name of tested field type
     *
     * @return string
     */
    public function getTypeName()
    {
        return 'ezgpx';
    }

    /**
     * Get handler with required custom field types registered
     *
     * @return Handler
     */
    public function getCustomHandler()
    {
        $fieldType = new Gpx\Type($this->getGpxClientMock());
        $fieldType->setTransformationProcessor($this->getTransformationProcessor());

        return $this->getHandler(
            'ezgpx',
            $fieldType,
            new Gpx\LegacyConverter(),
            new FieldType\NullStorage()
        );
    }

    /**
     * Returns the FieldTypeConstraints to be used to create a field definition
     * of the FieldType under test.
     *
     * @return \eZ\Publish\SPI\Persistence\Content\FieldTypeConstraints
     */
    public function getTypeConstraints()
    {
        return new Content\FieldTypeConstraints();
    }

    /**
     * Get field definition data values
     *
     * This is a PHPUnit data provider
     *
     * @return array
     */
    public function getFieldDefinitionData()
    {
        return [
            ['fieldType', 'ezgpx'],
            ['fieldTypeConstraints', new Content\FieldTypeConstraints()],
        ];
    }

    /**
     * Get initial field value
     *
     * @return \eZ\Publish\SPI\Persistence\Content\FieldValue
     */
    public function getInitialValue()
    {
        return new Content\FieldValue(
            [
                'data' => 'http://gpx.com/xxx/status/123545',
                'externalData' => null,
                'sortKey' => 'http://gpx.com/xxx/status/123545',
            ]
        );
    }

    /**
     * Get update field value.
     *
     * Use to update the field
     *
     * @return \eZ\Publish\SPI\Persistence\Content\FieldValue
     */
    public function getUpdatedValue()
    {
        return new Content\FieldValue(
            [
                'data' => 'http://gpx.com/yyyyy/status/54321',
                'externalData' => null,
                'sortKey' => 'http://gpx.com/yyyyy/status/54321',
            ]
        );
    }

    /**
     * @return \EzSystems\GpxFieldTypeBundle\Gpx\GpxClientInterface|\PHPUnit_Framework_MockObject_MockObject
     */
    private function getGpxClientMock()
    {
        if ($this->gpxClientMock === null) {
            $this->gpxClientMock = $this->getMock(GpxClientInterface::class);
        }

        return $this->gpxClientMock;
    }
}
