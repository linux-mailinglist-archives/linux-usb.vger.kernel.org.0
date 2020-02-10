Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6601584DB
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 22:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgBJVjJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 16:39:09 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:35208 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgBJVjJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 16:39:09 -0500
Received: by mail-pj1-f68.google.com with SMTP id q39so326046pjc.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Feb 2020 13:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=VKF4/I66fKSdVDxJHASCOE5T5FlSSr3FRirJUxwtQyk=;
        b=mqEl8hHCz0es7SHMqfM76JDDisCAudpxQZ6Siv/CdiD4CKEMtU4cB7CUayrBDKAq3f
         8ElzqBcGVuLM4DlmmUvpWgnVGGNQyqVSV0GbubrY6iImw1uR3L5iYUisOXJDv7MnSGJI
         puMfHXtizXOtI658y6Pd4rRROGv23Kk80mVK3qEBSI9MTptTIJhkA0yLEL9UI6sFh9KB
         JHnqc1E9pZy2sIRO/F2eNYPpdZeIy/Rb+5POomJwSb2egt+vjYJcoyDe9Gy3AowbRLIx
         zAKlYTXqJ/vmmykobcQxXFFxA8y+U/rOuMhuG9cZy0CfZ80SBE8wbWjRkdH6pOEoiFEJ
         WhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=VKF4/I66fKSdVDxJHASCOE5T5FlSSr3FRirJUxwtQyk=;
        b=luI8rYrXIYgNtcBoYjwGJiGwKxDYPnw99qdsbtadeIAUjDspkJB+WmFSw6XYB4FwEf
         11WFY95Qe3Tky7N68UK3r4IwbkDNzmx3WAOxKAZqlSJlv5xy+ONEXLCqUwMgLhaT443q
         EiDb0eJvkaNZBWfVUA5rV02kO4sH1GD6D8AhDd8pjxl/46mk/qgc8eAEDlNmOf+w2t0e
         U3CPXj2XKwsK3dUJlmUmRkuBIceFDS4C5YXGjFAkzGByGIXImA9Usy5Z1UkIRcqI7UJb
         6wNzKtUKz1eI9763DsM/g16vd4ywyIZGgD2ExvxGnFqYRECHB8v6WlS+UbSPT0C8cW4u
         JCBw==
X-Gm-Message-State: APjAAAUpvRNevYHO0F1ZluPkAnbndl6zZTRIGzrhQ5o9Nl0UQq1VE/rs
        zGIIYtnpJpAlKKNlZerU6a8=
X-Google-Smtp-Source: APXvYqy3k73uFNAS8nGaTXn2BuTF8XAUuNNcyFuVfyEH1m0PeO6wFaYg63owID50wVQryDxbMrZydg==
X-Received: by 2002:a17:902:a711:: with SMTP id w17mr14976474plq.152.1581370748256;
        Mon, 10 Feb 2020 13:39:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z16sm1027240pgl.92.2020.02.10.13.39.07
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Feb 2020 13:39:07 -0800 (PST)
Date:   Mon, 10 Feb 2020 13:39:06 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        FelipeBalbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200210213906.GA24079@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Boris,

On Mon, Feb 10, 2020 at 09:29:10PM +0000, Boris ARZUR wrote:
> <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org>, Minas Harutyunyan <hminas@synopsys.com>,
> William Wu <william.wu@rock-chips.com>, Dmitry Torokhov
> <dmitry.torokhov@gmail.com>, Douglas Anderson <dianders@chromium.org>
> 
> 
> Hello Guenter,
> 
> 
> >good find, and good analysis. We stated to see this problem as well in the
> >latest ChromeOS kernel.
> I'm glad you find my report helpful.
> 
> 
> >be able to reproduce the problem. Maybe you can help me. How do you tether
> >your phone through USB ?
> You mention thethering, so I think you have read my follow-up:
> https://www.spinics.net/lists/linux-usb/msg187497.html
> 

Unfortunately, I have been unable to reproduce the problem. It is seen only
with certain phones and with certain Ethernet adapters, and I was unable
to get any of those. I'll keep trying.

