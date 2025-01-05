// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
// import Rails from "@rails/ujs";
// Rails.start();
import "@hotwired/turbo-rails"; // Turboの有効化
import { Application } from "@hotwired/stimulus"; // Stimulusの有効化

const application = Application.start();



