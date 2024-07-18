import { application } from "controllers/application";
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

// スティミュラスのロード
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

const application = Application.start();
const context = require.context(".", true, /\.js$/);
application.load(definitionsFromContext(context));

// コントローラのイージーロード
eagerLoadControllersFrom(context, application);
