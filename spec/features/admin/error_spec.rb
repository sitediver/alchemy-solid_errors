# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Error feature", type: :system do
  context "without user" do
    it "should redirect to a devise page" do
      visit admin_errors_path
      expect(current_path).to eq("/admin/signup")

      visit admin_solid_errors_path
      expect(current_path).to eq("/admin/signup")
    end
  end

  context "as an admin" do
    before do
      authorize_user(create(:alchemy_admin_user))
    end

    it "has an menu entry in the main navigation" do
      visit admin_dashboard_path
      click_link("Errors", href: "/admin/errors")

      expect(page).to have_selector("iframe")
    end

    it "should render an iframe with the solid errors backend" do
      visit admin_errors_path
      expect(page).to have_selector("iframe[src='/admin/solid_errors']")
    end
  end

  context "as an editor" do
    before do
      authorize_user(create(:alchemy_editor_user))
    end

    it "doesn't has an menu entry in main navigation" do
      visit admin_dashboard_path
      expect(page).to_not have_selector(".main_navi_entry > a[href='/admin/errors']")
    end

    it "should redirect if not allowed" do
      visit admin_errors_path
      expect(current_path).to eq("/admin/dashboard")
      within "#flash_notices" do
        expect(page).to have_content(/You are not authorized/)
      end

      visit admin_solid_errors_path
      expect(current_path).to eq("/admin/dashboard")
    end
  end
end
