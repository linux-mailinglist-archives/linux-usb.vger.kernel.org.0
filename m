Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED449220A87
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 12:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731336AbgGOKuj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 06:50:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:40118 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729010AbgGOKui (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 06:50:38 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB16A206F4;
        Wed, 15 Jul 2020 10:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594810238;
        bh=kPUMiCx/Sxqe8a0E/tY68d5CGYOnZloz6gj4Vrsvt5Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OgqPcdgEV7UuhW0mYpNU54CVmmVTAjnOf5vF+W4DVpAH1GcZjZe4jPrulHuW42nwX
         ltde2ZvtHr8NruOCewgM9DDnZD0H7H3CwJOPfM77wMjrnD1Tela3gx2Rz6FJXTvGg6
         qo36NCQgxXvhRSJORReCAj7mGDLVZK8Jbz6TMIg0=
Date:   Wed, 15 Jul 2020 12:50:34 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Guillen Fandos <david@davidgf.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: System crash/lockup after plugging CDC ACM device
Message-ID: <20200715105034.GB2880893@kroah.com>
References: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
 <20200715093029.GB2759174@kroah.com>
 <867592c41350b09a0cb67e9a3924f8a2f758d79a.camel@davidgf.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867592c41350b09a0cb67e9a3924f8a2f758d79a.camel@davidgf.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 15, 2020 at 12:31:42PM +0200, David Guillen Fandos wrote:
> On Wed, 2020-07-15 at 11:30 +0200, Greg KH wrote:
> > On Wed, Jul 15, 2020 at 10:58:03AM +0200, David Guillen Fandos wrote:
> > > Hello linux-usb,
> > > 
> > > I think I might have found a kernel bug related to the USB
> > > subsystem
> > > (cdc_acm perhaps).
> > > 
> > > Context: I was playing around with a device I'm creating,
> > > essentially a
> > > USB quad modem device that exposes four modems to the host system.
> > > This
> > > device is still a prototype so there's a few bugs here and there,
> > > most
> > > likely in the USB descriptors and control requests.
> > > 
> > > What happens: After plugging the device the system starts spitting
> > > warnings and BUGs and it locks up. Most of the time some CPUs get
> > > into
> > > some spinloop and never comes back (you can see it being detected
> > > by
> > > the watchdog after a few seconds). Generally after that the USB
> > > devices
> > > stop working completely and at some point the machine freezes
> > > completely. In a couple of ocasions I managed to see a bug in dmesg
> > > saying "unable to handle page fault for address XXX" and
> > > "Supervisor
> > > read access in kernel mode" "error code (0x0000) not present page".
> > > I
> > > could not get a trace for that one since the kernel died completely
> > > and
> > > my log files were truncated/lost.
> > > 
> > > Since it is happening to my two machines (both Intel but rather
> > > different controllers, Sunrise Point-LP USB 3.0 vs 8 Series/C220)
> > > and
> > > with different kernel versions I suspect this might be a bug in the
> > > kernel.
> > > 
> > > I have 4 logs that I collected, they are sort of long-ish, not sure
> > > how
> > > to best send them to the list.
> > 
> > Send the crashes with the callback list, that should be quite small,
> > right?  We don't need the full log.
> > 
> > The first crash is the most important, the others can be from the
> > first
> > one and are not reliable.
> > 
> > thanks,
> > 
> > greg k-h
> 
> Ok then, here comes one of the logs, I selected some bits only
> 
> [  147.302016] WARNING: CPU: 3 PID: 134 at kernel/workqueue.c:1473
> __queue_work+0x364/0x410
> [...]
> [  147.302322] Call Trace:
> [  147.302329]  <IRQ>
> [  147.302342]  queue_work_on+0x36/0x40
> [  147.302353]  __usb_hcd_giveback_urb+0x9c/0x110
> [  147.302362]  usb_giveback_urb_bh+0xa0/0xf0
> [  147.302372]  tasklet_action_common.constprop.0+0x66/0x100
> [  147.302382]  __do_softirq+0xe9/0x2dc
> [  147.302391]  irq_exit+0xcf/0x110
> [  147.302397]  do_IRQ+0x55/0xe0
> [  147.302408]  common_interrupt+0xf/0xf
> [  147.302413]  </IRQ>
> [...]
> [  184.771172] watchdog: BUG: soft lockup - CPU#3 stuck for 23s!
> [kworker/3:2:134]

That was the first message?

Ok, we need some more logs, how about the 30 lines right before the
above?

And what kernel version are you using?

thanks,

greg k-h
