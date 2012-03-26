all check clean:
	@$(MAKE) -f build/SunOS/Makefile.mk \
                             CFLAGS="-DJSONSL_STATE_GENERIC -m32" \
                             LDFLAGS="-m32" ORIGINREL=".." \
                             LIBDIR=lib BINDIR=bin OBJDIR=obj/32 \
                             CC=c89 $@
	@$(MAKE) -f build/SunOS/Makefile.mk \
                             CFLAGS="-DJSONSL_STATE_GENERIC -m64" \
                             LDFLAGS="-m64" ORIGINREL="../.." \
                             LIBDIR=lib/`isainfo -n` \
                             BINDIR=bin/`isainfo -n` \
                             OBJDIR=obj/`isainfo -n` \
                             CC=c89 $@
