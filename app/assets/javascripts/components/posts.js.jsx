var Posts = React.createClass({
  getInitialState: function(){
    return {
      posts: this.props.posts,
      categories: this.props.categories
    }
  },

  render: function(){
    var self = this;
    return (
      <div className="container">
        <div className="row">
          <div className="col-md-9 col-sm-12">
            { this.state.posts.map(function(post) {
              return (
                <Post key={ post.id }
                          post={ post } />
              )
            })}
          </div>
          <div className="col-md-3 col-sm-12">
            <div className="panel panel-default">
              <div className="panel-heading text-center"> Categories </div>
                <ul className="list-group">
                  { this.state.categories.map(function(category){
                    return (
                      <Category key={ category.id }
                                category={ category } />
                    )
                  })}
                </ul>
              </div>
            </div>
          </div>
        </div>
    )
  }
})
