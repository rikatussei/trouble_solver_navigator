import Rails from "@rails/ujs";  // これが問題の行です
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import "@hotwired/turbo-rails";
import "controllers";
import "preview";
import "./controllers/preview";
import InfiniteScrollController from "./controllers/infinite_scroll_controller";

// スティミュラスのロード
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";

Rails.start();  // Rails UJSの開始

const application = Application.start();
const context = require.context("controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
application.register("infinite-scroll", InfiniteScrollController);

// コントローラのイージーロード
eagerLoadControllersFrom("controllers", application);
