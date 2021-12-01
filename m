Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2700464C53
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 12:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347733AbhLALIJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 06:08:09 -0500
Received: from informare.org ([217.11.52.70]:38950 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229696AbhLALII (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Dec 2021 06:08:08 -0500
Received: (qmail 20772 invoked from network); 1 Dec 2021 11:04:40 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.169.118)
  by 0 with ESMTPA; 1 Dec 2021 11:04:40 -0000
Message-ID: <08e62c4a-a911-9d35-8427-b5fbc9e959e6@faberman.de>
Date:   Wed, 1 Dec 2021 12:04:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v4] usb: gadget: composite: req->complete not set, using
 wrong callback for complete
Content-Language: en-US
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
 <e389b7e4-f8c5-1561-2fbc-e926270fc894@faberman.de>
 <20211127052031.GA7285@Peter>
From:   Florian Faber <faber@faberman.de>
In-Reply-To: <20211127052031.GA7285@Peter>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Peter,

On 11/27/21 06:20, Peter Chen wrote:
> On 21-10-13 16:15:13, Florian Faber wrote:
>> In usb_composite_setup_continue, req->complete is not set, leaving the
>> previous value untouched. After completion of the ep0 transaction, the
>> UDC would then call whatever complete callback was set previously with
>> the composite cdev as context,
> 
> Would you please explain more how ep0's req has changed? EP0's req
> should not be called by UDC driver.

I have found this bug by adding a source identifier field to struct usb_request so I could not only detect wether a correct packet was sent to a complete function, but also trace the exact origin. That way I could show that a packet with a gadget's completion callback was generated in composite.c.

I don't understand your question. Of course composite.c's completion function is called from the UDC driver.

>> leading to all sorts of havoc.
>>
>> A typical call trace looks like this: A setup packet for mass storage,
>> ending up in RNDIS's complete function:
> 
> Sorry, I could not understand your back trace well, would you mind
> explaining more? Besides, what's your kernel version?

For some reasons, the kernel stack traces on the target are often wrong and manually looking up the addresses in gdb gives the correct location in the source. That might be the case in this trace as well.

4.14.115.

>> ---------------------------snip---------------------------------
>> [  183.795661] [<bf10b31c>] (rndis_response_complete [usb_f_rndis]) from [<bf0ec024>] (xgs_iproc_ep_enable+0x92c/0xd2c [xgs_iproc_udc])
>> [  183.795666]  r5:df5d73ac r4:df767c80
> 
> What is xgs_iproc_udc? It seems a downstream UDC driver.

Yes, embedded system with iproc SoC.

>> [  183.795682] [<bf0ebf20>] (xgs_iproc_ep_enable [xgs_iproc_udc]) from [<bf0eca8c>] (xgs_iproc_ep_queue+0x384/0x5bc [xgs_iproc_udc])
>> [  183.795687]  r7:df767cb8 r6:df5d7380 r5:df767c80 r4:df5d73ac
>> [  183.795706] [<bf0ec708>] (xgs_iproc_ep_queue [xgs_iproc_udc]) from [<c0384fec>] (usb_ep_queue+0x1f0/0x238)
>> [  183.795713]  r10:43425355 r9:df767c80 r8:df767c80 r7:a00f0013 r6:df5d73ac r5:df767c80
>> [  183.795716]  r4:df65dea8
>> [  183.795743] [<c0384dfc>] (usb_ep_queue) from [<bf0f6910>] (usb_composite_overwrite_options+0x128/0x184 [libcomposite])
> 
> How could usb_ep_queue is called in usb_composite_overwrite_options?
>> [  183.795750]  r9:00055302 r8:df767c80 r7:a00f0013 r6:df65df04 r5:df767c80 r4:df65dea8
>> [  183.795777] [<bf0f68e0>] (usb_composite_overwrite_options [libcomposite]) from [<bf0f69f4>] (usb_composite_setup_continue+0x88/0x138 [libcomposite])
>> [  183.795782]  r7:a00f0013 r6:df65df04 r5:00000000 r4:df65dea8
>> [  183.795812] [<bf0f696c>] (usb_composite_setup_continue [libcomposite]) from [<bf120cf8>] (fsg_alloc_inst+0xa5c/0xac8 [usb_f_mass_storage])
> 
> How could usb_composite_setup_continue is called in fsg_alloc_inst? The
> usb_composite_setup_continue is usually called at the very late of
> enumeration.

I don't know what this has to do with this bug. The only relevant question is: Why is the callback function not set in this particular location in composite.c?

>> [  183.795819]  r9:00055302 r8:00000003 r7:deca5800 r6:00000001 r5:df595a80 r4:deca5948
>> [  183.795840] [<bf120a68>] (fsg_alloc_inst [usb_f_mass_storage]) from [<bf120e00>] (fsg_main_thread+0x9c/0x15dc [usb_f_mass_storage])
> 
> How fsg_alloc_inst is called at fsg_main_thread> 
> Peter
> 
>> [  183.795846]  r8:df770000 r7:df595a80 r6:deca1cc0 r5:df724000 r4:deca5800
>> [  183.795864] [<bf120d64>] (fsg_main_thread [usb_f_mass_storage]) from [<c0046cd0>] (kthread+0x14c/0x154)
>> [  183.795870]  r10:df785d14 r9:00000000 r8:deca5800 r7:df6c31b8 r6:df70f580 r5:df724000
>> [  183.795873]  r4:df6c3180
>> [  183.795881] [<c0046b84>] (kthread) from [<c000a67c>] (ret_from_fork+0x14/0x38)
>> [  183.795887]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0046b84
>> [  183.795889]  r4:df70f580
>> --------------------------snip-------------------------------------
> 
> 
>>
>> Fixes: 57943716ff1b ("usb: gadget: composite: set our req->context to cdev")
>> Signed-off-by: Florian Faber <faber@faberman.de>
>>
>> ---
>> Change in v4:
>>    - Short commit hash
>>    - Fix line wrap
>>
>> Change in v3:
>>    - Addes changes
>>
>> Change in v2:
>>    - More verbose explanation
>>    - Added commit hash that introduced the bug
>>
>>   drivers/usb/gadget/composite.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>> index 504c1cbc255d..8d497be4be32 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct usb_composite_dev *cdev)
>>   		DBG(cdev, "%s: Completing delayed status\n", __func__);
>>   		req->length = 0;
>>   		req->context = cdev;
>> +		req->complete = composite_setup_complete;
>>   		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
>>   		if (value < 0) {
>>   			DBG(cdev, "ep_queue --> %d\n", value);
>> -- 
> 

Flo
-- 
Machines can do the work, so people have time to think.
