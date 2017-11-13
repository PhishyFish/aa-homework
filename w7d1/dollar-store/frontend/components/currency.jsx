import React from 'react';

const Currency = ({name, rate}) => {
  let color = "green";
  if(rate < 1) {
    color = "red";
  }

  return (
    <div className={color}>
      <span>{name}</span>
      <span>{rate}</span>
    </div>
  );
};

export default Currency;
