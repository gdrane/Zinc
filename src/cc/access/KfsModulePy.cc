//---------------------------------------------------------- -*- Mode: C++ -*-
// $Id: KfsModulePy.cc 392 2010-05-27 20:11:26Z sriramsrao $
//
// Created 2006/08/01
//
// Copyright 2008 Quantcast Corp.
// Copyright 2006-2008 Kosmix Corp.
//
// This file is part of Kosmos File System (KFS).
//
// Licensed under the Apache License, Version 2.0
// (the "License"); you may not use this file except in compliance with
// the License. You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
// implied. See the License for the specific language governing
// permissions and limitations under the License.
// 
// \brief Glue code for Python apps to access KFS.
//
//----------------------------------------------------------------------------

#include "Python.h"
#include "structmember.h"
#include "libkfsClient/KfsClient.h"
#include <cstring>
#include <cerrno>
#include <string>
#include <vector>

extern "C" {
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
}

// XXX This is part of newer versions of Python; take out after
// we upgrade.
#if !defined(Py_RETURN_NONE)
/* Macro for returning Py_None from a function */
#define Py_RETURN_NONE return Py_INCREF(Py_None), Py_None
#endif // !defined(Py_RETURN_NONE)

using std::string;
using std::vector;
using namespace KFS;

struct kfs_Client {
	PyObject_HEAD
	PyObject *propfile;		// Properties file
	PyObject *cwd;			// Current directory
	KfsClientPtr client;		// The client itself
};

static void Client_dealloc(PyObject *pself);
static PyObject *Client_new(
		PyTypeObject *type, PyObject *args, PyObject *kwds);
static int Client_init(PyObject *pself, PyObject *args, PyObject *kwds);
static PyObject *Client_new(
		PyTypeObject *type, PyObject *args, PyObject *kwds);
static int Client_print(PyObject *pself, FILE *fp, int flags);
static PyObject *Client_repr(PyObject *pself);
static PyObject *kfs_isdir(PyObject *pself, PyObject *args);
static PyObject *kfs_isfile(PyObject *pself, PyObject *args);
static PyObject *kfs_mkdir(PyObject *pself, PyObject *args);
static PyObject *kfs_mkdirs(PyObject *pself, PyObject *args);
static PyObject *kfs_rmdir(PyObject *pself, PyObject *args);
static PyObject *kfs_rmdirs(PyObject *pself, PyObject *args);
static PyObject *kfs_readdir(PyObject *pself, PyObject *args);
static PyObject *kfs_readdirplus(PyObject *pself, PyObject *args);
static PyObject *kfs_create(PyObject *pself, PyObject *args);
static PyObject *kfs_stat(PyObject *pself, PyObject *args);
static PyObject *kfs_getNumChunks(PyObject *pself, PyObject *args);
static PyObject *kfs_getChunkSize(PyObject *pself, PyObject *args);
static PyObject *kfs_remove(PyObject *pself, PyObject *args);
static PyObject *kfs_rename(PyObject *pself, PyObject *args);
static PyObject *kfs_coalesceblocks(PyObject *pself, PyObject *args);
static PyObject *kfs_open(PyObject *pself, PyObject *args);
static PyObject *kfs_cd(PyObject *pself, PyObject *args);
static PyObject *kfs_log_level(PyObject *pself, PyObject *args);

static PyMemberDef Client_members[] = {
	{ "properties", T_OBJECT,
		offsetof(kfs_Client, propfile), RO, "properties file" },
	{ "cwd", T_OBJECT,
		offsetof(kfs_Client, cwd), RO, "current directory" },
	{ NULL }
};

