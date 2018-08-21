/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import "styles";

// ERB Components
import "components/erb/login-form/login-form";

// Turbolinks
import Turbolinks from "turbolinks";

Turbolinks.start();

// React Components
const componentRequireContext = require.context("components/react", true);
const ReactRailsUJS = require("react_ujs");

ReactRailsUJS.useContext(componentRequireContext);
