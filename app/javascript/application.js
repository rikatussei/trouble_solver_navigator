import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";  // 修正箇所
import "@hotwired/turbo-rails";
import "controllers";
import "./controllers/preview";
import InfiniteScrollController from "./controllers/infinite_scroll_controller";

const application = Application.start();
const context = require.context("controllers", true, /\.js$/);  // 修正箇所
application.load(definitionsFromContext(context));
application.register("infinite-scroll", InfiniteScrollController);
