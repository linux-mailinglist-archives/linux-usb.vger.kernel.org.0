Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1804623547A
	for <lists+linux-usb@lfdr.de>; Sat,  1 Aug 2020 23:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726978AbgHAV6L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Aug 2020 17:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgHAV6K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Aug 2020 17:58:10 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0DEC06174A
        for <linux-usb@vger.kernel.org>; Sat,  1 Aug 2020 14:58:10 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id q7so35926773ljm.1
        for <linux-usb@vger.kernel.org>; Sat, 01 Aug 2020 14:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IqZxQaiay3zz4XT/GEF4YNkpUfdLIPuG9OhUVrjgqN8=;
        b=Ds6ik7S56VtYmYcA7pY8lhD/r9kz/5BLU7jkiRYBpvIfM0szTzvaUBd83+KU/76mbM
         ClpjswbzEq8LOkB6nxvXU2n9GhKnW/2zyJLXv7hTiaBqU9fkNj+m93ZOKvZVb1n+wXWt
         iX9KJkOFaaB2umLkJ8Kv2zYmBJn4ZMrADre/u2JWTguoRr7rcUf9mAeSE+X48G8RQCT0
         Q0XHHfXCaxnUGj5kxBxJeKLR9QHrr/eBYkdOOc5wlILYif2kzGa43yVRtqstOYgZ5HfF
         /ys5K+DCKutfDUdrsoXjfv6ES0tmcBQu3CNEhPitnp+Fz9YoqohekR/ChNviJdxA4vgM
         ouyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IqZxQaiay3zz4XT/GEF4YNkpUfdLIPuG9OhUVrjgqN8=;
        b=rH1zy+xIUjGki64SMOUftH17RZZGQQSVw6rPas3KjOJWmJswgFq8K6vUqMgLKlpxDM
         vx7rUhGf+u9U31iDN9/LO5tmkgQDGJEVSN7GOUVyrcy4Oh93yJW1R0eySQWt+No8jdrG
         iEn3E28c6PWqwG+8Mpr/eZgRaCQNsLP2+/UKfmWSoPDdI+AWS7RAl9h521UiOSuT5hPv
         DfPia04jH3Q/cjigXqNjr7kJ3X4r/dQ7qIu9EyrzzaZzgvS+oTx/BxIOLj6zD07R0VsL
         iZEmvE3VSnIijWG4OtLrGeHRvEYIkeMv7j0XEqb6Z7F2lZIjE52ZjBluCT2cceI3wVeD
         mF8Q==
X-Gm-Message-State: AOAM532azZNWlMJPaOcvIuYhQjdT7ksN70yovSLO7ZypJi7q9CKHPklS
        4pESsivoRX+2lT93Jhjf7eXE8UbJtIDjHw5r09h9b3jL
X-Google-Smtp-Source: ABdhPJzfcl+DUjqxMWgh3+xjnjOMhuEFHMZP2fG+eoQhwALnf3jC6YPLLabO4O1DueauXzfpxYi4Ayii7LQNL6rIyu4=
X-Received: by 2002:a2e:999a:: with SMTP id w26mr4797896lji.242.1596319088452;
 Sat, 01 Aug 2020 14:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAO3ALPyB1JDvvC27JGgAoTuHh0w+897tPhmTKX9PQWBFCrrnbQ@mail.gmail.com>
 <CAOSf1CEkHLamLXK3HOAZ+w0K=2hTOjn=x5KpDdmRZ4BXVy+P2A@mail.gmail.com>
In-Reply-To: <CAOSf1CEkHLamLXK3HOAZ+w0K=2hTOjn=x5KpDdmRZ4BXVy+P2A@mail.gmail.com>
From:   Forest Crossman <cyrozap@gmail.com>
Date:   Sat, 1 Aug 2020 16:57:56 -0500
Message-ID: <CAO3ALPxou56Y8cvBzC9qOAkBLkTAxodan1PhQ1WSBgWubamJGQ@mail.gmail.com>
Subject: Re: ASMedia ASM2142 USB host controller tries to DMA to address zero
 when doing bulk reads from multiple devices
