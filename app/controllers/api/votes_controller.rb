class Api::VotesController < ApplicationController
    skip_before_action :authorize, only: [:index, :show, :destroy, :toprankers, :topcreators]

    def index
        render json: Vote.all
    end

    def show
        vote = vote_find
        render json: vote
    end

    def toprankers 
        rankers = Vote.all
        .select("user_id, count(*) as num_rows")
        .group(:user_id)
        .order("num_rows DESC")
        .limit(3)
        res = []
        rankers.map do |ranker|
            user = User.find(ranker.user_id)
            user_info = {"user_id" => user.id, "username" => user.username, "count" => ranker.num_rows}
            if user.avatar.attached? 
                user_info["avatar"] = user.avatar.key.to_s
            end
            res.push(user_info)
        end
        render json: res
    end

    def topcreators
        results = Vote.find_by_sql(
            "SELECT boards.user_id, sum(tally.num_votes) as total
            FROM boards, (SELECT board_id, count(*) as num_votes
                        FROM votes
                        GROUP BY board_id) as tally
            where boards.id = tally.board_id
            GROUP BY boards.user_id
            ORDER BY total desc
            limit 3"
        )
        final = []
        results.map do |result|
            user = User.find(result.user_id)
            user_info = {"user_id" => user.id, "username" => user.username, "count" => result.total}
            if user.avatar.attached? 
                user_info["avatar"] = user.avatar.key.to_s
            end
            final.push(user_info)
        end
        render json: final
    end

    def create
        vote = Vote.create!(vote_params.merge(:user_id => session[:user_id]))
        array_size = vote.rankings.length
        vote.rankings.map.with_index do |ranking, idx| 
            option = Option.find(ranking)
            option.score = option.score + (array_size - idx)
            option.save
        end
        render json: vote, includes: ['vote.user'], status: :created
    end

    def update
        vote = vote_find
        vote.update!(vote_params)
        render json: vote
    end

    def destroy
        vote = vote_find
        vote.destroy
        head :no_content
    end

    private

    def vote_find
        Vote.find(params[:id])
    end

    def vote_params
        # rankings is an array of OPTION IDs, NOT indeces!
        params.permit(:board_id, rankings: [])
    end
end
