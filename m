Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD4A0D73AB
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2019 12:45:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731166AbfJOKpY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 06:45:24 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:50534 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbfJOKpC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 06:45:02 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FAivOq054394;
        Tue, 15 Oct 2019 05:44:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1571136297;
        bh=t3uQRzoxUoIAGaVOBNnQcWE3nM7U8z67BUNAerP3x40=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=VbZlQ1A85nKRrceBss4jgVv6kHJ8sjIAHvlGAfxl9pQEHW98s6PkAaAzqw8gKQk1x
         5TOklRuW1c+hkx8uqrvVhAV86wX5pFUnYy8eTaeZrDo/yqBXiJT1aRw5oOE68dJsXQ
         9KonuLGp2mIj3b1n0OiUaHvMcph1rvTjqCUt1nOw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9FAivXj100908
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 15 Oct 2019 05:44:57 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 15
 Oct 2019 05:44:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 15 Oct 2019 05:44:50 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FAitwg048098;
        Tue, 15 Oct 2019 05:44:55 -0500
Subject: Re: how to test g_webcam
To:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>, <paul.elder@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu [EP]" <b-liu@ti.com>
CC:     "Nori, Sekhar" <nsekhar@ti.com>
References: <7c65d743-f6cd-846b-381a-07808c6f4c5a@ti.com>
 <8736fzv3c5.fsf@gmail.com> <a23554e6-4dd7-b252-eda3-4d986d4a80be@ti.com>
 <8736fvh58n.fsf@gmail.com> <922b2947-2d47-19c4-9116-73c5f281de15@ti.com>
 <871rvf8l09.fsf@gmail.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <75438b39-2233-8865-860a-661cf09bea4b@ti.com>
Date:   Tue, 15 Oct 2019 13:44:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <871rvf8l09.fsf@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 14/10/2019 17:22, Felipe Balbi wrote:
> 
> Hi,
> 
> Roger Quadros <rogerq@ti.com> writes:
>>> Hmm, Link Change is disabled by default upstream, unless you're running
>>> on anything older than 2.50a. I don't remember the version you're using,
>>> though :-p
>>
>> 2.02a
> 
> Thanks :-)
> 
>>>>        irq/170-dwc3-270   [000] d...   173.408918: dwc3_event: event (00000101): Reset [U0]
>>>>        irq/170-dwc3-270   [000] d...   173.463787: dwc3_event: event (00000201): Connection Done [U0]
>>>>        irq/170-dwc3-270   [000] d...   173.463796: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
>>>>        irq/170-dwc3-270   [000] d...   173.463799: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
>>>>        irq/170-dwc3-270   [000] d...   173.463803: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
>>>>        irq/170-dwc3-270   [000] d...   173.463804: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
>>>
>>> hmm, High speed? Can we get traces for superspeed too?
>>
>> We can after I figure out the -ENODEV issue I reported above.
> 
> cool
> 
>>>>          uvc-gadget-275   [001] d...   173.712586: dwc3_prepare_trb: ep0out: trb 4a151d32 buf 00000000ae85b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>>>          uvc-gadget-275   [001] d...   173.712592: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 ae85b000 00000000 --> status: Successful
>>>>        irq/170-dwc3-270   [000] d...   173.712688: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>>>        irq/170-dwc3-270   [000] d...   173.712690: dwc3_ctrl_req: a1 81 00 02 00 00 01 00
>>>
>>> Another one...
>>
>> 0xa1 GetRequest directed to video data endpoint of a VideoStreaming interface,
>> 0x81 GET_CUR (Current setting attribute),
>> 0002 CT_AE_MODE_CONTROL (Auto-exposure control selector),
>> 0000 interface?,
>> length 0001,
> 
> Thanks for these :-)
> 
>>>>          uvc-gadget-275   [001] d...   215.933842: dwc3_gadget_ep_cmd: ep1in: cmd 'End Transfer' [30c08] params 00000000 00000000 00000000 --> status: Successful
>>>>          uvc-gadget-275   [001] .n..   215.933980: dwc3_ep_dequeue: ep2in: req f1fb458c length 0/1024 zsI ==> -11
>>>>          uvc-gadget-275   [001] .n..   215.940651: dwc3_ep_dequeue: ep2in: req 5be7fd9f length 0/1024 zsI ==> -11
>>>>          uvc-gadget-275   [001] .n..   215.947297: dwc3_ep_dequeue: ep2in: req 996abf23 length 0/1024 zsI ==> -11
>>>>          uvc-gadget-275   [001] .n..   215.953954: dwc3_ep_dequeue: ep2in: req d9961026 length 0/1024 zsI ==> -11
>>>>          uvc-gadget-275   [001] .n..   215.960615: dwc3_free_request: ep2in: req f1fb458c length 0/1024 zsI ==> -11
>>>>          uvc-gadget-275   [001] .n..   215.960617: dwc3_free_request: ep2in: req 5be7fd9f length 0/1024 zsI ==> -11
>>>>          uvc-gadget-275   [001] .n..   215.960618: dwc3_free_request: ep2in: req 996abf23 length 0/1024 zsI ==> -11
>>>>          uvc-gadget-275   [001] .n..   215.960619: dwc3_free_request: ep2in: req d9961026 length 0/1024 zsI ==> -11
>>>
>>> So, first things first:
>>>
>>> Let's figure out what those class requests are and why are they *always*
>>> stalled. UVC class spec should answer that.
>>
>> I tried to decipher 2 class specific requests that we get.
>>
>>>
>>> Then we need to find out why it takes 1.5 seconds for uvc-gadget to
>>> queue more data.
>>>
>>
>> Not sure how to do that.
> 
> Look at the source for uvc-gadget. If I were to guess, I'd say
> uvc-gadget prepares frames as a function of the requested bandwidth.
> 
> It probably goes to sleep periodically until it thinks there's more data
> to send.
> 

I used the a different uvc-gadget application from this location [1] and it seems to
work quite fine with builtin video pattern and jpg image but not with V4L2 capture source.

So something is broken in uvc-gadget at [2]

[1] https://github.com/wlhe/uvc-gadget
[2] http://git.ideasonboard.org/uvc-gadget.git

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
