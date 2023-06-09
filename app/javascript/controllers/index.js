// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import EditItemController from "./edit_item_controller"
application.register("edit-item", EditItemController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import InsertCommentController from "./insert_comment_controller"
application.register("insert-comment", InsertCommentController)

import NewTagController from "./new_tag_controller"
application.register("new-tag", NewTagController)

import TomSelectController from "./tom_select_controller"
application.register("tom-select", TomSelectController)
