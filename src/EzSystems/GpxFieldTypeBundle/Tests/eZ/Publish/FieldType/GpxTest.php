<?php
/**
 * File containing the Gpx FieldType Test class.
 *
 * @copyright Copyright (C) eZ Systems AS. All rights reserved.
 * @license For full copyright and license information view LICENSE file distributed with this source code.
 */

namespace EzSystems\GpxFieldTypeBundle\Tests\eZ\Publish\FieldType;

use eZ\Publish\Core\FieldType\Tests\FieldTypeTest;
use EzSystems\GpxFieldTypeBundle\eZ\Publish\FieldType\Gpx\Type as GpxType;
use EzSystems\GpxFieldTypeBundle\eZ\Publish\FieldType\Gpx\Value as GpxValue;
use EzSystems\GpxFieldTypeBundle\Gpx\GpxClientInterface;
use eZ\Publish\Core\Base\Exceptions\InvalidArgumentException;

class GpxTest extends FieldTypeTest
{
    /**
     * @var \EzSystems\GpxFieldTypeBundle\Gpx\GpxClientInterface|\PHPUnit_Framework_MockObject_MockObject
     */
    private $gpxClientMock;

    protected function createFieldTypeUnderTest()
    {
        return new GpxType($this->getGpxClientMock());
    }

    protected function getValidatorConfigurationSchemaExpectation()
    {
        return [
            'GpxValueValidator' => [
                'authorList' => [
                    'type' => 'array',
                    'default' => []
                ]
            ]
        ];
    }

    protected function getSettingsSchemaExpectation()
    {
        return [];
    }

    protected function getEmptyValueExpectation()
    {
        return new GpxValue;
    }

    public function provideInvalidInputForAcceptValue()
    {
        return [
            [
                1,
                InvalidArgumentException::class,
            ],
            [
                new \stdClass,
                InvalidArgumentException::class
            ],
        ];
    }

    public function provideValidInputForAcceptValue()
    {
        return [
            [
                'https://gpx.com/user/status/123456789',
                new GpxValue(['url' => 'https://gpx.com/user/status/123456789']),
            ],
            [
                new GpxValue(
                    [
                        'url' => 'https://gpx.com/user/status/123456789'
                    ]
                ),
                new GpxValue(
                    [
                        'url' => 'https://gpx.com/user/status/123456789'
                    ]
                ),
            ],
            [
                new GpxValue(
                    [
                        'url' => 'https://gpx.com/user/status/123456789',
                        'authorUrl' => 'https://gpx.com/user',
                        'contents' => '<blockquote />'
                    ]
                ),
                new GpxValue(
                    [
                        'url' => 'https://gpx.com/user/status/123456789',
                        'authorUrl' => 'https://gpx.com/user',
                        'contents' => '<blockquote />'
                    ]
                )
            ]
        ];
    }

    public function provideInputForToHash()
    {
        return [
            [
                new GpxValue,
                null
            ],
            [
                new GpxValue(['url' => 'https://gpx.com/user/status/123456789']),
                [
                    'url' => 'https://gpx.com/user/status/123456789',
                    'authorUrl' => '',
                    'contents' => ''
                ]
            ],
            [
                new GpxValue(
                    [
                        'url' => 'https://gpx.com/user/status/123456789',
                        'authorUrl' => 'https://gpx.com/user',
                        'contents' => '<blockquote />'
                    ]
                ),
                [
                    'url' => 'https://gpx.com/user/status/123456789',
                    'authorUrl' => 'https://gpx.com/user',
                    'contents' => '<blockquote />'
                ]
            ]
        ];
    }

    public function provideInputForFromHash()
    {
        return [
            [
                [],
                new GpxValue
            ],
            [
                ['url' => 'https://gpx.com/user/status/123456789'],
                new GpxValue(['url' => 'https://gpx.com/user/status/123456789']),
            ],
            [
                [
                    'url' => 'https://gpx.com/user/status/123456789',
                    'authorUrl' => 'https://gpx.com/user',
                    'contents' => '<blockquote />'
                ],
                new GpxValue(
                    [
                        'url' => 'https://gpx.com/user/status/123456789',
                        'authorUrl' => 'https://gpx.com/user',
                        'contents' => '<blockquote />'
                    ]
                ),
            ]
        ];
    }

    protected function provideFieldTypeIdentifier()
    {
        return 'ezgpx';
    }

    public function provideDataForGetName()
    {
        return [
            [$this->getEmptyValueExpectation(), ''],
            [new GpxValue('https://gpx.com/user/status/123456789'), 'user-123456789'],
        ];
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

    public function provideValidDataForValidate()
    {
        // @todo implement me
        return [];
    }

    public function provideInvalidDataForValidate()
    {
        // @todo implement me
        return [];
    }
}
