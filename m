Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3FB1669C2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2020 22:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgBTVWr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Feb 2020 16:22:47 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34072 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726670AbgBTVWr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Feb 2020 16:22:47 -0500
Received: by mail-pg1-f196.google.com with SMTP id j4so2568204pgi.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2020 13:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oUhf/arnESdKeUisHAtTr8f7Z8Cev3fQ1slJwgvAd7k=;
        b=NyXEkUJV/nR22LgB3YZH8z7IlxMTj3n2mEY0cPycwLkocqXc1LHtiXRSgkBUurQD5o
         B9xUqNYHIGaJlf2yfIuYCFDRXXsHTTB51t3UX1dbnZa9FhEEkqhw5oXNkTha0ql7DCmH
         f4vd7H1B8bK/W08KMKrTfqfTGe6etkkFcgg1Ukxix3WijT/B1d8zLxTkOiX6J8QRU6q6
         EGOAmdEqPLCDHvLtnI94Nat7uq4R5m473YKxajK1PVP7ybsePeJhyV54U8xucsq/1dcw
         MrnNNPWghnJp98goAc8BLnDU+CiKvKuififKNO1zo17o4rqNg/4Hk2dzRqX/o5wnDhwI
         pz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=oUhf/arnESdKeUisHAtTr8f7Z8Cev3fQ1slJwgvAd7k=;
        b=lU3Z2j+nX6ruimwaG3s7+0r5P+iiMPCASnRt6l8BRmeWy8MI+EpmLnPEC8uUn7C/Sa
         OnMDs1qOpF/bQuFFAFzkl6eVePQxRrvmlS3e1rC8+b/pQ43dX8ZAxb8mQrOnnAEmvirS
         vALuEwT20Eyn2BygXGvKy8zDs0vrm74HUuohI17f8ZGgs4B1AVB3CjR2A2jtaq0QaBuX
         jpw44rd8IrmrrdZRmedwWBMTUVWk2DeyvK3W2XuVwXKp8hKfKayEVfFRJpboK+qkYA65
         xpo3ZNfGZN/ZPOkuvpjM0QqGt5r6je1qO9Yuz+p2xaxsnbt9N41Ogy6DBqWhNBV4WMWE
         tXWw==
X-Gm-Message-State: APjAAAXtWN4nsgTvLbqCl2Oo5DvNKua9OA+gvspdrJg2cXPFH7BpDDRY
        5iiIwjVllL6VXVoQzmM0M8c=
X-Google-Smtp-Source: APXvYqyRKWRz0zy0g6aXcvjwFCzl2oPEbaqEJWdUTSazPAJ00QVa4XPFDek6UyWG718oh2ZfnWcFZg==
X-Received: by 2002:a63:ff05:: with SMTP id k5mr34458057pgi.185.1582233766428;
        Thu, 20 Feb 2020 13:22:46 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w11sm521202pfn.4.2020.02.20.13.22.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 13:22:45 -0800 (PST)
Date:   Thu, 20 Feb 2020 13:22:44 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
Message-ID: <20200220212244.GA26054@roeck-us.net>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten>
 <20200211161522.GA1894@roeck-us.net>
 <20200215053647.GA10345@tungsten>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200215053647.GA10345@tungsten>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Boris,

On Sat, Feb 15, 2020 at 02:36:47PM +0900, Boris ARZUR wrote:
> Hi Guenter,
> 
> >> The first time around I was 0/ changing fonts 1/ trimming the dump message
> >> in the kernel 2/ filming my screen. That's not practical at all...
> Mmm, pstore does seem to work on my machine. CHROME_PSTORE is not available
> to me because I'm not on x86, I just enabled the rest and nothing pops up
> in /sys/fs/pstore...
> 
> So I took pictures (OCR did not help):
> - https://funyu.konbu.org/pQUF2P08etcpVxuKZ0A720%2b0/IMG_20200215_134343.jpg.webp
>   is a stack trace for your earlier patch "min_t", in
>   https://www.spinics.net/lists/linux-usb/msg191019.html ;
> - https://funyu.konbu.org/pQUF2P08etcpVxuKZ0A720%2b0/IMG_20200215_135816.jpg.webp
>   is a stack trace for your later patch "container_of", in
>   https://www.spinics.net/lists/linux-usb/msg191074.html .
> 
> Both patches crash (without even loading the machine), but "container_of" is
> a bit more resilient.
> 

