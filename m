Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70403EF438
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2019 04:56:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387466AbfKED4V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 22:56:21 -0500
Received: from ec2-52-39-95-60.us-west-2.compute.amazonaws.com ([52.39.95.60]:37503
        "EHLO ip-172-31-12-161.us-west-2.compute.internal"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387443AbfKED4V (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Nov 2019 22:56:21 -0500
X-Greylist: delayed 600 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Nov 2019 22:56:20 EST
Received: by ip-172-31-12-161.us-west-2.compute.internal (Postfix, from userid 110)
        id 781126641F; Tue,  5 Nov 2019 03:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konbu.org;
        s=default; t=1572925378;
        bh=9dAITeCukh7Es6PZQFhpkx/Zm2Noq6O+cDAHH7CuDdM=;
        h=Date:From:To:Cc:Subject:Message-ID;
        b=HDSjnqkveb36+dMSl0zquPhARVPlmquIB9wR5+5Lpayu9moXDM3Ir2nnWf7DUfU0e
         0CLH9FkuVIJMQHd9Iyt1y17AcLCo7NVT4qpGK4VcPtbosPWCnZSbgBwtsOucaMaFAf
         d6cl0NHisMO3eX6XbO2dhZcUWWD5YKgNUAph8AgY=
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        ip-172-31-12-161.us-west-2.compute.internal
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.2
Received: from tungsten (178.231.214.202.rev.vmobile.jp [202.214.231.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ip-172-31-12-161.us-west-2.compute.internal (Postfix) with ESMTPSA id B063A605E5;
        Tue,  5 Nov 2019 03:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konbu.org;
        s=default; t=1572925376;
        bh=9dAITeCukh7Es6PZQFhpkx/Zm2Noq6O+cDAHH7CuDdM=;
        h=Date:From:To:Cc:Subject:Message-ID;
        b=upF4ekXIc6ApcwGybjztjnurbg9j/gWo7ABXKPWKJIR+7H7CFaQk0C/dfbHweLOvG
         OQQTlEeEBZsLoGvDY18GuPydRxmUC2yizGG75VJeO6b+3B3WsCyrfmzF1qc0jaVjz0
         C8gq13LMLGTPgBPsT1/CUAdpJCQ26muKrz2BESS4=
Date:   Tue, 5 Nov 2019 12:39:51 +0900
From:   Boris ARZUR <boris@konbu.org>
To:     linux-usb@vger.kernel.org
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Gevorg Sahakyan <Gevorg.Sahakyan@synopsys.com>,
        John Youn <John.Youn@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20191105033951.GA3498@tungsten>
References: <20191105032922.GA3041@tungsten>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105032922.GA3041@tungsten>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

First post in this list, please be lenient.

Replying to self to give some context: I'm on a Asus c201 (rk3288)
and I see some crashes with cdc_ether.

Here is how to repro:
- create heavy usb network load: I tether my phone and
  netcat some file from it;
- create heavy CPU load (pushd linux; make -j 6)
- observe kernel messages:
dwc2 ff580000.usb: dwc2_hc_chhltd_intr_dma: Channel 7 - ChHltd set, but reason is unknown
dwc2 ff580000.usb: hcint 0x00000002, intsts 0x04200021
dwc2 ff580000.usb: ep_type 0x00000002 bulk /* ba: ADDED LOG */

The kernel will write to 0 at line 2494 below in file drivers/usb/dwc2/hcd.c
2474 static void dwc2_free_dma_aligned_buffer(struct urb *urb)
2475 {
/* ... */
2482 	/* Restore urb->transfer_buffer from the end of the allocated area */
2483 	memcpy(&stored_xfer_buffer,
2484 	       PTR_ALIGN(urb->transfer_buffer + urb->transfer_buffer_length,
2485 			 dma_get_cache_alignment()),
2486 	       sizeof(urb->transfer_buffer));
/* ... */
2494 		memcpy(stored_xfer_buffer, urb->transfer_buffer, length);
/* ... */
2500 }

The fix I propose has been working fine on my machine, but I confess
I am less than familiar with this area...

My guess is that the kernel misses some deadlines due to contention and we
see channel halts. I tried treating these as we do the other (with other end
point types) and it solved the crashes. I verified on next-20191030 that the
data is correctly transfered over the network (no corruption).

Thank you & regards,
Boris.

>Channel halt can happen with BULK endpoints when the
>cpu is under high load. Treating it as an error leads
>to a null-pointer dereference in dwc2_free_dma_aligned_buffer().
>
>Signed-off-by: Boris Arzur <boris@konbu.org>
>---
> drivers/usb/dwc2/hcd_intr.c | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
>index a052d39b4375..697fed530aeb 100644
>--- a/drivers/usb/dwc2/hcd_intr.c
>+++ b/drivers/usb/dwc2/hcd_intr.c
>@@ -1944,7 +1944,8 @@ static void dwc2_hc_chhltd_intr_dma(struct dwc2_hsotg
>*hsotg,
>                         */
>                        dwc2_hc_ack_intr(hsotg, chan, chnum, qtd);
>                } else {
>-                       if (chan->ep_type == USB_ENDPOINT_XFER_INT ||
>+                       if (chan->ep_type == USB_ENDPOINT_XFER_BULK ||
>+                           chan->ep_type == USB_ENDPOINT_XFER_INT ||
>                            chan->ep_type == USB_ENDPOINT_XFER_ISOC) {
>                                /*
>                                 * A periodic transfer halted with no other
>--
>2.23.0
