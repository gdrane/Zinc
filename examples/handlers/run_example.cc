#include "handler.h"

int main()	{
	ZincHandler *znc = ZincHandler::getInstance();
	znc->runHandler("GMAIL:_Z8firstLogv:read", "read"); 
}
