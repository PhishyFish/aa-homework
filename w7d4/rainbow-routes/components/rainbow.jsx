import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>
        {/* Your links should go here */}
        <Link to="/red">Red only</Link>
        <Link to="/red/orange">Add orange</Link>
        <Link to="/red/yellow">Add yellow</Link>
        <Link to="/green">Green only</Link>
        <Link to="/blue">Blue only</Link>
        <Link to="/blue/indigo">Add indigo</Link>
        <Link to="/violet">Violet only</Link>

        <div id="rainbow">
          {/* Your routes should go here */}
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
}

export default Rainbow;
