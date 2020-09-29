Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE0927D712
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 21:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgI2Tkv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 15:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbgI2Tkt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 15:40:49 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E425C061755
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 12:40:49 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id y190so3679954vsy.1
        for <linux-usb@vger.kernel.org>; Tue, 29 Sep 2020 12:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=FzLEqXog8Nbr++Tdf5+kgNx8GLcsDf99Bq+9g8RIYPk=;
        b=lfShqv6/+HQautrZpRqsOZnhuDFoi7q1qCMeNZqNiysL88Xq5IK99km77GoWJEghOz
         iKXX6rls/kWIhgUeup7SUCbW08qmg41/gckNv0r5kvUH0y3UsIXRXyblmj1BGkbz9d+J
         8ABKg/irvhvb3XeN7T2Y34eEeBQmGOZw+GrGE4GpPfuwSRn4GBfgvthdATzSFm5AHCAB
         u6vFyfHsgjmnPZrIwtnLM6plPak2NbYVaVOcZOa5YWrgYYOhjUBzEMJYyc8SLaun0UJ0
         VsrPFRWN836SPoF3yl4MvxuJZZ1iPjqsS/NzdU4VBhrrV1nJXTL4XbNAVHFdjTKah8Fh
         9COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=FzLEqXog8Nbr++Tdf5+kgNx8GLcsDf99Bq+9g8RIYPk=;
        b=VJ/Qxvxpv/LXiy3ef+Io1dmeXEJNEFI3zM5pZlNt1AdGyNN/DmoHAE93ICjUj6Jc2A
         GwQ+fAtU9AAHn/sYxUI2A9mlpmoLsDRYQZSEhaAxSa/sLwrDi61dXOFB6IaeWHA2TX6V
         wP4jwstISFUOduMo85LJ0ujIsuJ9fbjWPlLRlHn0FAJH6KezIr5WXXKVIJdSbQsrsojB
         11QlChiLNgAYCuQVYDzOwza0oGanB4fMc5G+uVIutB49LIUt/mNeoAQlosLOcIoFo/Zh
         CdEkszfzETESSQRw/WDB+cnSx74ZOwYcvwcf/cZ5bN0OFkZNm2M9zmAQIKb9JlDgQlO1
         T2Ig==
X-Gm-Message-State: AOAM5331/g4+QU24hOYXunTqd7+XJWVbA+tlm88aEsu8t2P+gFQpfm+d
        Ype7ih87sXqjK3vHEiri9c8v6+IOZiE2yrAdt6M=
X-Google-Smtp-Source: ABdhPJwjaRH4VmkcuJKaH0gWQ2jH0sXyGUNDdsBEE+PBj0DoRIWASdigS87jOd5PFcv5kSVLxYEOEiSSXUi1wCq+HtQ=
X-Received: by 2002:a67:fe8f:: with SMTP id b15mr4293054vsr.46.1601408448450;
 Tue, 29 Sep 2020 12:40:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:22c4:0:0:0:0:0 with HTTP; Tue, 29 Sep 2020 12:40:47
 -0700 (PDT)
In-Reply-To: <20200929101330.GQ24441@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org> <20200929101330.GQ24441@localhost>
From:   Mychaela Falconia <mychaela.falconia@gmail.com>
Date:   Tue, 29 Sep 2020 11:40:47 -0800
Message-ID: <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio quirks
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

> Thanks for the well-argued series. I've applied the first one now after
> dropping the PID for the dual-port device, which isn't used until the
> last patch.

Thank you for applying the JTAG patch: having that one mainlined means
that users of these JTAG+UART adapters will get the UART channel
working "out of the box", and there is now an unambiguous place in
ftdi_sio_ids.h and in the USB ID table for where DUART28C will need to
be added.

> Did you try inverting the signals so that they can be used on any serial
> port to power on and release reset on open, and then just clear HUPCL if
> you want the connected device to remain powered after the port is closed?

The first problem with asking for a hardware design change is that the
hardware has already been physically built - here are some photos:

https://www.freecalypso.org/members/falcon/pictures/duart28/

I got 20 fully assembled boards plus 20 more unpopulated PCBs, and
asking our community to throw this hardware out is a non-starter.

Also the idea of "so that they can be used on any serial port" is
meaningless in the context of this application: there is no "any
serial port", instead there exists a custom piece of hardware
(depicted above) that contains an FT2232D chip as one of its
components.  FTDI chips are powerful multifunction beasts, they are a
lot more than just serial ports, and on this particular board the I/O
channels coming out of the FT2232D chip are used in a mixed manner:
ADBUS0 through ADBUS7 form UART channel 0, BDBUS0 and BDBUS1 (data
leads only) form UART channel 1 (no flow control or modem control),
and BDBUS2 and BDBUS4 (which would otherwise be Channel B RTS & DTR)
are used essentially as GPIOs that have nothing to do with either of
the two serial ports.

