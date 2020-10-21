Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0D6294658
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 03:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439879AbgJUBrf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 21:47:35 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:44672 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2439862AbgJUBrf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Oct 2020 21:47:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603244853; h=In-Reply-To: Content-Transfer-Encoding:
 Content-Type: MIME-Version: References: Message-ID: Subject: Cc: To:
 From: Date: Sender; bh=wFHu37kzKF9fQAzvjssPeJi+hKQWbibFgYJweBSq16A=; b=hMC2Ex/9DU5+4LUWWo8Gy7M/3t7r+vz5cXKZZGOtFFwR8Ps7IsGfsdpWS8toUxnbjf5OY4yL
 M/HeK872O87EIgumNDu6VYAEySN6AkMfRm1h1SKGk6BMv0LPBV6oGCpUZWzfqYrMO2H+CBTX
 yeicNOsHAq9av7Peo/1pyFZKDQo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f8f9335d6d00c7a9e72a441 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Oct 2020 01:47:33
 GMT
Sender: jackp=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 31CD6C433FE; Wed, 21 Oct 2020 01:47:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 49008C433F1;
        Wed, 21 Oct 2020 01:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 49008C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jackp@codeaurora.org
Date:   Tue, 20 Oct 2020 18:47:25 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Ferry Toth <fntoth@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" 
        <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
Message-ID: <20201021014725.GA26640@jackp-linux.qualcomm.com>
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org>
 <a565dc52-27ab-f5be-4fee-5a8f96d66456@gmail.com>
 <874kmpf583.fsf@kernel.org>
 <d0aca346-353c-d74e-6f00-ccd2a4ed26ef@gmail.com>
 <976cea12-e54e-fbca-6c53-e6ef5c554094@synopsys.com>
 <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <645b6ddc-d4f5-3f5b-b85f-b3d27fc365f5@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Thinh, Ferry,

