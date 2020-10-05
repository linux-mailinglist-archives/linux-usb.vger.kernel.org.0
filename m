Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C739283451
	for <lists+linux-usb@lfdr.de>; Mon,  5 Oct 2020 12:57:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgJEK5c (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Oct 2020 06:57:32 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46434 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgJEK5c (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Oct 2020 06:57:32 -0400
Received: by mail-lf1-f67.google.com with SMTP id b22so10255551lfs.13
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2020 03:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wuUTpGgA3PXxAm+sJRiE79VXoTjKRT6I2hgC9BMS9YU=;
        b=KHHRSYOPjM+2Ya/amOg7qMT7qRFK53tDKXHUvmgOaQ3qdaehsjjUicgr3wLabpoRZA
         6ZaE+rd+xb6ob1MzGTOQ00njHZ+7GHeXX+HqQE40JidUqulEwsaB7f7i1hmMJ1UVyAue
         WiIhWae337wNl3kz7GS4aBXq1s6vPqCt8lEzF3z/GBIw8ASoGR+fefIM/2qAnl6l9Njs
         vNMDhIKUwAFRCZN82yV9YxQ62G4qaHCfVpFomVmDWzvGoumFSy3qLCMQyHqSEA1Vliki
         lTuX+FoeBvjMroMya/Dv03G5bJ3+1p2UVI/5ff9deMdD/A/dQJOUedm7dBm9wqHGUXPB
         YfZA==
X-Gm-Message-State: AOAM531IRoLtLevV2UCdla3/ClljD+pFs013XXVi0pa1wSbaA0fSYnEb
        HSyQ5YIDMcw/Jwz0NlV3vL4Y6+JIyGs=
X-Google-Smtp-Source: ABdhPJzPe1B+/k6rZlDDn2chdvZgNuQc5CWH61+1XXOz6HK2N/OEQB5Q3jhsb5PXMSL8HOK2QQtlzg==
X-Received: by 2002:a05:6512:695:: with SMTP id t21mr763396lfe.24.1601895447857;
        Mon, 05 Oct 2020 03:57:27 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id p9sm2511073ljj.52.2020.10.05.03.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 03:57:26 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kPOBG-0004V0-O7; Mon, 05 Oct 2020 12:57:23 +0200
Date:   Mon, 5 Oct 2020 12:57:22 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio
 quirks
Message-ID: <20201005105722.GN5141@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org>
 <20200929101330.GQ24441@localhost>
 <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 11:40:47AM -0800, Mychaela Falconia wrote:

> > Did you try inverting the signals so that they can be used on any serial
> > port to power on and release reset on open, and then just clear HUPCL if
> > you want the connected device to remain powered after the port is closed?
> 
> The first problem with asking for a hardware design change is that the
> hardware has already been physically built - here are some photos:
> 
> https://www.freecalypso.org/members/falcon/pictures/duart28/
> 
> I got 20 fully assembled boards plus 20 more unpopulated PCBs, and
> asking our community to throw this hardware out is a non-starter.
> 
> Also the idea of "so that they can be used on any serial port" is
> meaningless in the context of this application: there is no "any
> serial port", instead there exists a custom piece of hardware
> (depicted above) that contains an FT2232D chip as one of its
> components.  FTDI chips are powerful multifunction beasts, they are a
> lot more than just serial ports, and on this particular board the I/O
> channels coming out of the FT2232D chip are used in a mixed manner:
> ADBUS0 through ADBUS7 form UART channel 0, BDBUS0 and BDBUS1 (data
> leads only) form UART channel 1 (no flow control or modem control),
> and BDBUS2 and BDBUS4 (which would otherwise be Channel B RTS & DTR)
> are used essentially as GPIOs that have nothing to do with either of
> the two serial ports.
> 
> Aside from already built hardware, inverting the sense of the signals
> running between FT2232D and the open drain buffer (replacing the non-
> inverting 74LVC2G07 buffer with an inverting one) would not work: in
> that case both control signals would be immediately asserted as soon
> as the USB cable is connected between the adapter board and the host
> computer, resulting in the connected Calypso target being held down
> both in reset and in the PWON pulse - bad.

Yeah, your application would then need to deassert after open.

I believe some arduino boards use a capacitor to trigger a reset pulse
whenever DTR/RTS is asserted instead.

I wasn't expecting you to support "any serial port"; my point was that
when possible it's better to accommodate the standard behaviour of these
signals and have it work on any OS (version) rather than requiring
patching drivers.

> I also realize that I may have been a little unclear in my original
> explanation as to what the hardware signals really do.  FT2232D BDBUS2
> and BDBUS4 outputs are conventionally defined to be RTS and DTR,
> respectively, but their CMOS logic levels are the opposite of RS-232:
> RS-232 DTR & RTS asserted means CMOS low on BDBUS[24], and RS-232 DTR
> & RTS negated means CMOS high on BDBUS[24].  Both signals are CMOS
> high initially on USB power application, and with my patch they become
> CMOS low only as a result of an explicit TIOCMBIS ioctl setting DTR or
> RTS.  These signals go to a Nexperia 74LVC2G07 non-inverting open
> drain buffer IC (tiny U7 chip visible in the photos linked above), and
> the open drain outputs are wired to J5 header pins that are labeled
> CTL1 and CTL2 on the PCB silk screen - so they are not really DTR and
> RTS at all as far as this custom hw is concerned, instead they are
> special open drain pulse outputs.
> 
> CTL1 will be connected to PWON and CTL2 will be connected to RESET on
> the Calypso target board.  The pulse nature of these two open drain
> outputs is crucial: PWON is not a power on/off control where one
> steady state means on and the other steady state means off, instead it
> is a pulse control.  Virtually every handheld battery-powered device
> has a "soft power" button that is physically wired between the power
> management chip's dedicated PWON pin and ground, and Calypso is no
> different: the pulse put out on CTL1 by the DUART28C adapter (produced
> by userspace doing TIOCMBIS, delay, TIOCMBIC) simulates the action of
> a user pressing the red power button on her dumbphone.  RESET works
> the same way: having the target held down in reset long-term is bad,
> instead whenever a reset pulse is needed, we do a TIOCMBIS, delay,
> TIOCMBIC sequence.
> 
> In short, I will not change our hardware design, and I will continue
> running with my patch whether it is mainlined or not.
> 
> > As you probably expected, I'm a bit reluctant to adding quirks like this
> > (e.g. as it makes the code harder to read and maintain):
> 
> Right now I am instructing my user community to apply the needed patch
> locally.  I am making my best-faith attempt to get this patch mainlined
> as a matter of due diligence - had I not even bothered to try, my users
> would be bound to ask "why don't you get this patch mainlined".  If
> our patch is rejected, I will document this rejection in the user
> documentation for the hardware product, with links to the relevant
> messages in the linux-usb mailing list archive, so that my users will
> know that I have honestly tried and that I am not the one to blame -
> it is all I can do.

Right. But let's see where we end up on this, the more general the
solution we can come up with the better.

> I am going to prepare a second version of this patch series (down to
> just two patches now) with the changes you have requested for 2/3 and
> 3/3.
> 
> Oh, and a couple of comments from 3/3 that are worth addressing:
> 
> > If we are to add this, then you shouldn't allow for automatic deassert
> > either.
> 
> Because of the pulse nature of CTL1 and CTL2 outputs, automatic
> deassertion (in case a userspace program exited without having done
> TIOCMBIC) makes good sense here - but I am perfectly fine with
> disabling automatic deassertion for this quirk if it would help
> getting the patch mainlined.  If the patch gets mainlined with
> automatic deassertion disabled, the resulting system would be a little
> less robust against the contrived corner case of a userspace program
> crashing in the middle of a pulse, but it is not a deal breaker - if
> that very unlikely corner case happens, just unplug the USB cable and
> plug it back in to release the open drain outputs and to restore the
> internal signals to CMOS high.  I can also add a trivial "clean up"
> utility to our userspace software suite that opens the serial port,
> clears both controls with TIOCMBIC and exits.

Good.

> > And then there's CRTSCTS of course...
> 
> The second serial channel whose RTS & DTR outputs are being "stolen"
> and repurposed for a use not related to this serial channel per se is
> a data leads only UART with *no* flow control and no modem control -
> thus if a userspace program were to set CRTSCTS on this channel, it
> would be totally invalid usage, no different from a user trying to
> run, say, a modem dialer program (one that talks AT commands) against
> a /dev/ttyUSBx device connected to, say, an RS-232 thermometer, and
> expecting it to work - surely it is not the kernel's job to guard
> against such completely invalid usage?

You're quirk flag was named no-auto-dtr-rts or similar, so it doesn't
seem unreasonable to honour it also in case someone, perhaps
unknowingly, sets CRTSCTS.

But a less-intrusive patch for this is of course preferred so we can
probably leave CRTSCTS handling unchanged. But then the same should be
done for B0 I think.

> I realize that all of my answers are highly specific to my one
> particular custom hardware toy and aren't generalized in the
> slightest, but in my defense, the quirk which I am asking to mainline
> is conditionalized on one specific USB VID:PID, a specific USB VID:PID
> that belongs only to my specific hardware piece and to no one else -
> so where is the harm?

Right. But we should still try to aim at general solution that can be
reused by other devices if needed (cf. the jtag quirk).

Let me give this some more thought.

Johan
