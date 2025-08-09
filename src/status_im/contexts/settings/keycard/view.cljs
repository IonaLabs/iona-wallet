(ns status-im.contexts.settings.keycard.view
  (:require [quo.core :as quo]
            [status-im.common.events-helper :as events-helper]
            [utils.i18n :as i18n]))

(defn view
  []
  [quo/page-nav
   {:key        :header
    :background :blur
    :icon-name  :i/arrow-left
    :on-press   events-helper/navigate-back
    :title      "Feature Disabled"}])