Aside from already built hardware, inverting the sense of the signals
running between FT2232D and the open drain buffer (replacing the non-
inverting 74LVC2G07 buffer with an inverting one) would not work: in
that case both control signals would be immediately asserted as soon
as the USB cable is connected between the adapter board and the host
computer, resulting in the connected Calypso target being held down
both in reset and in the PWON pulse - bad.

I also realize that I may have been a little unclear in my original
explanation as to what the hardware signals really do.  FT2232D BDBUS2
and BDBUS4 outputs are conventionally defined to be RTS and DTR,
respectively, but their CMOS logic levels are the opposite of RS-232:
RS-232 DTR & RTS asserted means CMOS low on BDBUS[24], and RS-232 DTR
& RTS negated means CMOS high on BDBUS[24].  Both signals are CMOS
high initially on USB power application, and with my patch they become
CMOS low only as a result of an explicit TIOCMBIS ioctl setting DTR or
RTS.  These signals go to a Nexperia 74LVC2G07 non-inverting open
drain buffer IC (tiny U7 chip visible in the photos linked above), and
the open drain outputs are wired to J5 header pins that are labeled
CTL1 and CTL2 on the PCB silk screen - so they are not really DTR and
RTS at all as far as this custom hw is concerned, instead they are
special open drain pulse outputs.

CTL1 will be connected to PWON and CTL2 will be connected to RESET on
the Calypso target board.  The pulse nature of these two open drain
outputs is crucial: PWON is not a power on/off control where one
steady state means on and the other steady state means off, instead it
is a pulse control.  Virtually every handheld battery-powered device
has a "soft power" button that is physically wired between the power
management chip's dedicated PWON pin and ground, and Calypso is no
different: the pulse put out on CTL1 by the DUART28C adapter (produced
by userspace doing TIOCMBIS, delay, TIOCMBIC) simulates the action of
a user pressing the red power button on her dumbphone.  RESET works
the same way: having the target held down in reset long-term is bad,
instead whenever a reset pulse is needed, we do a TIOCMBIS, delay,
TIOCMBIC sequence.

In short, I will not change our hardware design, and I will continue
running with my patch whether it is mainlined or not.

> As you probably expected, I'm a bit reluctant to adding quirks like this
> (e.g. as it makes the code harder to read and maintain):

Right now I am instructing my user community to apply the needed patch
locally.  I am making my best-faith attempt to get this patch mainlined
as a matter of due diligence - had I not even bothered to try, my users
would be bound to ask "why don't you get this patch mainlined".  If
our patch is rejected, I will document this rejection in the user
documentation for the hardware product, with links to the relevant
messages in the linux-usb mailing list archive, so that my users will
know that I have honestly tried and that I am not the one to blame -
it is all I can do.

I am going to prepare a second version of this patch series (down to
just two patches now) with the changes you have requested for 2/3 and
3/3.

Oh, and a couple of comments from 3/3 that are worth addressing:

> If we are to add this, then you shouldn't allow for automatic deassert
> either.

Because of the pulse nature of CTL1 and CTL2 outputs, automatic
deassertion (in case a userspace program exited without having done
TIOCMBIC) makes good sense here - but I am perfectly fine with
disabling automatic deassertion for this quirk if it would help
getting the patch mainlined.  If the patch gets mainlined with
automatic deassertion disabled, the resulting system would be a little
less robust against the contrived corner case of a userspace program
crashing in the middle of a pulse, but it is not a deal breaker - if
that very unlikely corner case happens, just unplug the USB cable and
plug it back in to release the open drain outputs and to restore the
internal signals to CMOS high.  I can also add a trivial "clean up"
utility to our userspace software suite that opens the serial port,
clears both controls with TIOCMBIC and exits.

> And then there's CRTSCTS of course...

The second serial channel whose RTS & DTR outputs are being "stolen"
and repurposed for a use not related to this serial channel per se is
a data leads only UART with *no* flow control and no modem control -
thus if a userspace program were to set CRTSCTS on this channel, it
would be totally invalid usage, no different from a user trying to
run, say, a modem dialer program (one that talks AT commands) against
a /dev/ttyUSBx device connected to, say, an RS-232 thermometer, and
expecting it to work - surely it is not the kernel's job to guard
against such completely invalid usage?

I realize that all of my answers are highly specific to my one
particular custom hardware toy and aren't generalized in the
slightest, but in my defense, the quirk which I am asking to mainline
is conditionalized on one specific USB VID:PID, a specific USB VID:PID
that belongs only to my specific hardware piece and to no one else -
so where is the harm?

M~
