function R_img=RemovePeriodicNoise(N_Img)
a=fftshift(fft2(N_Img));
[m,n]=size(a);
a1=abs((a));
t=0.35;
rgn=6;
a3=a;
wmax=10;
for i=10:m-9
    for j=10:n-9
       d=sqrt((i-(m/2))^2+(j-(n/2))^2);
        if (d>rgn) 
            w1=1;
            cond=1;
            while(cond==1)
                w2=w1+1;
                s=0;
                s1=0;
                co1=0;
                co2=0;
                for k=-w2:w2
                    for l=-w2:w2
                        if (abs(k)<=w1)&&(abs(l)<=w1)
                            co1=co1+1;
                            s=s+a1(i+k,j+l);
                        else
                            co2=co2+1;
                            s1=s1+a1(i+k,j+l);
                        end                
                    end
                end
                if ((s1/co2)/(s/co1))<t
                    if w2>=wmax
                        cond=0;
                    else
                         w1=w1+1;            
                    end
                    for k=-w2:w2
                        for l=-w2:w2
                            h(w2+1+k,w2+1+l)=1-exp((-0.005)*(k^2+l^2));
                            a3(i+k,j+l)=min(a(i+k,j+l)*h(w2+1+k,w2+1+l),a3(i+k,j+l));
                        end
                    end
                    clear h;
                else
                    cond=0;
                end
            end
        end
    end
end
R_img=real(ifft2(ifftshift(a3)));