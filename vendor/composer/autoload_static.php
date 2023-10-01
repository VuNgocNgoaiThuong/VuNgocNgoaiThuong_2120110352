<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit683908c0db546f072fca74e5f51990bb
{
    public static $files = array (
        '36f623f398c2d3daddebccdb350d875f' => __DIR__ . '/../..' . '/app/Route.php',
        '5d212bc4a14f13a83f27399268002a95' => __DIR__ . '/../..' . '/config/database.php',
    );

    public static $prefixLengthsPsr4 = array (
        'A' => 
        array (
            'App\\' => 4,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'App\\' => 
        array (
            0 => __DIR__ . '/../..' . '/app',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit683908c0db546f072fca74e5f51990bb::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit683908c0db546f072fca74e5f51990bb::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit683908c0db546f072fca74e5f51990bb::$classMap;

        }, null, ClassLoader::class);
    }
}
