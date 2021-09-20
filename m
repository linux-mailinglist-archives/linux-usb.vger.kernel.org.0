Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA99410F5A
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 07:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhITFsC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 01:48:02 -0400
Received: from informare.org ([217.11.52.70]:40666 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231250AbhITFsC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 01:48:02 -0400
Received: (qmail 14560 invoked from network); 20 Sep 2021 05:46:34 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.230.47)
  by 0 with ESMTPA; 20 Sep 2021 05:46:34 -0000
Subject: Re: [PATCH] usb: gadget: composite: req->complete not set, using
 wrong callback for complete
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <bded07a9-0549-569f-dcea-12e8bc7bf091@faberman.de>
 <YUgVD6opx4MwGsJz@kroah.com>
From:   Florian Faber <faber@faberman.de>
Message-ID: <a1fa4299-2ad3-be09-4c83-602f8afa6d1b@faberman.de>
Date:   Mon, 20 Sep 2021 07:46:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUgVD6opx4MwGsJz@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg,

On 9/20/21 6:58 AM, Greg KH wrote:
> On Sun, Sep 19, 2021 at 09:41:27PM +0200, Florian Faber wrote:
>> In usb_composite_setup_continue, req->complete is not set, leaving the
>> previous value untouched. After completion of the ep0 transaction, the UDC
>> would then call whatever complete callback is set with the composite cdev as
>> context, leading to all sorts of havoc.
>>
>> Signed-off-by: Florian Faber <faber@faberman.de>
>>
>> ---
>>   drivers/usb/gadget/composite.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
>> index 504c1cbc255d..8d497be4be32 100644
>> --- a/drivers/usb/gadget/composite.c
>> +++ b/drivers/usb/gadget/composite.c
>> @@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct
>> usb_composite_dev *cdev)
>>   		DBG(cdev, "%s: Completing delayed status\n", __func__);
>>   		req->length = 0;
>>   		req->context = cdev;
>> +		req->complete = composite_setup_complete;
>>   		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
>>   		if (value < 0) {
>>   			DBG(cdev, "ep_queue --> %d\n", value);
>> -- 
> 
> Is this a bugfix? 

Yes.

> If so, what commit does this fix?

Sorry, this mixed git/mail workflow confuses me a bit. Was I supposed to check that?

> How can you trigger this issue?

I can reliably reproduce it on a device here with three different gadgets (ACM, RNDIS and mass storage). A setup packet for mass storage ends up in RNDIS' complete function instead of composite's when plugging/unplugging. It uses the address set for a previous packet to call back the complete function, which points to rndis_response_complete, but with the correct req->context for composite_setup_complete (cdev). rndis_response_complete is then called from the udc driver with a usb_request on ep0 and assumes req->context is of struct rndis, which of course is fatal.

---------------------------snip---------------------------------
[  183.795661] [<bf10b31c>] (rndis_response_complete [usb_f_rndis]) from [<bf0ec024>] (xgs_iproc_ep_enable+0x92c/0xd2c [xgs_iproc_udc])
[  183.795666]  r5:df5d73ac r4:df767c80
[  183.795682] [<bf0ebf20>] (xgs_iproc_ep_enable [xgs_iproc_udc]) from [<bf0eca8c>] (xgs_iproc_ep_queue+0x384/0x5bc [xgs_iproc_udc])
[  183.795687]  r7:df767cb8 r6:df5d7380 r5:df767c80 r4:df5d73ac
[  183.795706] [<bf0ec708>] (xgs_iproc_ep_queue [xgs_iproc_udc]) from [<c0384fec>] (usb_ep_queue+0x1f0/0x238)
[  183.795713]  r10:43425355 r9:df767c80 r8:df767c80 r7:a00f0013 r6:df5d73ac r5:df767c80
[  183.795716]  r4:df65dea8
[  183.795743] [<c0384dfc>] (usb_ep_queue) from [<bf0f6910>] (usb_composite_overwrite_options+0x128/0x184 [libcomposite])
[  183.795750]  r9:00055302 r8:df767c80 r7:a00f0013 r6:df65df04 r5:df767c80 r4:df65dea8
[  183.795777] [<bf0f68e0>] (usb_composite_overwrite_options [libcomposite]) from [<bf0f69f4>] (usb_composite_setup_continue+0x88/0x138 [libcomposite])
[  183.795782]  r7:a00f0013 r6:df65df04 r5:00000000 r4:df65dea8
[  183.795812] [<bf0f696c>] (usb_composite_setup_continue [libcomposite]) from [<bf120cf8>] (fsg_alloc_inst+0xa5c/0xac8 [usb_f_mass_storage])
[  183.795819]  r9:00055302 r8:00000003 r7:deca5800 r6:00000001 r5:df595a80 r4:deca5948
[  183.795840] [<bf120a68>] (fsg_alloc_inst [usb_f_mass_storage]) from [<bf120e00>] (fsg_main_thread+0x9c/0x15dc [usb_f_mass_storage])
[  183.795846]  r8:df770000 r7:df595a80 r6:deca1cc0 r5:df724000 r4:deca5800
[  183.795864] [<bf120d64>] (fsg_main_thread [usb_f_mass_storage]) from [<c0046cd0>] (kthread+0x14c/0x154)
[  183.795870]  r10:df785d14 r9:00000000 r8:deca5800 r7:df6c31b8 r6:df70f580 r5:df724000
[  183.795873]  r4:df6c3180
[  183.795881] [<c0046b84>] (kthread) from [<c000a67c>] (ret_from_fork+0x14/0x38)
[  183.795887]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0046b84
[  183.795889]  r4:df70f580
--------------------------snip-------------------------------------

> And your patch is line-wrapped and can not be applied :(

Weird, I had line wrapping disabled and it looks fine in thunderbird.

---
  drivers/usb/gadget/composite.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composite.c
index 504c1cbc255d..8d497be4be32 100644
--- a/drivers/usb/gadget/composite.c
+++ b/drivers/usb/gadget/composite.c
@@ -2518,6 +2518,7 @@ void usb_composite_setup_continue(struct usb_composite_dev *cdev)
  		DBG(cdev, "%s: Completing delayed status\n", __func__);
  		req->length = 0;
  		req->context = cdev;
+		req->complete = composite_setup_complete;
  		value = composite_ep0_queue(cdev, req, GFP_ATOMIC);
  		if (value < 0) {
  			DBG(cdev, "ep_queue --> %d\n", value);
-- 
