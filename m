Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AD721104AD
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 20:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbfLCTBM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 14:01:12 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:46858 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726057AbfLCTBM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 14:01:12 -0500
Received: (qmail 5328 invoked by uid 2102); 3 Dec 2019 14:01:10 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Dec 2019 14:01:10 -0500
Date:   Tue, 3 Dec 2019 14:01:10 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Erkka Talvitie <erkka.talvitie@vincit.fi>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
In-Reply-To: <01d701d5a9bd$79fc5230$6df4f690$@vincit.fi>
Message-ID: <Pine.LNX.4.44L0.1912031147050.1505-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 3 Dec 2019, Erkka Talvitie wrote:

> Thank you for the comments.
> 
> > -----Original Message-----
> > From: Alan Stern <stern@rowland.harvard.edu>
> > Sent: maanantai 2. joulukuuta 2019 21.44
> > To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> > claus.baumgartner@med.ge.com
> > Subject: Re: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> > disconnected
> > 
> > On Fri, 29 Nov 2019, Erkka Talvitie wrote:
> > 
> > > When disconnecting a USB hub that has some child device(s) connected
> > > to it (such as a USB mouse), then the stack tries to clear halt and
> > > reset device(s) which are _already_ physically disconnected.
> > 
> > That behavior is understandable.  The kernel doesn't know that the device
> > has been disconnected until it can process the notification from an
> upstream
> > hub, and it can't process that notification while it's trying to reset the
> device.
> > 
> 
> Ok. I was thinking that in this use case , it should not be trying to clear
> the halt (and reset the device when the clear halt fails). And this behavior
> was altered by this RFC.

Actually, the situation is a little different from what I described
above.  When you unplug the high-speed hub, the kernel doesn't know the
hub has been disconnected until it receives a notification from the
upstream hub.  The kernel checks for those notifications at roughly
250-ms intervals, so it can take up to that long before the kernel
realizes the high-speed hub is gone.  Until that time, the kernel will
keep trying to reset and communicate with the hub and the devices that
were attached to it.

You can see this in the logs that you posted in your original report.  
In each case, the "cannot reset" and -71 errors lasted for less than 
250 ms.

I just tried doing the same experiment on my PC (which does use all 
Intel hardware and an EHCI controller).  Here's the output from when I 
unplugged the high-speed hub:

[ 6321.245528] usb 1-1.4: clear tt 4 (00a0) error -71
[ 6321.250903] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.255155] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.259403] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.263657] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.267905] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.267910] usb 1-1.4-port4: Cannot enable. Maybe the USB cable is bad?
[ 6321.272155] usb 1-1.4-port4: cannot disable (err = -71)
[ 6321.276405] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.280653] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.284905] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.289155] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.293403] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.293407] usb 1-1.4-port4: Cannot enable. Maybe the USB cable is bad?
[ 6321.297656] usb 1-1.4-port4: cannot disable (err = -71)
[ 6321.301904] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.306152] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.310402] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.314653] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.318904] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.318908] usb 1-1.4-port4: Cannot enable. Maybe the USB cable is bad?
[ 6321.323154] usb 1-1.4-port4: cannot disable (err = -71)
[ 6321.327404] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.331651] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.335902] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.340155] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.344402] usb 1-1.4-port4: cannot reset (err = -71)
[ 6321.344406] usb 1-1.4-port4: Cannot enable. Maybe the USB cable is bad?
[ 6321.348652] usb 1-1.4-port4: cannot disable (err = -71)
[ 6321.352904] usb 1-1.4-port4: cannot disable (err = -71)
[ 6321.357154] hub 1-1.4:1.0: hub_ext_port_status failed (err = -71)
[ 6321.437000] usb 1-1.4: USB disconnect, device number 9
[ 6321.437010] usb 1-1.4.4: USB disconnect, device number 10

As you can see, the time interval runs from 6321.245 to 6321.437, 
roughly 192 ms < 250 ms.  This is the expected behavior.

I did not try to check whether the MMF bit got set or what value CERR 
had.


> But as in this use case the CERR has not been decreased yet there is error
> bit active (MMF) do you see it is still correct to interpret it as a stall
> (even when the halt bit is set)?

See below.

> I have tried to find out more details about our EHCI controller version, but
> I have only found out those CPU versions. It might help in a search whether
> this could be a HW issue.


> > > The specification [2] is not clear about error priorities, but since
> > > there is no explicit error bit for the stall, it is assumed to be
> > > lower priority than other errors.
> > 
> > On the contrary, the specification is very clear.  Since transaction
> errors cause
> > CERR to be decremented until it reaches 0, a nonzero value for CERR means
> > the endpoint was halted for some other reason.  And the only other reason
> > is a stall.  (Or end of the microframe, but there's no way to tell if that
> > happened.)
>  
> I see your point. EHCI specification states that babble is a serious error
> and it will also cause the halt. The babble error bit is checked first. But
> the specification does not say about order of the other errors or about what
> to do if there is an error, no retries executed, yet a halt (stall). For
> example should the XactErr be checked before the MMF.

