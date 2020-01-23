import { Engine, Rule } from 'json-rules-engine';
const rulesData = [
  {
    event: {
      type: 'Alabama:state',
    },
    conditions: {
      all: [
        {
          fact: 'state',
          operator: 'equal',
          value: 'Alabama',
        },
        {
          fact: 'legalCategory',
          operator: 'in',
          value: ['flower', 'vapes']
        },
      ],
    },
  },

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
  const res = await getProductViolations(
    rulesData.map(r => new Rule(r)),
    [{ state: 'Alabama', legalCategory: 'vapes' }]
  );
  console.log(res);
};

main();
