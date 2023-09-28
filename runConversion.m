close all
clear

MV4_inputPath = 'D:\_RESOURCE\MaidaVale-IRs\230925_2-N3D-All\MV4\AS2\AS2\TOA\';
MV4_convertedPath = ['D:\_RESOURCE\MaidaVale-IRs\230928-N3D-Omni-All' ...
        '\MV4\AS2\AS2\TOA\'];

% convert third order files
MV4_outputSRIRs = omniBatchConversion(  MV4_inputPath,...
                                        MV4_convertedPath    );

MV5_inputPath = 'D:\_RESOURCE\MaidaVale-IRs\230925_2-N3D-All\MV5\AS1\AS1\TOA\';
MV5_convertedPath = ['D:\_RESOURCE\MaidaVale-IRs\230928-N3D-Omni-All' ...
        '\MV5\AS1\AS1\TOA\'];

% convert third order files
MV5_outputSRIRs = omniBatchConversion(  MV5_inputPath,...
                                        MV5_convertedPath    );