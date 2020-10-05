Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2245D28400C
	for <lists+linux-usb@lfdr.de>; Mon,  5 Oct 2020 22:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729550AbgJEUC5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Oct 2020 16:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729424AbgJEUC5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Oct 2020 16:02:57 -0400
Received: from mail-vk1-xa44.google.com (mail-vk1-xa44.google.com [IPv6:2607:f8b0:4864:20::a44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37B78C0613CE
        for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2020 13:02:57 -0700 (PDT)
Received: by mail-vk1-xa44.google.com with SMTP id c25so2040028vkm.1
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2020 13:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Yl8tEe5h1GH6e9GsgrkbDVeveyZF+Tq1lj7aKSm4Jl8=;
        b=ufsJCiYb6DoDBEurRZWkoYoanlhaIveSvLoYwHJ91zXpXvqVVC48NKdVB/zlhuVIOm
         4CFkcmXdRY9sdv53YD5dpIbmkmQmyil1mqItQQWdTmjNt2mVmKcXYsmqrMfQcLTFKOjL
         +gio65Fb5jZNfDWe7BjjL6RDUGNmgNkhwO/hRde3e/1zUOyqZ+ORllhVb8ifs6gv//86
         Au5IiaIPjVM7NM5byCd7bAkjp8JhaidNgRvzetXhmROYcFpZt9zPGxGmpF1SDV+jZKQY
         C740Wc4i5Eqt+nscCZVCsSOkzD6+mb2pw3W8UtofXlwY1yh+V8w4VuSNVoKG2/x7pqDb
         Mc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Yl8tEe5h1GH6e9GsgrkbDVeveyZF+Tq1lj7aKSm4Jl8=;
        b=RpP2A8kGFW21EoWLOVRyrWESOtwLuGw3Nq+DNJ/U8j2sVrztBbBKSRyKwsZjSu1oZg
         9LQ9wjG49e6NZsTCho/TNLz5HGpAiMwGbyMZ52Of3j1NjL0eKbsmx83vgzilkTmzNWNy
         xVBcMMWCc5lDkV5JxYSXnE9pUZ68m4N188A2LLrXbNRenonwUxo5benYS4zyR1vIhUlH
         4LQn222tDF+tqVINQzfII+r8H5DYWejVBUm3g2uhwGtoPifxV0jiB006rrAyF8g903Gv
         7x0ISAMdW/LYspfolO/ciYriqFhu1CS7Qyc79q4tz9akpypxknbX+lawoP6jxj7p6WAX
         KD3Q==
X-Gm-Message-State: AOAM532BRI715Hb/NsE/M3ze0jvM6ETkyR7c4CTqTrPFlw4If0FoqgmW
        zva6abib7iR40vNoXUu5sNDrdebvtRhjfbz1i10nN1sV02k=
X-Google-Smtp-Source: ABdhPJwsiBA2WkebS/DjVnuQf0hR8kgQr8brO/mn3uE3OMVkVU1l652Wez1Yjlhnxtcwa3bB1moL9KZyZg8BEG5SoGY=
X-Received: by 2002:a1f:95c4:: with SMTP id x187mr943895vkd.10.1601928176183;
 Mon, 05 Oct 2020 13:02:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9f:22c4:0:0:0:0:0 with HTTP; Mon, 5 Oct 2020 13:02:55 -0700 (PDT)
In-Reply-To: <20201005105722.GN5141@localhost>
References: <20200916015621.EFCDA374023F@freecalypso.org> <20200929101330.GQ24441@localhost>
 <CA+uuBqY83q+UiRsYxBckXvbtYf4sRxqB_8eXXPgEKAOqTwD=vg@mail.gmail.com> <20201005105722.GN5141@localhost>
From:   Mychaela Falconia <mychaela.falconia@gmail.com>
Date:   Mon, 5 Oct 2020 12:02:55 -0800
Message-ID: <CA+uuBqZ6JhCq1ydU-9A+en3QO=9zX9LuEJ8+P0YvEzUE+9sYoA@mail.gmail.com>
Subject: Re: [PATCH 0/3] a family of FTDI-based devices that need ftdi_sio quirks
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

> Yeah, your application would then need to deassert after open.
>
> I believe some arduino boards use a capacitor to trigger a reset pulse
> whenever DTR/RTS is asserted instead.

But you are still asking me to modify the hardware in ways that would
make the product worse for the end user.  Just consider the current
situation:

* Calypso target board (FC Caramel2) can run either with or without a
host computer connected via the DUART28 USB-serial interface.  When
there is no host computer connected to either of the two UARTs, the
board can be usefully operated via its local LCD and keypad UI
elements, provided that the user loaded the necessary firmware into
flash when she did previously connect her host PC via DUART28.

* The board has human-finger-operated PWON and RESET pushbutton
switches on it, allowing the user to command the needed signals to the
power & reset control chip without requiring a connected host computer.
Each of the two pushbutton switches is wired between the corresponding
chipset signal and GND.

* The user can freely connect and disconnect the DUART28 adapter (both
the USB host to DUART28 connection and the connection from DUART28 to
the Calypso target board can be freely made and broken) with the
Calypso target board is either switched-on or switched-off state, and
NONE of these connect/disconnect manipulations will trigger any resets
or on/off switching actions on the Calypso.

* If the user has applied the necessary ftdi_sio driver patch,
programmed the DUART28 on-board EEPROM to the 'C' configuration
(assigning DUART28C custom USB PID) and connected the wires from
DUART28 open drain outputs CTL1 and CTL2 to Calypso target board PWON
and RESET, then DUART28 CTL1 becomes a programmatic PWON and CTL2
becomes a programmatic RESET.  Running fc-pulse-rts /dev/ttyUSB1 is
now equivalent to pressing PWON with one's finger, and running
fc-pulse-dtr /dev/ttyUSB1 is equivalent to pressing the RESET button
instead.  Note the selective pulsing of just one signal, either RTS
or DTR, but not both!  There are also more complex "macro" operations
that combine boot control pulsing with actual serial communication:
for example, fc-loadtool -Pdtr /dev/ttyUSB1 will pulse DTR (intending
a reset) while sending "beacons" on the serial port every 13 ms,
seeking to catch the attention of the chip's mask ROM bootloader.

* When no boot control pulsing is desired, the user can freely run
ordinary serial communication programs on both UARTs (standard AT
command software on /dev/ttyUSB0 and rvinterf on /dev/ttyUSB1) WITHOUT
any resets or PWON pulses being triggered ever.

I don't see how any of your proposed alternative hardware designs
would ever accomplish the same objectives of having NO resets or PWON
actions glitch-triggered when the user merely plugs in or unplugs the
USB cable, or when the user desires to run an ordinary serial
communication program *without* triggering either RESET or PWON
controls.  Oh, and don't forget the ability to selectively trigger
either one of PWON and RESET as desired, without producing even a
slightest glitch on the other control line.

> I wasn't expecting you to support "any serial port"; my point was that
> when possible it's better to accommodate the standard behaviour of these
> signals and have it work on any OS (version) rather than requiring
> patching drivers.

Please be more careful with phrases like "standard behaviour of these
signals" and "any OS": I argue that what Linux does with DTR & RTS is
NOT universally standard, and is in fact *defective* compared to what
Windows does.  Linux exhibits a fundamental philosophical design bug
in that whenever a serial port is opened, DTR and RTS are automatically
asserted without ever giving the userspace program a chance to say
"no, please don't do it" - that's a bug, not a feature.  I know that
Linux got this behaviour (which I hereby argue to be a philosophical
design bug) from POSIX, and that POSIX in turn got it from Original
UNIX - being a retrocomputing enthusiast, I happen to know that
Ancient UNIX exhibits the exact same misfeature of unconditional
DTR & RTS assertion on open - but just because it has been a very
long-standing tradition going all the way back to original 1970s UNIX
does not make it right.

If you look at a real independent competitor to Linux, namely Windows,
a totally independent OS design not hindered by those particular
traditions, you will see that it does NOT exhibit the same philosophical
design bug: under Windows one can open a serial port with a
CreateFile("COM1", ...) API call, and this action in itself will NOT
cause any of the modem control signals to change state.  Instead the
userspace program gets the complete freedom to manipulate modem control
signals *as desired* with a SetCommState() API call, *without* the OS
and its drivers producing an unstoppable, unpreventable glitch on DTR
and RTS immediately on open.

Of course the most proper fix would be to correct the Unix/POSIX/Linux
serial port handling philosophical design bug at its root, adding a
flag like O_NODTR to the open syscall that would prevent automatic
assertion of DTR & RTS on open, just like including O_NONBLOCK in the
open flags prevents a hang waiting for DCD to become asserted.  But
producing such a patch and getting it accepted would be far beyond my
capabilities, and even if such a change were to be made in current
mainline, it would not help practical end users: it would be too much
of a "new feature" change to get into stable kernels, end users of
older kernels would need to apply the patch locally, and making a
purely local application of a big change like adding a new open flag
(propagating it into /usr/include headers seen by userspace) is not
something I can reasonably ask my end users to do.

Hence I am going for the minimally invasive surgical approach instead:
suppress the unwanted on-open assertion of DTR & RTS in the ftdi_sio
driver, conditionalized on my custom USB ID so no one else will be
affected except my custom hardware, and the patch is small and
surgical such that end users should be able to apply it locally with
minimal pain.

> You're quirk flag was named no-auto-dtr-rts or similar, so it doesn't
> seem unreasonable to honour it also in case someone, perhaps
> unknowingly, sets CRTSCTS.

The flag is named no_auto_dtr_rts, and the associated comment in the
struct member definition reads:

	int no_auto_dtr_rts;	/* if non-zero, suppress automatic assertion
				   of DTR & RTS on device open */

The flag means no automatic assertion of DTR & RTS *on device open*,
i.e., producing the same behaviour which saner OSes like Windows
provide out of the box.  Once the open hurdle has been cleared, the
user has complete freedom of control: she can assert DTR and/or RTS
with TIOCMBIS, she can clear either or both of them with TIOCMBIC, and
she can also enable CRTSCTS if she so chooses - so why in the world
should the driver artificially block CRTSCTS?

If someone mistakenly enables CRTSCTS on Channel B (/dev/ttyUSB1 in
the absence of other ttyUSB devices) of a DUART28C, the result will be
bogus pulses on the RTS-turned-PWON line, and the resulting system
behaviour would be the same as if that user's unattended child were to
wander into the lab and playfully press the PWON button on the board
with her little pinky finger.  It is not the kernel's job to guard
against the latter scenario, so why does it need to go out of its way
to guard against the former?

Oh, and setting CRTSCTS on Channel B of a DUART28C would also block
all serial communication on that channel, as the FT2232D chip will see
its CTS input as being always negated: the chip's BDBUS3 pin is
physically unconnected (due to being unused) in the hardware, and the
FT2232D chip's built-in pull-ups cause unused/unconnected inputs to be
sensed as CMOS high.  CMOS high equals RS-232 inactive, thus CTS is
always sensed as being inactive, and setting CRTSCTS would stop all
communication - thus there is NO valid use case for setting CRTSCTS on
DUART28 Channel B.

> But a less-intrusive patch for this is of course preferred so we can
> probably leave CRTSCTS handling unchanged.

The actual implementation of CRTSCTS functionality resides in FTDI
chip hardware, the driver merely enables it with
FTDI_SIO_SET_FLOW_CTRL_REQUEST - and I don't see any valid reason to
artificially suppress this function when there is a quirk that says
"please don't twiddle control lines immediately on open without
userspace asking for it" - CRTSCTS in contrast *is* an explicit
request from userspace.

> But then the same should be done for B0 I think.

The whole concept of B0 meaning "hang up" is another bizarre legacy
from Ancient UNIX that crept its way into Linux through POSIX - before
TIOCMBIS and TIOCMBIC were invented, this B0 hack was provides as a
means for applications that needed to assert and negate DTR (RTS was
rarely used back then) without having to close and reopen the tty port.

When it comes to the no_auto_dtr_rts quirk, the important part is that
automatic assertion of DTR & RTS upon coming out of B0 state MUST be
suppressed - because having this suppression is the only way to prevent
unwanted automatic assertion of the signals if the previous state
(before userspace opening this serial port and operating on it) was B0.

What about going the other way: when userspace explicitly sets B0,
should the driver negate DTR & RTS?  I would be OK either way,
whichever way would allow my hardware support patch to be accepted,
but it seems more philosophically correct to me for the driver to
negate DTR & RTS upon userspace setting B0: it is an explicit request
from userspace, not an automatic unrequested action, and thus it
should honored.  This way userspace explicitly setting B0 is no
different from an explicit TIOCMBIC.

> Right. But we should still try to aim at general solution that can be
> reused by other devices if needed (cf. the jtag quirk).

It is indeed quite possible that other hardware engineers (or end
users of hardware that was designed for Windows) will run into the
same issue: someone has wired up DTR and/or RTS for a purpose that
does not tolerate glitches, everything works like a charm under
Windows, but Linux assininely insists on always asserting DTR & RTS on
device open whether the user wants it or not, and the hardware
glitches badly as a result.

If you let my current patch into the kernel and then someone else runs
into a similar situation, they should be able to set the exact same
no_auto_dtr_rts flag in their ID-code-specific quirk as appropriate
for their hw (DUART28C quirk needs this flag set for Channel B but not
for Channel A; other people's hw has every right to be different), and
it should allow those people to exercise full arbitrary control over
both DTR and RTS from userspace as appropriate for their application,
even if their hw specifics are quite different from mine:

* Absolutely no signal state change will happen upon the mere act of
opening the ttyUSB device.

* If someone wants to have some signal state changes upon open, they
can trivially follow their open syscall with TIOCMBIS and/or TIOCMBIC
ioctls as appropriate for their hw.

* No signal state change will happen when going from B0 to Bxxx, and
this behaviour is required in order to avoid unstoppable control signal
glitches if the initial state prior to userspace open was B0.

* If userspace is explicitly setting B0, it is an explicit userspace
request to drop DTR & RTS just like TIOCMBIC, so it gets honored.

* Whether or not DTR & RTS will be dropped upon port close will depend
on whether HUPCL has been set or not.  Because HUPCL is a userspace-
controlled flag, someone could argue that if userspace set HUPCL, then
userspace wants DTR & RTS to be negated on port close, and that this
request should be honored - hence the current behaviour of my present
patch is defended for both drop-on-close and drop-on-B0 cases.

* CRTSCTS still works like it always did - thus if someone else's hw
is wired differently from mine in that they have an RTS signal that
works as flow control, but they still need to block automatic
assertion of RTS and/or DTR on device open, then they can open the
serial port, optionally manipulate DTR with TIOCMBIS or TIOCMBIC as
needed, and then set CRTSCTS if that is what their application calls
for.

> Let me give this some more thought.

Please tell me if you would like me to make some specific changes to
my proposed patch, or if I should let my current v3 stand as it is
while you think about it.

M~
