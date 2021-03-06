local handy = request('!.mechs.processor.handy')

local vararg = request('^.expressions.vararg')
local name_list = request('^.words.name_list')
local word = request('^.words.word')
local statements = request('statements')
local opt_spc = request('^.words.opt_spc')

local params_list =
  handy.cho(
    vararg,
    {
      name_list,
      handy.opt(
        opt_spc, ',',
        vararg
      ),
    }
  )

return
  {
    {
      name = 'function_params',
      opt_spc, '(',
      handy.opt(params_list),
      opt_spc, ')',
    },
    {
      statements,
      word('end'),
    }
  }
