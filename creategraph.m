function creategraph(file,ar,fpp,mode)
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
    
        switch mode
            case 0 %mean
                output(i,1,:)=mean(mean(mean(intputbuffer,4),2),1);
                
            case 1 %median
                coloronlastdim=shiftdim(inputbuffer,-1);
                
                output(i,1,:)=median(reshape(coloronlastdim,[],3),1);
            case 2 %mode non black pixels
                coloronlastdim=shiftdim(inputbuffer,-1);
                colorvec=reshape(coloronlastdim,[],3);
                output(i,1,:)=mode(colorvec(sum(colorvec)>0,:),1);
        end
    
    
end

output=repmat(output,1,round(xdim/ar),1);
figure
imshow(output)