Please find yet another patch attached. This one applies on top of the two
patches I sent you yesterday. This patch still needs more testing, but it
or something similar will be essential to fix the problem.

Thanks,
Guenter

---
From 2ac7dd226942c48532587f69e48491de940176e2 Mon Sep 17 00:00:00 2001
From: Guenter Roeck <linux@roeck-us.net>
Date: Thu, 20 Feb 2020 12:47:57 -0800
Subject: [PATCH] usb: dwc2: Abort transaction after errors if the receive
 buffer is full.

In some situations, the following error messages are reported.

dwc2 ff540000.usb: dwc2_hc_chhltd_intr_dma: Channel 1 - ChHltd set, but reason is unknown
dwc2 ff540000.usb: hcint 0x00000002, intsts 0x04000021

This is sometimes followed by:

dwc2 ff540000.usb: dwc2_update_urb_state_abn(): trimming xfer length

and then:

WARNING: CPU: 0 PID: 0 at kernel/v4.19/drivers/usb/dwc2/hcd.c:2913
			dwc2_assign_and_init_hc+0x98c/0x990

The warning suggests an odd buffer address to be used for DMA.

After the first messages, the receive buffer is full (urb->actual_length
>= urb->length). However, the urb is still left in the queue. When it is
selected again, the dwc2 hcd code translates this into a 1-block transfer;
the length of that transfer depends on the endpoint's maximum block size.
If and when that packet is received, it is placed at the end of the
receive buffer (which was already full). This can have all kinds of
adverse affects.

To solve the problem, abort input transactions if there was an error and
the receive buffer is full. We could possibly handle this situation as
"transfer complete", but that seems risky since we don't really know why
the transaction was aborted.

Cc: Boris ARZUR <boris@konbu.org>
Cc: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/usb/dwc2/hcd_intr.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/hcd_intr.c b/drivers/usb/dwc2/hcd_intr.c
index a052d39b4375..1d99af809033 100644
--- a/drivers/usb/dwc2/hcd_intr.c
+++ b/drivers/usb/dwc2/hcd_intr.c
@@ -1167,8 +1167,11 @@ static void dwc2_hc_stall_intr(struct dwc2_hsotg *hsotg,
  * abnormal condition before the transfer completes. Modifies the
  * actual_length field of the URB to reflect the number of bytes that have
  * actually been transferred via the host channel.
+ *
+ * Return true if the receive buffer is full on an input transaction,
+ * false otherwise.
  */
-static void dwc2_update_urb_state_abn(struct dwc2_hsotg *hsotg,
+static bool dwc2_update_urb_state_abn(struct dwc2_hsotg *hsotg,
 				      struct dwc2_host_chan *chan, int chnum,
 				      struct dwc2_hcd_urb *urb,
 				      struct dwc2_qtd *qtd,
@@ -1199,6 +1202,8 @@ static void dwc2_update_urb_state_abn(struct dwc2_hsotg *hsotg,
 		 urb->actual_length);
 	dev_vdbg(hsotg->dev, "  urb->transfer_buffer_length %d\n",
 		 urb->length);
+
+	return chan->ep_is_in && urb->actual_length >= urb->length;
 }
 
 /*
@@ -1973,10 +1978,15 @@ static void dwc2_hc_chhltd_intr_dma(struct dwc2_hsotg *hsotg,
 			 "NYET/NAK/ACK/other in non-error case, 0x%08x\n",
 			 chan->hcint);
 error:
-		/* Failthrough: use 3-strikes rule */
-		qtd->error_count++;
-		dwc2_update_urb_state_abn(hsotg, chan, chnum, qtd->urb,
-					  qtd, DWC2_HC_XFER_XACT_ERR);
+		/*
+		 * Failthrough: use 3-strikes rule. Abort input transactions
+		 * after errors if the receive buffer is full.
+		 */
+		if (dwc2_update_urb_state_abn(hsotg, chan, chnum, qtd->urb,
+					      qtd, DWC2_HC_XFER_XACT_ERR))
+			qtd->error_count = 3;
+		else
+			qtd->error_count++;
 		dwc2_hcd_save_data_toggle(hsotg, chan, chnum, qtd);
 		dwc2_halt_channel(hsotg, chan, qtd, DWC2_HC_XFER_XACT_ERR);
 	}
-- 
2.17.1