static PyMethodDef Client_methods[] = {
	{ "mkdir", kfs_mkdir, METH_VARARGS, "Create directory."},
	{ "mkdirs", kfs_mkdirs, METH_VARARGS, "Create directory tree."},
        { "isdir", kfs_isdir, METH_VARARGS, "Check if a path is a directory."},
	{ "rmdir", kfs_rmdir, METH_VARARGS, "Remove directory."},
	{ "rmdirs", kfs_rmdirs, METH_VARARGS, "Remove directory tree."},
	{ "readdir", kfs_readdir, METH_VARARGS, "Read directory." },
	{ "readdirplus", kfs_readdirplus, METH_VARARGS,
		"Read directory with attributes." },
	{ "stat", kfs_stat, METH_VARARGS, "Stat file." },
	{ "getNumChunks", kfs_getNumChunks, METH_VARARGS, "Get # of chunks in a file." },
	{ "getChunkSize", kfs_getChunkSize, METH_VARARGS, "Get default chunksize for a file." },
	{ "create", kfs_create, METH_VARARGS, "Create file." },
	{ "remove", kfs_remove, METH_VARARGS, "Remove file." },
	{ "rename", kfs_rename, METH_VARARGS, "Rename file or directory." },
	{ "coalesce_blocks", kfs_coalesceblocks, METH_VARARGS, "Coalesce blocks from src->dest." },
	{ "open", kfs_open, METH_VARARGS, "Open file." },
        { "isfile", kfs_isfile, METH_VARARGS, "Check if a path is a file."},
	{ "cd", kfs_cd, METH_VARARGS, "Change directory." },
	{ "log_level", kfs_log_level, METH_VARARGS, "Set log4cpp log level." },
	{ NULL }
};

PyDoc_STRVAR(Client_doc,
"A kfs.client object is an instance of the KFS client library\n"
"that sends RPC's to the KFS metadata and chunk servers in order\n"
"to perform file system operations.  In addition, its 'open' method\n"
"creates kfs.file objects that represent files in KFS.\n\n"
"To create a client, you must supply a 'properties file' which\n"
"defines the hostname and port number for the metaserver, e.g.\n\n"
"\tmy_client = kfs.client('KfsTester.properties')\n\n"
"Methods:\n"
"\tmkdir(path) -- create a directory\n"
"\tmkdirs(path) -- create a directory tree\n"
"\trmdir(path) -- remove a directory (path should be an empty dir)\n"
"\trmdirs(path) -- remove a directory tree\n"
"\treaddir(path) -- return a tuple of directory contents\n"
"\treaddirplus(path) -- directory entries plus attributes\n"
"\tisdir(path) -- return TRUE if path is a directory\n"
"\tisfile(path) -- return TRUE if path is a file\n"
"\tstat(path)   --  file attributes, compatible with os.stat\n"
"\tgetNumChunks(path)   --  return the # of chunks in a file\n"
"\tgetChunkSize(path)   --  return the default size of chunks in a file\n"
"\tcreate(path, numReplicas=3) -- create a file and return a kfs.file object for it\n"
"\tremove(path) -- remove a file\n"
"\tcoalesceblocks(src, dst) -- append blocks from src->dest\n"
"\topen(path[, mode]) -- open a file and return an object for it\n"
"\tcd(path)     -- change current directory\n"
"\tlog_level(level)     -- change the message log level\n"
"\n\nData:\n"
"\tproperties   -- the name of the properties file\n"
"\tcwd          -- the current directory (for relative paths)\n");

static PyTypeObject kfs_ClientType = {
	PyObject_HEAD_INIT(NULL)
	0,				// ob_size
	"kfs.client",			// tp_name
	sizeof (kfs_Client),		// tp_basicsize
	0,				// tp_itemsize
	Client_dealloc,			// tp_dealloc
	Client_print,			// tp_print
	0,				// tp_getattr
	0,				// tp_setattr
	0,				// tp_compare
	Client_repr,			// tp_repr
	0,				// tp_as_number
	0,				// tp_as_sequence
	0,				// tp_as_mapping
	0,				// tp_hash
	0,				// tp_call
	0,				// tp_str
	0,				// tp_getattro
	0,				// tp_setattro
	0,				// tp_as_buffer
	Py_TPFLAGS_DEFAULT,		// tp_flags
	Client_doc,			// tp_doc
	0,				// tp_traverse
	0,				// tp_clear
	0,				// tp_richcompare
	0,				// tp_weaklistoffest
	0,				// tp_iter
	0,				// tp_iternext
	Client_methods,			// tp_methods
	Client_members,			// tp_members
	0,				// tp_getset
	0,				// tp_base
	0,				// tp_dict
	0,				// tp_descr_get
	0,				// tp_descr_set
	0,				// tp_dictoffset
	Client_init,			// tp_init
	0,				// tp_alloc
	Client_new			// tp_new
};


