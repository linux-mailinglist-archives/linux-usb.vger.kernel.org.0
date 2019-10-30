Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9408EE99B7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 11:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfJ3KId (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 06:08:33 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:42600 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfJ3KId (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 06:08:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UA8QBi039929;
        Wed, 30 Oct 2019 05:08:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572430106;
        bh=nu/REzDiafZ04drEphYfiwcZ5PWyW0npYFER8ZCAC4s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=zH/EbROvzIBw0LKeZFLwF6tWijszrCn7u+p5+9o5iHJNym9+KlOnlcLf2GELmYvYw
         caqrsdFoh4FjwrA70uHgWOBVBB/j7Sfh29v1BM7K21TNYRWEehtsAMbzy0mq0ZyBAY
         idTEoXUdK9d8RLfRThbcA1m9wNdqWvubO27mdpTc=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UA8QJr056811;
        Wed, 30 Oct 2019 05:08:26 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 05:08:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 05:08:24 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UA8MEM104568;
        Wed, 30 Oct 2019 05:08:23 -0500
Subject: Re: g_audio breaks with dwc3
To:     Jack Pham <jackp@codeaurora.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu [EP]" <b-liu@ti.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
 <20191030081757.GB12661@jackp-linux.qualcomm.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <1126c959-a2b5-2830-7f02-c53b1388b492@ti.com>
Date:   Wed, 30 Oct 2019 12:08:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030081757.GB12661@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jack,

On 30/10/2019 10:17, Jack Pham wrote:
> Hi Roger,
> 
> Will try to take a stab at this...
> 
> On Tue, Oct 29, 2019 at 01:30:23PM +0200, Roger Quadros wrote:
>>      irq/170-dwc3-1240  [000] d...    85.449686: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>      irq/170-dwc3-1240  [000] d...    85.449688: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
>>      irq/170-dwc3-1240  [000] d...    85.449693: dwc3_ep_dequeue: ep1out: req ee75d6ac length 0/256 zsI ==> -115
>>      irq/170-dwc3-1240  [000] d...    85.449697: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
>>      irq/170-dwc3-1240  [000] d...    85.449799: dwc3_free_request: ep1out: req ee75d6ac length 0/256 zsI ==> -115
> 
> req ee75d6ac is dequeued by f_uac2, and immediately freed. There is no
> giveback here, but oddly the givebacks happen at the end of the log
> right before the panic.
> 
>>      irq/170-dwc3-1240  [000] d...    85.449800: dwc3_ep_dequeue: ep1out: req c26c10a3 length 0/256 zsI ==> -115
>>      irq/170-dwc3-1240  [000] d...    85.449803: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
>>      irq/170-dwc3-1240  [000] d...    85.449905: dwc3_free_request: ep1out: req c26c10a3 length 0/256 zsI ==> -115
> 
> ditto for req c26c10a3
> 
>>      irq/170-dwc3-1240  [000] d...    85.449906: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 3/1 flags E:swBp:>
>>      irq/170-dwc3-1240  [000] d...    85.449909: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
> 
> Finally usb_ep_disable() is called on ep1out.
> 
>>      irq/170-dwc3-1240  [000] d...    85.450013: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>>      irq/170-dwc3-1240  [000] d...    85.450013: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>>      irq/170-dwc3-1240  [000] d...    85.450019: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>>      irq/170-dwc3-1240  [000] d...    85.450026: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
>>      irq/170-dwc3-1240  [000] d...    85.450027: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete
> 
> Completions for the two End Transfer commands sent during ep_dequeue().
> 
>>      irq/170-dwc3-1240  [000] d...    85.450043: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>>      irq/170-dwc3-1240  [000] d...    85.450044: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>      irq/170-dwc3-1240  [000] d...    85.450047: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
>>      irq/170-dwc3-1240  [000] d...    85.450049: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>      irq/170-dwc3-1240  [000] d...    85.450055: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>>      irq/170-dwc3-1240  [000] d...    85.450547: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>      irq/170-dwc3-1240  [000] d...    85.450550: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
>>      irq/170-dwc3-1240  [000] d...    85.450555: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
>>      irq/170-dwc3-1240  [000] d...    85.450556: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>>      irq/170-dwc3-1240  [000] d...    85.450557: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>>      irq/170-dwc3-1240  [000] d...    85.450559: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
>>      irq/170-dwc3-1240  [000] d...    85.450560: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
>>      irq/170-dwc3-1240  [000] d...    85.450561: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
>>      irq/170-dwc3-1240  [000] d...    85.450562: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
>>      irq/170-dwc3-1240  [000] d...    85.450564: dwc3_gadget_giveback: ep1out: req ee75d6ac length 0/256 zsI ==> -108
>>      irq/170-dwc3-1240  [000] d...    85.450566: dwc3_gadget_giveback: ep1out: req c26c10a3 length 0/256 zsI ==> -108
>>      irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0
> 
> Giveback happens on above two reqs after they are already freed. Could
> it be due to f_uac2 / u_audio.c performing usb_ep_free_request()
> immediately after usb_ep_dequeue() without waiting for completion?
> 
> static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
> {
> ...
> 	for (i = 0; i < params->req_number; i++) {
> 		if (prm->ureq[i].req) {
> 			usb_ep_dequeue(ep, prm->ureq[i].req);
> 			usb_ep_free_request(ep, prm->ureq[i].req);
> 			prm->ureq[i].req = NULL;
> 		}
> 	}
> 
> According to commit 1e19a520a925, the kerneldoc for usb_ep_dequeue() was
> clarified to imply that completion may occur asynchronously, and f_fs.c
> was similarly fixed to wait for the completion after doing a dequeue.
> Sso maybe above snippet is leading to a use-after-free? Maybe the
> req->list traversal in dwc3 when it is doing givebacks is walking over
> freed memory leading to the panic.
> 
> Although I am not sure why the givebacks are happening here much later
> than the ep_dequeue and ep_disable on ep1out that happened previously.
> Several ep1in operations happen after that before these ep1out
> givebacks.
> 

Thanks for the hint. With the below patch the enumeration failure goes away.
I've also attached the dwc3 trace log.

However, I'm not able to record/playback. But this might be some other issue.
Does the below patch look OK?

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 56906d15fb55..498a2743ebe1 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -26,6 +26,7 @@
  struct uac_req {
  	struct uac_rtd_params *pp; /* parent param */
  	struct usb_request *req;
+	struct completion req_completion;
  };
  
  /* Runtime data params for one stream */
@@ -88,9 +89,9 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
  	struct uac_rtd_params *prm = ur->pp;
  	struct snd_uac_chip *uac = prm->uac;
  
-	/* i/f shutting down */
-	if (!prm->ep_enabled || req->status == -ESHUTDOWN)
-		return;
+	/* don't process data if we are disconnected or dequeued */
+	if (req->status == -ESHUTDOWN || req->status == -ECONNRESET)
+		goto exit;
  
  	/*
  	 * We can't really do much about bad xfers.
@@ -178,6 +179,12 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
  		snd_pcm_period_elapsed(substream);
  
  exit:
+	complete(&ur->req_completion);
+	/* don't queue more transfers if we're disabled or disconnected */
+	if (!prm->ep_enabled || req->status == -ESHUTDOWN)
+		return;
+
+	reinit_completion(&ur->req_completion);
  	if (usb_ep_queue(ep, req, GFP_ATOMIC))
  		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
  }
@@ -352,6 +359,7 @@ static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
  	for (i = 0; i < params->req_number; i++) {
  		if (prm->ureq[i].req) {
  			usb_ep_dequeue(ep, prm->ureq[i].req);
+			wait_for_completion(&prm->ureq[i].req_completion);
  			usb_ep_free_request(ep, prm->ureq[i].req);
  			prm->ureq[i].req = NULL;
  		}
@@ -397,6 +405,7 @@ int u_audio_start_capture(struct g_audio *audio_dev)
  			req->buf = prm->rbuf + i * prm->max_psize;
  		}
  
+		reinit_completion(&prm->ureq[i].req_completion);
  		if (usb_ep_queue(ep, prm->ureq[i].req, GFP_ATOMIC))
  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  	}
@@ -473,6 +482,7 @@ int u_audio_start_playback(struct g_audio *audio_dev)
  			req->buf = prm->rbuf + i * prm->max_psize;
  		}
  
