Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F35EE97F7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 09:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbfJ3ISC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 04:18:02 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:48738 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725822AbfJ3ISC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 04:18:02 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 835C160FB4; Wed, 30 Oct 2019 08:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572423480;
        bh=kcCm/H5t19My0UWHuNsVdwLkOLGVv4OutbbVfyfm2Kw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iPQoXO98AnaS9mzCJfGV2/EZoQxgxiZo+NKqxGHJl9UA8o32Cd+0JtTdRjB8zDCQa
         1kKJOlqyOB35r9Cbibb8BPtTCYEG4iG31fGEMQ4DxoeuHHz0s5YYncG9O4HC6lZpC+
         4xtmqV0Oh4NU0P9BPh52WwanSuUYrhdkRWkzur1I=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 967AD60F5C;
        Wed, 30 Oct 2019 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572423479;
        bh=kcCm/H5t19My0UWHuNsVdwLkOLGVv4OutbbVfyfm2Kw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QTzv35In7ECHebpOM9POewZQEJb9SN7TkxyzDKEWknvOZeKnFsCJvm+mABPdBgMZF
         3dEp4uD3v1iEEkHVDcEDzDc8rbTRa3WRSQOmyo9hgXvhq9xET0MHTtFy7ob3bLafbq
         rM4lJWgUvQr1uuCBHEkOh0gEbUka3lEnKsJ/TvVc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 967AD60F5C
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Wed, 30 Oct 2019 01:17:58 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Roger Quadros <rogerq@ti.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu [EP]" <b-liu@ti.com>
Subject: Re: g_audio breaks with dwc3
Message-ID: <20191030081757.GB12661@jackp-linux.qualcomm.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Roger,

Will try to take a stab at this...

On Tue, Oct 29, 2019 at 01:30:23PM +0200, Roger Quadros wrote:
>     irq/170-dwc3-1240  [000] d...    85.449686: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>     irq/170-dwc3-1240  [000] d...    85.449688: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
>     irq/170-dwc3-1240  [000] d...    85.449693: dwc3_ep_dequeue: ep1out: req ee75d6ac length 0/256 zsI ==> -115
>     irq/170-dwc3-1240  [000] d...    85.449697: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
>     irq/170-dwc3-1240  [000] d...    85.449799: dwc3_free_request: ep1out: req ee75d6ac length 0/256 zsI ==> -115

req ee75d6ac is dequeued by f_uac2, and immediately freed. There is no
giveback here, but oddly the givebacks happen at the end of the log
right before the panic.

>     irq/170-dwc3-1240  [000] d...    85.449800: dwc3_ep_dequeue: ep1out: req c26c10a3 length 0/256 zsI ==> -115
>     irq/170-dwc3-1240  [000] d...    85.449803: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
>     irq/170-dwc3-1240  [000] d...    85.449905: dwc3_free_request: ep1out: req c26c10a3 length 0/256 zsI ==> -115

ditto for req c26c10a3

>     irq/170-dwc3-1240  [000] d...    85.449906: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 3/1 flags E:swBp:>
>     irq/170-dwc3-1240  [000] d...    85.449909: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful

Finally usb_ep_disable() is called on ep1out.

>     irq/170-dwc3-1240  [000] d...    85.450013: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>     irq/170-dwc3-1240  [000] d...    85.450013: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>     irq/170-dwc3-1240  [000] d...    85.450019: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>     irq/170-dwc3-1240  [000] d...    85.450026: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
>     irq/170-dwc3-1240  [000] d...    85.450027: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete

Completions for the two End Transfer commands sent during ep_dequeue().

>     irq/170-dwc3-1240  [000] d...    85.450043: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>     irq/170-dwc3-1240  [000] d...    85.450044: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>     irq/170-dwc3-1240  [000] d...    85.450047: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
>     irq/170-dwc3-1240  [000] d...    85.450049: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>     irq/170-dwc3-1240  [000] d...    85.450055: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>     irq/170-dwc3-1240  [000] d...    85.450547: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>     irq/170-dwc3-1240  [000] d...    85.450550: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
>     irq/170-dwc3-1240  [000] d...    85.450555: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
>     irq/170-dwc3-1240  [000] d...    85.450556: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>     irq/170-dwc3-1240  [000] d...    85.450557: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>     irq/170-dwc3-1240  [000] d...    85.450559: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
>     irq/170-dwc3-1240  [000] d...    85.450560: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
>     irq/170-dwc3-1240  [000] d...    85.450561: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
>     irq/170-dwc3-1240  [000] d...    85.450562: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
>     irq/170-dwc3-1240  [000] d...    85.450564: dwc3_gadget_giveback: ep1out: req ee75d6ac length 0/256 zsI ==> -108
>     irq/170-dwc3-1240  [000] d...    85.450566: dwc3_gadget_giveback: ep1out: req c26c10a3 length 0/256 zsI ==> -108
>     irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0

Giveback happens on above two reqs after they are already freed. Could
it be due to f_uac2 / u_audio.c performing usb_ep_free_request()
immediately after usb_ep_dequeue() without waiting for completion?

static inline void free_ep(struct uac_rtd_params *prm, struct usb_ep *ep)
{
...
	for (i = 0; i < params->req_number; i++) {
		if (prm->ureq[i].req) {
			usb_ep_dequeue(ep, prm->ureq[i].req);
			usb_ep_free_request(ep, prm->ureq[i].req);
			prm->ureq[i].req = NULL;
		}
	}

According to commit 1e19a520a925, the kerneldoc for usb_ep_dequeue() was
clarified to imply that completion may occur asynchronously, and f_fs.c
was similarly fixed to wait for the completion after doing a dequeue.
Sso maybe above snippet is leading to a use-after-free? Maybe the
req->list traversal in dwc3 when it is doing givebacks is walking over
freed memory leading to the panic.

Although I am not sure why the givebacks are happening here much later
than the ep_dequeue and ep_disable on ep1out that happened previously.
Several ep1in operations happen after that before these ep1out
givebacks.

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
