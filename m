Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF47136BED
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jan 2020 12:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727710AbgAJL2Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jan 2020 06:28:24 -0500
Received: from dougal.metanate.com ([90.155.101.14]:24966 "EHLO metanate.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727685AbgAJL2Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jan 2020 06:28:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=metanate.com;
         s=stronger; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References
        :In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=9UVcHhyzY5K16TcQ5yTzjUzazOe1PQWT54GHNs0Y9a8=; b=dDg0x7rwv9gCKvSXDhQ2xX5Cb/
        eCGjC6upLQL5CFktP1F2mmMi+l40JdgfuFFtd35BHyt5QSui71eZcTjByod9wW5hzVU5x6+HzgN6s
        OEs3M6yRxsUea4CFAt3yT5L+LDBoe8VNXjEi0UCKxRYStnOadrIP74ciYLXNkwJeTyTUegmuR1OwQ
        kCndl0yJ6QjQntbUAZ0ez4NTEy9nO5duuU/ao7U2mZhj8nZ745bjyfZqv60+pKTgVTbO2RYYVsNz0
        tCcNUXv4pVi/NjYoGClgnu8C4vJ9dUkGvhmhYqpTtYmVbkd0MAeo3L0OqHfsLv/9g4J6/2HxJ5sww
        96wPG8bg==;
Received: from johnkeeping.plus.com ([81.174.171.191] helo=donbot)
        by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <john@metanate.com>)
        id 1ipsSj-0003gJ-GL; Fri, 10 Jan 2020 11:28:21 +0000
Date:   Fri, 10 Jan 2020 11:28:14 +0000
From:   John Keeping <john@metanate.com>
To:     Pavel Hofman <pavel.hofman@ivitera.com>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: [PATCH] usb: gadget: f_uac2: fix packet size calculation
Message-ID: <20200110112814.1abf2075.john@metanate.com>
In-Reply-To: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
References: <4f2df2bc-e208-fffb-48e2-3e14cd093103@ivitera.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authenticated: YES
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 10 Jan 2020 08:29:06 +0100
Pavel Hofman <pavel.hofman@ivitera.com> wrote:

> Together with dwc2 maintainer Minas Harutyunyan we have been
> troubleshooting various issues of dwc2 on RPi4. We hit a problem where
> the g_audio in capture (EP OUT, playback from USB host) requests req->
> length larger than maxpacket*mc.
> 
> As a workaround we removed the check in dwc2/gadget.c, however that is
> not a proper solution. Minas with his team decided to add a patch where 
> dwc2 will rejecting this type of wrong requests in dwc2_hsotg_ep_queue()
> function, to not process these request at all. The f_uac2 + g_audio
> gadget should restrain from sending such requests.
> 
> Steps to reproduce:
> 
> * Changing fs_epout_desc.bInterval in f_uac2.c from 4 (1ms) to 1 (125us) 
> - the goal is to maximize available throughput of the audio gadget
> 
> * Loading the g_audio module with c_srate=48000, c_ssize=2, c_chmask=2 - 
> i.e. standard 48kHz/16bit/2ch USB playback -> alsa capture
> 
> This combination produces mps=24 and mc=1 for EP OUT. Yet the audio 
> function driver sometimes queues request with req->length 192.

This sounded familiar to me, and I realised that I've been running with
a patch for this case that I never submitted upstream.

Does the patch below fix the issue you're seeing?

-- >8 --
The packet size for USB audio must always be a multiple of the frame
size, otherwise we are transmitting a partial frame which omits some
channels (and these end up at the wrong offset in the next packet).
Furthermore, it breaks the residue handling such that we end up trying
to send a packet exceeding the maximum packet size for the endpoint.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/usb/gadget/function/u_audio.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index cf4f2358889b..6d956f190f5a 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -407,7 +407,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	struct usb_ep *ep;
 	struct uac_rtd_params *prm;
 	struct uac_params *params = &audio_dev->params;
-	unsigned int factor, rate;
+	unsigned int factor;
 	const struct usb_endpoint_descriptor *ep_desc;
 	int req_len, i;
 
@@ -426,13 +426,15 @@ int u_audio_start_playback(struct g_audio *audio_dev)
 	/* pre-compute some values for iso_complete() */
 	uac->p_framesize = params->p_ssize *
 			    num_channels(params->p_chmask);
-	rate = params->p_srate * uac->p_framesize;
 	uac->p_interval = factor / (1 << (ep_desc->bInterval - 1));
-	uac->p_pktsize = min_t(unsigned int, rate / uac->p_interval,
+	uac->p_pktsize = min_t(unsigned int,
+				uac->p_framesize *
+					(params->p_srate / uac->p_interval),
 				prm->max_psize);
 
 	if (uac->p_pktsize < prm->max_psize)
-		uac->p_pktsize_residue = rate % uac->p_interval;
+		uac->p_pktsize_residue = uac->p_framesize *
+			(params->p_srate % uac->p_interval);
 	else
 		uac->p_pktsize_residue = 0;
 
-- 
2.24.1

