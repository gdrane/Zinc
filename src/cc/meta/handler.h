#ifndef _KFS_ZINC_HANDLER_H_
#define _KFS_ZINC_HANDLER_H_

#include <map>
#include <string>

#include <dlfcn.h>

class   ZincHandler    {
   private:
       std::map<std::string, char*>   handlerMap;
       static ZincHandler            *handler;
       ZincHandler()   {
       }
   public:
       static const std::string       path;
       static const std::string       lib_ext;
      
       static ZincHandler* getInstance();
      
       char* get_lib_handle(const std::string app)  {
            char *return_handle =  handlerMap[app];
            if (return_handle == NULL)  {
                return_handle = put_lib_handler(app);
            }
            return return_handle;
       }

       //  put handler
       char* put_lib_handler(const std::string &app) {

            std::string lib_path; 
            lib_path.append(path);
            lib_path.append(app);
            lib_path.append(lib_ext);

            char *lib_handle = (char*) dlopen(lib_path.c_str(), RTLD_LAZY);
            if (!lib_handle)    {
                return NULL; 
            }
            handlerMap.insert(std::pair<std::string,char*>(app, lib_handle));
            return lib_handle;
       }

       //  run handler 
       void  runHandler (const std::string handler_key, const std::string event);

       //   close all the handlers open
       ~ZincHandler() {
           std::map<std::string,char*>::iterator it;
           for (it = handlerMap.begin(); it != handlerMap.end(); it++)    {
                void *lib_handle = (*it).second;
                dlclose(lib_handle);  
           }
       }
       
};

#endif  //  _KFS_ZINC_HANDLER_H_
