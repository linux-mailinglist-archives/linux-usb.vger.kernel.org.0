Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C580EABF8
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 09:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726945AbfJaI4r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 04:56:47 -0400
Received: from mga04.intel.com ([192.55.52.120]:17130 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726875AbfJaI4q (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Oct 2019 04:56:46 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 31 Oct 2019 01:56:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,250,1569308400"; 
   d="scan'208";a="203466071"
Received: from pipin.fi.intel.com (HELO pipin) ([10.237.72.175])
  by orsmga003.jf.intel.com with ESMTP; 31 Oct 2019 01:56:44 -0700
From:   Felipe Balbi <balbi@kernel.org>
To:     Roger Quadros <rogerq@ti.com>, Jack Pham <jackp@codeaurora.org>
Cc:     "linux-usb\@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu \[EP\]" <b-liu@ti.com>
Subject: Re: g_audio breaks with dwc3
In-Reply-To: <a31ea724-fcdf-cb36-1af2-24fd34f4c967@ti.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com> <20191030081757.GB12661@jackp-linux.qualcomm.com> <87mudihapt.fsf@gmail.com> <9ca2f64b-2cbc-3757-2e5f-233b968f3dd1@ti.com> <87bltyfp90.fsf@gmail.com> <a31ea724-fcdf-cb36-1af2-24fd34f4c967@ti.com>
Date:   Thu, 31 Oct 2019 10:56:43 +0200
Message-ID: <87mudhe1is.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Roger Quadros <rogerq@ti.com> writes:
> Felipe,
>
> On 30/10/2019 13:26, Felipe Balbi wrote:
>> 
>> Hi,
>> 
>> Roger Quadros <rogerq@ti.com> writes:
>>>>>>       irq/170-dwc3-1240  [000] d...    85.450564: dwc3_gadget_giveback: ep1out: req ee75d6ac length 0/256 zsI ==> -108
>>>>>>       irq/170-dwc3-1240  [000] d...    85.450566: dwc3_gadget_giveback: ep1out: req c26c10a3 length 0/256 zsI ==> -108
>>>>>>       irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0
>>>>>
>>>>> Giveback happens on above two reqs after they are already freed. Could
>>>>> it be due to f_uac2 / u_audio.c performing usb_ep_free_request()
>>>>> immediately after usb_ep_dequeue() without waiting for completion?
>>>>
>>>> this could be a race condition. Add a trace_printk() at the cancelation,
>>>> see if the request is moved to cancelled list.
>>>>
>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>> index 86dc1db788a9..affc2f7a929d 100644
>>>> --- a/drivers/usb/dwc3/gadget.c
>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>> @@ -1513,6 +1513,7 @@ static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep)
>>>>    	struct dwc3_request		*tmp;
>>>>    
>>>>    	list_for_each_entry_safe(req, tmp, &dep->cancelled_list, list) {
>>>> +		trace_printk("---> completing cancellation of req %p\n", req);
>>>>    		dwc3_gadget_ep_skip_trbs(dep, req);
>>>>    		dwc3_gadget_giveback(dep, req, -ECONNRESET);
>>>>    	}
>>>> @@ -1551,6 +1552,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>>>>    			if (!r->trb)
>>>>    				goto out0;
>>>>    
>>>> +			trace_printk("---> req %p moved to cancelled\n", req);
>>>>    			dwc3_gadget_move_cancelled_request(req);
>>>>    			if (dep->flags & DWC3_EP_TRANSFER_STARTED)
>>>>    				goto out0;
>>>>
>>>>
>>>
>>> Below is trace with above debug patch applied.
>> 
>> Did it fail the same way? It doesn't look like in the trace.
>> 
>> Does this help?
>> 
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 86dc1db788a9..a9aba716bf80 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -707,6 +707,12 @@ static void dwc3_remove_requests(struct dwc3 *dwc, struct dwc3_ep *dep)
>>   
>>   		dwc3_gadget_giveback(dep, req, -ESHUTDOWN);
>>   	}
>> +
>> +	while (!list_empty(&dep->cancelled_list)) {
>> +		req = next_request(&dep->cancelled_list);
>> +
>> +		dwc3_gadget_giveback(dep, req, -ESHUTDOWN);
>> +	}
>>   }
>>   
>>   /**
>> 
>
> Yes, this fixes the issue.
> I'm able to use aplay/arecord as well. Thanks!

Great, I'll send as a fix

-- 
balbi
