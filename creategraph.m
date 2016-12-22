function creategraph(file,ar,fpp,mode,thresh)
video=VideoReader(file);
i=1;
xdim=double(video.Duration*video.FrameRate/fpp);
output=zeros(1,i,3);
%inputbuffer=zeros(video.Height,video.Width,3,fpp);
assert(fpp>0)
h=waitbar(0,'processing');
for i=1:xdim
    waitbar(i/xdim);
    if fpp>1
        inputbuffer=zeros(video.Height,video.Width,3,fpp);
        for x=1:fpp
            inputbuffer(:,:,:,x)=readFrame(video);
        end
        coloronlastdim=shiftdim(inputbuffer,-1);
    else
        coloronlastdim=readFrame(video);
    end
    

    colorvec=reshape(coloronlastdim,[],3);
    clear inputbuffer coloronlastdim %free ram
    colorvec(sum(colorvec)<=thresh,:)=[];
        switch mode
            case 0 %mean
                output(1,i,:)=mean(colorvec,1);
               
            case 1 %median
                output(1,i,:)=median(colorvec,1);
            case 2 %mode
                output(1,i,:)=mode(colorvec,1);
        end
    clear colorvec
    
end

output=output/255;
output=repmat(output,round(xdim/ar),1,1);
close(h);
figure
imshow(output)
imwrite(output,[video.Name,'.png'])
