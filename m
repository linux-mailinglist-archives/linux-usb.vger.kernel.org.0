Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96FCB9EA47
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2019 16:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729579AbfH0OBC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Aug 2019 10:01:02 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:39858 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729471AbfH0OBB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Aug 2019 10:01:01 -0400
Received: (qmail 30830 invoked by uid 2102); 27 Aug 2019 10:01:00 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Aug 2019 10:01:00 -0400
Date:   Tue, 27 Aug 2019 10:01:00 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc:     gregkh@linuxfoundation.org, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3] usb: host: ohci: fix a race condition between shutdown
 and irq
In-Reply-To: <1566877910-6020-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Message-ID: <Pine.LNX.4.44L0.1908271000430.1545-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 27 Aug 2019, Yoshihiro Shimoda wrote:

> This patch fixes an issue that the following error is
> possible to happen when ohci hardware causes an interruption
> and the system is shutting down at the same time.
> 
> [   34.851754] usb 2-1: USB disconnect, device number 2
> [   35.166658] irq 156: nobody cared (try booting with the "irqpoll" option)
> [   35.173445] CPU: 0 PID: 22 Comm: kworker/0:1 Not tainted 5.3.0-rc5 #85
> [   35.179964] Hardware name: Renesas Salvator-X 2nd version board based on r8a77965 (DT)
> [   35.187886] Workqueue: usb_hub_wq hub_event
> [   35.192063] Call trace:
> [   35.194509]  dump_backtrace+0x0/0x150
> [   35.198165]  show_stack+0x14/0x20
> [   35.201475]  dump_stack+0xa0/0xc4
> [   35.204785]  __report_bad_irq+0x34/0xe8
> [   35.208614]  note_interrupt+0x2cc/0x318
> [   35.212446]  handle_irq_event_percpu+0x5c/0x88
> [   35.216883]  handle_irq_event+0x48/0x78
> [   35.220712]  handle_fasteoi_irq+0xb4/0x188
> [   35.224802]  generic_handle_irq+0x24/0x38
> [   35.228804]  __handle_domain_irq+0x5c/0xb0
> [   35.232893]  gic_handle_irq+0x58/0xa8
> [   35.236548]  el1_irq+0xb8/0x180
> [   35.239681]  __do_softirq+0x94/0x23c
> [   35.243253]  irq_exit+0xd0/0xd8
> [   35.246387]  __handle_domain_irq+0x60/0xb0
> [   35.250475]  gic_handle_irq+0x58/0xa8
> [   35.254130]  el1_irq+0xb8/0x180
> [   35.257268]  kernfs_find_ns+0x5c/0x120
> [   35.261010]  kernfs_find_and_get_ns+0x3c/0x60
> [   35.265361]  sysfs_unmerge_group+0x20/0x68
> [   35.269454]  dpm_sysfs_remove+0x2c/0x68
> [   35.273284]  device_del+0x80/0x370
> [   35.276683]  hid_destroy_device+0x28/0x60
> [   35.280686]  usbhid_disconnect+0x4c/0x80
> [   35.284602]  usb_unbind_interface+0x6c/0x268
> [   35.288867]  device_release_driver_internal+0xe4/0x1b0
> [   35.293998]  device_release_driver+0x14/0x20
> [   35.298261]  bus_remove_device+0x110/0x128
> [   35.302350]  device_del+0x148/0x370
> [   35.305832]  usb_disable_device+0x8c/0x1d0
> [   35.309921]  usb_disconnect+0xc8/0x2d0
> [   35.313663]  hub_event+0x6e0/0x1128
> [   35.317146]  process_one_work+0x1e0/0x320
> [   35.321148]  worker_thread+0x40/0x450
> [   35.324805]  kthread+0x124/0x128
> [   35.328027]  ret_from_fork+0x10/0x18
> [   35.331594] handlers:
> [   35.333862] [<0000000079300c1d>] usb_hcd_irq
> [   35.338126] [<0000000079300c1d>] usb_hcd_irq
> [   35.342389] Disabling IRQ #156
> 
> ohci_shutdown() disables all the interrupt and rh_state is set to
> OHCI_RH_HALTED. In other hand, ohci_irq() is possible to enable
> OHCI_INTR_SF and OHCI_INTR_MIE on ohci_irq(). Note that OHCI_INTR_SF
> is possible to be set by start_ed_unlink() which is called:
>  ohci_irq()
>   -> process_done_list()
>    -> takeback_td()
>     -> start_ed_unlink()
> 
> So, ohci_irq() has the following condition, the issue happens by
> &ohci->regs->intrenable = OHCI_INTR_MIE | OHCI_INTR_SF and
> ohci->rh_state = OHCI_RH_HALTED:
> 
> 	/* interrupt for some other device? */
> 	if (ints == 0 || unlikely(ohci->rh_state == OHCI_RH_HALTED))
> 		return IRQ_NOTMINE;
> 
> To fix the issue, ohci_shutdown() holds the spin lock while disabling
> the interruption and changing the rh_state flag to prevent reenable
> the OHCI_INTR_MIE unexpectedly. Note that io_watchdog_func() also
> calls the ohci_shutdown() and it already held the spin lock, so that
> the patch makes a new function as _ohci_shutdown().
> 
> This patch is inspired by a Renesas R-Car Gen3 BSP patch
> from Tho Vu.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>

