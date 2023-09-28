function outputSRIRs = omniBatchConversion(inputSRIRPath, outputSRIRPath)
%omniBatchConversion     converts folder of SRIRs to omnidirectional
%   function takes in a path and converts groups of four SRIRs from a 
%   single source-receiver combination with 4 orientations to a single,
%   omnidirectional SIR
%   this interfaces with the function NESWtoOmni.m
%   the resultant SIRs are saved in the outputSRIRPath
%   INPUT
%       inputSRIRPath   relative path for raw SIRs
%       outputSRIRPath  relative path for processed SIRs
%   OUTPUT
%       outputSRIRs     onmidirectional SRIRs

    % if the output file path does not excist, create it
    mkdir(outputSRIRPath);

    % add in required paths
    addpath(inputSRIRPath);
    addpath(outputSRIRPath);
    
    % place all .wav files in structs
    fileStruct = dir(fullfile(inputSRIRPath,'*.wav'));

    % cell for output SRIRs
    outputSRIRs = cell(1, numel(fileStruct)/4);

    tic
    
    % loop through audio files in groups of four
    %   this assumes appropriate naming of files (i.e. N, E, S and W are
    %   located together) and that no other files are present
    %   note:   some primitive error checking is present, however this is 
    %           by no means exhaustive
    for i = 1: length(fileStruct)/4
    
        % put file names in a matrix
        fileNames = [   fileStruct(4*(i-1)+1).name;...
                        fileStruct(4*(i-1)+2).name;...
                        fileStruct(4*(i-1)+3).name;...
                        fileStruct(4*(i-1)+4).name      ];
    
        % locate the north, east, south and west files and assign to
        % variables
        for k = 1: size(fileNames, 1)
                if fileNames(k, end - 8) == 'N'
                    northFileName = strcat(inputSRIRPath, fileNames(k, :));
                elseif fileNames(k, end - 8) == 'E'
                    eastFileName = strcat(inputSRIRPath, fileNames(k, :));
                elseif fileNames(k, end - 8) == 'S'
                    southFileName = strcat(inputSRIRPath, fileNames(k, :));
                elseif fileNames(k, end - 8) == 'W'
                    westFileName = strcat(inputSRIRPath, fileNames(k, :));
                else
                    % throw error if the file name does not have an 'N', 
                    % 'E', 'S' or 'W' in the expected location
                    error('File names not in the correct format.');
                end
        end

        % convert the audio file to omnidirectional
        [outputSRIRs{i}, Fs] = NESWtoOmni(    northFileName, eastFileName, ...
                                            southFileName, westFileName);
    end

    % write each SRIR to an audio file
    for k = 1:length(fileStruct)
        % for each North IR
        if fileStruct(k).name(end - 8) == 'N'
            % use this name to construct the name for the omnidirectional
            % SRIR
            inputFileName = fileStruct(k).name;
            splitName = split(inputFileName, "N");
            outputFileName = strcat(outputSRIRPath, '/', splitName{1},...
                'Omni', splitName{2});

            % write each IR to an audio file
            audiowrite( outputFileName, outputSRIRs{ceil(k/4)}, ...
                        Fs, 'BitsPerSample', 24);
        end
    end

    toc
end