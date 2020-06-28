require 'rails_helper'

describe 'レシピ管理機能', type: :system do
    let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
    let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
    let!(:recipe_a) { FactoryBot.create(:recipe, name: '最初のレシピ', user: user_a, group: nil) }
    let!(:recipe_b) { FactoryBot.create(:recipe, name: '２番目のレシピ', user: user_b, group: user_b.groups.first) }

    before do
        visit login_path
        fill_in 'メールアドレス', with: login_user.email
        fill_in 'パスワード', with: login_user.password
        click_button 'ログインする'
    end

    describe '一覧表示機能' do
        let(:login_user) { user_a }
        context 'ログインしていない時' do
            before do
                find(".fa-sign-out").click
            end

            it '一般公開されているレシピが表示される' do
                expect(page).to have_content 'ユーザーA'
            end
        end

        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }

            it '一般公開されているレシピが表示される' do
                expect(page).to have_content 'ユーザーA'
            end
        end
    end

    describe '詳細表示機能' do
        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }
            before do
                visit recipe_path(recipe_a)
            end

            it 'ユーザーAが作成したレシピが表示される' do
                expect(page).to have_content '最初のレシピ'
            end
        end
    end

    describe 'グループ投稿機能' do
        context 'ユーザーAがログインしている時' do
            let(:login_user) { user_a }

            it 'ユーザーBがグループに投稿したレシピが表示されない' do
                expect(page).to have_no_content 'ユーザーB'
            end
        end

        context 'ユーザーBがログインしているとき' do
            let(:login_user) { user_b }

            before do
                visit mygroup_group_path(user_b.groups.first)
            end

            it 'ユーザーBがグループに投稿したレシピが表示される' do
                expect(page).to have_content 'ユーザーB'
            end
        end
    end
end