I think the order doesn't matter.  In fact, it's possible that both 
errors occurred, since the transaction gets retried multiple times.

> >(Or end of the microframe, but there's no way to tell if that happened.)
> 
> I was not able to locate this from the specification. Could you please point
> out where this statement is from?

"Enhanced Host Controller Interface Specification for Universal Serial 
Bus", rev 1.0 (2002), p. 110:

Transaction Error (XactErr). Timeout, data CRC failure, etc. The CErr
field is decremented and the XactErr bit in the Status field is set to
a one. The complete split transaction is immediately retried (if Cerr
is non-zero). If there is not enough time in the micro-frame to
complete the retry and the endpoint is an IN, or CErr is decremented to
a zero from a one, the queue is halted. If there is not enough time in
the micro-frame to complete the retry and the endpoint is an OUT and
CErr is not zero, then this state is exited (i.e. return to Do Start
Split). This results in a retry of the entire OUT split transaction, at
the next poll period. Refer to Chapter 11 Hubs (specifically the
section full- and low-speed Interrupts) in the USB Specification
Revision 2.0 for detailed requirements on why these errors must be
immediately retried. •

> Could the way to tell if "end of microframe" happened, be what is done here
> - check for MMF error bit and if CERR has not been decreased?

No, because the "end of microframe" situation happens when the host 
controller is handling a transaction error, whereas MMF gets set when 
the host controller detects an error on the host.

> > > diff --git a/drivers/usb/host/ehci-q.c b/drivers/usb/host/ehci-q.c
> > > index 3276304..da7fd12 100644
> > > --- a/drivers/usb/host/ehci-q.c
> > > +++ b/drivers/usb/host/ehci-q.c
> > > @@ -206,8 +206,9 @@ static int qtd_copy_status (
> > >  		if (token & QTD_STS_BABBLE) {
> > >  			/* FIXME "must" disable babbling
> > device's port too */
> > >  			status = -EOVERFLOW;
> > > -		/* CERR nonzero + halt --> stall */
> > > -		} else if (QTD_CERR(token)) {
> > > +		/* CERR nonzero and less than
> > EHCI_TUNE_CERR + halt --> stall.
> > > +		   This handles situation where stall comes after
> > an error. */
> > 
> > This comment doesn't make sense.  Who cares whether a stall comes after
> > an error or not?  It's still a stall and should be reported.
> 
> This was basically a comment trying to answer to this commit:
> ba516de332c0  USB: EHCI: check for STALL before other errors
> 
>     "The existing code doesn't do this properly, because it tests for MMF
>     (Missed MicroFrame) and DBE (Data Buffer Error) before testing the
>     retry counter.  Thus, if a transaction gets either MMF or DBE the
>     corresponding flag is set and the transaction is retried.  If the
>     second attempt receives a STALL then -EPIPE is the correct return
>     value.  But the existing code would see the MMF or DBE flag instead
>     and return -EPROTO, -ENOSR, or -ECOMM."
> 
> The comment tries to explain that it will not revert the fix made in the
> commit ba516de332c0.

Okay, I get it.  You're trying to rely on the strange behavior of the 
MMF bit.

I'm not sure this is a good idea.  Suppose MMF gets set for some other 
reason (a genuine error on the host) and then the transaction gets a 
STALL on the next retry.  Since host errors don't decrement CERR, your 
patch would cause the driver to return -EPROTO instead of -EPIPE.

> > > +		} else if (QTD_CERR(token) &&
> > QTD_CERR(token) < EHCI_TUNE_CERR) {
> > >  			status = -EPIPE;
> > 
> > If an error occurs and the transaction is retried and the retry gets a
> stall, then
> > the final status should be -EPIPE, not something else.
> 
> This is how the RFC also works. If the transaction has been retried and gets
> stall then -EPIPE is returned.
> Or if there are no errors but there is a stall then -EPIPE is returned.
> 
> The only difference in this patch in comparison to the existing
> implementation is that if there is an error but the 
> transaction has not been retried it is not interpret as a stall even if
> there is a halt.

Sometimes that will be the right behavior and other times it won't.  
However, it looks like there may be a way to tell which situation we
are in.  Setting the MMF bit will cause the queue to halt immediately
if the transaction is IN, but not if it is OUT (see Table 4-13 in the 
EHCI spec).

So if CERR == EHCI_TUNE_CERR and the QTD_PID != 1 (not IN) then we
should return -EPIPE, as the existing code does.  But if QTD_PID == 1
then the code should continue, as your patch does -- with one
difference: Put the additional check for EHCI_TUNE_CERR between the
tests for DBE and XACT instead of after XACT (because XACT would
decrement CERR whereas DBE wouldn't).

Can you make that change and test it?

Alan Stern

