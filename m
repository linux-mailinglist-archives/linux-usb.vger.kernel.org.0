Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71BDE2C877A
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 16:15:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgK3POB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 10:14:01 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40023 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbgK3POA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Nov 2020 10:14:00 -0500
Received: by mail-lj1-f196.google.com with SMTP id y10so18455036ljc.7
        for <linux-usb@vger.kernel.org>; Mon, 30 Nov 2020 07:13:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V6uTNLxqpt7fAmAeM7/85Kr33LfMWRD1suuaBgrEuIQ=;
        b=WbBgF4CKhx8eyGer3GiUVQsUCEwBIoVkdbVsds8FocZ+Rm7gS0s94+vF694s2xX7gS
         qDjCfNBWJ8sIcx73ygGIP0YfIhy42AUr6gQJqduBpu+24dfhryi6K+I73U93njtmzbMk
         pzteIKXWsPaLf0mBW/A7OrJOohO/BEDo8emsAwKP/9PDRowOMZ1HPx5/zjsxcJtXFx+U
         2U37fJx6iWVt8DSApc7Q5ErH3EVJ8BQ+WpfXfcojssMZ0D/H9GvMLPaz51CiXn9pNA+x
         0nIK6cc6xz4BO2V68rRC2LEZpSjvvEba16VFeGHg+0YMR+DwlnHdEY4mPj50/ro6XZmF
         PC7A==
X-Gm-Message-State: AOAM532zwK9EtdtWyLffROQVOx2vaPVSpY7j+L+fmuyBCgaPpmgioZ66
        Ix7Aw1A/hkmIjcPQA7lVe4MJRLeLZ0jUjg==
X-Google-Smtp-Source: ABdhPJw5ky9Rk+7aE6T3TSJjEgGHHVu3aLoKU6Esby1Y+l4BZF4NRES/HWGJIG0aC/qtMU4BSkNolA==
X-Received: by 2002:a2e:6e14:: with SMTP id j20mr10088227ljc.372.1606749196233;
        Mon, 30 Nov 2020 07:13:16 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id o15sm2953728ljh.57.2020.11.30.07.13.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 07:13:15 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kjks3-0000uI-VW; Mon, 30 Nov 2020 16:13:44 +0100
Date:   Mon, 30 Nov 2020 16:13:43 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Mychaela Falconia <mychaela.falconia@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio
 quirks
Message-ID: <X8UMJ9a051tT1rbz@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org>
 <20200929101330.GQ24441@localhost>
 <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com>
 <20201005105722.GN5141@localhost>
 <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mychaela, 

and sorry about the late follow-up on this.

I took a fresh look at this before going back and reading you last
mails and found that I'd landed in more or less the same conclusions as
you. Please see below.

On Mon, Oct 05, 2020 at 12:02:55PM -0800, Mychaela Falconia wrote:
> Hi Johan,
> 
> > Yeah, your application would then need to deassert after open.
> >
> > I believe some arduino boards use a capacitor to trigger a reset pulse
> > whenever DTR/RTS is asserted instead.
> 
> But you are still asking me to modify the hardware in ways that would
> make the product worse for the end user.  Just consider the current
> situation:

> I don't see how any of your proposed alternative hardware designs
> would ever accomplish the same objectives of having NO resets or PWON
> actions glitch-triggered when the user merely plugs in or unplugs the
> USB cable, or when the user desires to run an ordinary serial
> communication program *without* triggering either RESET or PWON
> controls.  Oh, and don't forget the ability to selectively trigger
> either one of PWON and RESET as desired, without producing even a
> slightest glitch on the other control line.

Yeah, you're right.

> > I wasn't expecting you to support "any serial port"; my point was that
> > when possible it's better to accommodate the standard behaviour of these
> > signals and have it work on any OS (version) rather than requiring
> > patching drivers.
> 
> Please be more careful with phrases like "standard behaviour of these
> signals" and "any OS": I argue that what Linux does with DTR & RTS is
> NOT universally standard, and is in fact *defective* compared to what
> Windows does.  Linux exhibits a fundamental philosophical design bug
> in that whenever a serial port is opened, DTR and RTS are automatically
> asserted without ever giving the userspace program a chance to say
> "no, please don't do it" - that's a bug, not a feature.  I know that
> Linux got this behaviour (which I hereby argue to be a philosophical
> design bug) from POSIX, and that POSIX in turn got it from Original
> UNIX - being a retrocomputing enthusiast, I happen to know that
> Ancient UNIX exhibits the exact same misfeature of unconditional
> DTR & RTS assertion on open - but just because it has been a very
> long-standing tradition going all the way back to original 1970s UNIX
> does not make it right.

I'd still call it standard behaviour since Linux has always handled it
this way (and so has earlier systems as you point out), but I see your
point.

> If you look at a real independent competitor to Linux, namely Windows,
> a totally independent OS design not hindered by those particular
> traditions, you will see that it does NOT exhibit the same philosophical
> design bug: under Windows one can open a serial port with a
> CreateFile("COM1", ...) API call, and this action in itself will NOT
> cause any of the modem control signals to change state.  Instead the
> userspace program gets the complete freedom to manipulate modem control
> signals *as desired* with a SetCommState() API call, *without* the OS
> and its drivers producing an unstoppable, unpreventable glitch on DTR
> and RTS immediately on open.

From the API docs I found, it seems the behaviour on open (CreateFile())
is configurable after opening the port. Perhaps the default can be set
through some other means too, unless it's driver dependent.

