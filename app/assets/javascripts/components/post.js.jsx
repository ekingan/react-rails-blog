var Post = React.createClass({
  getInitialState: function() {
    return {
      postLink: '/posts/' + this.props.post.id,
      upvotes: this.props.post.cached_votes_up,
      downvotes: this.props.post.cached_votes_down,
      categoryName: '',
      userName: '',
      commentCount: ''
    };
  },

  componentDidMount: function() {
    $.getJSON('/posts/' + this.props.post.id + '/category.json', function(postCategoryData) {
      if (this.isMounted()) {
        this.setState({
          categoryName: postCategoryData.name
        })
      }
    }.bind(this));

    $.getJSON('/posts/' + this.props.post.id + '/user.json', function(postUserData) {
      if (this.isMounted()) {
        this.setState({
          userName: postUserData.name
        })
      }
    }.bind(this));

    $.getJSON('/posts/' + this.props.post.id + '/comments.json', function(commentData) {
      if (this.isMounted()) {
        this.setState({
          commentCount: commentData.length
        })
      }
    }.bind(this));
  },

  handleUpvote: function(e) {
    e.preventDefault();
    $.ajax({
      method: 'PUT',
      url: '/posts/' + this.props.post.id + '/like',
      success: function(e) {
        this.setState({
          upvotes: e.cached_votes_up,
          downvotes: e.cached_votes_down
        })
      }.bind(this)
    })
  },
  handleDownvote: function(e) {
    e.preventDefault();
    $.ajax({
      method: 'PUT',
      url: '/posts/' + this.props.post.id + '/dislike',
      success: function(e) {
        this.setState({
          upvotes: e.cached_votes_up,
          downvotes: e.cached_votes_down
        })
      }.bind(this)
    })
  },

  render: function() {
    return (
      <div className="well">
          { this.props.post.title }
          <br/>
          { this.props.post.body }
          <br/>
          <br/>
          <a className="btn btn-success btn-xs"
            onClick={ this.handleUpvote }> Definitely doing that!</a>
          <span className="text-success">({ this.state.upvotes })</span>
          <a className="btn btn-warning btn-xs"
            onClick={ this.handleDownvote }> Not Interested </a>
          <span className="text-warning">({ this.state.downvotes })</span>
          <a className="btn btn-link btn-xs"> Comments </a>
          <small><em>({ this.state.commentCount })</em></small>
          <br/>
          <span className="text-muted pull-right"><small>Created By: { this.state.userName } on 1/1/17</small></span>
          <br/>
          <span className="text-muted pull-right"><small>Category: { this.state.categoryName } </small></span>
      </div>
    );
  }
})
