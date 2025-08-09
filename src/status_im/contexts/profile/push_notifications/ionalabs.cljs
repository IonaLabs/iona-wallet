(ns status-im.contexts.profile.push-notifications.ionalabs
  (:require
    [taoensso.timbre :as log]))

(def IONALABS_API_BASE "https://api.ionalabs.ai")

(defn register-ionalabs-notifications
  [token platform]
  (let [endpoint (str IONALABS_API_BASE "/v1/notifications/register")
        platform-str (if (= platform 1) "ios" "android")
        payload (js/JSON.stringify 
                 #js {:fcm_token token
                      :platform platform-str
                      :app_version "1.0.0"
                      :user_id "iona_user"
                      :timestamp (js/Date.now)})]
    (-> (js/fetch endpoint
                  #js {:method "POST"
                       :headers #js {"Content-Type" "application/json"}
                       :body payload})
        (.then #(.json %))
        (.then #(log/info "✅ IonaLabs notifications registered!" %))
        (.catch #(log/error "❌ IonaLabs registration failed" %)))))

(defn override-status-registration
  [original-token platform-type]
  (log/info "🔄 Redirecting from Status to IonaLabs API")
  (register-ionalabs-notifications original-token platform-type)
  {:success true :provider "ionalabs"})
