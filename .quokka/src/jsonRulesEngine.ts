import { Engine, Rule } from 'json-rules-engine';
import _ from 'lodash';

const validRules = {
  flower: false,
  vapes: false,
  alwaysAllowed: true,
};
const activeRuleKeys = Object.keys(_.pickBy(validRules, val => val === false));
const inactiveRuleKeys = Object.keys(_.pickBy(validRules, val => val === true));
import R from 'ramda';
const rulesData = [
  new Rule({
    event: {
      type: 'state',
    },
    conditions: {
      any: [
        {
          fact: 'legalCategory',
          operator: 'notIn',
          value: inactiveRuleKeys,
        },
      ],
      all: [
        {
          fact: 'state',
          operator: 'equal',
          value: 'Alabama',
        },
        {
          fact: 'legalCategory',
          operator: 'in',
          value: activeRuleKeys,
        },
      ],
    },
  }),
  new Rule({
    event: {
      type: 'state',
    },
    conditions: {
      any: [
        {
          fact: 'legalCategory',
          operator: 'notIn',
          value: inactiveRuleKeys,
        },
      ],
      all: [
        {
          fact: 'state',
          operator: 'equal',
          value: 'Illinois',
        },
        {
          fact: 'legalCategory',
          operator: 'in',
          value: activeRuleKeys,
        },
      ],
    },
  }),
];

export const getProductViolations = async (rules: Rule[], facts: any[]) => {
  const engine = new Engine(rules, { allowUndefinedFacts: true });

  const results: any[] = [];

  engine.on('success', async (event, almanac, ruleResult) => {
    results.push(ruleResult);
  });

  await Promise.all(facts.map(f => engine.run(f)));
  return results;
};

const main = async () => {
  const res = await getProductViolations(rulesData, [{ state: 'Alabama', legalCategory: 'vapes' }]);
  console.log(res);
};

main();
