require 'rails_helper'

RSpec.describe "Signins", type: :request do
    it "should display login page" do
      get '/'
      expect(response).to have_http_status(200)
      visit '/'
      click_link I18n.t("Sign in")
      page.has_current_path? new_user_session_path
    end
    it "should display login page if not authenticated" do
      get '/'
      expect(response).to have_http_status(200)
      visit '/'
      get '/pages/fill?pay_type=mobile'
      page.has_current_path? new_user_session_path
    end
    it "should display fill page when user is signed in" do
      user = create(:user)
      get '/'
      expect(response).to have_http_status(200)
      visit '/'
      click_link I18n.t("Sign in")
      page.has_current_path? new_user_session_path
      fill_in I18n.t("Email address"), with: "coco_j@mbo.ru"
      fill_in I18n.t("Password"), with: "yayacocojambo"
      click_button I18n.t("Log in")
      expect(page).to have_content I18n.t('Welcome!')
    end
    it "should cancel current payment when cancel button is clicked" do
      user = create(:user)
      get '/'
      expect(response).to have_http_status(200)
      visit '/'
      click_link I18n.t("Sign in")
      page.has_current_path? new_user_session_path
      fill_in I18n.t("Email address"), with: "coco_j@mbo.ru"
      fill_in I18n.t("Password"), with: "yayacocojambo"
      click_button I18n.t("Log in")
      expect(response).to have_http_status(200)
      expect(page).to have_content I18n.t('Welcome!')
      get '/pages/fill?pay_type=mobile'
      expect(response).to have_http_status(302)
      payment = create(:payment)
      get "/pages/destroy_payment?payment_del=#{payment.id}"
      expect(response).to have_http_status(302)
      page.has_current_path? pages_index_path
      # fill_in 'pay_acc', with: "#{payment.payment_account}"
      # fill_in 'pay_sum', with: "#{payment.payment_summa}"
    end
    it "should confirm payment when confirm button is clicked" do
      user = create(:user)
      get '/'
      expect(response).to have_http_status(200)
      visit '/'
      click_link I18n.t("Sign in")
      page.has_current_path? new_user_session_path
      fill_in I18n.t("Email address"), with: "coco_j@mbo.ru"
      fill_in I18n.t("Password"), with: "yayacocojambo"
      click_button I18n.t("Log in")
      expect(response).to have_http_status(200)
      expect(page).to have_content I18n.t('Welcome!')
      get '/pages/fill?pay_type=mobile'
      expect(response).to have_http_status(302)
      payment = create(:payment)
      get "/pages/confirm_payment.json?payment_confirm=#{payment.id}"
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json")
      page.has_current_path? pages_result_path
    end
    it "should sign out after signing in" do
      user = create(:user)
      get '/'
      expect(response).to have_http_status(200)
      visit '/'
      click_link I18n.t("Sign in")
      page.has_current_path? new_user_session_path
      fill_in I18n.t("Email address"), with: "coco_j@mbo.ru"
      fill_in I18n.t("Password"), with: "yayacocojambo"
      click_button I18n.t("Log in")
      click_link I18n.t("Sign out")
      expect(response).to have_http_status(200)
    end

end