To:     "Oliver O'Halloran" <oohall@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Alexey Kardashevskiy <aik@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 29, 2020 at 8:22 AM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> On Tue, Jul 21, 2020 at 3:51 PM Forest Crossman <cyrozap@gmail.com> wrote:
> >
> > Hello, again!
> >
> > After fixing the issue in my previous thread using this patch[1], I
> > decided to do some stress-testing of the controller to make sure it
> > could handle my intended workloads and that there were no further DMA
> > address issues that would need to be fixed. Unfortunately, it looks
> > like there's still more work to be done: when I try to do long bulk
> > reads from multiple devices simultaneously, eventually the host
> > controller sends a DMA write to address zero, which then triggers EEH
> > in my POWER9 system, causing the controller card to get hotplug-reset,
> > which of course kills the disk-reading processes. For more details on
> > the EEH errors, you can see my kernel's EEH message log[2].
>
> Take the logged address with a grain of salt. If an error occurs while
> translating the DMA address the PHB logs all zeros as the "DMA
> Address" because it only keeps around the bits that it needs to fetch
> the next level of the TCE table. The EEH dump says the error is due to
> a TCE permission mis-match so odds the ASmedia controller is writing
> to an address that's already been DMA unmapped, hence the logged
> address being zeros.

Interesting, that's good to know. I saw that the RXE_TCE_FESR had the
"TCE Response Page Access Error" bit set, and had originally assumed
that just meant the DMA to address zero was triggering that error
since it wasn't in a mapped page, but after reading that bit's
description again I think I understand it now.

> Sorry, I probably should have mentioned that quirk in the last mail.
>
> > The results of the various tests I performed are listed below.
> >
> > Test results (all failures are due to DMA writes to address zero, all
> > hubs are USB 3.0/3.1 Gen1 only, and all disks are accessed via the
> > usb-storage driver):
> > - Reading simultaneously from two or more disks behind a hub connected
> > to one port on the host controller:
> >   - FAIL after 20-50 GB of data transferred for each device.
> > - Reading simultaneously from two disks, each connected directly to
> > one port on the host controller:
> >   - FAIL after about 800 GB of data transferred for each device.
> > - Reading from one disk behind a hub connected to one port on the host
> > controller:
> >   - OK for at least 2.7 TB of data transferred (I didn't test the
> > whole 8 TB disk).
> > - Writing simultaneously to two FL2000 dongles (using osmo-fl2k's
> > "fl2k_test"), each connected directly to one port on the host
> > controller:
> >   - OK, was able to write several dozen terabytes to each device over
> > the course of a little over 21 hours.
> >
> > Seeing how simultaneous writes to multiple devices and reads from
> > single devices both seem to work fine, I assume that means this is
> > being caused by some race condition in the host controller firmware
> > when it responds to multiple read requests.
>
> Most likely. It's possible it's a platform specific race with DMA
> map/unmap too, but I think we would be seeing similar issues with
> other devices if it was.

Yeah, I have several other xHCI controllers connected to this system,
and I've never experienced this issue with any of them. If the problem
was a POWER-specific DMA map/unmap race I would expect to be having
problems with those controllers as well.

> > I also assume we're not
> > going to be able to convince ASMedia to both fix the bug in their
> > firmware and release the details on how to flash it from Linux, so I
> > guess we'll just have to figure out how to make the driver talk to the
> > controller in a way that avoids triggering the bad DMA write. As
> > before, I decided to try a little kernel hacking of my own before
> > sending this email, and tried separately enabling the
> > XHCI_BROKEN_STREAMS and XHCI_ASMEDIA_MODIFY_FLOWCONTROL quirks in an
> > attempt to fix this. As you might expect since you're reading this
> > message, neither of those quirks fixed the issue, nor did they even
> > make the transfers last any longer before failing.
> >
> > So now I've reached the limits of my understanding, and I need some
> > help devising a fix. If anyone has any comments to that effect, or any
> > questions about my hardware configuration, testing methodology, etc.,
> > please don't hesitate to air them. Also, if anyone needs me to perform
> > additional tests, or collect more log information, I'd be happy to do
> > that as well.
>
> I started writing a tool a while ago to use the internal trace bus to
> log incoming TLPs. Something like that might allow you to get a better
> idea what the faulting access pattern is, but you would still need to
> find a way to mitigate the issue. I'm not all that familiar with USB3
> so I'm not much help on that front.

Oh, interesting, I remember seeing the trace registers in the PHB4
spec, but I wasn't sure how to access them without writing a kernel
driver. I'd love to be able to log and dissect TLPs in Wireshark the
same way I do for USB packets, since it makes reverse engineering
protocols and debugging drivers so much easier. This would also be
especially helpful because I haven't yet figured out how to get Qemu
to intercept certain types of PCIe accesses (I forget if it was DMA or
PIO or something, it was a quite while ago), and PCIe protocol
analyzer hardware is prohibitively expensive (when it's even available
for purchase). So if you've uploaded your code anywhere, I'd be really
interested in seeing it, even if it's incomplete, since even with
incomplete code I could use that as a reference for a Wireshark plugin
or something. But if it's not online or if you'd prefer not to share
it in its current state, I'll understand.


Thanks again for your help,

Forest
