Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 221A3401081
	for <lists+linux-usb@lfdr.de>; Sun,  5 Sep 2021 17:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233365AbhIEPRl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Sep 2021 11:17:41 -0400
Received: from informare.org ([217.11.52.70]:40648 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhIEPRk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Sep 2021 11:17:40 -0400
Received: (qmail 24615 invoked from network); 5 Sep 2021 15:16:36 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.154.214)
  by 0 with ESMTPA; 5 Sep 2021 15:16:36 -0000
Subject: Re: [PATCH] usb: core: Fix possible memleak in usb_add_gadget
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <311d64c6-f0e2-da42-5619-1efe46df0007@faberman.de>
 <YTTahtscWqQyY0CU@kroah.com>
From:   Florian Faber <faber@faberman.de>
Message-ID: <dda401c9-2a0c-19a8-871e-28f1a903bcd4@faberman.de>
Date:   Sun, 5 Sep 2021 17:16:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTTahtscWqQyY0CU@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg,

On 9/5/21 4:56 PM, Greg KH wrote:
> On Sat, Sep 04, 2021 at 05:34:29PM +0200, Florian Faber wrote:
>> The memory for the udc structure allocated via kzalloc in line 1295 is not
>> freed in the error handling code, leading to a memory leak in case of an
>> error.
>>
>> Singed-off-by: Florian Faber <faber@faberman.de>
>>
>> ---
>>   drivers/usb/gadget/udc/core.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
>> index 14fdf918ecfe..a1270a44855a 100644
>> --- a/drivers/usb/gadget/udc/core.c
>> +++ b/drivers/usb/gadget/udc/core.c
>> @@ -1346,6 +1346,8 @@ int usb_add_gadget(struct usb_gadget *gadget)
>>
>>    err_put_udc:
>>   	put_device(&udc->dev);
>> +	kfree(udc);
>> +	gadget->udc = NULL;
>>
>>    error:
>>   	return ret;
>> -- 
>> 2.33.0
>>
>> Flo
>> -- 
>> Machines can do the work, so people have time to think.
> 
> Did you test this?  I think you will find that you just caused a
> use-after-free :(

Correct, please forget about this patch.

This 'leak' was found by Klocwork and seemed plausible at first 
oversight. Sorry for wasting your time and not checking it further.

> Please read the documentation for device_initialize() for why this is
> not the correct thing to do here.

I know now :) It was a bit counter intuitive that two different methods 
are used for memory allocation and freeing.

Regarding the other patch: I found the real culprit in the meantime. The 
UDC driver (broadcom iproc udc, out of tree) did not call composite's 
disconnect when VBUS is lost. Out of the three gadgets I am using, only 
mass storage misbehaved that badly, which led me on the wrong track there.


Flo
-- 
Machines can do the work, so people have time to think.
