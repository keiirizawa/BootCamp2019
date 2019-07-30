// RBC Model with additively separable preferences over labor
//
// Thomas Winberry, July 19th, 2019

//----------------------------------------------------------------
// 0. Housekeeping
//----------------------------------------------------------------

close all

//----------------------------------------------------------------
// 1. Endogenous variables
//----------------------------------------------------------------

var 

// Allocation variables 
y c k i n

// Prices
r w 

// Productivity shock
z

// Auxiliary variables for analysis
logY logC logI logL logW r_annual;

//----------------------------------------------------------------
// 2. Exogenous variables
//----------------------------------------------------------------

varexo omega;

//----------------------------------------------------------------
// 3. Parameters
//----------------------------------------------------------------

parameters 

// Utility function
bbeta aa

// Technology
ttheta mmu ddelta rrho ssigma ppsi;

//----------------------------------------------------------------
// 4. Calibration
//----------------------------------------------------------------

// Preferences 
bbeta   	= 0.96;
n_ss 		= 0.6;

// Technology
ttheta       = 0.21;
mmu          = 0.64;
ddelta  	= 0.1;
rrho 		= 0.9;
ssigma  	= 0.02;
ppsi         = 0.5;

//----------------------------------------------------------------
// 5. Model
//----------------------------------------------------------------

model; 

	// 1. Euler equation 
	1 / c			= a / w;
	
	// 3. Production function
	y					= exp(z) * (k(-1) ^ aalpha) * (l ^ (1 - aalpha));
	
	// 4. Wage rate
	w					= mmu * e * (n ^ mmu - 1)
	
	// 5. Rental rate on capital
	r					= ttheta * e * (k ^ (ttheta - 1)) * n
	
	// 6. Evolution of capital stock
	k					= (1 - ddelta) * k(-1) + i;
	
	// 7. Output market clearing
	y					= c + i;
	
	// 8. Law of motion for productivity
	e					= rrho * e(-1) + w;
	
	// 9. Definition of logY
	logY					= 100 * log(y);
	
	// 10. Definition of logC
	logC					= 100 * log(c);
	
	// 11. Definition of logI
	logI					= 100 * log(i);
	
	// 12. Definition of logL
	logL					= 100 * log(l);
	
	// 13. Definition of logW
	logW					= 100 * log(w);
	
	// 14. Definition of r_annual
	r_annual				= 400 * r;
	
end;

//----------------------------------------------------------------
// 6. Steady State
//----------------------------------------------------------------

steady_state_model;

	r		= (1 / bbeta) - (1 - ddelta);  // use this expression instead of firm FOC because use to solve k
	n		= n_ss;
	k		= (aalpha * (l ^ (1 - aalpha)) / r) ^ (1 / (1 - aalpha)); // ?
	y		= e * (k ^ ttheta) * (n ^ mmu);
	i		= ddelta * k;
	c		= y - i;
	z		= 0;
	w		= mmu * y / l;  
    a       = w / c; 
	
	logY		= 100 * log(y);
	logC		= 100 * log(c);
	logI		= 100 * log(i);
	logL		= 100 * log(l);
	logW		= 100 * log(w);
	r_annual	= 400 * r;
	
end;

//----------------------------------------------------------------
// 7. Computation
//----------------------------------------------------------------

shocks;
	var omega = ssigma ^ 2;
end;

steady;

check;

stoch_simul(hp_filter = 1600, irf = 80, order = 1) logY logC logI logL logW r_annual;
