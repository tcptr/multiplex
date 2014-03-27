OUTPUT = multiplex

DMD = dmd
#OPTS = -Isrc -w -unittest -debug -version=StbImage -version=StbVorbis
OPTS = -Isrc -w -O -release -inline -version=StbImage -version=StbVorbis
DIRS = src src/thino src/mplx src/mplx/mode
SOURCES = $(wildcard $(addsuffix /*.d,$(DIRS)))
ifeq ($(OS),Windows_NT)
  CC = dmc
  EXT = .obj
  LIBS = $(wildcard lib/*.lib) -L/exet:nt/su:windows:4.0 lib/gear.res
else
  CC = gcc
  EXT = .o
  UNAME = ${shell uname}
  ifeq ($(UNAME),Darwin)
    LIBS = -L-lglfw -L-framework -LOpenGL -L-framework -LOpenAL -L-headerpad_max_install_names
  else
    LIBS = -L-lglfw -L-lGL -L-lopenal
  endif
endif

all: image$(EXT) vorbis$(EXT)
	$(DMD) -of$(OUTPUT) $(OPTS) $(SOURCES) $(LIBS) image$(EXT) vorbis$(EXT)
	mv $(OUTPUT) bin

clean:
	rm -f bin/$(OUTPUT)
	rm -rf multiplex.app
	rm -f .json.tmp
	rm -f tags
	rm -f $(OUTPUT)$(EXT) image$(EXT) vorbis$(EXT)

image$(EXT):
	$(CC) -c src/stb/image.c

vorbis$(EXT):
	$(CC) -c -w src/stb/vorbis.c

tags:
	$(DMD) -o- $(OPTS) $(SOURCES) -Xf.json.tmp
	rdmd ~/.dub/packages/d2tags-master/d2tags.d .json.tmp >tags

# depend on homebrew's glfw2
app_bundle: all
	mkdir -p multiplex.app/Contents/MacOS
	mkdir -p multiplex.app/Contents/Resources
	mkdir -p multiplex.app/Contents/Library
	cp bin/multiplex multiplex.app/Contents/MacOS/
	cp -r bin/resources multiplex.app/Contents/Resources/
	cp -r bin/shaders multiplex.app/Contents/Resources/
	cp lib/Info.plist multiplex.app/Contents/
	cp lib/gear.icns multiplex.app/Contents/Resources/
	cp /usr/local/Cellar/glfw2/2.7.9/lib/libglfw.dylib multiplex.app/Contents/Library/
	install_name_tool -change /usr/local/lib/libglfw.dylib @executable_path/../Library/libglfw.dylib multiplex.app/Contents/MacOS/multiplex

