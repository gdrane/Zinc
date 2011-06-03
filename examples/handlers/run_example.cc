#include "handler.h"

int main()	{
	ZincHandler *znc = ZincHandler::getInstance();
	znc->runHandler("GMAIL:firstLog:read", "read"); 
}