> Of course the most proper fix would be to correct the Unix/POSIX/Linux
> serial port handling philosophical design bug at its root, adding a
> flag like O_NODTR to the open syscall that would prevent automatic
> assertion of DTR & RTS on open, just like including O_NONBLOCK in the
> open flags prevents a hang waiting for DCD to become asserted.  But
> producing such a patch and getting it accepted would be far beyond my
> capabilities, and even if such a change were to be made in current
> mainline, it would not help practical end users: it would be too much
> of a "new feature" change to get into stable kernels, end users of
> older kernels would need to apply the patch locally, and making a
> purely local application of a big change like adding a new open flag
> (propagating it into /usr/include headers seen by userspace) is not
> something I can reasonably ask my end users to do.

Yeah, that may not be feasible.

> Hence I am going for the minimally invasive surgical approach instead:
> suppress the unwanted on-open assertion of DTR & RTS in the ftdi_sio
> driver, conditionalized on my custom USB ID so no one else will be
> affected except my custom hardware, and the patch is small and
> surgical such that end users should be able to apply it locally with
> minimal pain.

Right, but I still think this should be generalised somewhat.

> > But then the same should be done for B0 I think.
> 
> The whole concept of B0 meaning "hang up" is another bizarre legacy
> from Ancient UNIX that crept its way into Linux through POSIX - before
> TIOCMBIS and TIOCMBIC were invented, this B0 hack was provides as a
> means for applications that needed to assert and negate DTR (RTS was
> rarely used back then) without having to close and reopen the tty port.
> 
> When it comes to the no_auto_dtr_rts quirk, the important part is that
> automatic assertion of DTR & RTS upon coming out of B0 state MUST be
> suppressed - because having this suppression is the only way to prevent
> unwanted automatic assertion of the signals if the previous state
> (before userspace opening this serial port and operating on it) was B0.
> 
> What about going the other way: when userspace explicitly sets B0,
> should the driver negate DTR & RTS?  I would be OK either way,
> whichever way would allow my hardware support patch to be accepted,
> but it seems more philosophically correct to me for the driver to
> negate DTR & RTS upon userspace setting B0: it is an explicit request
> from userspace, not an automatic unrequested action, and thus it
> should honored.  This way userspace explicitly setting B0 is no
> different from an explicit TIOCMBIC.

I don't think we need to change the B0 handling. It will never be set
unless explicitly requested by the user.

> > Right. But we should still try to aim at general solution that can be
> > reused by other devices if needed (cf. the jtag quirk).
> 
> It is indeed quite possible that other hardware engineers (or end
> users of hardware that was designed for Windows) will run into the
> same issue: someone has wired up DTR and/or RTS for a purpose that
> does not tolerate glitches, everything works like a charm under
> Windows, but Linux assininely insists on always asserting DTR & RTS on
> device open whether the user wants it or not, and the hardware
> glitches badly as a result.

Right. This has come up the in past, and there are other more or less
established applications such has HAM radio that use these lines for
other purposes. So I agree, we should try to support it.

> If you let my current patch into the kernel and then someone else runs
> into a similar situation, they should be able to set the exact same
> no_auto_dtr_rts flag in their ID-code-specific quirk as appropriate
> for their hw (DUART28C quirk needs this flag set for Channel B but not
> for Channel A; other people's hw has every right to be different), and
> it should allow those people to exercise full arbitrary control over
> both DTR and RTS from userspace as appropriate for their application,
> even if their hw specifics are quite different from mine:
> 
> * Absolutely no signal state change will happen upon the mere act of
> opening the ttyUSB device.
> 
> * If someone wants to have some signal state changes upon open, they
> can trivially follow their open syscall with TIOCMBIS and/or TIOCMBIC
> ioctls as appropriate for their hw.
> 
> * No signal state change will happen when going from B0 to Bxxx, and
> this behaviour is required in order to avoid unstoppable control signal
> glitches if the initial state prior to userspace open was B0.
> 
> * If userspace is explicitly setting B0, it is an explicit userspace
> request to drop DTR & RTS just like TIOCMBIC, so it gets honored.
> 
> * Whether or not DTR & RTS will be dropped upon port close will depend
> on whether HUPCL has been set or not.  Because HUPCL is a userspace-
> controlled flag, someone could argue that if userspace set HUPCL, then
> userspace wants DTR & RTS to be negated on port close, and that this
> request should be honored - hence the current behaviour of my present
> patch is defended for both drop-on-close and drop-on-B0 cases.
> 
> * CRTSCTS still works like it always did - thus if someone else's hw
> is wired differently from mine in that they have an RTS signal that
> works as flow control, but they still need to block automatic
> assertion of RTS and/or DTR on device open, then they can open the
> serial port, optionally manipulate DTR with TIOCMBIS or TIOCMBIC as
> needed, and then set CRTSCTS if that is what their application calls
> for.
> 
> > Let me give this some more thought.

I've prepared a series adding generic support for use-cases such as
yours and respun your last two patches on top so that they use the
generic implementation instead.

I'm adding a new tty port flag that can be used to suppress the
assertion of DTR/RTS to signal DTE readiness on open named NORDY.
Eventually we can expose it through termios to match HUPCL that controls
the behaviour on final close. For now I'm only adding a sysfs interface
but that also allows control over these signals on first open.

Your FTDI quirk now only needs to set this flag on probe to override the
default behaviour. The end result with respect to your device should be
the same except for B0, which is still handled as before.

I'll post the series shortly.

Johan
