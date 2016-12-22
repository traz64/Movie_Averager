function creategraph(file,ar,fpp,mode)
video=VideoReader(file);
i=1;
xdim=floor(video.Duration*video.FrameRate/fpp);
output=zeros(xdim,round(xdim/ar),3);
while(i<=xdim)
    