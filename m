Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E93E1589C5
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 06:50:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727594AbgBKFuE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 00:50:04 -0500
Received: from funyu.konbu.org ([51.15.241.64]:43116 "EHLO funyu.konbu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726942AbgBKFuE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 Feb 2020 00:50:04 -0500
Received: from tungsten (90.203.49.163.rev.vmobile.jp [163.49.203.90])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by funyu.konbu.org (Postfix) with ESMTPSA id 070652885E1;
        Tue, 11 Feb 2020 05:49:57 +0000 (UTC)
Date:   Tue, 11 Feb 2020 14:49:53 +0900
From:   Boris ARZUR <boris@konbu.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-usb@vger.kernel.org,
        FelipeBalbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200211054953.GA2401@tungsten>
References: <20200210213906.GA24079@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210213906.GA24079@roeck-us.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Guenter,

>In the meantime, can you by any chance test the attached patch ? It _might_
>fix the problem, but it is a bit of a wild shot.
I tried your patch, but the machine does not finish booting.


I would like to give you a dump, but the screen scrolls fast, and what's
left when paused is not interesting. How do I get it to dump on disk?

My journalctl doesn't show anything. I have no kmesg.log anywhere.
The first time around I was 0/ changing fonts 1/ trimming the dump message
in the kernel 2/ filming my screen. That's not practical at all...


I have been looking a bit at things. I believe that part of the issue
is the need to re-align the buffer we get in the URB. I'm wondering if asking
for a specific alignment when creating the URB could be doable.


As a stop-gap, maybe doing things like in tegra ehci could fix our bug:
https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-tegra.c#L288
i.e. having the old pointer before the new buffer instead of at the end of
it.

Now if something is overwriting the buffer end, that would also be hiding the
issue... but if the bug is related to lengths that don't match between
allocation and free, that could work. In this case, that would also be
hiding the issue :)


>Unfortunately, I have been unable to reproduce the problem. It is seen only
>with certain phones and with certain Ethernet adapters, and I was unable
>to get any of those. I'll keep trying.
If you want, I can run a kernel with some printk instrumentation or run
experiments. I'll research a bit on how to get that kernel oops data, that
does not involve serial or net console.

Thanks, have a good day,
Boris.


