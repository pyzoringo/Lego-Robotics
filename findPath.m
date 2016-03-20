function path = findPath(A)
%findPath Summary of this function goes here
%   find path. A is the matrix containing path info.
%   A=[Point1; Point2; Point3....]
angleA=angleSol(A(1,1),A(1,2));        % initial angles
prompt='For initial Angle, Enter "1" for COM1, "2" for COM2: ';
x=input(prompt);                % Select initial angle
flag=0;
while flag==0
    if x==1
        angle0=angleA(:,1);
        flag=1;
    else if x==2
            angle0=angleA(:,2);
            flag=1;
        else
            disp('Invalid Input, Enter "1" or "2".')
        end
    end
end

anglebuffer=0;

for i=1:size(A,1)-1
    if A(i,1)==A(i+1,1)
        AB(1,:)=A(i,1)+zeros(1,10);
    else
        AB(1,:)=A(i,1):(A(i+1,1)-A(i,1))/9:A(i+1,1);
    end
    if A(i,2)==A(i+1,2)
        AB(2,:)=A(i,2)+zeros(1,10);
    else
        AB(2,:)=A(i,2):(A(i+1,2)-A(i,2))/9:A(i+1,2);
    end
    angles=zeros(2,size(AB,2));
    if i==1
        angles(:,1)=angle0;
    else
        angles(:,1)=anglebuffer;
    end
    
    for n=1:9
        angleB=angleSolHide(AB(1,n+1),AB(2,n+1));
        if abs(360+angleB(1,1)-angles(1,n))<180
            if abs(360+angleB(1,1)-angles(1,n))<abs(angleB(1,2)-angles(1,n))
                angles(:,n+1)=angleB(:,1);
            else
                angles(:,n+1)=angleB(:,2);
            end
        else
            if abs(angleB(1,1)-angles(1,n))<=abs(angleB(1,2)-angles(1,n))
                angles(:,n+1)=angleB(:,1);
            else
                angles(:,n+1)=angleB(:,2);
            end
        end
        if n==9
            anglebuffer=angles(:,n+1);
        end
        %backslash
        if n==1
            m2a(angles(:,n),angles(:,n+1));
        else
            if angles(1,n)*angles(1,n+1)<0
                angle1wbs=angles(1,n+1)+5*angles(1,n+1)/abs(angles(1,n+1));
            else
                angle1wbs=angles(1,n+1);
            end
            if angles(2,n)*angles(2,n+1)<0
                angle2wbs=angles(2,n+1)+6*angles(1,n+1)/abs(angles(1,n+1));
            else
                angle2wbs=angles(2,n+1);
            end
            m2a(angles(:,n),[angle1wbs,angle2wbs]);
        end
       % pause(2);
    end
end
            

end

