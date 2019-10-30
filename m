Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9D9E9BA3
	for <lists+linux-usb@lfdr.de>; Wed, 30 Oct 2019 13:39:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726646AbfJ3MjG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Oct 2019 08:39:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57218 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbfJ3MjG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Oct 2019 08:39:06 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UCd31D059101;
        Wed, 30 Oct 2019 07:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572439143;
        bh=zzr0lbNyXxAIMPCRGutK0A7QyhYXHgxsW0VdLgl6n0Q=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=n3+xpNYV7f0jKRWHu67nl0XCoKHoD+QOZqklPPT019NcboYp/Avxws/m5eKE1nwa7
         giPZ/TvrtfvMJunqA5plrMxkfNNil91WEecvKWBTOlY/1dY7ZV8U9qFln0ICmLr+Us
         mys4vUljthpNFQSmrW6HiunRBqpmwLaBcKuLGbMg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UCd2uM100537
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 07:39:03 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 07:38:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 07:38:50 -0500
Received: from [192.168.2.14] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UCd1Mi100190;
        Wed, 30 Oct 2019 07:39:01 -0500
Subject: Re: g_audio breaks with dwc3
To:     Felipe Balbi <balbi@kernel.org>, Jack Pham <jackp@codeaurora.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Bin Liu [EP]" <b-liu@ti.com>
References: <c97b96cf-65f6-5143-838f-a3e9d1a5c5b2@ti.com>
 <20191030081757.GB12661@jackp-linux.qualcomm.com> <87mudihapt.fsf@gmail.com>
 <9ca2f64b-2cbc-3757-2e5f-233b968f3dd1@ti.com> <87bltyfp90.fsf@gmail.com>
From:   Roger Quadros <rogerq@ti.com>
Message-ID: <a31ea724-fcdf-cb36-1af2-24fd34f4c967@ti.com>
Date:   Wed, 30 Oct 2019 14:39:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <87bltyfp90.fsf@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Felipe,

On 30/10/2019 13:26, Felipe Balbi wrote:
> 
> Hi,
> 
> Roger Quadros <rogerq@ti.com> writes:
>>>>>       irq/170-dwc3-1240  [000] d...    85.450564: dwc3_gadget_giveback: ep1out: req ee75d6ac length 0/256 zsI ==> -108
>>>>>       irq/170-dwc3-1240  [000] d...    85.450566: dwc3_gadget_giveback: ep1out: req c26c10a3 length 0/256 zsI ==> -108
>>>>>       irq/170-dwc3-1240  [000] d...    85.450567: dwc3_gadget_giveback: : req d4301893 length 0/0 zsI ==> 0
>>>>
>>>> Giveback happens on above two reqs after they are already freed. Could
>>>> it be due to f_uac2 / u_audio.c performing usb_ep_free_request()
>>>> immediately after usb_ep_dequeue() without waiting for completion?
>>>
>>> this could be a race condition. Add a trace_printk() at the cancelation,
>>> see if the request is moved to cancelled list.
>>>
>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>> index 86dc1db788a9..affc2f7a929d 100644
>>> --- a/drivers/usb/dwc3/gadget.c
>>> +++ b/drivers/usb/dwc3/gadget.c
>>> @@ -1513,6 +1513,7 @@ static void dwc3_gadget_ep_cleanup_cancelled_requests(struct dwc3_ep *dep)
>>>    	struct dwc3_request		*tmp;
>>>    
>>>    	list_for_each_entry_safe(req, tmp, &dep->cancelled_list, list) {
>>> +		trace_printk("---> completing cancellation of req %p\n", req);
>>>    		dwc3_gadget_ep_skip_trbs(dep, req);
>>>    		dwc3_gadget_giveback(dep, req, -ECONNRESET);
>>>    	}
>>> @@ -1551,6 +1552,7 @@ static int dwc3_gadget_ep_dequeue(struct usb_ep *ep,
>>>    			if (!r->trb)
>>>    				goto out0;
>>>    
>>> +			trace_printk("---> req %p moved to cancelled\n", req);
>>>    			dwc3_gadget_move_cancelled_request(req);
>>>    			if (dep->flags & DWC3_EP_TRANSFER_STARTED)
>>>    				goto out0;
>>>
>>>
>>
>> Below is trace with above debug patch applied.
> 
> Did it fail the same way? It doesn't look like in the trace.
> 
> Does this help?
> 
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 86dc1db788a9..a9aba716bf80 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -707,6 +707,12 @@ static void dwc3_remove_requests(struct dwc3 *dwc, struct dwc3_ep *dep)
>   
>   		dwc3_gadget_giveback(dep, req, -ESHUTDOWN);
>   	}
> +
> +	while (!list_empty(&dep->cancelled_list)) {
> +		req = next_request(&dep->cancelled_list);
> +
> +		dwc3_gadget_giveback(dep, req, -ESHUTDOWN);
> +	}
>   }
>   
>   /**
> 

Yes, this fixes the issue.
I'm able to use aplay/arecord as well. Thanks!

cheers,
-roger
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