+		reinit_completion(&prm->ureq[i].req_completion);
  		if (usb_ep_queue(ep, prm->ureq[i].req, GFP_ATOMIC))
  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  	}
@@ -497,7 +507,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
  	struct snd_pcm *pcm;
  	struct uac_params *params;
  	int p_chmask, c_chmask;
-	int err;
+	int err, i;
  
  	if (!g_audio)
  		return -EINVAL;
@@ -525,6 +535,9 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
  			goto fail;
  		}
  
+		for (i = 0; i < params->req_number; i++)
+			init_completion(&prm->ureq[i].req_completion);
+
  		prm->rbuf = kcalloc(params->req_number, prm->max_psize,
  				GFP_KERNEL);
  		if (!prm->rbuf) {
@@ -547,6 +560,9 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
  			goto fail;
  		}
  
+		for (i = 0; i < params->req_number; i++)
+			init_completion(&prm->ureq[i].req_completion);
+
  		prm->rbuf = kcalloc(params->req_number, prm->max_psize,
  				GFP_KERNEL);
  		if (!prm->rbuf) {

--

dwc3 trace log with above patch applied.

# tracer: nop
#
# entries-in-buffer/entries-written: 710/710   #P:2
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
         modprobe-1226  [001] .n..    93.678323: dwc3_alloc_request: ep0out: req b318d483 length 0/0 zsI ==> 0
         modprobe-1226  [000] dn..    93.702997: dwc3_gadget_ep_cmd: ep0out: cmd 'Start New Configuration' [409] params 00000000 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703003: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703006: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703009: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703011: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703014: dwc3_gadget_ep_cmd: ep2out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703017: dwc3_gadget_ep_cmd: ep2in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703019: dwc3_gadget_ep_cmd: ep3out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703022: dwc3_gadget_ep_cmd: ep3in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703025: dwc3_gadget_ep_cmd: ep4out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703027: dwc3_gadget_ep_cmd: ep4in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703030: dwc3_gadget_ep_cmd: ep5out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703033: dwc3_gadget_ep_cmd: ep5in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703035: dwc3_gadget_ep_cmd: ep6out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703038: dwc3_gadget_ep_cmd: ep6in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703041: dwc3_gadget_ep_cmd: ep7out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703043: dwc3_gadget_ep_cmd: ep7in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703046: dwc3_gadget_ep_cmd: ep8out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703049: dwc3_gadget_ep_cmd: ep8in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703052: dwc3_gadget_ep_cmd: ep9out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703054: dwc3_gadget_ep_cmd: ep9in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703057: dwc3_gadget_ep_cmd: ep10out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703060: dwc3_gadget_ep_cmd: ep10in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703063: dwc3_gadget_ep_cmd: ep11out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703065: dwc3_gadget_ep_cmd: ep11in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703068: dwc3_gadget_ep_cmd: ep12out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703071: dwc3_gadget_ep_cmd: ep12in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703073: dwc3_gadget_ep_cmd: ep13out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703076: dwc3_gadget_ep_cmd: ep13in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703079: dwc3_gadget_ep_cmd: ep14out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703081: dwc3_gadget_ep_cmd: ep14in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703084: dwc3_gadget_ep_cmd: ep15out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703087: dwc3_gadget_ep_cmd: ep15in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703089: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000 00000500 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703092: dwc3_gadget_ep_enable: ep0out: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:>
         modprobe-1226  [000] dn..    93.703094: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 00001000 02000500 00000000 --> status: Successful
         modprobe-1226  [000] dn..    93.703096: dwc3_gadget_ep_enable: ep0in: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
         modprobe-1226  [000] dn..    93.703098: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
         modprobe-1226  [000] dn..    93.703104: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    93.703173: dwc3_event: event (00150301): Link Change [RX.Detect]
     irq/170-dwc3-1228  [000] d...    93.801496: dwc3_event: event (00040301): Link Change [SS.Disabled]
     irq/170-dwc3-1228  [000] d...    93.801499: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1228  [000] d...    93.804662: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1228  [000] d...    93.807503: dwc3_event: event (00030301): Link Change [U3]
     irq/170-dwc3-1228  [000] d...    93.974202: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1228  [000] d...    93.990210: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1228  [000] d...    93.990219: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    93.990223: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1228  [000] d...    93.990228: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    93.990230: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    93.990231: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1228  [000] d...    94.054104: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.054107: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
     irq/170-dwc3-1228  [000] d...    94.054120: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.054126: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.054129: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.054153: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.054154: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.054160: dwc3_gadget_giveback: ep0out: req b318d483 length 18/18 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.054168: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.054169: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.054175: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.054224: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.054225: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.054230: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.054235: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.057275: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1228  [000] d...    94.057773: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1228  [000] d...    94.070213: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1228  [000] d...    94.070218: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.070220: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1228  [000] d...    94.070223: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.070224: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.070227: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1228  [000] d...    94.133926: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.133927: dwc3_ctrl_req: Set Address(Addr = 13)
     irq/170-dwc3-1228  [000] d...    94.133933: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.133934: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.133940: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.133978: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.133980: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.133984: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.133989: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.153907: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.153909: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 18)
     irq/170-dwc3-1228  [000] d...    94.153915: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.153921: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.153925: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.153948: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.153949: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.153954: dwc3_gadget_giveback: ep0out: req b318d483 length 18/18 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.153960: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.153962: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.153967: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154026: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154027: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154031: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.154036: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154099: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.154101: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 5)
     irq/170-dwc3-1228  [000] d...    94.154107: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 5 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154112: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154122: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154148: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154149: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154154: dwc3_gadget_giveback: ep0out: req b318d483 length 5/5 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.154161: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154162: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154167: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154223: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154224: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154228: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.154233: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154359: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.154360: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 22)
     irq/170-dwc3-1228  [000] d...    94.154366: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 22 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154372: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154381: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154397: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154398: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154403: dwc3_gadget_giveback: ep0out: req b318d483 length 22/22 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.154409: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154410: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154416: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154442: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154443: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154447: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.154452: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154588: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.154589: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 9)
     irq/170-dwc3-1228  [000] d...    94.154598: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 9 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154604: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154613: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154614: dwc3_event: event (000090c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154641: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154642: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154646: dwc3_gadget_giveback: ep0out: req b318d483 length 9/9 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.154647: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154649: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154654: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154688: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154689: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154693: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.154698: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154826: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.154828: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 219)
     irq/170-dwc3-1228  [000] d...    94.154836: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 219 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154841: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154849: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154885: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.154886: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.154890: dwc3_gadget_giveback: ep0out: req b318d483 length 219/219 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.154891: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154893: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154898: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.154932: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.154933: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.154937: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.154942: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155073: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.155075: dwc3_ctrl_req: Get String Descriptor(Index = 0, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.155081: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.155087: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155096: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.155122: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.155123: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.155127: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.155134: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.155135: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.155141: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155201: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.155202: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.155206: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.155211: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155296: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.155297: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.155304: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 46 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.155310: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155319: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.155320: dwc3_event: event (000090c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.155353: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.155354: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.155358: dwc3_gadget_giveback: ep0out: req b318d483 length 46/46 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.155365: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.155366: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.155372: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155397: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.155398: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.155402: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.155407: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155465: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.155466: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.155474: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 106 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.155480: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155487: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.155516: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.155518: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.155522: dwc3_gadget_giveback: ep0out: req b318d483 length 106/106 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.155523: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.155524: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.155530: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155564: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.155565: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.155569: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.155574: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.155860: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.155861: dwc3_ctrl_req: Set Configuration(Config = 1)
     irq/170-dwc3-1228  [000] d...    94.162618: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.162620: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.162625: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.162662: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.162663: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.162667: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.162669: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.162676: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.162768: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.162770: dwc3_ctrl_req: Get String Descriptor(Index = 5, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.162778: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 34 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.162784: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.162787: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.162820: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.162821: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.162826: dwc3_gadget_giveback: ep0out: req b318d483 length 34/34 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.162829: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.162831: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.162837: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.162892: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.162894: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.162898: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.162903: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163110: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.163112: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.163118: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 46 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163124: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163132: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163157: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163159: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163163: dwc3_gadget_giveback: ep0out: req b318d483 length 46/46 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.163172: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163173: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163178: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163204: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163205: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163209: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.163214: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163248: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.163249: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.163255: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 106 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163261: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163269: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163303: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163305: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163309: dwc3_gadget_giveback: ep0out: req b318d483 length 106/106 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.163312: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163313: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163319: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163374: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163376: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163379: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.163385: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163504: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.163505: dwc3_ctrl_req: a1 02 00 01 00 05 02 00
     irq/170-dwc3-1228  [000] d...    94.163511: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 2 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163517: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163520: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163553: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163555: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163559: dwc3_gadget_giveback: ep0out: req b318d483 length 2/2 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.163567: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163568: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163573: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163626: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163627: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163631: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.163636: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163731: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.163733: dwc3_ctrl_req: a1 02 00 01 00 05 0e 00
     irq/170-dwc3-1228  [000] d...    94.163739: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 14 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163744: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163756: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163783: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.163784: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.163788: dwc3_gadget_giveback: ep0out: req b318d483 length 14/14 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.163796: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163797: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163803: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.163854: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.163855: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.163859: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.163864: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164303: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.164304: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1228  [000] d...    94.164312: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164319: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1228  [000] d...    94.164321: dwc3_alloc_request: ep1out: req ebc6338f length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.164324: dwc3_ep_queue: ep1out: req ebc6338f length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.164326: dwc3_alloc_request: ep1out: req 72d27dfc length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.164328: dwc3_ep_queue: ep1out: req 72d27dfc length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.164335: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.164337: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.164342: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164359: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.164360: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.164363: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.164365: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.164370: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164379: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.164380: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1228  [000] d...    94.164387: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.164392: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164394: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.164428: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.164430: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.164434: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.164441: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.164442: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.164448: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164473: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.164475: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.164478: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.164484: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164878: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.164879: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1228  [000] d...    94.164885: dwc3_ep_dequeue: ep1out: req ebc6338f length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.164886: dwc3_gadget_giveback: ep1out: req ebc6338f length 0/256 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.164890: dwc3_free_request: ep1out: req ebc6338f length 0/256 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.164891: dwc3_ep_dequeue: ep1out: req 72d27dfc length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.164892: dwc3_gadget_giveback: ep1out: req 72d27dfc length 0/256 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.164895: dwc3_free_request: ep1out: req 72d27dfc length 0/256 zsI ==> -104
     irq/170-dwc3-1228  [000] d...    94.164897: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1228  [000] d...    94.164906: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.164907: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.164913: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.164932: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.164933: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.164937: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.164939: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.164944: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165043: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.165044: dwc3_ctrl_req: a1 02 00 01 00 06 02 00
     irq/170-dwc3-1228  [000] d...    94.165050: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 2 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.165056: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165065: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.165072: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.165073: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.165077: dwc3_gadget_giveback: ep0out: req b318d483 length 2/2 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.165078: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.165080: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.165085: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165101: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.165102: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.165106: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.165112: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165199: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.165200: dwc3_ctrl_req: a1 02 00 01 00 06 0e 00
     irq/170-dwc3-1228  [000] d...    94.165207: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 14 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.165212: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165221: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.165227: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.165229: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.165233: dwc3_gadget_giveback: ep0out: req b318d483 length 14/14 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.165239: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.165240: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.165246: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165280: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.165282: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.165285: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.165291: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165872: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.165873: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1228  [000] d...    94.165881: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165887: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.165889: dwc3_alloc_request: ep1in: req 72d27dfc length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.165890: dwc3_ep_queue: ep1in: req 72d27dfc length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.165892: dwc3_alloc_request: ep1in: req ebc6338f length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.165893: dwc3_ep_queue: ep1in: req ebc6338f length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.165896: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.165897: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.165903: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.165938: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.165939: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.165943: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.165945: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.165950: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.166035: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.166037: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1228  [000] d...    94.166043: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.166049: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.166056: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.166071: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.166073: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.166077: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.166085: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.166085: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.166091: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.166120: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.166121: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.166125: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.166130: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.166530: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.166531: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1228  [000] d...    94.166536: dwc3_ep_dequeue: ep1in: req 72d27dfc length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.166537: dwc3_gadget_giveback: ep1in: req 72d27dfc length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.166539: dwc3_free_request: ep1in: req 72d27dfc length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.166541: dwc3_ep_dequeue: ep1in: req ebc6338f length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.166542: dwc3_gadget_giveback: ep1in: req ebc6338f length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.166544: dwc3_free_request: ep1in: req ebc6338f length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] d...    94.166545: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.166554: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.166555: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.166560: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.166578: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.166579: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.166583: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.166585: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.166591: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.167250: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.167251: dwc3_ctrl_req: Get String Descriptor(Index = 12, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.167257: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 36 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.167263: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.167266: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.167295: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.167296: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.167300: dwc3_gadget_giveback: ep0out: req b318d483 length 36/36 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.167307: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.167308: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.167314: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.167339: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.167340: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.167343: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.167349: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.167461: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.167462: dwc3_ctrl_req: Get String Descriptor(Index = 14, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.167468: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 34 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.167474: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.167482: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.167508: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.167510: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.167514: dwc3_gadget_giveback: ep0out: req b318d483 length 34/34 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.167520: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.167521: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.167527: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.167560: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.167561: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.167565: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.167570: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.245810: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.245812: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1228  [000] d...    94.245822: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.245828: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.245830: dwc3_alloc_request: ep1in: req ebc6338f length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.245831: dwc3_ep_queue: ep1in: req ebc6338f length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.245833: dwc3_alloc_request: ep1in: req 72d27dfc length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.245834: dwc3_ep_queue: ep1in: req 72d27dfc length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.245836: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.245838: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.245843: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.245868: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.245869: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.245873: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.245875: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.245881: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.245922: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.245923: dwc3_ctrl_req: Get String Descriptor(Index = 15, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.245929: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 30 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.245935: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.245945: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.245951: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.245952: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.245956: dwc3_gadget_giveback: ep0out: req b318d483 length 30/30 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.245963: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.245964: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.245969: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.246002: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.246004: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.246008: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.246013: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.246089: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.246090: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1228  [000] d...    94.246096: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.246101: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.246110: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.246137: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.246138: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.246142: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.246149: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.246150: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.246155: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.246189: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.246190: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.246194: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.246199: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.250858: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.250860: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1228  [000] d...    94.250865: dwc3_ep_dequeue: ep1in: req ebc6338f length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.250866: dwc3_gadget_giveback: ep1in: req ebc6338f length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.250869: dwc3_free_request: ep1in: req ebc6338f length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.250870: dwc3_ep_dequeue: ep1in: req 72d27dfc length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.250871: dwc3_gadget_giveback: ep1in: req 72d27dfc length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.250874: dwc3_free_request: ep1in: req 72d27dfc length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] d...    94.250875: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] ....    94.250880: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] ....    94.250881: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] ....    94.250886: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.250927: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.250929: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.250932: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.250934: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.250939: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.251679: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.251680: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1228  [000] d...    94.251688: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.251694: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.251696: dwc3_alloc_request: ep1in: req 72d27dfc length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.251698: dwc3_ep_queue: ep1in: req 72d27dfc length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.251699: dwc3_alloc_request: ep1in: req ebc6338f length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.251701: dwc3_ep_queue: ep1in: req ebc6338f length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.251708: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.251709: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.251715: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.251732: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.251733: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.251737: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.251739: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.251745: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.251809: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.251810: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1228  [000] d...    94.251816: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.251822: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.251829: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.251845: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.251846: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.251851: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.251857: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.251858: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.251864: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.251892: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.251893: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.251897: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.251902: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.252398: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.252399: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1228  [000] d...    94.252403: dwc3_ep_dequeue: ep1in: req 72d27dfc length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.252405: dwc3_gadget_giveback: ep1in: req 72d27dfc length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.252409: dwc3_free_request: ep1in: req 72d27dfc length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.252410: dwc3_ep_dequeue: ep1in: req ebc6338f length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.252411: dwc3_gadget_giveback: ep1in: req ebc6338f length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.252413: dwc3_free_request: ep1in: req ebc6338f length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] d...    94.252415: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.252423: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.252424: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.252429: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.252461: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.252462: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.252466: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.252467: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.252473: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253585: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.253587: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1228  [000] d...    94.253594: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253600: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1228  [000] d...    94.253601: dwc3_alloc_request: ep1out: req ebc6338f length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.253603: dwc3_ep_queue: ep1out: req ebc6338f length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.253606: dwc3_alloc_request: ep1out: req 72d27dfc length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.253607: dwc3_ep_queue: ep1out: req 72d27dfc length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.253616: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.253617: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.253622: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253640: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.253641: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.253644: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.253646: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.253652: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253667: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.253668: dwc3_ctrl_req: Get String Descriptor(Index = 13, Length = 255)
     irq/170-dwc3-1228  [000] d...    94.253674: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 32 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.253680: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253687: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.253706: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.253707: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.253712: dwc3_gadget_giveback: ep0out: req b318d483 length 32/32 ZsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.253719: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.253721: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.253726: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253752: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.253754: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.253757: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.253763: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253825: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.253827: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1228  [000] d...    94.253833: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.253838: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253846: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.253874: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.253875: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.253879: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.253887: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.253888: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.253894: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.253929: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.253930: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.253934: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.253939: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.254313: dwc3_event: event (30f000c4): ep1out: Transfer Not Ready [12528] (Not Active)
     irq/170-dwc3-1228  [000] d...    94.254316: dwc3_prepare_trb: ep1out: trb 5f31d473 buf 00000000ad585000 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.254320: dwc3_prepare_trb: ep1out: trb aee24341 buf 00000000ad585100 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.254325: dwc3_gadget_ep_cmd: ep1out: cmd 'Start Transfer' [30f80406] params 00000000 fe05d000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.255311: dwc3_event: event (30f86084): ep1out: Transfer In Progress [12536] (SIm)
     irq/170-dwc3-1228  [000] d...    94.255313: dwc3_complete_trb: ep1out: trb 5f31d473 buf 00000000ad585000 size 1x 0 ctrl 0c3e0c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.255318: dwc3_gadget_giveback: ep1out: req ebc6338f length 256/256 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.255320: dwc3_ep_queue: ep1out: req ebc6338f length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.255322: dwc3_prepare_trb: ep1out: trb e6f6b673 buf 00000000ad585000 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.255328: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256290: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.256291: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1228  [000] d...    94.256299: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256305: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.256307: dwc3_alloc_request: ep1in: req 90dba1da length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.256308: dwc3_ep_queue: ep1in: req 90dba1da length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.256311: dwc3_alloc_request: ep1in: req 6ca51bd9 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.256313: dwc3_ep_queue: ep1in: req 6ca51bd9 length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.256315: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.256316: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.256321: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256329: dwc3_event: event (31006084): ep1out: Transfer In Progress [12544] (SIm)
     irq/170-dwc3-1228  [000] d...    94.256330: dwc3_complete_trb: ep1out: trb aee24341 buf 00000000ad585100 size 1x 0 ctrl 0c400c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.256335: dwc3_gadget_giveback: ep1out: req 72d27dfc length 256/256 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.256337: dwc3_ep_queue: ep1out: req 72d27dfc length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.256339: dwc3_prepare_trb: ep1out: trb 7b0bfd7b buf 00000000ad585100 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.256344: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256351: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.256352: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.256355: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.256357: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.256362: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256439: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.256441: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1228  [000] d...    94.256447: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.256453: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256460: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.256487: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.256488: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.256492: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.256499: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.256500: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.256506: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256532: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.256533: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.256537: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.256542: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.256970: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.256971: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1228  [000] d...    94.256975: dwc3_ep_dequeue: ep1in: req 90dba1da length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.256977: dwc3_gadget_giveback: ep1in: req 90dba1da length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.256979: dwc3_free_request: ep1in: req 90dba1da length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.256980: dwc3_ep_dequeue: ep1in: req 6ca51bd9 length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.256981: dwc3_gadget_giveback: ep1in: req 6ca51bd9 length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] ....    94.256984: dwc3_free_request: ep1in: req 6ca51bd9 length 0/192 zsI ==> -104
     irq/170-dwc3-1228  [000] d...    94.256985: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.256993: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.256994: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.257000: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.257031: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.257033: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.257036: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.257038: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.257043: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.257314: dwc3_event: event (31086084): ep1out: Transfer In Progress [12552] (SIm)
     irq/170-dwc3-1228  [000] d...    94.257316: dwc3_complete_trb: ep1out: trb e6f6b673 buf 00000000ad585000 size 1x 0 ctrl 0c420c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.257320: dwc3_gadget_giveback: ep1out: req ebc6338f length 256/256 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.257323: dwc3_ep_queue: ep1out: req ebc6338f length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.257325: dwc3_prepare_trb: ep1out: trb a4d06798 buf 00000000ad585000 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1228  [000] d...    94.257330: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.257856: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.257857: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1228  [000] d...    94.257865: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.257871: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1228  [000] d...    94.257873: dwc3_alloc_request: ep1in: req 6ca51bd9 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.257874: dwc3_ep_queue: ep1in: req 6ca51bd9 length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.257876: dwc3_alloc_request: ep1in: req 90dba1da length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.257877: dwc3_ep_queue: ep1in: req 90dba1da length 0/192 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.257879: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.257880: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.257886: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.257928: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.257930: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1228  [000] d...    94.257934: dwc3_gadget_giveback: ep0out: req b318d483 length 0/0 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.257936: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.257941: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.257999: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.258000: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1228  [000] d...    94.258006: dwc3_prepare_trb: ep0in: trb b9d2caaa buf 00000000ac829000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.258012: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.258019: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.258053: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1228  [000] d...    94.258054: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000ac829000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1228  [000] d...    94.258058: dwc3_gadget_giveback: ep0out: req b318d483 length 4/4 zsI ==> 0
     irq/170-dwc3-1228  [000] d...    94.258065: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.258066: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.258072: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.258127: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1228  [000] d...    94.258128: dwc3_complete_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1228  [000] d...    94.258132: dwc3_prepare_trb: ep0out: trb b9d2caaa buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1228  [000] d...    94.258137: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.270204: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1228  [000] d...    94.270205: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1228  [000] d...    94.270210: dwc3_ep_dequeue: ep1out: req ebc6338f length 0/256 zsI ==> -115
     irq/170-dwc3-1228  [000] d...    94.270213: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1228  [000] d...    94.270317: dwc3_gadget_ep_dequeue: ---> req ebc6338f moved to cancelled

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

