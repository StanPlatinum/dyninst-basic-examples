
CXXFLAGS = -g -O2 -std=c++11

#please remember to install modified dyninst into the following dir
#e.g., cmake -DCMAKE_INSTALL_PREFIX=/usr/local
DYNINST_ROOT = /usr/local

DYNINST_BUILD_DIR = /path/to/your/dyninst/dyninst-build
#remember to create a dyninst-build folder
#e.g., DYNINST_BUILD_DIR = /home/dyninst4sgxminidep/dyninst-build

ELFUTIL_LIB = $(DYNINST_BUILD_DIR)/elfutils/lib

INC = -I$(DYNINST_ROOT)/include
LIB = -L$(DYNINST_ROOT)/lib -L$(ELFUTIL_LIB)
DEP = -ldyninstAPI -lparseAPI -linstructionAPI -lsymtabAPI -lelf -ldynDwarf -ldw -ldynElf -lcommon -lboost_system


basic_mem_write: basic_mem_write.c
	gcc basic_mem_write.c -o basic_mem_write

parse: parse.cpp
	g++ $(CXXFLAGS) $(INC) $(LIB) parse.cpp -o parse $(DEP)

modify: modify.cpp
	g++ $(CXXFLAGS) $(INC) $(LIB) modify.cpp -o modify $(DEP)

clean:
	rm -f basic_mem_write modify parse
