Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECFDD177A86
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 16:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729644AbgCCPfL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 10:35:11 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:38292 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729588AbgCCPfL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Mar 2020 10:35:11 -0500
Received: (qmail 2156 invoked by uid 2102); 3 Mar 2020 10:35:10 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Mar 2020 10:35:10 -0500
Date:   Tue, 3 Mar 2020 10:35:10 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     John Donnelly <John.P.Donnelly@Oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Spurious EHCI interrupts with 5.2 and later on shutdown / init
 6 reboot .
In-Reply-To: <42c1a8c5-aaa6-b875-d173-136509838a32@Oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003031025440.1538-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2 Mar 2020, John Donnelly wrote:

> On 3/2/20 3:56 PM, Alan Stern wrote:
> > On Mon, 2 Mar 2020, John Donnelly wrote:
> > 
> >> Hello linux-usb.
> >>
> >>
> >> I am seeing this message every time a server is rebooted, and it started around 5.2 release. It is benign behavior but it does not occur in prior 4.18 Linux kernels.
> > 
> > What about 4.19?  4.20?  5.0?  And so on...
> > 
> > It still think your best bet for finding out what is happening is to do
> > a bisection.
> 
>    Thank you for the feedback.  This could take awhile !  I will update 
> you on my findings.
> 
> 
> 
> > 
> >> Kernel 5.6.0-rc1.01.el8uek.rc1.x86_64 on an x86_64
> >>
> >>
> >> [  836.063284] irq 18: nobody cared (try booting with the "irqpoll" option)
> >> [  836.143498] CPU: 24 PID: 0 Comm: swapper/24 Kdump: loaded Not tainted
> >> 5.3.6.jpd.01.+ #5
> >> [  836.239310] Hardware name: Oracle Corporation ORACLE SERVER
> >> X5-2/ASM,MOTHERBOARD,1U, BIOS 30140300 09/20/2018
> >> [  836.358010] Call Trace:
> >> [  836.387248]  <IRQ>
> >> [  836.411298]  dump_stack+0x63/0x8a
> >> [  836.450951]  __report_bad_irq+0x3c/0xb6
> >> [  836.496830]  note_interrupt.cold.10+0xb/0x5d
> >> [  836.547916]  handle_irq_event_percpu+0x6f/0x80
> >> [  836.601077]  handle_irq_event+0x3b/0x5a
> >> [  836.646962]  handle_fasteoi_irq+0x90/0x130
> >> [  836.695968]  handle_irq+0x20/0x30
> >> [  836.711139] megaraid_sas 0000:23:00.0: megasas_disable_intr_fusion is
> >> called outbound_intr_mask:0x40000009
> >> [  836.735612]  do_IRQ+0x4e/0xe0
> >> [  836.735616]  common_interrupt+0xf/0xf
> >> [  836.735619]  </IRQ>
> >>
> >> [  336.622666] [<0000000010b50533>] usb_hcd_irq
> >> [  336.673746] [<0000000010b50533>] usb_hcd_irq

Let's try to be a little more precise.  You said this happens "every 
time a server is rebooted".  At first I thought you meant it happened 
during the boot process.  But the timestamps on these log messages 
indicate the unwanted IRQ happened 836 seconds _after_ boot, possibly 
also 336 seconds after.

So when exactly do you see this?

>     Removing the modules BEFORE I do a shutdown does not produce the error - which is kind of surprising . 

What exactly does this mean?  Do you mean that the error does not occur 
at the time the module is removed?  Or do you mean that if you remove 
the module and then reboot, the error does not occur during the reboot?  
Or do you mean that if you remove the module and reboot, the error does 
not occur until the system is booted yet again?

>    It appears the modules are actually loaded by the ramdisk too  - prior to getting to the single user mode when I built them as loadable module .. because I renamed them  so modprobe/udev  would not find them after systemd starts.

This depends on the contents of your initramfs.  Most likely you
rebuilt that along with the kernel, so if the kernel uses modules for
the EHCI drivers then so does the initramfs.

Alan Stern

