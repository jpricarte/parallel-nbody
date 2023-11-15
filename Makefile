NAME	=	nbody
CC		=	gcc
CXX		=	gcpc
LD		=	gcc
DEBUG		+=
CFLAGS		+=	-O3  $(DEBUG)
CXXFLAGS	+=	$(CFLAGS)
LDFLAGS		+=	-lm -fopenmp

EXE		=	$(NAME)
CFILES		=	$(wildcard *.c)
CXXFILES	=	$(wildcard *.cpp)
OBJECTS		=	$(CFILES:.c=.o) $(CXXFILES:.cpp=.o)

all : $(EXE)
	@echo "Building..."

$(EXE) : $(OBJECTS)
	$(LD) $^ $(CFLAGS) $(LDFLAGS) -o $@

%.o : %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o : %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean :	
	rm -fr $(EXE) $(OBJECTS) 
