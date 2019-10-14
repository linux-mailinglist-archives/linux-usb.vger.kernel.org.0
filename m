Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8477BD6506
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 16:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732598AbfJNOWe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 10:22:34 -0400
Received: from mga03.intel.com ([134.134.136.65]:61757 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731121AbfJNOWe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Oct 2019 10:22:34 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Oct 2019 07:22:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,295,1566889200"; 
   d="scan'208";a="225092078"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2019 07:22:31 -0700
From:   Felipe Balbi <felipe.balbi@linux.intel.com>
To:     Roger Quadros <rogerq@ti.com>, laurent.pinchart@ideasonboard.com,
        paul.elder@ideasonboard.com,
        "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu \[EP\]" <b-liu@ti.com>
Cc:     "Nori\, Sekhar" <nsekhar@ti.com>
Subject: Re: how to test g_webcam
In-Reply-To: <922b2947-2d47-19c4-9116-73c5f281de15@ti.com>
References: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com> <8736fzv3c5.fsf@gmail.com> <a23554e6-4dd7-b252-eda3-4d986d4a80be@ti.com> <8736fvh58n.fsf@gmail.com> <922b2947-2d47-19c4-9116-73c5f281de15@ti.com>
Date:   Mon, 14 Oct 2019 17:22:30 +0300
Message-ID: <871rvf8l09.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Roger Quadros <rogerq@ti.com> writes:
>> Hmm, Link Change is disabled by default upstream, unless you're running
>> on anything older than 2.50a. I don't remember the version you're using,
>> though :-p
>
> 2.02a

Thanks :-)

>>>       irq/170-dwc3-270   [000] d...   173.408918: dwc3_event: event (00000101): Reset [U0]
>>>       irq/170-dwc3-270   [000] d...   173.463787: dwc3_event: event (00000201): Connection Done [U0]
>>>       irq/170-dwc3-270   [000] d...   173.463796: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
>>>       irq/170-dwc3-270   [000] d...   173.463799: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
>>>       irq/170-dwc3-270   [000] d...   173.463803: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
>>>       irq/170-dwc3-270   [000] d...   173.463804: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
>> 
>> hmm, High speed? Can we get traces for superspeed too?
>
> We can after I figure out the -ENODEV issue I reported above.

cool

>>>         uvc-gadget-275   [001] d...   173.712586: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>>         uvc-gadget-275   [001] d...   173.712592: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>>>       irq/170-dwc3-270   [000] d...   173.712688: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>>       irq/170-dwc3-270   [000] d...   173.712690: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>> 
>> Another one...
>
> 0xa1 GetRequest directed to video data endpoint of a VideoStreaming interface,
> 0x81 GET_CUR (Current setting attribute),
> 0002 CT_AE_MODE_CONTROL (Auto-exposure control selector),
> 0000 interface?,
> length 0001,

Thanks for these :-)

>>>         uvc-gadget-275   [001] d...   215.933842: dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [30c08] params 00000000 00000000 00000000 --> status: Successful
>>>         uvc-gadget-275   [001] .n..   215.933980: dwc3_ep_dequeue: ep2in: req f1fb458c length 0/1024 zsI ==> -11
>>>         uvc-gadget-275   [001] .n..   215.940651: dwc3_ep_dequeue: ep2in: req 5be7fd9f length 0/1024 zsI ==> -11
>>>         uvc-gadget-275   [001] .n..   215.947297: dwc3_ep_dequeue: ep2in: req 996abf23 length 0/1024 zsI ==> -11
>>>         uvc-gadget-275   [001] .n..   215.953954: dwc3_ep_dequeue: ep2in: req d9961026 length 0/1024 zsI ==> -11
>>>         uvc-gadget-275   [001] .n..   215.960615: dwc3_free_request: ep2in: req f1fb458c length 0/1024 zsI ==> -11
>>>         uvc-gadget-275   [001] .n..   215.960617: dwc3_free_request: ep2in: req 5be7fd9f length 0/1024 zsI ==> -11
>>>         uvc-gadget-275   [001] .n..   215.960618: dwc3_free_request: ep2in: req 996abf23 length 0/1024 zsI ==> -11
>>>         uvc-gadget-275   [001] .n..   215.960619: dwc3_free_request: ep2in: req d9961026 length 0/1024 zsI ==> -11
>> 
>> So, first things first:
>> 
>> Let's figure out what those class requests are and why are they *always*
>> stalled. UVC class spec should answer that.
>
> I tried to decipher 2 class specific requests that we get.
>
>> 
>> Then we need to find out why it takes 1.5 seconds for uvc-gadget to
>> queue more data.
>> 
>
> Not sure how to do that.

Look at the source for uvc-gadget. If I were to guess, I'd say
uvc-gadget prepares frames as a function of the requested bandwidth.

It probably goes to sleep periodically until it thinks there's more data
to send.

Best

-- 
balbi
