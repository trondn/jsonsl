RPATH=\$$ORIGIN/$(ORIGINREL)/$(LIBDIR)
all: $(BINDIR)/json_test $(LIBDIR)/libjsonsl.so

$(BINDIR) $(LIBDIR) $(OBJDIR):; -@mkdir -p $@

$(BINDIR)/json_test: $(BINDIR) $(OBJDIR) $(OBJDIR)/json_test.o $(LIBDIR)/libjsonsl.so
	$(LINK.c) -R$(RPATH) -o $@ $(OBJDIR)/json_test.o -L$(LIBDIR) -ljsonsl

share: json_samples.tgz
	gzcat $^ | tar xf -

check: $(BINDIR)/json_test share
	JSONSL_QUIET_TESTS=1 ./$(BINDIR)/json_test share/*

$(LIBDIR)/libjsonsl.so: $(LIBDIR) $(OBJDIR)/jsonsl.o
	$(LINK.c) -G -KPIC -R$(RPATH) -o $@ $(OBJDIR)/jsonsl.o

$(OBJDIR)/json_test.o: $(OBJDIR) json_test.c
	$(COMPILE.c) -o $@ json_test.c

$(OBJDIR)/jsonsl.o: $(OBJDIR) jsonsl.c jsonsl.h
	$(COMPILE.c) -KPIC -o $@ jsonsl.c

clean:
	$(RM) -r $(OBJDIR) $(LIBDIR) $(BINDIR) share
