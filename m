Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF203E9999
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 11:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbfJ3KAZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 06:00:25 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56162 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfJ3KAZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 06:00:25 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UA0GDA020041;
        Wed, 30 Oct 2019 05:00:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572429616;
        bh=zApt/bnCLheAT0/TOMj0x8e7MrIX3VnE8DxC2jpLKJ4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=eVRwVdT7p8cIjdT0Dh5KvstLb+QUbImLpKTum2iYQsVgKOQXwriYvkrwoWospJeir
         PmYxzD2c+EMspOsR63BkeZBI7R7kLUim84dpda4t8O6a08DbOLKMAttcbOMiNLzGjx
         zgyukj0d8NCFjy7UP0K52aICu+UKvolb+RRdJrNY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UA0Gtx066347
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 05:00:16 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 05:00:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 05:00:03 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UA0Dkk064715;
        Wed, 30 Oct 2019 05:00:13 -0500
Subject: Re: g_audio breaks with dwc3
To:     Felipe Balbi <balbi@kernel.org>, Jack Pham <jackp@codeaurora.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu [EP]" <b-liu@ti.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
 <20191030081757.GB12661@jackp-linux.qualcomm.com> <87mudihapt.fsf@gmail.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <9ca2f64b-2cbc-3757-2e5f-233b968f3dd1@ti.com>
Date:   Wed, 30 Oct 2019 12:00:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87mudihapt.fsf@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/10/2019 10:57, Felipe Balbi wrote:
> 
> Hi,
> 
> Jack Pham <jackp@codeaurora.org> writes:
>> Will try to take a stab at this...
>>
>> On Tue, Oct 29, 2019 at 01:30:23PM +0200, Roger Quadros wrote:
>>>      irq/170-dwc3-1240  [000] d...    85.449686: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>>      irq/170-dwc3-1240  [000] d...    85.449688: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
>>>      irq/170-dwc3-1240  [000] d...    85.449693: dwc3_ep_dequeue: ep1out: req ee75d6ac length 0/256 zsI ==> -115
>>>      irq/170-dwc3-1240  [000] d...    85.449697: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
>>>      irq/170-dwc3-1240  [000] d...    85.449799: dwc3_free_request: ep1out: req ee75d6ac length 0/256 zsI ==> -115
>>
>> req ee75d6ac is dequeued by f_uac2, and immediately freed. There is no
>> giveback here, but oddly the givebacks happen at the end of the log
>> right before the panic.
>>
>>>      irq/170-dwc3-1240  [000] d...    85.449800: dwc3_ep_dequeue: ep1out: req c26c10a3 length 0/256 zsI ==> -115
>>>      irq/170-dwc3-1240  [000] d...    85.449803: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
>>>      irq/170-dwc3-1240  [000] d...    85.449905: dwc3_free_request: ep1out: req c26c10a3 length 0/256 zsI ==> -115
>>
>> ditto for req c26c10a3
>>
>>>      irq/170-dwc3-1240  [000] d...    85.449906: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 3/1 flags E:swBp:>
>>>      irq/170-dwc3-1240  [000] d...    85.449909: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
>>
>> Finally usb_ep_disable() is called on ep1out.
>>
>>>      irq/170-dwc3-1240  [000] d...    85.450013: dwc3_event: event (000020c2): ep0in:  [Status Phase]
>>>      irq/170-dwc3-1240  [000] d...    85.450013: dwc3_prepare_trb: ep0in: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c33 (HLcs:SC:status2)
>>>      irq/170-dwc3-1240  [000] d...    85.450019: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>>>      irq/170-dwc3-1240  [000] d...    85.450026: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
>>>      irq/170-dwc3-1240  [000] d...    85.450027: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete
>>
>> Completions for the two End Transfer commands sent during ep_dequeue().
>>
>>>      irq/170-dwc3-1240  [000] d...    85.450043: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
>>>      irq/170-dwc3-1240  [000] d...    85.450044: dwc3_complete_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 0 ctrl 00000c32 (hLcs:SC:status2)
>>>      irq/170-dwc3-1240  [000] d...    85.450047: dwc3_gadget_giveback: ep0out: req 36600525 length 0/0 zsI ==> 0
>>>      irq/170-dwc3-1240  [000] d...    85.450049: dwc3_prepare_trb: ep0out: trb 089fca0d buf 00000000fe05b000 size 8 ctrl 00000c23 (HLcs:SC:setup)
>>>      irq/170-dwc3-1240  [000] d...    85.450055: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05b000 00000000 --> status: Successful
>>>      irq/170-dwc3-1240  [000] d...    85.450547: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
>>>      irq/170-dwc3-1240  [000] d...    85.450550: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
>>>      irq/170-dwc3-1240  [000] d...    85.450555: dwc3_ep_dequeue: ep1in: req f11a91c0 length 0/192 zsI ==> -115
>>>      irq/170-dwc3-1240  [000] d...    85.450556: dwc3_gadget_giveback: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>>>      irq/170-dwc3-1240  [000] d...    85.450557: dwc3_free_request: ep1in: req f11a91c0 length 0/192 zsI ==> -104
>>>      irq/170-dwc3-1240  [000] d...    85.450559: dwc3_ep_dequeue: ep1in: req d9b92dec length 0/192 zsI ==> -115
>>>      irq/170-dwc3-1240  [000] d...    85.450560: dwc3_gadget_giveback: ep1in: req d9b92dec length 0/192 zsI ==> -104
>>>      irq/170-dwc3-1240  [000] d...    85.450561: dwc3_free_request: ep1in: req d9b92dec length 0/192 zsI ==> -104
>>>      irq/170-dwc3-1240  [000] d...    85.450562: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
>>>      irq/170-dwc3-1240  [000] d...    85.450564: dwc3_gadget_giveback: ep1out: req ee75d6ac length 0/256 zsI ==> -108
>>>      irq/170-dwc3-1240  [000] d...    85.450566: dwc3_gadget_giveback: ep1out: req c26c10a3 length 0/256 zsI ==> -108
>>>      irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0
>>
>> Giveback happens on above two reqs after they are already freed. Could
>> it be due to f_uac2 / u_audio.c performing usb_ep_free_request()
>> immediately after usb_ep_dequeue() without waiting for completion?
> 
> this could be a race condition. Add a trace_printk() at the cancelation,
> see if the request is moved to cancelled list.
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 86dc1db788a9..affc2f7a929d 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -1513,6 +1513,7 @@ static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep)
>   	struct dwc3_request		*tmp;
>   
>   	list_for_each_entry_safe(req, tmp, &dep->cancelled_list, list) {
> +		trace_printk("---> completing cancellation of req %p\n", req);
>   		dwc3_gadget_ep_skip_trbs(dep, req);
>   		dwc3_gadget_giveback(dep, req, -ECONNRESET);
>   	}
> @@ -1551,6 +1552,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>   			if (!r->trb)
>   				goto out0;
>   
> +			trace_printk("---> req %p moved to cancelled\n", req);
>   			dwc3_gadget_move_cancelled_request(req);
>   			if (dep->flags & DWC3_EP_TRANSFER_STARTED)
>   				goto out0;
> 
> 

