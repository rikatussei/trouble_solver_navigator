import Rails from "@rails/ujs";
Rails.start(); // Rails UJSの開始

import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import "@hotwired/turbo-rails";
import "./controllers/preview";
import InfiniteScrollController from "./controllers/infinite_scroll_controller";

// スティミュラスのロード
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

const application = Application.start();
const context = require.context("controllers", true, /\.js$/);

// コントローラのイージーロード
eagerLoadControllersFrom("controllers", application);

application.load(definitionsFromContext(context));
application.register("infinite-scroll", InfiniteScrollController);