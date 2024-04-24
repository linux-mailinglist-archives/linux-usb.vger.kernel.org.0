Return-Path: <linux-usb+bounces-9692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D58AFE33
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 04:11:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26E14284B2E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 02:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA12DDA0;
	Wed, 24 Apr 2024 02:11:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 3C26C125C1
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 02:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713924679; cv=none; b=nM8sFBOZboJ2eGDE3k7x87beL7f+zgQZ9DChvdo+/KBH4od1xl9NFrFdarJvw1RifwTh/8zqLZPtP+DainV5JKCoVwoQNaSbnFREWRX7o1Obq0JqQH7d7NuGKt2LI84pnypLnGhvt8fR089cGAlTNOmtwIONrv64sQR+WR94NR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713924679; c=relaxed/simple;
	bh=Tdsk7eICqVr//3oYpJ3uABGlvo2OwgUft5PCXW+hkzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9t3U803WDm/z7YMmWdo+xcDqntZ0rrM2aVw4Y416LGJz/ffj8L8IqFh8cX2KHBpmA9/78tRAGMMVfsNWBvmpDchwvKnHh+bPM/4DsJF08Qb8rpCpOffHPaPBPaUdURacMUCQsutfGzt0IaKBGnSQwmIw0NY+UyaKcp77I/LfLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 437083 invoked by uid 1000); 23 Apr 2024 22:11:14 -0400
Date: Tue, 23 Apr 2024 22:11:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  linux-usb@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
  qemu-devel@nongnu.org
Subject: Re: Problems (timeouts) when testing usb-ohci with qemu
Message-ID: <27fd4d9c-3be3-4d3d-87e3-8eddc507a634@rowland.harvard.edu>
References: <4664cf39-5dfe-4557-959d-149640ca36e1@roeck-us.net>
 <10f44ba3-51a4-42a6-85c7-f8068b56fee1@rowland.harvard.edu>
 <52bac533-6b22-49b0-8390-ded9c075e72b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52bac533-6b22-49b0-8390-ded9c075e72b@roeck-us.net>

On Tue, Apr 23, 2024 at 02:10:13PM -0700, Guenter Roeck wrote:
> Hi Alan,
> 
> On 4/23/24 10:30, Alan Stern wrote:
> > On Tue, Apr 23, 2024 at 10:04:17AM -0700, Guenter Roeck wrote:
> > > Hi,
> > > 
> > > when testing usb-ohci
> > 
> > What is usb-ohci?  Do you mean ohci-hcd?
> > 
> > >   with qemu's pci-ohci emulation, I keep getting
> > > random usb interface timeouts. Sometimes the usb_hub_wq times out.
> > ...
> > 
> > > Sometimes there is an i/o scheduling timeout such as
> > ...
> > 
> > > This is not a new problem; I have seen it forever. Recently I spent some
> > > time trying to understand the problem and found that the linux driver does
> > > not always handle all ohci interupts.
> > 
> > Please be more specific: _Which_ interrupts aren't being handled?  That
> > is, which flags remain set in the intrstatus register when the handler
> > returns?
> > 
> Sorry, I didn't think it was relevant.
> 
> Here is the result of repeating the test with the linux patch several times
> and passing the log output through "sort | uniq".
> 
>       1 pending 0x2 mask 0x8000005a
>       9 pending 0x4 mask 0x8000001e
>     208 pending 0x4 mask 0x8000005e
> 
> So it is almost always OHCI_INTR_SF and rarely OHCI_INTR_WDH.

I see.  Both of those flags can legitimately get turned on while the 
interrupt routine is running, and under heavy load this could happen fairly 
frequently.  The SF (Start of Frame) interrupt occurs once every 
millisecond, and the WDH (Writeback Done Head) interrupt occurs more or 
less when a transfer completes.

> For reference, this is repeatedly running
> 
> CMDLINE="panic=-1 kunit.stats_enabled=2 kunit.filter=speed>slow root=/dev/sda rootwait console=ttyS0,115200 earlycon=uart8250,mmio,0x10000000,115200"
> qemu-system-riscv32 -M virt -m 512M \
>      -no-reboot -bios default -kernel arch/riscv/boot/Image -snapshot \
>      -device virtio-net-device,netdev=net0 -netdev user,id=net0 -usb \
>      -device pci-ohci,id=ohci -device usb-storage,bus=ohci.0,drive=d0 \
>      -drive file=rootfs.ext2,if=none,id=d0,format=raw \
>      -append "${CMDLINE}" \
>      -nographic -monitor none \
>      --trace 'usb*' -D "/tmp/usb-ohci.$$.${sequence}.trace.log"
> 
> Tracing isn't really necessary but it changes timing enough that
> the problem is more likely to be seen if it is active. The problem
> is seen with various emulations; I just picked one of them.
> 
> > >   Since the interrupt is shared and
> > > thus level triggered, that means that interrupts are still pending when
> > > ohci_irq() exits. The interrupt core in Linux does not re-enter the
> > > interrupt handler, presumably because it is marked as shared interrupt
> > > and returns that the interrupt has been handled.
> > 
> > Isn't that behavior mistaken?  A level-triggered IRQ that remains set when
> > it is re-enabled (when the various shared handlers return) should cause
> > another interrupt to occur right away.
> > 
> > Edged-triggered interrupts would be a different story, of course.
> > 
> 
> Maybe I got it wrong; I thought that shared interrupts would have to be
> level triggered. But then you are correct: one would think that level
> triggered interrupts would keep executing interrupt handlers until the
> interrupt is completely handled. I guess that means that I don't really
> understand what is happening. Sorry for jumping to conclusions.

To avoid the overhead of repeated interrupts, it would be best to check the 
interrupt status at the end of the routine and restart if any of the 
enabled bits are set, as in your first patch.

If you would like to clean it up (get rid of the debugging stuff) and 
submit it, I'll review it.

> > > I found two possible fixes for the problem. One essentially mirrors the
> > > code from ehci_irq(), the other adds a (bad) kludge into qemu. Both "fix"
> > > or work around the problem.
> > > 
> > > Question is: What is actually wrong ? Something in the generic interrupt
> > > handling code in Linux, something in the Linux usb-ohci driver, or
> > > something in qemu ? Any idea how a proper fix might look like ?
> > 
> > To answer these questions we need more information.
> > 
> What else would you need ?

Nothing else really, just the remaining interrupt flag bits.

Alan Stern