struct kfs_File {
	PyObject_HEAD
	PyObject *name;			// File name
	PyObject *mode;			// Access mode
	PyObject *pclient;		// Python object for KFS client
	int fd;				// File descriptor
};

static PyObject *
File_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	static PyObject *noname = NULL;
	if (noname == NULL) {
		noname = PyString_FromString("<uninitialized file>");
		if (noname == NULL)
			return NULL;
	}
	kfs_File *self = (kfs_File *)type->tp_alloc(type, 0);
	if (self != NULL) {
		Py_INCREF(noname);
		self->name = noname;
		Py_INCREF(noname);
		self->mode = noname;
		Py_INCREF(noname);
		self->pclient = noname;
		self->fd = -1;
	}
	return (PyObject *)self;
}

static void
File_dealloc(PyObject *pself)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	if (self->fd != -1)
		cl->client->Close(self->fd);
	Py_DECREF(self->name);
	Py_DECREF(self->mode);
	Py_DECREF(self->pclient);
	self->ob_type->tp_free((PyObject *)self);
}

static int
modeflag(const char *modestr)
{
	// convert mode string to flag
	int mode = -1;

	if (strcmp(modestr, "r") == 0)
		mode = O_RDWR;
	else if (strcmp(modestr, "w") == 0)
		mode = O_WRONLY;
	else if (strcmp(modestr, "r+") == 0 || strcmp(modestr, "w+") == 0)
		mode = O_RDWR;
	else if (strcmp(modestr, "a") == 0)
		mode = O_WRONLY | O_APPEND;

	return mode;
}

static int
set_file_members(
		kfs_File *self, const char *path,
		const char *modestr, kfs_Client *client, int fd)
{
	int mode;

	// convert mode string to flag
	mode = modeflag(modestr);
	if (mode == -1)
		return -1;

	// open the file if necessary
	if (fd < 0)
		fd = client->client->Open(path, mode);

	if (fd < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-fd));
		return -1;
	}

	// set all of the fields in the kfs_File structure
	Py_DECREF(self->name);
	self->name = PyString_FromString(path);
	Py_DECREF(self->mode);
	self->mode = PyString_FromString(modestr);
	PyObject *pclient = (PyObject *)client;
	Py_INCREF(pclient);
	Py_DECREF(self->pclient);
	self->pclient = pclient;
	self->fd = fd;

	return 0;
}

static int
File_init(PyObject *pself, PyObject *args, PyObject *kwds)
{
	kfs_File *self = (kfs_File *)pself;
	char *nm, *md = "r";
	PyObject *cl;
	static char *kwlist[] = { "client", "name", "mode", NULL };

	int ok = !PyArg_ParseTupleAndKeywords(
			args, kwds, "O!s|s", kwlist, &kfs_ClientType,
			&cl, &nm, &md);
	if (!ok)
		return -1;

	return set_file_members(self, nm, md, (kfs_Client *)cl, -1);
}

static PyObject *
File_repr(PyObject *pself)
{
	kfs_File *self = (kfs_File *)pself;
	return PyString_FromFormat("kfs.file<%s, %s, %d>",
			PyString_AsString(self->name),
			PyString_AsString(self->mode),
			self->fd);
}

static int
File_print(PyObject *pself, FILE *fp, int flags)
{
	kfs_File *self = (kfs_File *)pself;
	fprintf(fp, "kfs.file<%s, %s, %d>\n",
			PyString_AsString(self->name),
			PyString_AsString(self->mode),
			self->fd);
	return 0;
}

static PyObject *
kfs_reopen(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	char *modestr = PyString_AsString(self->mode);

	if (!PyArg_ParseTuple(args, "|s", &modestr))
		return NULL;

	int mode = modeflag(modestr);
	if (mode == -1)
		return NULL;

	int fd = cl->client->Open(PyString_AsString(self->name), mode);
	if (fd == -1)
		return NULL;

	self->fd = fd;
	self->mode = PyString_FromString(modestr);
	Py_RETURN_NONE;
}

