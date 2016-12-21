var Category = React.createClass({
  getInitialState: function() {
    return {
      name: ''
    }
  },

  render: function() {
    return (
      <li className="list-group-item">
        <a> { this.props.category.name }</a>
      </li>
    )
  }
})
