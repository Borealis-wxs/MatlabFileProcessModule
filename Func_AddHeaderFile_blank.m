function [ output_args ] = Func_AddHeaderFile( pthFileName_src,pthFileName_dst )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
num_row=21;
num_col=29;
headerFileName='headertxt.txt';

cell_annual_year1 = func_importfile_txt_R21C29_blank(pthFileName_src, 1, 21);
disp(pthFileName_src);
%start ����һ��cell_grid�������洢Ԥ����������
for id_row=1:num_row %��ѭ��
    for id_col=1:num_col %��ѭ��
        tmp_1=cell2mat(cell_annual_year1(id_row,id_col));
        if tmp_1 == -9999
            cell_grid_1(id_row,id_col)=-9999;
        else
            cell_grid_1(id_row,id_col)=cell2mat(cell_annual_year1(id_row,id_col));
        end
    end
end % end for id_row
%end ����һ��cell_grid����---------------

%% �����д���ļ�
% �ȸ���һ��ͷ�ļ�ģ��
pthFileName_SrcFile  = headerFileName;
pthFileName_DestFile  = pthFileName_dst;
copyfile(pthFileName_SrcFile, pthFileName_DestFile);

% ʹ��dlmwrite������������д�뵽����ļ���
% ע�⣬�˴�ʹ��'-append'���Բ�����ʵ����ͷ�ļ�����Ӿ�������
dlmwrite(pthFileName_DestFile,cell_grid_1, 'delimiter', '\t', 'precision', '%8.6f','-append');
output_args='sucess';

end