static PyObject *
kfs_close(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	if (self->fd != -1) {
		cl->client->Close(self->fd);
		self->fd = -1;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_read(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	ssize_t rsize = -1l;

	if (!PyArg_ParseTuple(args, "l", &rsize))
		return NULL;

	if (self->fd == -1) {
		PyErr_SetString(PyExc_IOError, strerror(EBADF));
		return NULL;
	}

#if 0
	if (rsize > PY_SSIZE_T_MAX) {
		PyErr_SetString(PyExc_OverflowError,
"requested number of bytes is more than a Python string can hold");
		return NULL;
	}
#endif // 0

	PyObject *v = PyString_FromStringAndSize((char *)NULL, rsize);
	if (v == NULL)
		return NULL;

	char *buf = PyString_AsString(v);
	ssize_t nr = cl->client->Read(self->fd, buf, rsize);
	if (nr < 0) {
		Py_DECREF(v);
		PyErr_SetString(PyExc_IOError, strerror(-nr));
		return NULL;
	}
	if (nr != rsize)
		_PyString_Resize(&v, nr);
	return v;
}

static PyObject *
kfs_write(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	int wsize = -1;
	char *buf = NULL;

	if (!PyArg_ParseTuple(args, "s#", &buf, &wsize))
		return NULL;

	if (self->fd == -1) {
		PyErr_SetString(PyExc_IOError, strerror(EBADF));
		return NULL;
	}

	ssize_t nw = cl->client->Write(self->fd, buf, (ssize_t)wsize);
	if (nw < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-nw));
		return NULL;
	}
	if (nw != wsize) {
		PyObject *msg = PyString_FromFormat(
	"requested write of %d bytes but %ld were written", wsize, nw);
		return msg;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_chunkLocations(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	int off, len;

	if (!PyArg_ParseTuple(args, "i|i", &off, &len))
		return NULL;

	if (self->fd == -1) {
		PyErr_SetString(PyExc_IOError, strerror(EBADF));
		return NULL;
	}

	vector<vector <string> > results;

	int s = cl->client->GetDataLocation(self->fd, (off_t)off, len, results);
	if (s < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-s));
		return NULL;
	}
	int n = results.size();
	PyObject *outer = PyTuple_New(n);
	for (int i = 0; i < n; i++) {
		int nlocs = results[i].size();
		vector<string> locs = results[i];
		PyObject *inner = PyTuple_New(nlocs);
		for (int j = 0; j < nlocs; j++) {
			PyTuple_SetItem(inner, j, PyString_FromString(locs[j].c_str()));
		}
		PyTuple_SetItem(outer, i, inner);
	}
	return outer;
}

static PyObject *
kfs_dataVerify(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	int wsize = -1;
	char *buf = NULL;

	if (!PyArg_ParseTuple(args, "s#", &buf, &wsize))
		return NULL;

	if (self->fd == -1) {
		PyErr_SetString(PyExc_IOError, strerror(EBADF));
		return NULL;
	}

        bool res = cl->client->VerifyDataChecksums(self->fd, 0, buf, (ssize_t)wsize);
        return Py_BuildValue("b", res);
}

static PyObject *
kfs_truncate(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	int off;

	if (!PyArg_ParseTuple(args, "i", &off))
		return NULL;

	if (self->fd == -1) {
		PyErr_SetString(PyExc_IOError, strerror(EBADF));
		return NULL;
	}

	int s = cl->client->Truncate(self->fd, (off_t)off);
	if (s < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-s));
		return NULL;
	}
	Py_RETURN_NONE;
}


