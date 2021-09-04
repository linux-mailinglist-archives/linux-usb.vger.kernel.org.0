Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C91400C0E
	for <lists+linux-usb@lfdr.de>; Sat,  4 Sep 2021 18:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236873AbhIDQSj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 12:18:39 -0400
Received: from informare.org ([217.11.52.70]:40646 "EHLO informare.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236830AbhIDQSj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Sep 2021 12:18:39 -0400
Received: (qmail 27516 invoked from network); 4 Sep 2021 16:17:36 -0000
Received: from unknown (HELO ?192.168.2.105?) (faber@faberman.de@87.133.154.214)
  by 0 with ESMTPA; 4 Sep 2021 16:17:36 -0000
Subject: Re: [PATCH] usb: gadget: f_mass_storage: Shut down mass storage
 device when USB connection is shut, down.
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
References: <5f9fbabd-2e2c-9389-446d-3bd1dd954a82@faberman.de>
 <20210904160951.GA493355@rowland.harvard.edu>
From:   Florian Faber <faber@faberman.de>
Message-ID: <a9ec9f6b-c9cb-06d6-a04e-bafaecce1111@faberman.de>
Date:   Sat, 4 Sep 2021 18:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210904160951.GA493355@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 9/4/21 6:09 PM, Alan Stern wrote:
> On Sat, Sep 04, 2021 at 05:32:58PM +0200, Florian Faber wrote:
>> f_mass_storage continues to send out packets after the connection to the USB
>> host has been terminated, ignoring the error status.
> 
> The driver doesn't send packets after the connection has been terminated --
> that would be impossible.  It may _try_ to send packets, but it can't
> actually send anything unless the hosts asks for the data.  There's nothing
> wrong with trying and failing.

Correct, that could have been expressed more clearly.

> 
>> Signed-off-by: Florian Faber <faber@faberman.de>
>>
>> ---
>>   drivers/usb/gadget/function/f_mass_storage.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_mass_storage.c
>> b/drivers/usb/gadget/function/f_mass_storage.c
>> index 6ad669dde41c..1e73ba629e43 100644
>> --- a/drivers/usb/gadget/function/f_mass_storage.c
>> +++ b/drivers/usb/gadget/function/f_mass_storage.c
>> @@ -529,6 +529,10 @@ static int start_transfer(struct fsg_dev *fsg, struct
>> usb_ep *ep,
>>   		/* We can't do much more than wait for a reset */
>>   		req->status = rc;
>>
>> +		if (rc==-ESHUTDOWN) {
>> +			fsg->common->running = 0;
>> +		}
>> +
> 
> This is wrong because it isn't what common->running means.  common->running
> means that the mass-storage configuration has been set by the host; it has
> nothing to do with whether or not the USB cable is connected.

So it is OK to keep the thread running and _trying_ to send out packets 
all the time until another USB host is plugged in, wasting resources?

I would argue that the removal of a USB host is an implicit 
configuration change.


Flo
-- 
Machines can do the work, so people have time to think.