Below is trace with above debug patch applied.

# tracer: nop
#
# entries-in-buffer/entries-written: 898/898   #P:2
#
#                              _-----=> irqs-off
#                             / _----=> need-resched
#                            | / _---=> hardirq/softirq
#                            || / _--=> preempt-depth
#                            ||| /     delay
#           TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
#              | |       |   ||||       |         |
         modprobe-1217  [000] ....    24.217936: dwc3_alloc_request: ep0out: req 36a8842f length 0/0 zsI ==> 0
         modprobe-1217  [000] dn..    24.251914: dwc3_gadget_ep_cmd: ep0out: cmd 'Start New Configuration' [409] params 00000000 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251920: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251923: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251926: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251929: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251932: dwc3_gadget_ep_cmd: ep2out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251934: dwc3_gadget_ep_cmd: ep2in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251937: dwc3_gadget_ep_cmd: ep3out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251940: dwc3_gadget_ep_cmd: ep3in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251944: dwc3_gadget_ep_cmd: ep4out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251947: dwc3_gadget_ep_cmd: ep4in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251950: dwc3_gadget_ep_cmd: ep5out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251953: dwc3_gadget_ep_cmd: ep5in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251956: dwc3_gadget_ep_cmd: ep6out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251959: dwc3_gadget_ep_cmd: ep6in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251962: dwc3_gadget_ep_cmd: ep7out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251965: dwc3_gadget_ep_cmd: ep7in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251968: dwc3_gadget_ep_cmd: ep8out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251972: dwc3_gadget_ep_cmd: ep8in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251975: dwc3_gadget_ep_cmd: ep9out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251978: dwc3_gadget_ep_cmd: ep9in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251981: dwc3_gadget_ep_cmd: ep10out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251984: dwc3_gadget_ep_cmd: ep10in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251987: dwc3_gadget_ep_cmd: ep11out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251990: dwc3_gadget_ep_cmd: ep11in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251993: dwc3_gadget_ep_cmd: ep12out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251996: dwc3_gadget_ep_cmd: ep12in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.251999: dwc3_gadget_ep_cmd: ep13out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252002: dwc3_gadget_ep_cmd: ep13in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252005: dwc3_gadget_ep_cmd: ep14out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252008: dwc3_gadget_ep_cmd: ep14in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252010: dwc3_gadget_ep_cmd: ep15out: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252014: dwc3_gadget_ep_cmd: ep15in: cmd 'Set Endpoint Transfer Resource' [402] params 00000001 00000000 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252017: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 00001000 00000500 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252020: dwc3_gadget_ep_enable: ep0out: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:>
         modprobe-1217  [000] dn..    24.252023: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 00001000 02000500 00000000 --> status: Successful
         modprobe-1217  [000] dn..    24.252024: dwc3_gadget_ep_enable: ep0in: mps 512/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
         modprobe-1217  [000] dn..    24.252026: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
         modprobe-1217  [000] dn..    24.252031: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.252094: dwc3_event: event (00150301): Link Change [RX.Detect]
     irq/170-dwc3-1219  [000] d...    24.350345: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1219  [000] d...    24.350348: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1219  [000] d...    24.353334: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1219  [000] d...    24.356348: dwc3_event: event (00030301): Link Change [U3]
     irq/170-dwc3-1219  [000] d...    24.521061: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1219  [000] d...    24.537077: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1219  [000] d...    24.537085: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.537088: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1219  [000] d...    24.537091: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.537093: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.537094: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1219  [000] d...    24.600865: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.600868: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 64)
     irq/170-dwc3-1219  [000] d...    24.600880: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.600885: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.600889: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.600924: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.600926: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.600932: dwc3_gadget_giveback: ep0out: req 36a8842f length 18/18 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.600934: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.600935: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.600941: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.600970: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.600972: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.600976: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.600981: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.604059: dwc3_event: event (00050301): Link Change [RX.Detect]
     irq/170-dwc3-1219  [000] d...    24.604557: dwc3_event: event (00000101): Reset [U0]
     irq/170-dwc3-1219  [000] d...    24.617104: dwc3_event: event (00000201): Connection Done [U0]
     irq/170-dwc3-1219  [000] d...    24.617110: dwc3_gadget_ep_cmd: ep0out: cmd 'Set Endpoint Configuration' [401] params 80000200 00000500 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.617112: dwc3_gadget_ep_enable: ep0out: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swBp:>
     irq/170-dwc3-1219  [000] d...    24.617115: dwc3_gadget_ep_cmd: ep0in: cmd 'Set Endpoint Configuration' [401] params 80000200 02000500 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.617116: dwc3_gadget_ep_enable: ep0in: mps 64/512 streams 0 burst 1 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.617119: dwc3_event: event (00000301): Link Change [U0]
     irq/170-dwc3-1219  [000] d...    24.680836: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.680838: dwc3_ctrl_req: Set Address(Addr = 12)
     irq/170-dwc3-1219  [000] d...    24.680843: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.680844: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.680850: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.680888: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.680890: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.680893: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.680899: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.700749: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.700751: dwc3_ctrl_req: Get Device Descriptor(Index = 0, Length = 18)
     irq/170-dwc3-1219  [000] d...    24.700757: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 18 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.700763: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.700767: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.700793: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.700794: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.700799: dwc3_gadget_giveback: ep0out: req 36a8842f length 18/18 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.700806: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.700807: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.700813: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.700877: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.700879: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.700883: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.700888: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.700962: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.700963: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 5)
     irq/170-dwc3-1219  [000] d...    24.700970: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 5 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.700975: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.700985: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701008: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701010: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.701014: dwc3_gadget_giveback: ep0out: req 36a8842f length 5/5 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.701015: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701016: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701022: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701050: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701051: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701055: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.701061: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701207: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.701208: dwc3_ctrl_req: Get BOS Descriptor(Index = 0, Length = 22)
     irq/170-dwc3-1219  [000] d...    24.701214: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 22 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.701220: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701229: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701256: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701257: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.701261: dwc3_gadget_giveback: ep0out: req 36a8842f length 22/22 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.701268: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701269: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701274: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701307: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701309: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701312: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.701318: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701468: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.701469: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 9)
     irq/170-dwc3-1219  [000] d...    24.701478: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 9 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.701484: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701493: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701499: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701500: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.701505: dwc3_gadget_giveback: ep0out: req 36a8842f length 9/9 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.701511: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701512: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701517: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701554: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701555: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701559: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.701565: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701719: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.701721: dwc3_ctrl_req: Get Configuration Descriptor(Index = 0, Length = 219)
     irq/170-dwc3-1219  [000] d...    24.701728: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 219 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.701734: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701743: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701777: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.701778: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.701782: dwc3_gadget_giveback: ep0out: req 36a8842f length 219/219 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.701783: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701785: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701790: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.701848: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.701849: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.701853: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.701858: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702009: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.702010: dwc3_ctrl_req: Get String Descriptor(Index = 0, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.702017: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.702022: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702032: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.702058: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.702059: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.702063: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.702070: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.702071: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.702076: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702131: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.702132: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.702136: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.702141: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702226: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.702227: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.702235: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 46 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.702240: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702249: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.702265: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.702267: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.702271: dwc3_gadget_giveback: ep0out: req 36a8842f length 46/46 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.702277: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.702278: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.702284: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702311: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.702312: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.702316: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.702321: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702360: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.702361: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.702368: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 106 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.702373: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702382: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.702398: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.702399: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.702404: dwc3_gadget_giveback: ep0out: req 36a8842f length 106/106 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.702410: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.702411: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.702416: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702443: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.702444: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.702448: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.702454: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.702770: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.702771: dwc3_ctrl_req: Set Configuration(Config = 1)
     irq/170-dwc3-1219  [000] d...    24.709525: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.709528: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.709534: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.709558: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.709559: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.709563: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.709565: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.709570: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.709772: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.709774: dwc3_ctrl_req: Get String Descriptor(Index = 5, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.709781: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 34 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.709787: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.709790: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.709819: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.709821: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.709825: dwc3_gadget_giveback: ep0out: req 36a8842f length 34/34 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.709826: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.709827: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.709834: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.709857: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.709858: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.709862: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.709868: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710078: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.710079: dwc3_ctrl_req: Get String Descriptor(Index = 2, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.710086: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 46 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710092: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710095: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710125: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710126: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710130: dwc3_gadget_giveback: ep0out: req 36a8842f length 46/46 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.710137: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710139: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710144: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710181: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710182: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710186: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.710191: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710253: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.710254: dwc3_ctrl_req: Get String Descriptor(Index = 1, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.710261: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 106 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710266: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710275: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710308: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710309: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710313: dwc3_gadget_giveback: ep0out: req 36a8842f length 106/106 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.710320: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710321: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710327: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710380: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710381: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710385: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.710391: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710469: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.710470: dwc3_ctrl_req: a1 02 00 01 00 05 02 00
     irq/170-dwc3-1219  [000] d...    24.710476: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 2 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710482: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710490: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710517: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710518: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710522: dwc3_gadget_giveback: ep0out: req 36a8842f length 2/2 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.710529: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710530: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710535: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710567: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710568: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710572: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.710577: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710666: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.710667: dwc3_ctrl_req: a1 02 00 01 00 05 0e 00
     irq/170-dwc3-1219  [000] d...    24.710674: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 14 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710679: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710687: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710714: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.710715: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.710719: dwc3_gadget_giveback: ep0out: req 36a8842f length 14/14 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.710725: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710726: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710732: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.710789: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.710790: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.710794: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.710799: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.711254: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.711256: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.711264: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.711270: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1219  [000] d...    24.711273: dwc3_alloc_request: ep1out: req 25488c21 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.711276: dwc3_ep_queue: ep1out: req 25488c21 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.711277: dwc3_alloc_request: ep1out: req 4d479605 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.711279: dwc3_ep_queue: ep1out: req 4d479605 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.711286: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.711287: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.711293: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.711325: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.711326: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.711330: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.711332: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.711337: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.711353: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.711355: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.711362: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.711368: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.711375: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.711376: dwc3_event: event (000090c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.711405: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.711406: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.711410: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.711411: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.711413: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.711418: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.711475: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.711476: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.711480: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.711485: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712141: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.712143: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.712148: dwc3_ep_dequeue: ep1out: req 25488c21 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.712149: dwc3_gadget_giveback: ep1out: req 25488c21 length 0/256 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.712152: dwc3_free_request: ep1out: req 25488c21 length 0/256 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.712153: dwc3_ep_dequeue: ep1out: req 4d479605 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.712154: dwc3_gadget_giveback: ep1out: req 4d479605 length 0/256 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.712156: dwc3_free_request: ep1out: req 4d479605 length 0/256 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.712159: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1219  [000] d...    24.712163: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.712164: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.712169: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712205: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.712206: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.712210: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.712212: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.712217: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712287: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.712288: dwc3_ctrl_req: a1 02 00 01 00 06 02 00
     irq/170-dwc3-1219  [000] d...    24.712294: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 2 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.712300: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712309: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.712310: dwc3_event: event (000090c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.712337: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.712338: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.712342: dwc3_gadget_giveback: ep0out: req 36a8842f length 2/2 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.712349: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.712350: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.712356: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712414: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.712415: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.712419: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.712424: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712466: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.712467: dwc3_ctrl_req: a1 02 00 01 00 06 0e 00
     irq/170-dwc3-1219  [000] d...    24.712475: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 14 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.712480: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712488: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.712494: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.712495: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.712499: dwc3_gadget_giveback: ep0out: req 36a8842f length 14/14 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.712505: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.712506: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.712511: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.712546: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.712548: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.712551: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.712557: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.713234: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.713235: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.713243: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.713249: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.713251: dwc3_alloc_request: ep1in: req 4d479605 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.713253: dwc3_ep_queue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.713254: dwc3_alloc_request: ep1in: req 25488c21 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.713256: dwc3_ep_queue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.713259: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.713260: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.713266: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.713304: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.713305: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.713309: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.713310: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.713316: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.713421: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.713422: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.713428: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.713434: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.713441: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.713442: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.713443: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.713448: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.713455: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.713456: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.713462: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.713495: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.713496: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.713500: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.713506: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.714138: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.714139: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.714143: dwc3_ep_dequeue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.714145: dwc3_gadget_giveback: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.714146: dwc3_free_request: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.714148: dwc3_ep_dequeue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.714149: dwc3_gadget_giveback: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.714150: dwc3_free_request: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.714152: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.714155: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.714156: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.714161: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.714179: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.714180: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.714183: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.714185: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.714192: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.715183: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.715184: dwc3_ctrl_req: Get String Descriptor(Index = 12, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.715191: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 36 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.715196: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.715199: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.715228: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.715229: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.715233: dwc3_gadget_giveback: ep0out: req 36a8842f length 36/36 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.715240: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.715241: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.715246: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.715273: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.715274: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.715278: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.715283: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.715387: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.715388: dwc3_ctrl_req: Get String Descriptor(Index = 14, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.715395: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 34 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.715400: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.715408: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.715434: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.715436: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.715440: dwc3_gadget_giveback: ep0out: req 36a8842f length 34/34 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.715446: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.715447: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.715453: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.715509: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.715510: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.715514: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.715519: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768166: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.768167: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.768175: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768181: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.768183: dwc3_alloc_request: ep1in: req 25488c21 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.768185: dwc3_ep_queue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.768187: dwc3_alloc_request: ep1in: req 4d479605 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.768188: dwc3_ep_queue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.768190: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.768191: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.768197: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768219: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.768220: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.768224: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.768226: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.768231: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768257: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.768259: dwc3_ctrl_req: Get String Descriptor(Index = 15, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.768265: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 30 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.768271: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768280: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.768306: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.768307: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.768312: dwc3_gadget_giveback: ep0out: req 36a8842f length 30/30 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.768319: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.768320: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.768326: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768380: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.768382: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.768385: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.768391: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768474: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.768476: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.768482: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.768488: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768496: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.768513: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.768514: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.768518: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.768525: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.768526: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.768531: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.768561: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.768562: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.768566: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.768572: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.772435: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.772437: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.772441: dwc3_ep_dequeue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.772443: dwc3_gadget_giveback: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.772444: dwc3_free_request: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.772445: dwc3_ep_dequeue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.772447: dwc3_gadget_giveback: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.772448: dwc3_free_request: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.772449: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.772454: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.772455: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.772460: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.772477: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.772478: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.772482: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.772483: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.772489: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.773594: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.773595: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.773603: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.773609: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.773611: dwc3_alloc_request: ep1in: req 4d479605 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.773612: dwc3_ep_queue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.773614: dwc3_alloc_request: ep1in: req 25488c21 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.773615: dwc3_ep_queue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.773617: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.773618: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.773623: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.773662: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.773663: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.773667: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.773668: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.773675: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.773759: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.773761: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.773767: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.773773: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.773780: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.773786: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.773787: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.773791: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.773797: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.773798: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.773803: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.773838: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.773840: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.773843: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.773849: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.774460: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.774461: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.774465: dwc3_ep_dequeue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.774466: dwc3_gadget_giveback: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.774468: dwc3_free_request: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.774469: dwc3_ep_dequeue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.774470: dwc3_gadget_giveback: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.774471: dwc3_free_request: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.774473: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.774475: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.774476: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.774482: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.774508: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.774509: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.774513: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.774515: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.774520: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776163: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.776164: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.776171: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776177: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1219  [000] d...    24.776179: dwc3_alloc_request: ep1out: req 25488c21 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.776181: dwc3_ep_queue: ep1out: req 25488c21 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.776183: dwc3_alloc_request: ep1out: req 4d479605 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.776185: dwc3_ep_queue: ep1out: req 4d479605 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.776193: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.776194: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.776199: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776226: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.776227: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.776230: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.776232: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.776237: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776269: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.776270: dwc3_ctrl_req: Get String Descriptor(Index = 13, Length = 255)
     irq/170-dwc3-1219  [000] d...    24.776276: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 32 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.776282: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776289: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.776315: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.776316: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.776320: dwc3_gadget_giveback: ep0out: req 36a8842f length 32/32 ZsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.776328: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.776329: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.776335: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776361: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.776362: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.776366: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.776371: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776451: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.776452: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.776458: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.776464: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776471: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.776497: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.776498: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.776502: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.776510: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.776511: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.776517: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.776543: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.776544: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.776547: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.776553: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.777193: dwc3_event: event (0e7800c4): ep1out: Transfer Not Ready [3704] (Not Active)
     irq/170-dwc3-1219  [000] d...    24.777196: dwc3_prepare_trb: ep1out: trb e01310e5 buf 00000000ad7a0a00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.777200: dwc3_prepare_trb: ep1out: trb 006001fd buf 00000000ad7a0b00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.777206: dwc3_gadget_ep_cmd: ep1out: cmd 'Start Transfer' [e800406] params 00000000 fe05c000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.778186: dwc3_event: event (0e806084): ep1out: Transfer In Progress [3712] (SIm)
     irq/170-dwc3-1219  [000] d...    24.778188: dwc3_complete_trb: ep1out: trb e01310e5 buf 00000000ad7a0a00 size 1x 0 ctrl 03a00c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.778193: dwc3_gadget_giveback: ep1out: req 25488c21 length 256/256 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.778195: dwc3_ep_queue: ep1out: req 25488c21 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.778197: dwc3_prepare_trb: ep1out: trb 8692d9f9 buf 00000000ad7a0a00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.778202: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.778441: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.778443: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.778450: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.778456: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.778458: dwc3_alloc_request: ep1in: req 9107cfae length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.778460: dwc3_ep_queue: ep1in: req 9107cfae length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.778462: dwc3_alloc_request: ep1in: req 83d67cfd length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.778464: dwc3_ep_queue: ep1in: req 83d67cfd length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.778472: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.778473: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.778478: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.778506: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.778507: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.778510: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.778512: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.778518: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.778573: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.778574: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.778581: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.778586: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.778594: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.778609: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.778611: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.778615: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.778622: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.778623: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.778629: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.778656: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.778657: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.778661: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.778666: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.779104: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.779105: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.779110: dwc3_ep_dequeue: ep1in: req 9107cfae length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.779111: dwc3_gadget_giveback: ep1in: req 9107cfae length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.779113: dwc3_free_request: ep1in: req 9107cfae length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.779114: dwc3_ep_dequeue: ep1in: req 83d67cfd length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.779115: dwc3_gadget_giveback: ep1in: req 83d67cfd length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.779116: dwc3_free_request: ep1in: req 83d67cfd length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.779118: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.779126: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.779127: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.779132: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.779150: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.779151: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.779154: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.779156: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.779162: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.779190: dwc3_event: event (0e886084): ep1out: Transfer In Progress [3720] (SIm)
     irq/170-dwc3-1219  [000] d...    24.779191: dwc3_complete_trb: ep1out: trb 006001fd buf 00000000ad7a0b00 size 1x 0 ctrl 03a20c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.779196: dwc3_gadget_giveback: ep1out: req 4d479605 length 256/256 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.779198: dwc3_ep_queue: ep1out: req 4d479605 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.779200: dwc3_prepare_trb: ep1out: trb 23d14d25 buf 00000000ad7a0b00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.779206: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780158: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.780160: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.780168: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780174: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.780176: dwc3_alloc_request: ep1in: req 83d67cfd length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.780177: dwc3_ep_queue: ep1in: req 83d67cfd length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.780179: dwc3_alloc_request: ep1in: req 9107cfae length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.780180: dwc3_ep_queue: ep1in: req 9107cfae length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.780182: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.780183: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.780189: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780196: dwc3_event: event (0e906084): ep1out: Transfer In Progress [3728] (SIm)
     irq/170-dwc3-1219  [000] d...    24.780197: dwc3_complete_trb: ep1out: trb 8692d9f9 buf 00000000ad7a0a00 size 1x 0 ctrl 03a40c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.780202: dwc3_gadget_giveback: ep1out: req 25488c21 length 256/256 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.780204: dwc3_ep_queue: ep1out: req 25488c21 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.780206: dwc3_prepare_trb: ep1out: trb 657e9f90 buf 00000000ad7a0a00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.780211: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780219: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.780220: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.780223: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.780225: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.780230: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780295: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.780296: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.780303: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.780308: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780316: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.780317: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.780318: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.780322: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.780328: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.780329: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.780334: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780372: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.780373: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.780377: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.780383: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780828: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.780830: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.780834: dwc3_ep_dequeue: ep1out: req 25488c21 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.780838: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.780942: dwc3_gadget_ep_dequeue: ---> req 25488c21 moved to cancelled
     irq/170-dwc3-1219  [000] d...    24.780943: dwc3_free_request: ep1out: req 25488c21 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.780945: dwc3_ep_dequeue: ep1out: req 4d479605 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.780948: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.781050: dwc3_gadget_ep_dequeue: ---> req 4d479605 moved to cancelled
     irq/170-dwc3-1219  [000] d...    24.781051: dwc3_free_request: ep1out: req 4d479605 length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.781053: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 5/3 flags E:swBp:>
     irq/170-dwc3-1219  [000] d...    24.781056: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.781164: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.781165: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.781171: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.781173: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1219  [000] d...    24.781173: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1219  [000] d...    24.781191: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.781192: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.781196: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.781198: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.781203: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.781664: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.781665: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.781670: dwc3_ep_dequeue: ep1in: req 83d67cfd length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.781671: dwc3_gadget_giveback: ep1in: req 83d67cfd length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.781673: dwc3_free_request: ep1in: req 83d67cfd length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.781674: dwc3_ep_dequeue: ep1in: req 9107cfae length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.781675: dwc3_gadget_giveback: ep1in: req 9107cfae length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.781676: dwc3_free_request: ep1in: req 9107cfae length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.781678: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.781686: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.781687: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.781692: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.781729: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.781730: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.781734: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.781735: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.781741: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.790998: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.791001: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.791009: dwc3_gadget_ep_cmd: ep1out: cmd 'Set Endpoint Configuration' [401] params 00000802 04030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.791015: dwc3_gadget_ep_enable: ep1out: mps 256/1024 streams 15 burst 0 ring 0/0 flags E:swbp:>
     irq/170-dwc3-1219  [000] d...    24.791017: dwc3_alloc_request: ep1out: req 9107cfae length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.791018: dwc3_ep_queue: ep1out: req 9107cfae length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.791020: dwc3_alloc_request: ep1out: req 83d67cfd length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.791021: dwc3_ep_queue: ep1out: req 83d67cfd length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.791023: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.791024: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.791030: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.791058: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.791059: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.791062: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.791064: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.791069: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.791141: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.791142: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.791149: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.791155: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.791162: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.791189: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.791191: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.791195: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.791202: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.791203: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.791208: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.791225: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.791226: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.791230: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.791235: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792068: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.792070: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.792078: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792084: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.792086: dwc3_alloc_request: ep1in: req 4d479605 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.792087: dwc3_ep_queue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.792089: dwc3_alloc_request: ep1in: req 25488c21 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.792090: dwc3_ep_queue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.792092: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.792093: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.792098: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792137: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.792138: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.792142: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.792144: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.792149: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792199: dwc3_event: event (0ef000c4): ep1out: Transfer Not Ready [3824] (Not Active)
     irq/170-dwc3-1219  [000] d...    24.792202: dwc3_prepare_trb: ep1out: trb e01310e5 buf 00000000ad7a0a00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.792206: dwc3_prepare_trb: ep1out: trb 006001fd buf 00000000ad7a0b00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.792211: dwc3_gadget_ep_cmd: ep1out: cmd 'Start Transfer' [ef80406] params 00000000 fe05c000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792219: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.792219: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.792226: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.792231: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792233: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.792250: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.792252: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.792256: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.792264: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.792265: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.792270: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792306: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.792307: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.792311: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.792316: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792778: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.792779: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.792783: dwc3_ep_dequeue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.792785: dwc3_gadget_giveback: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.792787: dwc3_free_request: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.792788: dwc3_ep_dequeue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.792789: dwc3_gadget_giveback: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.792790: dwc3_free_request: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.792791: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.792799: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.792801: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.792806: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.792839: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.792840: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.792843: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.792845: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.792852: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.793190: dwc3_event: event (0ef86084): ep1out: Transfer In Progress [3832] (SIm)
     irq/170-dwc3-1219  [000] d...    24.793192: dwc3_complete_trb: ep1out: trb e01310e5 buf 00000000ad7a0a00 size 1x 0 ctrl 03be0c68 (hlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.793196: dwc3_gadget_giveback: ep1out: req 9107cfae length 256/256 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.793199: dwc3_ep_queue: ep1out: req 9107cfae length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.793201: dwc3_prepare_trb: ep1out: trb 8692d9f9 buf 00000000ad7a0a00 size 1x 256 ctrl 00000c69 (HlcS:SC:isoc-first)
     irq/170-dwc3-1219  [000] d...    24.793205: dwc3_gadget_ep_cmd: ep1out: cmd 'Update Transfer' [20407] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.793831: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.793832: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 1)
     irq/170-dwc3-1219  [000] d...    24.793840: dwc3_gadget_ep_cmd: ep1in: cmd 'Set Endpoint Configuration' [401] params 00020602 06030600 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.793846: dwc3_gadget_ep_enable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.793848: dwc3_alloc_request: ep1in: req 25488c21 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.793849: dwc3_ep_queue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.793851: dwc3_alloc_request: ep1in: req 4d479605 length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.793853: dwc3_ep_queue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.793854: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.793856: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.793861: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.793897: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.793899: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.793902: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.793904: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.793909: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.793962: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.793965: dwc3_ctrl_req: Clear Interface Feature(UNKNOWN)
     irq/170-dwc3-1219  [000] d...    24.793971: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000acfcb000 size 4 ctrl 00000c53 (HLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.793976: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.793984: dwc3_event: event (000010c2): ep0in:  [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.794010: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Data Phase]
     irq/170-dwc3-1219  [000] d...    24.794011: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000acfcb000 size 0 ctrl 00000c52 (hLcs:SC:data)
     irq/170-dwc3-1219  [000] d...    24.794015: dwc3_gadget_giveback: ep0out: req 36a8842f length 4/4 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.794022: dwc3_event: event (000020c0): ep0out:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.794023: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c43 (HLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.794028: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.794061: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.794063: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c42 (hLcs:SC:status3)
     irq/170-dwc3-1219  [000] d...    24.794067: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.794072: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.801148: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.801151: dwc3_ctrl_req: Set Interface(Intf = 1, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.801155: dwc3_ep_dequeue: ep1out: req 9107cfae length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.801159: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [20d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.801262: dwc3_gadget_ep_dequeue: ---> req 9107cfae moved to cancelled
     irq/170-dwc3-1219  [000] d...    24.801263: dwc3_free_request: ep1out: req 9107cfae length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.801265: dwc3_ep_dequeue: ep1out: req 83d67cfd length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.801268: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [d08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.801370: dwc3_gadget_ep_dequeue: ---> req 83d67cfd moved to cancelled
     irq/170-dwc3-1219  [000] d...    24.801371: dwc3_free_request: ep1out: req 83d67cfd length 0/256 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.801373: dwc3_gadget_ep_disable: ep1out: mps 256/1024 streams 15 burst 0 ring 3/1 flags E:swBp:>
     irq/170-dwc3-1219  [000] d...    24.801376: dwc3_gadget_ep_cmd: ep1out: cmd 'End Transfer' [c08] params 00000000 00000000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.801479: dwc3_event: event (000020c2): ep0in:  [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.801480: dwc3_prepare_trb: ep0in: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c33 (HLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.801485: dwc3_gadget_ep_cmd: ep0in: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.801493: dwc3_event: event (080201c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1219  [000] d...    24.801494: dwc3_event: event (080001c4): ep1out: Endpoint Command Complete
     irq/170-dwc3-1219  [000] d...    24.801513: dwc3_event: event (0000c042): ep0in: Transfer Complete (sIL) [Status Phase]
     irq/170-dwc3-1219  [000] d...    24.801515: dwc3_complete_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 0 ctrl 00000c32 (hLcs:SC:status2)
     irq/170-dwc3-1219  [000] d...    24.801518: dwc3_gadget_giveback: ep0out: req 36a8842f length 0/0 zsI ==> 0
     irq/170-dwc3-1219  [000] d...    24.801520: dwc3_prepare_trb: ep0out: trb 35168a42 buf 00000000fe05a000 size 8 ctrl 00000c23 (HLcs:SC:setup)
     irq/170-dwc3-1219  [000] d...    24.801525: dwc3_gadget_ep_cmd: ep0out: cmd 'Start Transfer' [406] params 00000000 fe05a000 00000000 --> status: Successful
     irq/170-dwc3-1219  [000] d...    24.801979: dwc3_event: event (0000c040): ep0out: Transfer Complete (sIL) [Setup Phase]
     irq/170-dwc3-1219  [000] d...    24.801982: dwc3_ctrl_req: Set Interface(Intf = 2, Alt.Setting = 0)
     irq/170-dwc3-1219  [000] d...    24.801987: dwc3_ep_dequeue: ep1in: req 25488c21 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.801988: dwc3_gadget_giveback: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.801990: dwc3_free_request: ep1in: req 25488c21 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.801991: dwc3_ep_dequeue: ep1in: req 4d479605 length 0/192 zsI ==> -115
     irq/170-dwc3-1219  [000] d...    24.801992: dwc3_gadget_giveback: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.801993: dwc3_free_request: ep1in: req 4d479605 length 0/192 zsI ==> -104
     irq/170-dwc3-1219  [000] d...    24.801995: dwc3_gadget_ep_disable: ep1in: mps 192/1024 streams 15 burst 0 ring 0/0 flags E:swbp:<
     irq/170-dwc3-1219  [000] d...    24.801996: dwc3_gadget_giveback: ep1out: req 9107cfae length 0/256 zsI ==> -108
     irq/170-dwc3-1219  [000] d...    24.801998: dwc3_gadget_giveback: ep1out: req 83d67cfd length 0/256 zsI ==> -108
     irq/170-dwc3-1219  [000] d...    24.801999: dwc3_gadget_giveback: : req 3a7b7028 length 0/0 Zsi ==> 0

-- 
cheers,
-roger
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