static PyObject *
kfs_sync(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	int s = cl->client->Sync(self->fd);
	if (s < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-s));
		return NULL;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_seek(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;
	off_t off;
	int whence = SEEK_SET;

	if (!PyArg_ParseTuple(args, "L|i", &off, &whence))
		return NULL;

	if (self->fd == -1) {
		PyErr_SetString(PyExc_IOError, strerror(EBADF));
		return NULL;
	}

	off_t s = cl->client->Seek(self->fd, (off_t)off, whence);
	if (s < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-s));
		return NULL;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_tell(PyObject *pself, PyObject *args)
{
	kfs_File *self = (kfs_File *)pself;
	kfs_Client *cl = (kfs_Client *)self->pclient;

	if (self->fd == -1) {
		PyErr_SetString(PyExc_IOError, strerror(EBADF));
		return NULL;
	}

	off_t pos = cl->client->Tell(self->fd);
	if (pos < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-pos));
		return NULL;
	}
	return Py_BuildValue("L", pos);
}

static PyMethodDef File_methods[] = {
	{ "open", kfs_reopen, METH_VARARGS, "Open a closed file." },
	{ "close", kfs_close, METH_NOARGS, "Close file." },
	{ "read", kfs_read, METH_VARARGS, "Read from file." },
	{ "write", kfs_write, METH_VARARGS, "Write to file." },
	{ "truncate", kfs_truncate, METH_VARARGS, "Truncate a file." },
	{ "chunk_locations", kfs_chunkLocations, METH_VARARGS, "Get location(s) of a chunk." },
	{ "seek", kfs_seek, METH_VARARGS, "Seek to file offset." },
	{ "tell", kfs_tell, METH_NOARGS, "Return current offset." },
	{ "sync", kfs_sync, METH_NOARGS, "Flush file data." },
        { "data_verify", kfs_dataVerify, METH_VARARGS, "Verify data matches what is in KFS."},
	{ NULL }
};

static PyMemberDef File_members[] = {
	{ "name", T_OBJECT, offsetof(kfs_File, name), RO, "file name" },
	{ "mode", T_OBJECT, offsetof(kfs_File, mode), RO, "access mode" },
	{ "fd", T_INT, offsetof(kfs_File, fd), RO, "file descriptor" },
	{ NULL }
};

PyDoc_STRVAR(File_doc,
"These objects represent KFS files.  They include a file descriptor (fd)\n"
"that identifies the file to the KFS client library for reads, writes,\n"
"and syncs.  When a file is closed, its fd becomes -1 and no further\n"
"operations can be done on it unless it is reopened with the kfs.file\n"
"open method.\n\n"
"Methods:\n"
"\topen([mode]) -- reopen closed file\n"
"\tclose()     -- close file\n"
"\tread(len)   -- read len bytes, return as string\n"
"\twrite(str)  -- write string to file\n"
"\ttruncate(off) -- truncate file at specified offset\n"
"\tseek(off)   -- seek to specified offset\n"
"\ttell()      -- return current offest\n"
"\tsync()      -- flush file data to server\n"
"\tchunk_locations(path, offset) -- location(s) of the chunk corresponding to offset\n"
"\tdata_verify(str) -- verify that the data in KFS matches what is passed in\n"
"\nData:\n\n"
"\tname        -- the name of the file\n"
"\tmode        -- access mode ('r', 'w', 'r+', or 'w+')\n"
"\tfd          -- file descriptor (-1 if closed)\n");

static PyTypeObject kfs_FileType = {
	PyObject_HEAD_INIT(NULL)
	0,				// ob_size
	"kfs.file",			// tp_name
	sizeof (kfs_File),		// tp_basicsize
	0,				// tp_itemsize
	File_dealloc,			// tp_dealloc
	File_print,			// tp_print
	0,				// tp_getattr
	0,				// tp_setattr
	0,				// tp_compare
	File_repr,			// tp_repr
	0,				// tp_as_number
	0,				// tp_as_sequence
	0,				// tp_as_mapping
	0,				// tp_hash
	0,				// tp_call
	0,				// tp_str
	0,				// tp_getattro
	0,				// tp_setattro
	0,				// tp_as_buffer
	Py_TPFLAGS_DEFAULT,		// tp_flags
	File_doc,			// tp_doc
	0,				// tp_traverse
	0,				// tp_clear
	0,				// tp_richcompare
	0,				// tp_weaklistoffest
	0,				// tp_iter
	0,				// tp_iternext
	File_methods,			// tp_methods
	File_members,			// tp_members
	0,				// tp_getset
	0,				// tp_base
	0,				// tp_dict
	0,				// tp_descr_get
	0,				// tp_descr_set
	0,				// tp_dictoffset
	File_init,			// tp_init
	0,				// tp_alloc
	File_new			// tp_new
};

