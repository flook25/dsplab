%creating "analogue" signal
clear; %clears all variables
t=0:.1:20;
F1=.1;
F2=.2;
x=sin(2*pi*F1*t)+sin(2*pi*F2*t);

%plotting
figure(1);
subplot(2,1,1);
plot(t,x);
title('Original signal')
xlabel('t');
ylabel('x(t)');

subplot(2,1,2);
x_samples=x(1:10:201); %gets 21 samples of x.
stem(x_samples,'filled');
title('Sampled signal')
xlabel('n');
ylabel('x_s(n)');
axis([0 20 -2 2]);

%creating dialog box with explanations
l1=[blanks(10),'Sample by sample reconstruction.'];
l2='Blue dots: Input samples.';
l3='Blue curve: reconstructed signal.';
l4='Red curve: contribution to output sample from current sample.';
l5='Press any key to update with 1 iteration.';
l6='(You can keep this window open while watching the reconstruction)';
information ={l1,'',l2,l3,l4,'',l5,'',l6};

%starting reconstruction process
figure(2);
messagebox=msgbox(information,'Information','help');
subplot(2,1,2);
plot(t,x,'black');
hold on;
plot([0 20],[0 0],'black');
hold off;
xlabel('t');
ylabel('x(t)');
title('Original signal');
grid;

x_recon=0;
subplot(2,1,1);
for k=0:length(x_samples)-1
    stem(0:length(x_samples)-1,x_samples,'filled');
    if k==length(x_samples)-1
       title('Reconstruction finished'); 
    else
        title('Sample by sample reconstruction');    
    end
    grid on;
    l=k:-.1:-20+k;
    x_recon=x_recon+x_samples(k+1)*sinc(l);
    axis([0 20 -2 2]);
    hold;
    plot(t,x_samples(k+1)*sinc(l),'r')
    plot(t,x_recon);
    hold off;
    waitforbuttonpress; 
end