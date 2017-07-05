import React, { PropTypes } from 'react';
import Answer from './Answer';

const Question = ({ url, question, answers, handleAnswerClick }) => {
  return (
    <li className="question">
      <h2 className="question-title">
        <img src={url} width="30%"/>
      </h2>
      <h4 className="question-title">{question}</h4>
      <div className="question-container">
        <ul className="question-answers">
          {answers.map(answer => {
            return (
              <Answer
                key={answer}
                answer={answer}
                handleAnswerClick={handleAnswerClick}
              />
            );
          })}
        </ul>
      </div>
    </li>
  );
}

Question.propTypes = {
  url: PropTypes.string.isRequired,
  question: PropTypes.string.isRequired,
  answers: PropTypes.array.isRequired,
  handleAnswerClick: PropTypes.func.isRequired
};

export default Question;
