Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3DF28C154
	for <lists+linux-usb@lfdr.de>; Mon, 12 Oct 2020 21:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390346AbgJLTQz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Oct 2020 15:16:55 -0400
Received: from mga11.intel.com ([192.55.52.93]:13346 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729890AbgJLTQz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Oct 2020 15:16:55 -0400
IronPort-SDR: 2zozAeZSIuFPY1/jf9rAbNBusAOI8oVbnY9kDPKr4zwaNfgulpL7VZLWyZmEplnh4FoT1oRMAe
 A7Jo50Ubg2SQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9772"; a="162324542"
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="162324542"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2020 12:16:54 -0700
IronPort-SDR: FvgPGcwih/TV3cKb2gIpXOM/BWBnkKv9hR2dS0PfXV/xOlUrZAod9Y7zyiIaqvst7VQgwV9zUj
 0BuaAYRSUa/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,367,1596524400"; 
   d="scan'208";a="355894353"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.170]) ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 12 Oct 2020 12:16:53 -0700
Subject: Re: xhci problem -> general protection fault
To:     zwisler@google.com
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
References: <65ac3a73-ca57-c3e8-561b-9ba5c15b3c65@collabora.com>
 <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
 <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
 <20201001164352.GA13249@google.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mathias.nyman@linux.intel.com; prefer-encrypt=mutual; keydata=
 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 fiD/
Message-ID: <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com>
Date:   Mon, 12 Oct 2020 22:20:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20201001164352.GA13249@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 1.10.2020 19.43, zwisler@google.com wrote:
> On Tue, Sep 29, 2020 at 01:35:31AM +0300, Mathias Nyman wrote:
> <>
>> The race I was referring to is if a driver issues a "Stop endpoint" command,
>> and it races with an endpoint error/halt initiated by the xHC controller. 
>>
>> The additional note in xhci 4.6.9 - Stop Endpoint, explains it:
>> "Note: A Busy endpoint may asynchronously transition from the Running to the Halted
>> or Error state due to error conditions detected while processing TRBs. A possible
>> race condition may occur if software, thinking an endpoint is in the Running state,
>> issues a Stop Endpoint Command however at the same time the xHC
>> asynchronously transitions the endpoint to the Halted or Error state. In this case,
>> a Context State Error may be generated for the command completion. Software
>> may verify that this case occurred by inspecting the EP State for Halted or Error
>> when a Stop Endpoint Command results in a Context State Error."
>>
>> There are several context state errors in your trace.
>>
>> Thanks
>> -Mathias
> 
> Interestingly it looks like it's the actions that we take at the end of
> xhci_handle_cmd_set_deq() for the broken command which break the HC.
> Specifically, this line:
> 
> 	dev->eps[ep_index].ep_state &= ~SET_DEQ_PENDING;
> 
> If I skip this line when I notice that ep_ctx->deq==0, the system will keep
> running happily.

Skipping this will prevent this endpoint from running, and thus
preventing the issues seen if we continue.

> 
> Here is a trace and dmesg for a run with the patch at the bottom of this mail.
> I trimmed the trace a bit since it was very large, but I think I've left the
> important bits intact:
> 
> https://gist.github.com/rzwisler/422e55321d9d2db5fc258d6d5b93d018
> 
> I've been able to run with this patch and survive through many "Mismatch"
> occurrences, both with ep_ctx->deq set to 0 and set to some other value which
> just seems to be wrong.
> 
> It seems like there are a few other places where we notice that we're in a bad
> state, and we just bail, specifically these in xhci_queue_new_dequeue_state():
> 
> 	addr = xhci_trb_virt_to_dma(deq_state->new_deq_seg,
> 				    deq_state->new_deq_ptr);
> 	if (addr == 0) {
> 		xhci_warn(xhci, "WARN Cannot submit Set TR Deq Ptr\n");
> 		xhci_warn(xhci, "WARN deq seg = %px, deq pt = %px\n",
> 			  deq_state->new_deq_seg, deq_state->new_deq_ptr);
> 		return;
> 	}
> 	ep = &xhci->devs[slot_id]->eps[ep_index];
> 	if ((ep->ep_state & SET_DEQ_PENDING)) {
> 		xhci_warn(xhci, "WARN Cannot submit Set TR Deq Ptr\n");
> 		xhci_warn(xhci, "A Set TR Deq Ptr command is pending.\n");
> 		return;
> 	}
> 
> Is noticing that the HC has given us bad data via the "Mismatch" check in
> xhci_handle_cmd_set_deq() and bailing out enough, or should we figure out
> exactly why the HC is getting into a bad state?

I'm rewriting how xhci driver handles halted and canceled transfers.
While looking into it I found an older case where hardware gives bad data 
in the output context. This was 10 years ago and on some specic hardware,
see commit:

ac9d8fe7c6a8 USB: xhci: Add quirk for Fresco Logic xHCI hardware.

> 
> I'm happy to gather logs with more debug or run other experiments, if that
> would be helpful.  As it is I don't really know how to debug the internal
> state of the HC further, but hopefully the knowledge that the patch below
> makes a difference will help us move forward.

Great thanks, it will take some time before rewrite is ready.

-Mathias

