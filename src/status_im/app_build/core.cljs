(ns status-im.app-build.core
  (:require-macros [status-im.app-build.core :as build]))

(def commit-hash "iona-mobile-v1.0")
(def build-no "100")
(def version "1.0.0-iona")

(def app-short-version
  (str version " (" build-no ")"))