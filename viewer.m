function viewer(y,movie)
    m = size(y,1); n = size(y,2);
    if( m == 2 && movie == 1 ),
        for i=1:n,
            scatter(y(1,i),y(2,i),'bo');axis equal;hold on;
            plot(y(1,1:i),y(2,1:i),'b-');axis equal;hold off;
            pause(1.0/30.0);
        end;
    elseif( m == 2 && movie == 0 ),
        scatter(y(1,1),y(2,1));axis equal;hold on;
        plot(y(1,:),y(2,:));axis equal; hold on;
    elseif( m == 3 && movie == 1 ),
        for i=1:n,
            scatter3(y(1,i),y(2,i),y(3,i),'bo');axis equal;hold on;
            plot3(y(1,1:i),y(2,1:i),y(3,1:i),'b-');axis equal;hold off;
            pause(1.0/30.0);
        end;
    elseif( m == 3 && movie == 0 ),
        scatter3(y(1,1),y(2,1),y(3,1));axis equal;hold on;
        plot3(y(1,:),y(2,:),y(3,:));axis equal;hold on;
    else
        error('Solution input "y" must have m=2 or m=3 rows');
    end;