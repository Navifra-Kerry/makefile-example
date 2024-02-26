TARGET = app

SRCS  = $(shell find ./src     -type f -name *.cpp)
HEADS = $(shell find ./include -type f -name *.h)
OBJS = $(SRCS:.cpp=.o)
DEPS = Makefile.depend

INCLUDES = -I./include
CXXFLAGS = -O2 -Wall $(INCLUDES)
CXXFLAGS_DEBUG = -g -O0 -Wall $(INCLUDES)  # -g 플래그를 추가하여 디버깅 정보 포함
LDFLAGS = -lm


all: $(TARGET)

debug: CXXFLAGS = $(CXXFLAGS_DEBUG)
debug: all

$(TARGET): $(OBJS) $(HEADS)
	$(CXX) $(LDFLAGS) -o $@ $(OBJS)

run: all
	@./$(TARGET)

.PHONY: depend clean
depend:
	$(CXX) $(INCLUDES) -MM $(SRCS) > $(DEPS)
	@sed -i -E "s/^(.+?).o: ([^ ]+?)\1/\2\1.o: \2\1/g" $(DEPS)

clean:
	$(RM) $(OBJS) $(TARGET)

-include $(DEPS)
