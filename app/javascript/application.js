import Rails from "@rails/ujs";
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";
import "@hotwired/turbo-rails";
import "controllers";
import "./controllers/preview";
import InfiniteScrollController from "./controllers/infinite_scroll_controller";

Rails.start();  // Rails UJSの開始

const application = Application.start();
const context = require.context("controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
application.register("infinite-scroll", InfiniteScrollController);
