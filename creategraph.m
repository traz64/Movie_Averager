function creategraph(file,ar,fpp,mode,thresh)
video=VideoReader(file);
i=1;
xdim=floor(video.Duration*video.FrameRate/fpp);
output=zeros(xdim,1,3);
inputbuffer=zeros(video.Width,video.Height,3,fpp);

while(i<=xdim)
    waitbar(i/xdim);
    
    for x=1:fpp
        inputbuffer(:,:,:,x)=readFrame(video);
    end
    coloronlastdim=shiftdim(inputbuffer,-1);
    colorvec=reshape(coloronlastdim,[],3);
    colorvec(sum(colorvec)<=thresh,:)=[];
        switch mode
            case 0 %mean
                output(i,1,:)=mean(colorvec,1);
                
            case 1 %median
                output(i,1,:)=median(colorvec,1);
            case 2 %mode
                output(i,1,:)=mode(colorvec,1);
        end
    
    
end
output=output/255;
output=repmat(output,1,round(xdim/ar),1);
figure
imshow(output)
