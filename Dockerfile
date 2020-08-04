FROM darribas/gds:5.0
ADD ./Makefile ./
RUN make shelf
