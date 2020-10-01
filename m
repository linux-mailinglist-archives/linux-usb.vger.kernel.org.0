Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BE36280429
	for <lists+linux-usb@lfdr.de>; Thu,  1 Oct 2020 18:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732287AbgJAQn5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Oct 2020 12:43:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732119AbgJAQn4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Oct 2020 12:43:56 -0400
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2803C0613D0
        for <linux-usb@vger.kernel.org>; Thu,  1 Oct 2020 09:43:56 -0700 (PDT)
Received: by mail-ot1-x333.google.com with SMTP id s66so6107863otb.2
        for <linux-usb@vger.kernel.org>; Thu, 01 Oct 2020 09:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m0RIKIu85j25vfB+jdQ1fpgtb4VFlTvQNAnHdPwFwQE=;
        b=sHZhmxsmcQ58TYoh9/uqezN3IMNgkeIrEQHIhl5af85xEHySdwsteYJzrEGAYqMcuC
         Q88cMdkrfYagBMXk0isFZE6blbupmhmPodHFUj0r4akJNkNKXIcypdU8Oynd+5WgD/+x
         8VxyHEjMnSAX7T+Q349FnmV6VIzQSxe/6GEy7gMYoZG60+8XIYNUnmhcCwQsainKOAHe
         Y3BHkF8Z/VJeXCIpBhSwW3F2R3NQU63caQIFs9JtaI/he1azR2qKPpjbPbmudRHoeoHt
         IHR+I3kfyyosWN/3kIN0hsN/YGvWu1Lq1q0zNrVEfkBvE2lMHKPWLbcs4QMOSknj/nEE
         CjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m0RIKIu85j25vfB+jdQ1fpgtb4VFlTvQNAnHdPwFwQE=;
        b=r6YOZdEdjzEptEKvVnnpC1V8S19XoysBwP77IabklPJaNoyIneFSW2EeUTCHSQ8lyu
         PHLUwcOdYTP9TnkhIkLWcxTLEaPQMlIdoCbdoW6iG5ZYNZIhZUsH1vTf+NBGySjSIHJQ
         X1FD7Fn0AHVfViBEokdt6JsDyvwvKSJyaDxTY7Q7ndUpbv/b8wvmsJGkU538YA6mZ5CJ
         2+jrI21WLlvU8L2EBDU86HCXWFyJJqNgjLejmRVolFh9AOy/oxRfWlf99JFb430Hy9Bc
         0T+eslPzJgNFU3Q0FSkZDlNodv4SxtaNPalh9urd0IR4blSBqd7mUnJ9UEFla64Nuq0L
         R91w==
X-Gm-Message-State: AOAM532dvQgGAJU1o24xSzZQl1CquryiewasZDZ2fCfOURfpkFnIcOo1
        NdHFlJM04AdbJCXE319f7Ck7Iw==
X-Google-Smtp-Source: ABdhPJwqd0k7ObuGt/G8S0TNvvU2diOU8bHMVtkwBTr2N2B+5SGu+7NU2VYB+qBCt4TTih7RjTTwTw==
X-Received: by 2002:a05:6830:1487:: with SMTP id s7mr5399704otq.225.1601570635819;
        Thu, 01 Oct 2020 09:43:55 -0700 (PDT)
Received: from google.com ([2601:285:8380:9270::a07d])
        by smtp.gmail.com with ESMTPSA id i5sm1338027otj.19.2020.10.01.09.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 09:43:54 -0700 (PDT)
Date:   Thu, 1 Oct 2020 10:43:52 -0600
From:   zwisler@google.com
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <20201001164352.GA13249@google.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
 <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 01:35:31AM +0300, Mathias Nyman wrote:
<>
> The race I was referring to is if a driver issues a "Stop endpoint" command,
> and it races with an endpoint error/halt initiated by the xHC controller. 
> 
> The additional note in xhci 4.6.9 - Stop Endpoint, explains it:
> "Note: A Busy endpoint may asynchronously transition from the Running to the Halted
> or Error state due to error conditions detected while processing TRBs. A possible
> race condition may occur if software, thinking an endpoint is in the Running state,
> issues a Stop Endpoint Command however at the same time the xHC
> asynchronously transitions the endpoint to the Halted or Error state. In this case,
> a Context State Error may be generated for the command completion. Software
> may verify that this case occurred by inspecting the EP State for Halted or Error
> when a Stop Endpoint Command results in a Context State Error."
> 
> There are several context state errors in your trace.
> 
> Thanks
> -Mathias

Interestingly it looks like it's the actions that we take at the end of
xhci_handle_cmd_set_deq() for the broken command which break the HC.
Specifically, this line:

	dev->eps[ep_index].ep_state &= ~SET_DEQ_PENDING;

If I skip this line when I notice that ep_ctx->deq==0, the system will keep
running happily.

Here is a trace and dmesg for a run with the patch at the bottom of this mail.
I trimmed the trace a bit since it was very large, but I think I've left the
important bits intact:

https://gist.github.com/rzwisler/422e55321d9d2db5fc258d6d5b93d018

I've been able to run with this patch and survive through many "Mismatch"
occurrences, both with ep_ctx->deq set to 0 and set to some other value which
just seems to be wrong.

It seems like there are a few other places where we notice that we're in a bad
state, and we just bail, specifically these in xhci_queue_new_dequeue_state():

	addr = xhci_trb_virt_to_dma(deq_state->new_deq_seg,
				    deq_state->new_deq_ptr);
	if (addr == 0) {
		xhci_warn(xhci, "WARN Cannot submit Set TR Deq Ptr\n");
		xhci_warn(xhci, "WARN deq seg = %px, deq pt = %px\n",
			  deq_state->new_deq_seg, deq_state->new_deq_ptr);
		return;
	}
	ep = &xhci->devs[slot_id]->eps[ep_index];
	if ((ep->ep_state & SET_DEQ_PENDING)) {
		xhci_warn(xhci, "WARN Cannot submit Set TR Deq Ptr\n");
		xhci_warn(xhci, "A Set TR Deq Ptr command is pending.\n");
		return;
	}

Is noticing that the HC has given us bad data via the "Mismatch" check in
xhci_handle_cmd_set_deq() and bailing out enough, or should we figure out
exactly why the HC is getting into a bad state?

I'm happy to gather logs with more debug or run other experiments, if that
would be helpful.  As it is I don't really know how to debug the internal
state of the HC further, but hopefully the knowledge that the patch below
makes a difference will help us move forward.

--- >8 ---
From 1642f6f375d4822919fb03a56ce8c9186f58d6f7 Mon Sep 17 00:00:00 2001
From: Ross Zwisler <zwisler@google.com>
Date: Wed, 30 Sep 2020 17:45:24 -0600
Subject: [PATCH] DEBUG: avoid xhci crash

---
 drivers/usb/host/xhci-ring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 2c255d0620b05..379570facbc9e 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -1142,6 +1142,8 @@ static void xhci_handle_cmd_set_deq(struct xhci_hcd *xhci, int slot_id,
 			xhci_warn(xhci, "Mismatch between completed Set TR Deq Ptr command & xHCI internal state.\n");
 			xhci_warn(xhci, "ep deq seg = %p, deq ptr = %p\n",
 				  ep->queued_deq_seg, ep->queued_deq_ptr);
+			xhci_warn(xhci, "calculated deq:%#llx  real deq:%#llx\n", xhci_trb_virt_to_dma(ep->queued_deq_seg, ep->queued_deq_ptr), deq);
+			return;
 		}
 	}
 
-- 
2.28.0.709.gb0816b6eb0-goog

