import React, { PropTypes } from 'react';
import tally from '../helpers/tally';

const Results = ({ userAnswers, score, restartQuiz }) => {
  const triesTotal = tally(userAnswers);
  const oneTries = triesTotal[1] && <div><strong>{triesTotal[1]}</strong> beim ersten Versuch.</div>;
  const twoTries = triesTotal[2] && <div><strong>{triesTotal[2]}</strong> beim zweiten Versuch.</div>;
  const threeTries = triesTotal[3] && <div><strong>{triesTotal[3]}</strong> beim dritten Versuch.</div>;
  const fourTries = triesTotal[4] && <div><strong>{triesTotal[4]}</strong> beim letzten Versuch.</div>;
  return (
    <div className="results-container">
      <h2>Quiz Ergebnisse</h2>
      <div>Du antworteste...</div>
      {oneTries}
      {twoTries}
      {threeTries}
      {fourTries}
      <div className="results-total">Deine Gesammtpunktzahl beträgt <strong>{score}</strong>.</div>
      <a onClick={restartQuiz}>Quiz neustarten!</a>
    </div>
  );
}

Results.propTypes = {
  userAnswers: PropTypes.array.isRequired,
  score: PropTypes.number.isRequired,
  restartQuiz: PropTypes.func.isRequired
};

export default Results;