In the meantime, can you by any chance test the attached patch ? It _might_
fix the problem, but it is a bit of a wild shot.

Thanks,
Guenter

---
From 29e0949531a27f14a5b46d70e34aa43546e6a3d1 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Mon, 10 Feb 2020 13:11:00 -0800
Subject: [PATCH] usb: dwc2: constrain endpoint transfer size on split IN

The following messages are seen on Veyron Chromebooks running v4.19 or
later kernels.

dwc2 ff580000.usb: dwc2_update_urb_state(): trimming xfer length
dwc2 ff580000.usb: dwc2_hc_chhltd_intr_dma: Channel 7 - ChHltd set, but reason is unknown
dwc2 ff580000.usb: hcint 0x00000002, intsts 0x04600021

This is typically followed by a crash.

Unable to handle kernel paging request at virtual address 29f9d9fc
pgd = 4797dac9
[29f9d9fc] *pgd=80000000004003, *pmd=00000000
Internal error: Oops: a06 [#1] PREEMPT SMP ARM
Modules linked in: ip6t_REJECT rfcomm i2c_dev uinput hci_uart btbcm ...
CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         4.19.87-07825-g4ab3515f6e4d #1
Hardware name: Rockchip (Device Tree)
PC is at memcpy+0x50/0x330
LR is at 0xdd9ac94
...
[<c0a89f50>] (memcpy) from [<c0783b94>] (dwc2_free_dma_aligned_buffer+0x5c/0x7c)
[<c0783b94>] (dwc2_free_dma_aligned_buffer) from [<c0765dcc>] (__usb_hcd_giveback_urb+0x78/0x130)
[<c0765dcc>] (__usb_hcd_giveback_urb) from [<c07678fc>] (usb_giveback_urb_bh+0xa0/0xe4)
[<c07678fc>] (usb_giveback_urb_bh) from [<c023a164>] (tasklet_action_common+0xc0/0xdc)
[<c023a164>] (tasklet_action_common) from [<c02021f0>] (__do_softirq+0x1b8/0x434)
[<c02021f0>] (__do_softirq) from [<c0239a14>] (irq_exit+0xdc/0xe0)
[<c0239a14>] (irq_exit) from [<c029f260>] (__handle_domain_irq+0x94/0xd0)
[<c029f260>] (__handle_domain_irq) from [<c05da780>] (gic_handle_irq+0x74/0xb0)
[<c05da780>] (gic_handle_irq) from [<c02019f8>] (__irq_svc+0x58/0x8c)

The crash suggests that the memory after the end of a temporary DMA-aligned
buffer is overwritten.

The Raspberry Pi Linux kernel includes a patch suggesting that a similar
problem was observed with the dwg2 otc driver used there. The patch
description is as follows.

    The hcd would unconditionally set the transfer length to the endpoint
    packet size for non-isoc IN transfers. If the remaining buffer length
    was less than the length of returned data, random memory would get
    scribbled over, with bad effects if it crossed a page boundary.

    Force a babble error if this happens by limiting the max transfer size
    to the available buffer space. DMA will stop writing to memory on a
    babble condition.

Apply the same fix to this driver.

Reported-by: Boris ARZUR <boris@konbu.org>
Cc: Boris ARZUR <boris@konbu.org>
Cc: Jonathan Bell <jonathan@raspberrypi.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/dwc2/hcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
index b90f858af960..2c81b346b464 100644
--- a/drivers/usb/dwc2/hcd.c
+++ b/drivers/usb/dwc2/hcd.c
@@ -1264,7 +1264,8 @@ static void dwc2_hc_start_transfer(struct dwc2_hsotg *hsotg,
 			 */
 			chan->xfer_len = 0;
 		else if (chan->ep_is_in || chan->xfer_len > chan->max_packet)
-			chan->xfer_len = chan->max_packet;
+			chan->xfer_len = min_t(uint32_t, chan->xfer_len,
+					       chan->max_packet);
 		else if (!chan->ep_is_in && chan->xfer_len > 188)
 			chan->xfer_len = 188;
 
-- 
2.17.1

