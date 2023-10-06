close all
clear

% paths for MV2 SRIRs
MV2_inputPath = 'D:\_RESOURCE\MaidaVale-IRs\230925_2-N3D-All\MV2\AS1_Main\TOA\';
MV2_convertedPath = 'D:\_RESOURCE\MaidaVale-IRs\230928-N3D-Omni-All\MV2\AS1_Main\TOA\';
% convert third order files
MV2_outputSRIRs = omniBatchConversion(  MV2_inputPath,...
                                        MV2_convertedPath    );

% paths for MV4 SRIRs
MV4_inputPath = 'D:\_RESOURCE\MaidaVale-IRs\230925_2-N3D-All\MV4\AS2\AS2\TOA\';
MV4_convertedPath = ['D:\_RESOURCE\MaidaVale-IRs\230928-N3D-Omni-All' ...
        '\MV4\AS2\AS2\TOA\'];

% convert third order files
MV4_outputSRIRs = omniBatchConversion(  MV4_inputPath,...
                                        MV4_convertedPath    );

% paths for MV5 SRIRs
MV5_inputPath = 'D:\_RESOURCE\MaidaVale-IRs\230925_2-N3D-All\MV5\AS1\AS1\TOA\';
MV5_convertedPath = ['D:\_RESOURCE\MaidaVale-IRs\230928-N3D-Omni-All' ...
        '\MV5\AS1\AS1\TOA\'];

% convert third order files
MV5_outputSRIRs = omniBatchConversion(  MV5_inputPath,...
                                        MV5_convertedPath    );