On Tue, Oct 20, 2020 at 10:58:31PM +0000, Thinh Nguyen wrote:
> Thinh Nguyen wrote:
> > Hi,
> >
> > Ferry Toth wrote:
> >> Op 20-10-2020 om 14:32 schreef Felipe Balbi:
> >>> Hi,
> >>>
> >>> Ferry Toth <fntoth@gmail.com> writes:
> >>>
> >>> 8< snip
> >>>
> >>>>>> [   12.657416] CR2: 0000000100000000
> >>>>>> [   12.660729] ---[ end trace 9b92dea6da33c71e ]---
> >>>>> It this something you can reproduce on your end? Ferry, can you get
> >>>>> dwc3
> >>>>> trace logs when this happens? ftrace_dump_on_oops may help here.
> >>>> I will do that tonight. Is flipping on ftrace_dump_on_oops
> >>>> sufficient or
> >>>> do I need to do more?
> >>> you'd have to enable dwc3 trace events first ;-)
> >>>
> >>>> BTW after posting this I found in host mode dwc3 is not working
> >>>> properly
> >>>> either. No oops, but no driver get loaded on device plug in.
> >>> okay
> >>>
> >> Ehem, you maybe only me to enable /dwc3/dwc3_ep_dequeue/enable:
> >>
> >> root@edison:/boot# uname -a
> >> Linux edison 5.9.0-edison-acpi-standard #1 SMP Mon Oct 19 20:17:04 UTC
> >> 2020 x86_64 x86_64 x86_64 GNU/Linux
> >> root@edison:/boot# echo 1 >
> >> /sys/kernel/debug/tracing/events/dwc3/dwc3_ep_dequeue/enable
> >> root@edison:/boot# echo 1 > /proc/sys/kernel/ftrace_dump_on_oops
> >> root@edison:/boot#
> >> root@edison:/boot# [ 2608.585323] BUG: kernel NULL pointer
> >> dereference, address: 0000000000000000
> >> [ 2608.592288] #PF: supervisor read access in kernel mode
> >> [ 2608.597419] #PF: error_code(0x0000) - not-present page
> >> [ 2608.602549] PGD 0 P4D 0
> >> [ 2608.605090] Oops: 0000 [#1] SMP PTI
> >> [ 2608.608580] CPU: 1 PID: 733 Comm: irq/15-dwc3 Not tainted
> >> 5.9.0-edison-acpi-standard #1
> >> [ 2608.616571] Hardware name: Intel Corporation Merrifield/BODEGA BAY,
> >> BIOS 542 2015.01.21:18.19.48
> >> [ 2608.625356] RIP: 0010:dwc3_gadget_ep_dequeue+0x41/0x1c0
> >> [ 2608.630580] Code: e9 51 01 00 00 4c 8d a3 30 01 00 00 4c 89 e7 e8
> >> 15 e6 42 00 49 8b 4e 48 49 89 c5 49 8d 46 48 48 8d 51 a0 48 39 c8 75
> >> 0f eb 2e <48> 8b 4a 60 48 8d 51 a0 48 39 c8 74 21 48 39 d5 75 ee 45 31
> >> f6 4c
> >> [ 2608.649320] RSP: 0018:ffffa838002a7c40 EFLAGS: 00010087
> >> [ 2608.654543] RAX: ffff9a5f4609c048 RBX: ffff9a5f46f48028 RCX:
> >> 0000000000000000
> >> [ 2608.661666] RDX: ffffffffffffffa0 RSI: 0000000000000008 RDI:
> >> ffff9a5f46f48158
> >> [ 2608.668790] RBP: ffff9a5f7bd09b40 R08: 00000000000002d8 R09:
> >> ffff9a5f7dd6a000
> >> [ 2608.675913] R10: ffffa838002a7d90 R11: ffff9a5f46f48300 R12:
> >> ffff9a5f46f48158
> >> [ 2608.683039] R13: 0000000000000046 R14: ffff9a5f4609c000 R15:
> >> ffff9a5f7ad77e00
> >> [ 2608.690165] FS:  0000000000000000(0000) GS:ffff9a5f7e300000(0000)
> >> knlGS:0000000000000000
> >> [ 2608.698244] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> [ 2608.703980] CR2: 0000000000000000 CR3: 000000003780a000 CR4:
> >> 00000000001006e0
> >> [ 2608.711102] Call Trace:
> >> [ 2608.713561]  usb_ep_dequeue+0x19/0x80
> >> [ 2608.717234]  u_audio_stop_capture+0x54/0x9a [u_audio]
> >> [ 2608.722289]  afunc_set_alt+0x73/0x80 [usb_f_uac2]
> > I took a look at how the audio function is handling switching alternate
> > setting and dequeuing endpoints, and I think I found the issue.
> >
> > Here's a snippet of the free_ep() code in u_audio.c:
> >
> > static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
> > {
> >     .....
> >         for (i = 0; i < params->req_number; i++) {
> >                 if (prm->ureq[i].req) {
> >                         usb_ep_dequeue(ep, prm->ureq[i].req);
> >                         usb_ep_free_request(ep, prm->ureq[i].req);
> >                         prm->ureq[i].req = NULL;
> >                 }
> >         }
> >   ....
> >
> >
> > usb_ep_dequeue() can be asynchronous. The dwc3 still has ownership of
> > the request until it gives back the request. Freeing the request
> > immediately here will cause a problem.
> 
> To confirm my suspicion, can you try this and see if you still get oops?
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index eec8e9a9e3ed..b66eb24ec070 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -2031,6 +2031,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>                         list_for_each_entry_safe(r, t,
> &dep->started_list, list)
>                                 dwc3_gadget_move_cancelled_request(r);
>  
> +                       dwc3_gadget_ep_cleanup_cancelled_requests(dep);
>                         goto out;
>                 }
>         }
> 
> 
> This will make usb_ep_dequeue() synchronous. (Note that this is not tested).

But only for dwc3 right? In general do other UDC drivers provide
synchronous behavior? It does states clearly in the kerneldoc for
usb_ep_dequeue() that the completion is asynchronous.  From
drivers/usb/gadget/udc/core.c:

 * If the request is still active on the endpoint, it is dequeued and
 * eventually its completion routine is called (with status -ECONNRESET);
 * else a negative error code is returned.  This routine is asynchronous,
 * that is, it may return before the completion routine runs.

Alternatively, could we not fix up u_audio.c to deal with this?

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 56906d15fb55..f08f036d520e 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -89,7 +89,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
	struct snd_uac_chip *uac = prm->uac;

	/* i/f shutting down */
-	if (!prm->ep_enabled || req->status == -ESHUTDOWN)
+	if (!prm->ep_enabled) {
+		usb_ep_free_request(ep, req);
+		return;
+	}
+
+	if (req->status == -ESHUTDOWN)
		return;

	/*
@@ -352,7 +357,6 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
	for (i = 0; i < params->req_number; i++) {
		if (prm->ureq[i].req) {
			usb_ep_dequeue(ep, prm->ureq[i].req);
-			usb_ep_free_request(ep, prm->ureq[i].req);
			prm->ureq[i].req = NULL;
		}
	}

Jack
