Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B061140823
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jan 2020 11:40:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726684AbgAQKk2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jan 2020 05:40:28 -0500
Received: from dougal.metanate.com ([90.155.101.14]:16916 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbgAQKk2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 17 Jan 2020 05:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References
        :In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=0gTzcCMTsUwDKWsISkssm8z26Q8j9Dmeq01vPExB8Oc=; b=MU2kiHWt7h7Lu1aXg3DV8grub+
        56JreiVv6BS65JbzlkLA6Cq0lEIblL/1DuQ5B/p0sDO4XPgls2LW/mHX2uzwYBijhBIQno4Csk/jL
        fvle0f48xM2jBT14UTmNlebTjaAIik6idPuDFB5VVPXfNxrOEqmNY8xI2d9oK2yaLcb5VndaemYNa
        baGYnSQdVG6CUoQkII60JYcj12P6PtK/nc98JNxCEdYrIQksIovt756s9WK/KhWUs3vVmZHMVFmdf
        te2OtyGWA0tTzN5ER16mVRZQqDTxzyXxDSqpiqWnj72ENlHJBlTROZ4gRBVFR3osf++Z+25/o24Fs
        ZAwExMYQ==;
Received: from johnkeeping.plus.com ([81.174.171.191] helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1isP3B-0003ir-PC; Fri, 17 Jan 2020 10:40:26 +0000
Date:   Fri, 17 Jan 2020 10:40:22 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: gadget: u_audio: Fix high-speed max packet size
Message-ID: <20200117104022.5bb769f2.john@metanate.com>
In-Reply-To: <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
        <60bf144a-2039-8832-b6f1-f972de6a6846@ivitera.com>
        <cfcef91b-799e-7d02-4a4c-26ee95e85ff7@ivitera.com>
        <20200114200450.064cd521.john@metanate.com>
        <24f0935d-16a7-4301-78f4-fa459e356ca9@ivitera.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 16 Jan 2020 16:39:50 +0100
Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> > I've taken a look at this and the patch below fixes it in my simple
> > testing.  But note that this doesn't adjust the PCM's min_period_bytes
> > which will be necessary if you want to minimize latency with an adjusted
> > high-speed bInterval setting.
> >   
> 
> Please can I ask you to submit your patch? IMO your perhaps slightly 
> suboptimal solution is much better than the current broken version.

Yes, the patch is definitely an improvement.  I thought it would be
picked up from the earlier mail, but I think Patchwork requires the
subject to match, so I'm including it again here.

Are you able to provide a Tested-by for this change?

-- >8 --
Prior to commit eb9fecb9e69b ("usb: gadget: f_uac2: split out audio
core") the maximum packet size was calculated only from the high-speed
descriptor but now we use the largest of the full-speed and high-speed
descriptors.

This is correct, but the full-speed value is likely to be higher than
that for high-speed and this leads to submitting requests for OUT
transfers (received by the gadget) which are larger than the endpoint's
maximum packet size.  These are rightly rejected by the gadget core.

config_ep_by_speed() already sets up the correct maximum packet size for
the enumerated speed in the usb_ep structure, so we can simply use this
instead of the overall value that has been used to allocate buffers for
requests.

Note that the minimum period for ALSA is still set from the largest
value, and this is unavoidable because it's possible to open the audio
device before the gadget has been enumerated.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/usb/gadget/function/u_audio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 6d956f190f5a..e6d32c536781 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -361,7 +361,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 	ep = audio_dev->out_ep;
 	prm = &uac->c_prm;
 	config_ep_by_speed(gadget, &audio_dev->func, ep);
-	req_len = prm->max_psize;
+	req_len = ep->maxpacket;
 
 	prm->ep_enabled = true;
 	usb_ep_enable(ep);
@@ -379,7 +379,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
 			req->context = &prm->ureq[i];
 			req->length = req_len;
 			req->complete = u_audio_iso_complete;
-			req->buf = prm->rbuf + i * prm->max_psize;
+			req->buf = prm->rbuf + i * ep->maxpacket;
 		}
 
 		if (usb_ep_queue(ep, prm->ureq[i].req, GFP_ATOMIC))
@@ -430,9 +430,9 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	uac->p_pktsize = min_t(unsigned int,
 				uac->p_framesize *
 					(params->p_srate / uac->p_interval),
-				prm->max_psize);
+				ep->maxpacket);
 
-	if (uac->p_pktsize < prm->max_psize)
+	if (uac->p_pktsize < ep->maxpacket)
 		uac->p_pktsize_residue = uac->p_framesize *
 			(params->p_srate % uac->p_interval);
 	else
@@ -457,7 +457,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 			req->context = &prm->ureq[i];
 			req->length = req_len;
 			req->complete = u_audio_iso_complete;
-			req->buf = prm->rbuf + i * prm->max_psize;
+			req->buf = prm->rbuf + i * ep->maxpacket;
 		}
 
 		if (usb_ep_queue(ep, prm->ureq[i].req, GFP_ATOMIC))
-- 
2.24.1