static void
Client_dealloc(PyObject *pself)
{
	kfs_Client *self = (kfs_Client *)pself;
	Py_XDECREF(self->propfile);
	Py_XDECREF(self->cwd);
	self->client.reset();
	self->ob_type->tp_free(pself);
}

static PyObject *
Client_new(PyTypeObject *type, PyObject *args, PyObject *kwds)
{
	kfs_Client *self = (kfs_Client *)type->tp_alloc(type, 0);

	if (self == NULL)
		return NULL;

	PyObject *p = PyString_FromString("");
	PyObject *c = PyString_FromString("/");
	if (p == NULL || c == NULL) {
		Py_DECREF(self);
		return NULL;
	}

	self->propfile = p;
	self->cwd = c;

	return (PyObject *)self;
}

static int
Client_init(PyObject *pself, PyObject *args, PyObject *kwds)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *pf = NULL;

	if (!PyArg_ParseTuple(args, "s", &pf))
		return -1;

	KfsClientPtr client = KFS::getKfsClientFactory()->GetClient(pf);
	if (!client) {
		PyErr_SetString(PyExc_IOError, "Unable to start client.");
		return -1;
	}
	self->client = client;
	PyObject *tmp = self->propfile;
	self->propfile = PyString_FromString(pf);
	Py_XDECREF(tmp);

	return 0;
}

static PyObject *
Client_repr(PyObject *pself)
{
	kfs_Client *self = (kfs_Client *)pself;
	return PyString_FromFormat("kfs.client<%s, %s>",
			PyString_AsString(self->propfile),
			PyString_AsString(self->cwd));
}

static int
Client_print(PyObject *pself, FILE *fp, int flags)
{
	kfs_Client *self = (kfs_Client *)pself;
	fprintf(fp, "kfs.client<%s, %s>\n",
			PyString_AsString(self->propfile),
			PyString_AsString(self->cwd));
	return 0;
}

static string
strip_dots(string path)
{
	vector <string> component;
	string result;
	string::size_type start = 0;

	while (start != string::npos) {
		assert(path[start] == '/');
		string::size_type slash = path.find('/', start + 1);
		string nextc = path.substr(start, slash - start);
		start = slash;
		if (nextc.compare("/..") == 0) {
			if (!component.empty())
				component.pop_back();
		} else if (nextc.compare("/.") != 0)
			component.push_back(nextc);
	}

	if (component.empty())
		component.push_back(string("/"));

	for (vector <string>::iterator c = component.begin();
			c != component.end(); c++) {
		result += *c;
	}
	return result;
}

/*
 * Take a path name that was supplied as an argument for a KFS operation.
 * If it is not absolute, add the current directory to the front of it and
 * in either case, call strip_dots to strip out any "." and ".." components.
 */
static string
build_path(PyObject *cwd, const char *input)
{
	string tail(input);
	if (input[0] == '/')
		return strip_dots(tail);

	const char *c = PyString_AsString(cwd);
	bool is_root = (c[0] == '/' && c[1] == '\0');
	string head(c);
	if (!is_root)
		head.append("/");
	return strip_dots(head + tail);
}

