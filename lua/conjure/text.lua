local _2afile_2a = "fnl/conjure/text.fnl"
local _0_
do
  local name_0_ = "conjure.text"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  do end (module_0_)["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  do end (package.loaded)[name_0_] = module_0_
  _0_ = module_0_
end
local autoload
local function _1_(...)
  return (require("conjure.aniseed.autoload")).autoload(...)
end
autoload = _1_
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {require("conjure.aniseed.core"), require("conjure.aniseed.string")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {require = {a = "conjure.aniseed.core", str = "conjure.aniseed.string"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local a = _local_0_[1]
local str = _local_0_[2]
local _2amodule_2a = _0_
local _2amodule_name_2a = "conjure.text"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local trailing_newline_3f
do
  local v_0_
  do
    local v_0_0
    local function trailing_newline_3f0(s)
      return ("\n" == string.sub(s, -1))
    end
    v_0_0 = trailing_newline_3f0
    _0_["trailing-newline?"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["trailing-newline?"] = v_0_
  trailing_newline_3f = v_0_
end
local trim_last_newline
do
  local v_0_
  do
    local v_0_0
    local function trim_last_newline0(s)
      if trailing_newline_3f(s) then
        return string.sub(s, 1, -2)
      else
        return s
      end
    end
    v_0_0 = trim_last_newline0
    _0_["trim-last-newline"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["trim-last-newline"] = v_0_
  trim_last_newline = v_0_
end
local left_sample
do
  local v_0_
  do
    local v_0_0
    local function left_sample0(s, limit)
      local flat = str.trim(string.gsub(string.gsub(s, "\n", " "), "%s+", " "))
      if (limit >= a.count(flat)) then
        return flat
      else
        return (string.sub(flat, 0, a.dec(limit)) .. "...")
      end
    end
    v_0_0 = left_sample0
    _0_["left-sample"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["left-sample"] = v_0_
  left_sample = v_0_
end
local right_sample
do
  local v_0_
  do
    local v_0_0
    local function right_sample0(s, limit)
      return string.reverse(left_sample(string.reverse(s), limit))
    end
    v_0_0 = right_sample0
    _0_["right-sample"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["right-sample"] = v_0_
  right_sample = v_0_
end
local split_lines
do
  local v_0_
  do
    local v_0_0
    local function split_lines0(s)
      return str.split(s, "\n")
    end
    v_0_0 = split_lines0
    _0_["split-lines"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["split-lines"] = v_0_
  split_lines = v_0_
end
local prefixed_lines
do
  local v_0_
  do
    local v_0_0
    local function prefixed_lines0(s, prefix, opts)
      local function _4_(_3_)
        local _arg_0_ = _3_
        local n = _arg_0_[1]
        local line = _arg_0_[2]
        if ((1 == n) and a.get(opts, "skip-first?")) then
          return line
        else
          return (prefix .. line)
        end
      end
      return a["map-indexed"](_4_, split_lines(s))
    end
    v_0_0 = prefixed_lines0
    _0_["prefixed-lines"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["prefixed-lines"] = v_0_
  prefixed_lines = v_0_
end
local starts_with
do
  local v_0_
  do
    local v_0_0
    local function starts_with0(str0, start)
      return (string.sub(str0, 1, a.count(start)) == start)
    end
    v_0_0 = starts_with0
    _0_["starts-with"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["starts-with"] = v_0_
  starts_with = v_0_
end
local ends_with
do
  local v_0_
  do
    local v_0_0
    local function ends_with0(str0, _end)
      return ((_end == "") or (_end == string.sub(str0, ( - a.count(_end)))))
    end
    v_0_0 = ends_with0
    _0_["ends-with"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["ends-with"] = v_0_
  ends_with = v_0_
end
local strip_ansi_escape_sequences
do
  local v_0_
  do
    local v_0_0
    local function strip_ansi_escape_sequences0(s)
      return string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(s, "\27%[%d+;%d+;%d+;%d+;%d+m", ""), "\27%[%d+;%d+;%d+;%d+m", ""), "\27%[%d+;%d+;%d+m", ""), "\27%[%d+;%d+m", ""), "\27%[%d+m", "")
    end
    v_0_0 = strip_ansi_escape_sequences0
    _0_["strip-ansi-escape-sequences"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["strip-ansi-escape-sequences"] = v_0_
  strip_ansi_escape_sequences = v_0_
end
local chars
do
  local v_0_
  do
    local v_0_0
    local function chars0(s)
      local res = {}
      if s then
        for c in string.gmatch(s, ".") do
          table.insert(res, c)
        end
      end
      return res
    end
    v_0_0 = chars0
    _0_["chars"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["chars"] = v_0_
  chars = v_0_
end
local upper_first
do
  local v_0_
  do
    local v_0_0
    local function upper_first0(s)
      if s then
        return s:gsub("^%l", string.upper)
      end
    end
    v_0_0 = upper_first0
    _0_["upper-first"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["upper-first"] = v_0_
  upper_first = v_0_
end
return nil