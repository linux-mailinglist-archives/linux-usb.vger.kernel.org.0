Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F48111260B
	for <lists+linux-usb@lfdr.de>; Wed,  4 Dec 2019 09:55:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727009AbfLDIze (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Dec 2019 03:55:34 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35305 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbfLDIzd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Dec 2019 03:55:33 -0500
Received: by mail-lj1-f195.google.com with SMTP id j6so7157959lja.2
        for <linux-usb@vger.kernel.org>; Wed, 04 Dec 2019 00:55:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vincit.fi; s=ticniv;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=RwUl2/f4pct9XXK55wH8l1dNkxCdO6l6uFMBlZm7tts=;
        b=A9RPR2zAZOu4h+CV1lJM5zJwNzHDSZieisoVnlvxgrX1H6FK6eL8ufIqxBn2iw4LPQ
         1qXctJeMNQ3BDg7d8H1YkVkPxYY8oORwBxo77wMlkfKRTh/D0E7ZRr7fXmcb0YZDqgmq
         9EUwxxnKukPkibi4fxTWAFVjRIEaeNcTMz4Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=RwUl2/f4pct9XXK55wH8l1dNkxCdO6l6uFMBlZm7tts=;
        b=p/7Ia+tpz4UVDtVnlNbwVDW7QXGxAF7DOHGDiCu/ughmYkrivcH0ktSHtdXuAiKCxc
         c+7EEUrH+qeT7qgoVXnAIcgBIZwscAanrDo0FAFLkP6lilczJbSs8ukFb0r0kkDlqFzm
         Q8EwFMa3ARg/oF7zK4dmlGKIiodILIK06mpaJ0dWXMswtTxMrP42/gQjlZ7KXtzBatjT
         aGwHKGJJnFjLkWGczb6tiy0EC44Sqf4tvEKAJp0F6BYt+vWl6YpAr4z3J/s4g4fbDjVP
         Cs9rSNzLHh4Or9GjW8zxW6Z0d+Rd9jZRqeu6MF8ce2fAPoTq3o4jdHTIkNBCSFCNS034
         Jysg==
X-Gm-Message-State: APjAAAWz2ABsTilln83FPnEwB+VCuzdJgdH6s9Ot69JAwa1PORLOaUha
        5nliFKNSWicT0kYr87CbDmEvvQ==
X-Google-Smtp-Source: APXvYqzTdzNGvxG0dIClPDglHLepeC4+s3DVLwLsQIE8f4Ux6gGVRVOA8cILCxQ9jrmRebdgtO4LeA==
X-Received: by 2002:a05:651c:1049:: with SMTP id x9mr1172428ljm.233.1575449730722;
        Wed, 04 Dec 2019 00:55:30 -0800 (PST)
Received: from LAPTOPJ4R3A4KE ([213.255.177.137])
        by smtp.gmail.com with ESMTPSA id p26sm2837256lfh.64.2019.12.04.00.55.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Dec 2019 00:55:29 -0800 (PST)
From:   "Erkka Talvitie" <erkka.talvitie@vincit.fi>
To:     "'Alan Stern'" <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <claus.baumgartner@med.ge.com>
References: <01d701d5a9bd$79fc5230$6df4f690$@vincit.fi> <Pine.LNX.4.44L0.1912031147050.1505-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912031147050.1505-100000@iolanthe.rowland.org>
Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is disconnected
Date:   Wed, 4 Dec 2019 10:55:28 +0200
Message-ID: <01fb01d5aa80$9403caf0$bc0b60d0$@vincit.fi>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHwohxGxigriY1LDDPcHQiqlkU+dKdzm4WA
Content-Language: fi
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thank you for the comments.

> -----Original Message-----
> From: Alan Stern <stern@rowland.harvard.edu>
> Sent: tiistai 3. joulukuuta 2019 21.01
> To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> claus.baumgartner@med.ge.com
> Subject: RE: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub is
> disconnected
>=20
> On Tue, 3 Dec 2019, Erkka Talvitie wrote:
>=20
> > Thank you for the comments.
> >
> > > -----Original Message-----
> > > From: Alan Stern <stern@rowland.harvard.edu>
> > > Sent: maanantai 2. joulukuuta 2019 21.44
> > > To: Erkka Talvitie <erkka.talvitie@vincit.fi>
> > > Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org;
> > > claus.baumgartner@med.ge.com
> > > Subject: Re: [RFCv1 1/1] USB: EHCI: Do not return -EPIPE when hub =
is
> > > disconnected
> > >
> > > On Fri, 29 Nov 2019, Erkka Talvitie wrote:
> > >
> > > > When disconnecting a USB hub that has some child device(s)
> > > > connected to it (such as a USB mouse), then the stack tries to
> > > > clear halt and reset device(s) which are _already_ physically
> disconnected.
> > >
> > > That behavior is understandable.  The kernel doesn't know that the
> > > device has been disconnected until it can process the notification
> > > from an
> > upstream
> > > hub, and it can't process that notification while it's trying to
> > > reset the
> > device.
> > >
> >
> > Ok. I was thinking that in this use case , it should not be trying =
to
> > clear the halt (and reset the device when the clear halt fails). And
> > this behavior was altered by this RFC.
>=20
> Actually, the situation is a little different from what I described =
above.  When
> you unplug the high-speed hub, the kernel doesn't know the hub has =
been
> disconnected until it receives a notification from the upstream hub.  =
The
> kernel checks for those notifications at roughly 250-ms intervals, so =
it can
> take up to that long before the kernel realizes the high-speed hub is =
gone.
> Until that time, the kernel will keep trying to reset and communicate =
with the
> hub and the devices that were attached to it.
>=20
> You can see this in the logs that you posted in your original report.
> In each case, the "cannot reset" and -71 errors lasted for less than
> 250 ms.
>=20
> I just tried doing the same experiment on my PC (which does use all =
Intel
> hardware and an EHCI controller).  Here's the output from when I =
unplugged
> the high-speed hub:
>=20
> [ 6321.245528] usb 1-1.4: clear tt 4 (00a0) error -71 [ 6321.250903] =
usb 1-1.4-
> port4: cannot reset (err =3D -71) [ 6321.255155] usb 1-1.4-port4: =
cannot reset
> (err =3D -71) [ 6321.259403] usb 1-1.4-port4: cannot reset (err =3D =
-71) [
> 6321.263657] usb 1-1.4-port4: cannot reset (err =3D -71) [ =
6321.267905] usb 1-
> 1.4-port4: cannot reset (err =3D -71) [ 6321.267910] usb 1-1.4-port4: =
Cannot
> enable. Maybe the USB cable is bad?
> [ 6321.272155] usb 1-1.4-port4: cannot disable (err =3D -71) [ =
6321.276405] usb
> 1-1.4-port4: cannot reset (err =3D -71) [ 6321.280653] usb =
1-1.4-port4: cannot
> reset (err =3D -71) [ 6321.284905] usb 1-1.4-port4: cannot reset (err =
=3D -71) [
> 6321.289155] usb 1-1.4-port4: cannot reset (err =3D -71) [ =
6321.293403] usb 1-
> 1.4-port4: cannot reset (err =3D -71) [ 6321.293407] usb 1-1.4-port4: =
Cannot
> enable. Maybe the USB cable is bad?
> [ 6321.297656] usb 1-1.4-port4: cannot disable (err =3D -71) [ =
6321.301904] usb
> 1-1.4-port4: cannot reset (err =3D -71) [ 6321.306152] usb =
1-1.4-port4: cannot
> reset (err =3D -71) [ 6321.310402] usb 1-1.4-port4: cannot reset (err =
=3D -71) [
> 6321.314653] usb 1-1.4-port4: cannot reset (err =3D -71) [ =
6321.318904] usb 1-
> 1.4-port4: cannot reset (err =3D -71) [ 6321.318908] usb 1-1.4-port4: =
Cannot
> enable. Maybe the USB cable is bad?
> [ 6321.323154] usb 1-1.4-port4: cannot disable (err =3D -71) [ =
6321.327404] usb
> 1-1.4-port4: cannot reset (err =3D -71) [ 6321.331651] usb =
1-1.4-port4: cannot
> reset (err =3D -71) [ 6321.335902] usb 1-1.4-port4: cannot reset (err =
=3D -71) [
> 6321.340155] usb 1-1.4-port4: cannot reset (err =3D -71) [ =
6321.344402] usb 1-
> 1.4-port4: cannot reset (err =3D -71) [ 6321.344406] usb 1-1.4-port4: =
Cannot
> enable. Maybe the USB cable is bad?
> [ 6321.348652] usb 1-1.4-port4: cannot disable (err =3D -71) [ =
6321.352904] usb
> 1-1.4-port4: cannot disable (err =3D -71) [ 6321.357154] hub =
1-1.4:1.0:
> hub_ext_port_status failed (err =3D -71) [ 6321.437000] usb 1-1.4: USB
> disconnect, device number 9 [ 6321.437010] usb 1-1.4.4: USB =
disconnect,
> device number 10
>=20
> As you can see, the time interval runs from 6321.245 to 6321.437, =
roughly 192
> ms < 250 ms.  This is the expected behavior.
>=20
> I did not try to check whether the MMF bit got set or what value CERR =
had.
>=20

Ok, makes sense. Thank you for testing this with your setup.
=20
>=20
> > But as in this use case the CERR has not been decreased yet there is =
error
> > bit active (MMF) do you see it is still correct to interpret it as a =
stall
> > (even when the halt bit is set)?
>=20
> See below.
>=20
> > I have tried to find out more details about our EHCI controller =
version, but
> > I have only found out those CPU versions. It might help in a search =
whether
> > this could be a HW issue.
>=20
>=20
> > > > The specification [2] is not clear about error priorities, but =
since
> > > > there is no explicit error bit for the stall, it is assumed to =
be
> > > > lower priority than other errors.
> > >
> > > On the contrary, the specification is very clear.  Since =
transaction
> > errors cause
> > > CERR to be decremented until it reaches 0, a nonzero value for =
CERR
> means
> > > the endpoint was halted for some other reason.  And the only other
> reason
> > > is a stall.  (Or end of the microframe, but there's no way to tell =
if that
> > > happened.)
> >
> > I see your point. EHCI specification states that babble is a serious =
error
> > and it will also cause the halt. The babble error bit is checked =
first. But
> > the specification does not say about order of the other errors or =
about
> what
> > to do if there is an error, no retries executed, yet a halt (stall). =
For
> > example should the XactErr be checked before the MMF.
>=20
> I think the order doesn't matter.  In fact, it's possible that both
> errors occurred, since the transaction gets retried multiple times.
=20
True as the error bits are "sticky".

For example XactErr in EHCI specification [2] table 3-16:
" If the host controller sets this bit to a one, then it remains a one =
for the duration of the transfer."

>=20
> > >(Or end of the microframe, but there's no way to tell if that =
happened.)
> >
> > I was not able to locate this from the specification. Could you =
please point
> > out where this statement is from?
>=20
> "Enhanced Host Controller Interface Specification for Universal Serial
> Bus", rev 1.0 (2002), p. 110:
>=20
> Transaction Error (XactErr). Timeout, data CRC failure, etc. The CErr
> field is decremented and the XactErr bit in the Status field is set to
> a one. The complete split transaction is immediately retried (if Cerr
> is non-zero). If there is not enough time in the micro-frame to
> complete the retry and the endpoint is an IN, or CErr is decremented =
to
> a zero from a one, the queue is halted. If there is not enough time in
> the micro-frame to complete the retry and the endpoint is an OUT and
> CErr is not zero, then this state is exited (i.e. return to Do Start
> Split). This results in a retry of the entire OUT split transaction, =
at
> the next poll period. Refer to Chapter 11 Hubs (specifically the
> section full- and low-speed Interrupts) in the USB Specification
> Revision 2.0 for detailed requirements on why these errors must be
> immediately retried. =E2=80=A2
>=20

There it is, thank you.

> > Could the way to tell if "end of microframe" happened, be what is =
done
> here
> > - check for MMF error bit and if CERR has not been decreased?
>=20
> No, because the "end of microframe" situation happens when the host
> controller is handling a transaction error, whereas MMF gets set when
> the host controller detects an error on the host.

Ok, I see.
=20
>=20
> > > > diff --git a/drivers/usb/host/ehci-q.c =
b/drivers/usb/host/ehci-q.c
> > > > index 3276304..da7fd12 100644
> > > > --- a/drivers/usb/host/ehci-q.c
> > > > +++ b/drivers/usb/host/ehci-q.c
> > > > @@ -206,8 +206,9 @@ static int qtd_copy_status (
> > > >  		if (token & QTD_STS_BABBLE) {
> > > >  			/* FIXME "must" disable babbling
> > > device's port too */
> > > >  			status =3D -EOVERFLOW;
> > > > -		/* CERR nonzero + halt --> stall */
> > > > -		} else if (QTD_CERR(token)) {
> > > > +		/* CERR nonzero and less than
> > > EHCI_TUNE_CERR + halt --> stall.
> > > > +		   This handles situation where stall comes after
> > > an error. */
> > >
> > > This comment doesn't make sense.  Who cares whether a stall comes
> after
> > > an error or not?  It's still a stall and should be reported.
> >
> > This was basically a comment trying to answer to this commit:
> > ba516de332c0  USB: EHCI: check for STALL before other errors
> >
> >     "The existing code doesn't do this properly, because it tests =
for MMF
> >     (Missed MicroFrame) and DBE (Data Buffer Error) before testing =
the
> >     retry counter.  Thus, if a transaction gets either MMF or DBE =
the
> >     corresponding flag is set and the transaction is retried.  If =
the
> >     second attempt receives a STALL then -EPIPE is the correct =
return
> >     value.  But the existing code would see the MMF or DBE flag =
instead
> >     and return -EPROTO, -ENOSR, or -ECOMM."
> >
> > The comment tries to explain that it will not revert the fix made in =
the
> > commit ba516de332c0.
>=20
> Okay, I get it.  You're trying to rely on the strange behavior of the
> MMF bit.
>=20
> I'm not sure this is a good idea.  Suppose MMF gets set for some other
> reason (a genuine error on the host) and then the transaction gets a
> STALL on the next retry.  Since host errors don't decrement CERR, your
> patch would cause the driver to return -EPROTO instead of -EPIPE.

Hmm. I originally understood from the documentation that the MMF does =
decrement the CERR. I followed the EHCI specification table 3-16, the =
row about the CERR.
There are listed the errors that do decrement the CERR and which do not =
decrement. Data buffer error, stall, babble and no error (of course) do =
not decrement.
Transaction errors do decrement the CERR. As there was no mention about =
MMF I have been in the impression that it is included to the transaction =
errors of the table.

Now I was able to find from the documentation you pointed out (in your =
next comment below)  that your statement is correct. EHCI specification, =
table 4-13 contains Interrupt IN / OUT
conditions which prove your point.

>=20
> > > > +		} else if (QTD_CERR(token) &&
> > > QTD_CERR(token) < EHCI_TUNE_CERR) {
> > > >  			status =3D -EPIPE;
> > >
> > > If an error occurs and the transaction is retried and the retry =
gets a
> > stall, then
> > > the final status should be -EPIPE, not something else.
> >
> > This is how the RFC also works. If the transaction has been retried =
and gets
> > stall then -EPIPE is returned.
> > Or if there are no errors but there is a stall then -EPIPE is =
returned.
> >
> > The only difference in this patch in comparison to the existing
> > implementation is that if there is an error but the
> > transaction has not been retried it is not interpret as a stall even =
if
> > there is a halt.
>=20
> Sometimes that will be the right behavior and other times it won't.
> However, it looks like there may be a way to tell which situation we
> are in.  Setting the MMF bit will cause the queue to halt immediately
> if the transaction is IN, but not if it is OUT (see Table 4-13 in the
> EHCI spec).

Thank you, this Table 4-13 was a vital piece of documentation that I =
either missed or failed  to read carefully enough.
Now this could explain why the queue is halted with MMF set, even if it =
would not be a stall. Well done!
=20
>=20
> So if CERR =3D=3D EHCI_TUNE_CERR and the QTD_PID !=3D 1 (not IN) then =
we
> should return -EPIPE, as the existing code does.  But if QTD_PID =
=3D=3D 1
> then the code should continue, as your patch does -- with one
> difference: Put the additional check for EHCI_TUNE_CERR between the
> tests for DBE and XACT instead of after XACT (because XACT would
> decrement CERR whereas DBE wouldn't).

Good point, I agree.
=20
>=20
> Can you make that change and test it?

Sure, I have made the change and test it as soon as possible.

>=20
> Alan Stern

Erkka Talvitie


