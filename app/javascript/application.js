// app/javascript/application.js
import { Application } from "@hotwired/stimulus";
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers";
import "@hotwired/turbo-rails";
import "controllers";
import "./controllers/preview";
import InfiniteScrollController from "./controllers/infinite_scroll_controller";

const application = Application.start();
const context = require.context("controllers", true, /\.js$/);
application.load(definitionsFromContext(context));
application.register("infinite-scroll", InfiniteScrollController);