static PyObject *
kfs_cd(PyObject *pself, PyObject *args)
{
	struct stat s;
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int status = self->client->Stat(path.c_str(), s);
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	if (!S_ISDIR(s.st_mode)) {
		PyErr_SetString(PyExc_IOError, strerror(ENOTDIR));
		return NULL;
	}
	PyObject *newcwd = PyString_FromString(path.c_str());
	if (newcwd != NULL) {
		Py_DECREF(self->cwd);
		self->cwd = newcwd;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_log_level(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *logLevel;

	if (PyArg_ParseTuple(args, "s", &logLevel) == -1)
		return NULL;

	self->client->SetLogLevel(logLevel);
        Py_RETURN_NONE;
}

static PyObject *
kfs_isdir(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	bool res = self->client->IsDirectory(path.c_str());
        return Py_BuildValue("b", res);
}

static PyObject *
kfs_isfile(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	bool res = self->client->IsFile(path.c_str());
        return Py_BuildValue("b", res);
}

static PyObject *
kfs_mkdir(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int status  = self->client->Mkdir(path.c_str());
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_mkdirs(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int status  = self->client->Mkdirs(path.c_str());
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_rmdir(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int status = self->client->Rmdir(path.c_str());
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_rmdirs(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int status = self->client->Rmdirs(path.c_str());
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	Py_RETURN_NONE;
}

/*!
 * \brief read directory
 *
 * Return directory contents as a tuple of names
 * XXX It should return a tuple of (name, fid) pairs, but
 * the KFS client readdir code currently only gives names
 */
static PyObject *
kfs_readdir(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	vector <string> result;
	int status = self->client->Readdir(path.c_str(), result);
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	int n = result.size();
	PyObject *tuple = PyTuple_New(n);
	for (int i = 0; i != n; i++) {
		PyTuple_SetItem(tuple, i,
				PyString_FromString(result[i].c_str()));
	}
	return tuple;
}

/*!
 * \brief Package a KfsFileAttr into a tuple
 */
static PyObject *
package_fattr(KfsFileAttr &fa)
{
	PyObject *tuple = PyTuple_New(7);
	PyTuple_SetItem(tuple, 0, PyString_FromString(fa.filename.c_str()));
	PyTuple_SetItem(tuple, 1, PyLong_FromLong(fa.fileId));
	PyTuple_SetItem(tuple, 2, PyString_FromString(ctime(&fa.mtime.tv_sec)));
	PyTuple_SetItem(tuple, 3, PyString_FromString(ctime(&fa.ctime.tv_sec)));
	PyTuple_SetItem(tuple, 4, PyString_FromString(ctime(&fa.crtime.tv_sec)));
	PyTuple_SetItem(tuple, 5, PyString_FromString(
				fa.isDirectory ? "dir" : "file"));
	PyTuple_SetItem(tuple, 6, PyLong_FromLong(fa.fileSize));

	return tuple;
}

/*!
 * \brief read directory with attributes
 *
 * Returns a tuple of tuples, each with the following data:
 *
 * (name, fid, mtime, ctime, crtime, type, size)
 */
static PyObject *
kfs_readdirplus(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);

	vector <KfsFileAttr> result;
	int status = self->client->ReaddirPlus(path.c_str(), result);
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	int n = result.size();
	PyObject *outer = PyTuple_New(n);
	for (int i = 0; i != n; i++) {
		PyObject *inner = package_fattr(result[i]);
		PyTuple_SetItem(outer, i, inner);
	}
	return outer;
}

static PyObject *
kfs_stat(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;
	struct stat s;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int status = self->client->Stat(path.c_str(), s, true);
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	/*
	 * Return the stat information in the same format as
	 * os.stat() so that we can use the standard stat module
	 * on it.
	 */
	PyObject *pstat = PyTuple_New(10);
	PyTuple_SetItem(pstat, 0, PyInt_FromLong(s.st_mode));
	PyTuple_SetItem(pstat, 1, PyLong_FromLongLong(s.st_ino));
	PyTuple_SetItem(pstat, 2, PyLong_FromLong(s.st_dev));
	PyTuple_SetItem(pstat, 3, PyInt_FromLong(s.st_nlink));
	PyTuple_SetItem(pstat, 4, PyInt_FromLong(s.st_uid));
	PyTuple_SetItem(pstat, 5, PyInt_FromLong(s.st_gid));
	PyTuple_SetItem(pstat, 6, PyLong_FromLongLong(s.st_size));
	PyTuple_SetItem(pstat, 7, PyInt_FromLong(s.st_atime));
	PyTuple_SetItem(pstat, 8, PyInt_FromLong(s.st_mtime));
	PyTuple_SetItem(pstat, 9, PyInt_FromLong(s.st_ctime));
	return pstat;
}

static PyObject *
kfs_getNumChunks(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int chunkCount = self->client->GetNumChunks(path.c_str());
	if (chunkCount < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-1));
		return NULL;
	}
        return Py_BuildValue("i", chunkCount);
}

static PyObject *
kfs_getChunkSize(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;
	string path = build_path(self->cwd, patharg);
	int chunksz = self->client->GetChunkSize(path.c_str());
        return Py_BuildValue("i", chunksz);
}

static PyObject *
kfs_create(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;
        int numReplicas = 3;

	if (PyArg_ParseTuple(args, "s|i", &patharg, &numReplicas) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int fd = self->client->Create(path.c_str(), numReplicas);
	if (fd < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-fd));
		return NULL;
	}

	kfs_File *f = (kfs_File *)kfs_FileType.tp_new(&kfs_FileType, NULL, NULL);
	if (f == NULL || set_file_members(f, path.c_str(), "w", self, fd) < 0)
		return NULL;

	return (PyObject *)f;
}

static PyObject *
kfs_remove(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg;

	if (PyArg_ParseTuple(args, "s", &patharg) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);
	int status = self->client->Remove(path.c_str());
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_rename(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *srcpath, *dstpath;
	bool overwrite = true;

	if (PyArg_ParseTuple(args, "ss|b", &srcpath, &dstpath, &overwrite) == -1)
		return NULL;

	string spath = build_path(self->cwd, srcpath);
	string dpath = build_path(self->cwd, dstpath);
	int status = self->client->Rename(spath.c_str(), dpath.c_str(), overwrite);
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
	Py_RETURN_NONE;
}

static PyObject *
kfs_coalesceblocks(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *srcpath, *dstpath;

	if (PyArg_ParseTuple(args, "ss", &srcpath, &dstpath) == -1)
		return NULL;

	string spath = build_path(self->cwd, srcpath);
	string dpath = build_path(self->cwd, dstpath);
        off_t dstStartOffset;
	off_t status = self->client->CoalesceBlocks(spath.c_str(), dpath.c_str(), &dstStartOffset);
	if (status < 0) {
		PyErr_SetString(PyExc_IOError, strerror(-status));
		return NULL;
	}
        return Py_BuildValue("l", dstStartOffset);
}

static PyObject *
kfs_open(PyObject *pself, PyObject *args)
{
	kfs_Client *self = (kfs_Client *)pself;
	char *patharg, *modestr = "r";

	if (PyArg_ParseTuple(args, "s|s", &patharg, &modestr) == -1)
		return NULL;

	string path = build_path(self->cwd, patharg);

	kfs_File *f = (kfs_File *)kfs_FileType.tp_new(&kfs_FileType, NULL, NULL);
	if (f == NULL ||
	    set_file_members(f, path.c_str(), modestr, self, -1) < 0) {
		return NULL;
	}
	return (PyObject *)f;
}

PyDoc_STRVAR(module_doc,
"This module links to the KFS client library to provide simple KFS\n"
"file services akin to those for built-in Python file objects.  To use\n"
"it, you must first create a kfs.client object.  This provides the\n"
"connection to KFS; the appropriate KFS servers (i.e., the metaserver\n"
" and chunkservers) must already be active.\n\n"
"Once you have a kfs.client, you can perform file system operations\n"
"corresponding to the KFS client library interfaces and create kfs.file\n"
"objects that represent files in KFS.\n");


PyMODINIT_FUNC
initkfs()
{
	if (PyType_Ready(&kfs_ClientType) < 0 ||
	    PyType_Ready(&kfs_FileType) < 0)
		return;

	PyObject *m = Py_InitModule3("kfs", NULL, module_doc);

	Py_INCREF(&kfs_ClientType);
	PyModule_AddObject(m, "client", (PyObject *)&kfs_ClientType);
	Py_INCREF(&kfs_FileType);
	PyModule_AddObject(m, "file", (PyObject *)&kfs_FileType);
}