Guenter Roeck wrote:
>Hi Boris,
>
>On Mon, Feb 10, 2020 at 09:29:10PM +0000, Boris ARZUR wrote:
>> <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org>, Minas Harutyunyan <hminas@synopsys.com>,
>> William Wu <william.wu@rock-chips.com>, Dmitry Torokhov
>> <dmitry.torokhov@gmail.com>, Douglas Anderson <dianders@chromium.org>
>> 
>> 
>> Hello Guenter,
>> 
>> 
>> >good find, and good analysis. We stated to see this problem as well in the
>> >latest ChromeOS kernel.
>> I'm glad you find my report helpful.
>> 
>> 
>> >be able to reproduce the problem. Maybe you can help me. How do you tether
>> >your phone through USB ?
>> You mention thethering, so I think you have read my follow-up:
>> https://www.spinics.net/lists/linux-usb/msg187497.html
>> 
>
>Unfortunately, I have been unable to reproduce the problem. It is seen only
>with certain phones and with certain Ethernet adapters, and I was unable
>to get any of those. I'll keep trying.
>
>In the meantime, can you by any chance test the attached patch ? It _might_
>fix the problem, but it is a bit of a wild shot.
>
>Thanks,
>Guenter
>
>---
>From 29e0949531a27f14a5b46d70e34aa43546e6a3d1 Mon Sep 17 00:00:00 2001
>From: Guenter Roeck <linux@roeck-us.net>
>Date: Mon, 10 Feb 2020 13:11:00 -0800
>Subject: [PATCH] usb: dwc2: constrain endpoint transfer size on split IN
>
>The following messages are seen on Veyron Chromebooks running v4.19 or
>later kernels.
>
>dwc2 ff580000.usb: dwc2_update_urb_state(): trimming xfer length
>dwc2 ff580000.usb: dwc2_hc_chhltd_intr_dma: Channel 7 - ChHltd set, but reason is unknown
>dwc2 ff580000.usb: hcint 0x00000002, intsts 0x04600021
>
>This is typically followed by a crash.
>
>Unable to handle kernel paging request at virtual address 29f9d9fc
>pgd = 4797dac9
>[29f9d9fc] *pgd=80000000004003, *pmd=00000000
>Internal error: Oops: a06 [#1] PREEMPT SMP ARM
>Modules linked in: ip6t_REJECT rfcomm i2c_dev uinput hci_uart btbcm ...
>CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.87-07825-g4ab3515f6e4d #1
>Hardware name: Rockchip (Device Tree)
>PC is at memcpy+0x50/0x330
>LR is at 0xdd9ac94
>...
>[<c0a89f50>] (memcpy) from [<c0783b94>] (dwc2_free_dma_aligned_buffer+0x5c/0x7c)
>[<c0783b94>] (dwc2_free_dma_aligned_buffer) from [<c0765dcc>] (__usb_hcd_giveback_urb+0x78/0x130)
>[<c0765dcc>] (__usb_hcd_giveback_urb) from [<c07678fc>] (usb_giveback_urb_bh+0xa0/0xe4)
>[<c07678fc>] (usb_giveback_urb_bh) from [<c023a164>] (tasklet_action_common+0xc0/0xdc)
>[<c023a164>] (tasklet_action_common) from [<c02021f0>] (__do_softirq+0x1b8/0x434)
>[<c02021f0>] (__do_softirq) from [<c0239a14>] (irq_exit+0xdc/0xe0)
>[<c0239a14>] (irq_exit) from [<c029f260>] (__handle_domain_irq+0x94/0xd0)
>[<c029f260>] (__handle_domain_irq) from [<c05da780>] (gic_handle_irq+0x74/0xb0)
>[<c05da780>] (gic_handle_irq) from [<c02019f8>] (__irq_svc+0x58/0x8c)
>
>The crash suggests that the memory after the end of a temporary DMA-aligned
>buffer is overwritten.
>
>The Raspberry Pi Linux kernel includes a patch suggesting that a similar
>problem was observed with the dwg2 otc driver used there. The patch
>description is as follows.
>
>    The hcd would unconditionally set the transfer length to the endpoint
>    packet size for non-isoc IN transfers. If the remaining buffer length
>    was less than the length of returned data, random memory would get
>    scribbled over, with bad effects if it crossed a page boundary.
>
>    Force a babble error if this happens by limiting the max transfer size
>    to the available buffer space. DMA will stop writing to memory on a
>    babble condition.
>
>Apply the same fix to this driver.
>
>Reported-by: Boris ARZUR <boris@konbu.org>
>Cc: Boris ARZUR <boris@konbu.org>
>Cc: Jonathan Bell <jonathan@raspberrypi.org>
>Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>---
> drivers/usb/dwc2/hcd.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
>index b90f858af960..2c81b346b464 100644
>--- a/drivers/usb/dwc2/hcd.c
>+++ b/drivers/usb/dwc2/hcd.c
>@@ -1264,7 +1264,8 @@ static void dwc2_hc_start_transfer(struct dwc2_hsotg *hsotg,
> 			 */
> 			chan->xfer_len = 0;
> 		else if (chan->ep_is_in || chan->xfer_len > chan->max_packet)
>-			chan->xfer_len = chan->max_packet;
>+			chan->xfer_len = min_t(uint32_t, chan->xfer_len,
>+					       chan->max_packet);
> 		else if (!chan->ep_is_in && chan->xfer_len > 188)
> 			chan->xfer_len = 188;
> 
>-- 
>2.17.1
>
