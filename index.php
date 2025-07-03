<?php
session_start();

// Autoload classes
spl_autoload_register(function ($class) {
    $file = __DIR__ . '/controllers/' . $class . '.php';
    if (file_exists($file)) {
        require_once $file;
    }
});

require_once __DIR__ . '/config/database.php';

// Routing
$request = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$base_path = '/superstore_v2';

switch (str_replace($base_path, '', $request)) {
    case '/login':
        (new AuthController())->login();
        break;
    case '/forgot-password':
        (new AuthController())->forgotPassword();
        break;
    default:
        header("Location: $base_path/login");
        break;
}
?>