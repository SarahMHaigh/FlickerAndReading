%%%% Arnold J Wilkins %%%%%
% Analyzes autocorrelation in an image %

clear;
clear locat*
B(:)=0;
ls(:)=0;
locat1=pwd; %identify directory
%Prepare output file
clock_integer=fix(clock);
output_file=strcat(locat1,'autocorrpage_',int2str(clock_integer(4)),'-',int2str(clock_integer(5)),'_',date,'.xls');
 

% ---- loop over all the images ----------------------------------------------
 
n=0;
files1 = dir(locat1);
for serial_number_1=3:1:size(files1) % was 3
    file_to_analyse=strcat(locat1,files1(serial_number_1).name);
    k=strfind(file_to_analyse,'.TIF');k=size(k); v1=k(2);
    k=strfind(file_to_analyse,'.tif');k=size(k); v2=k(2);
    k=strfind(file_to_analyse,'.tiff');k=size(k); v11=k(2);
    k=strfind(file_to_analyse,'.JPG');k=size(k); v3=k(2);
    k=strfind(file_to_analyse,'.jpg');k=size(k); v4=k(2);
    k=strfind(file_to_analyse,'.png');k=size(k); v5=k(2);
    k=strfind(file_to_analyse,'.JPEG');k=size(k); v6=k(2);
    k=strfind(file_to_analyse,'.GIF');k=size(k); v7=k(2);
    k=strfind(file_to_analyse,'.gif');k=size(k); v8=k(2);
    k=strfind(file_to_analyse,'.bmp');k=size(k); v9=k(2);
    k=strfind(file_to_analyse,'.BMP');k=size(k); v10=k(2);
    k=strfind(file_to_analyse,'.PNG');k=size(k); v12=k(2);
    k=strfind(file_to_analyse,'.jpeg');k=size(k); v13=k(2);
    k=v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13;
    
    if k>0
        n=n+1;
        img=imread(file_to_analyse);
        imhsv=rgb2hsv(img);
            
                % ----- core process ----------------------------------------
               
        img=imhsv(:,:,3);
        img=double(img);
        figure;
        imshow(img)
        l=mean(img');
        %plot(l);
        sz=size(img');
        j=0;
                
        for i=1:sz(2)-1
            if l(i)<.9 && l(i+1)>.9
                j=j+1;
                ls(j)=i;%linestart
            end
        end
                
        imgi=img';
        sizels=size(ls);
        sizls=sizels(2);%number of lines
        csumupper=0;csumlower=0;countern=0;

        for i=2:sizls-1
            csumupper=csumupper+mean(l(ls(i):ls(i)+19));
            csumlower=csumlower+mean(l(ls(i)+20:ls(i)+39));
            countern=countern+1;
        end
        
        csumupper./countern
        csumlower./countern
        (csumupper+csumlower)/2/counter
                
        sz=size(img);
        
        for l=1:30
            lag=uint16(l);
            B(lag)=corr2(img(1:sz(1),1:sz(2)-30),img(1:sz(1),lag:sz(2)-30+lag-1));%corr2 is the one to use           
        end
           
        %figure;
        %plot(B)
    end
    
    %title_string=strcat(file_to_analyse,' - ',int2str(index(2).*100));
    fid1=fopen(output_file,'A');%open file for append
    fprintf(fid1,'%s',file_to_analyse);
    fprintf(fid1,'%10.8g\t ',0);%print a null string
    fprintf(fid1,'%10.8g\t ',B);
    fprintf(fid1,'\n'); %print <CR> at end to generate new line
    fclose(fid1);% close the file to enable access
end
 
 