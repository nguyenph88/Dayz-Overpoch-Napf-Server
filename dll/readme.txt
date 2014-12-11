Please refer to http://community.bistudio.com/wiki/ArmA_2:_Custom_Memory_Allocator for most recent information about the memory allocators and dll folder in Arma 2.

Since Arma 2 Operation Arrowhead build 85869  it is possible to provide custom memory allocators for the game.  The memory allocator is a very important component, which significantly affects both performance an stability of the game. 
The purpose of this customization is to allow the allocator to be developed independently on the application,  allowing both Bohemia Interactive and community to fix bugs and improve performance without having to modify the core game files.


Default
=====

Default allocator used atm by engine is based on Intel TBB 3 (see details about  tbb3malloc_bi below)

Specifying a custom allocator
==================

The allocator is a dll placed in a directory named "dll" located next to the game executable. Allocator search order is:

* tbb3malloc_bi - based on http://threadingbuildingblocks.org/ver.php?fid=171 Intel TBB 3], distributed under http://www.gnu.org/licenses/gpl-2.0.html GPL v2  + http://gcc.gnu.org/onlinedocs/libstdc++/manual/bk01pt01ch01s02.html RE([ftp://downloads.bistudio.com/arma2.com/update/Allocs/TBB3_source.7z source code]), based on [http://threadingbuildingblocks.org/ver.php?fid=171 tbb30_20110427oss]

* tbb4malloc_bi - based on [http://threadingbuildingblocks.org/ver.php?fid=176 Intel TBB 4], distributed under [http://www.gnu.org/licenses/gpl-2.0.html GPL v2] + [http://gcc.gnu.org/onlinedocs/libstdc++/manual/bk01pt01ch01s02.html RE] ([ftp://downloads.bistudio.com/arma2.com/update/Allocs/TBB4_source.7z source code]) based on [http://threadingbuildingblocks.org/ver.php?fid=176 tbb40_258oss]
* jemalloc_bi - based on [http://www.canonware.com/download/jemalloc/ JEMalloc], distributed under [http://www.canonware.com/jemalloc/license.html BSD-derived license] ([ftp://downloads.bistudio.com/arma2.com/update/Allocs/JEMalloc_source.7z source code])

* tcmalloc_bi - based on [http://code.google.com/p/google-perftools/ TCMalloc], distributed under [http://www.opensource.org/licenses/bsd-license.php New BSD license] ([ftp://downloads.bistudio.com/arma2.com/update/Allocs/TCMalloc_source.7z source code]) based on [http://google-perftools.googlecode.com/svn/trunk/src/ revision 100]

* nedmalloc_bi - based on [http://www.nedprod.com/programs/portable/nedmalloc/ NedMalloc], distributed under [http://www.boost.org/users/license.html Boost Software License] ([ftp://downloads.bistudio.com/arma2.com/update/Allocs/NedMalloc_source.7z source code])

* customMalloc_bi - not provided, feel free to plug-in your own

If no allocator dll is found, functions _aligned_malloc/ _aligned_free (using Windows Heap functions) are used as a fallback. Important note: Windows 7 allocator seems to be quite good, and it may therefore make sense for some users to delete all custom allocators on Windows 7 or newer).>

You can select an allocator by deleting other allocators from the dll folder or via Command line.

===Commandline parameter===

You can specify a particular allocator from a command line, like: 
* -malloc=tbb3malloc_bi
*<b>-malloc=tbb4malloc_bi</b>  <br>
or <br>
*<b>-malloc=mybestmalloc_bi</b> <br> 
<i>(dll directory and extension are appended automatically, the allocator must not be located in other directory and its name must not contain any dots before the .dll extension)</i>

===Dedicated server===

You can specify allocator for Windows dedicated server the same way as for client binary, but expected performance gain is minimal, because of low concurrency of the dedicated server code compared to a client.

Linux server uses allocator provided by operating system. <i>There are NO plans to allow its customization</i>.

==DLL Interface==

The dll interface is as follows:

<syntaxhighlight lang="cpp">extern "C" {
  __declspec(dllexport) size_t __stdcall MemTotalCommitted();         // _MemTotalCommitted@0
  __declspec(dllexport) size_t __stdcall MemTotalReserved();          // _MemTotalReserved@0
  __declspec(dllexport) size_t __stdcall MemFlushCache(size_t size);  // _MemFlushCache@4
  __declspec(dllexport) void __stdcall MemFlushCacheAll();            // _MemFlushCacheAll@0
  __declspec(dllexport) size_t __stdcall MemSize(void *mem);          // _MemSize@4
  __declspec(dllexport) void *__stdcall MemAlloc(size_t size);        // _MemAlloc@4
  __declspec(dllexport) void __stdcall MemFree(void *mem);            // _MemFree@4
};
</syntaxhighlight>

Note: besides of the interface above, if the allocator is performing any per-thread caching, it will typically want to perform a cleanup of per-thread data on DLL_THREAD_DETACH event sent to [http://msdn.microsoft.com/en-us/library/windows/desktop/ms682583(v=vs.85).aspx DllMain function].

===  MemTotalCommitted() ===
Total memory committed by the allocator (should correspond to VirtualAlloc with MEM_COMMIT)

===  MemTotalReserved() ===
Total memory reserved by the allocator (should correspond to VirtualAlloc with MEM_RESERVE)

===  MemFlushCache(size_t size) ===
Try to flush at least "size" bytes of memory from caches and working areas, return how much memory was flushed. Called by game when memory needs to be trimmed to reduce virtual memory use.

===  MemFlushCacheAll() ===
Flush all memory held in caches and working areas. Called by game when memory needs to be trimmed to reduce virtual memory use.

===  MemSize(void *mem) ===
Return allocated size of given memory block.

===  MemAlloc(size_t size) ===
Allocate at least size bytes of memory, return the allocated memory. If the size is 16 B or more, the memory must be 16 B -aligned, so that it is usable to hold SSE data.

===  MemFree(void *mem) ===
Free given memory block.