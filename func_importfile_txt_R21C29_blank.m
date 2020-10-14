function gwrmp = func_importfile_txt_R21C29_blank(filename, dataLines)
%IMPORTFILE 从文本文件中导入数据
%  GWRMP = IMPORTFILE(FILENAME)读取文本文件 FILENAME 中默认选定范围的数据。  以元胞数组形式返回数据。
%
%  GWRMP = IMPORTFILE(FILE, DATALINES)按指定行间隔读取文本文件 FILENAME
%  中的数据。对于不连续的行间隔，请将 DATALINES 指定为正整数标量或 N×2 正整数标量数组。
%
%  示例:
%  gwrmp = importfile("D:\workstation\matlab\20201011-proExtendData\input\max_gwrmp\flood\1979_gwrmp.txt", [1, Inf]);
%
%  另请参阅 READTABLE。
%
% 由 MATLAB 于 2020-10-11 11:50:22 自动生成

%% 输入处理

% 如果不指定 dataLines，请定义默认范围
if nargin < 2
    dataLines = [1, Inf];
end

%% 设置导入选项并导入数据
opts = delimitedTextImportOptions("NumVariables", 29);

% 指定范围和分隔符
opts.DataLines = dataLines;
opts.Delimiter = ["\t", " ", ","];

% 指定列名称和类型
opts.VariableNames = ["ncols", "VarName2", "VarName3", "VarName4", "VarName5", "VarName6", "VarName7", "VarName8", "VarName9", "VarName10", "VarName11", "VarName12", "VarName13", "VarName14", "VarName15", "VarName16", "VarName17", "VarName18", "VarName19", "VarName20", "VarName21", "VarName22", "VarName23", "VarName24", "VarName25", "VarName26", "VarName27", "VarName28", "VarName29"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];

% 指定文件级属性
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% 导入数据
gwrmp = readtable(filename, opts);

%% 转换为输出类型
gwrmp = table2cell(gwrmp);
numIdx = cellfun(@(x) ~isnan(str2double(x)), gwrmp);
gwrmp(numIdx) = cellfun(@(x) {str2double(x)}, gwrmp(numIdx));
end