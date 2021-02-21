Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7351B320A8A
	for <lists+linux-usb@lfdr.de>; Sun, 21 Feb 2021 14:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhBUNYM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Feb 2021 08:24:12 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:34486 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbhBUNYH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Feb 2021 08:24:07 -0500
Received: from [123.112.65.49] (helo=[192.168.0.106])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <hui.wang@canonical.com>)
        id 1lDoho-0007C0-Fm; Sun, 21 Feb 2021 13:23:24 +0000
Subject: Re: [PATCH] USB: UAS: don't unbind and rebind the driver during
 usb_reset_device
To:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        oneukum@suse.com, gregkh@linuxfoundation.org
References: <20210221085100.4297-1-hui.wang@canonical.com>
 <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
From:   Hui Wang <hui.wang@canonical.com>
Message-ID: <b4e51bb9-8717-979b-1060-2d821b3c4e23@canonical.com>
Date:   Sun, 21 Feb 2021 21:23:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/21/21 6:20 PM, Hans de Goede wrote:
> Hi,
>
> On 2/21/21 9:51 AM, Hui Wang wrote:
>> Once pre_reset() or post_reset() returns non-zero, the disconnect()
>> and probe() of the usb_driver will be called. In the disconnect(),
>> the scsi_host will be removed and be freed after scsi_host_put(), in
>> the probe(), the new scsi_host and uas_dev_info will be created.
>>
>> If the usb_reset_device() is triggered by eh_device_reset_handler(),
>> and pre_reset()/post_reset() returns non-zero, the disconnect() and
>> probe() will be called, then returns to the eh_device_reset_handler(),
>> it still accesses old scsi related variables and uas_dev_info, and so
>> do its caller functions.
>>
>> Here change the pre_reset() and post_reset() to let them only return
>> 0, after this change, the usb_reset_device() will only reset this
>> usb devcie from its hub port, will not execute unbind and rebind
>> usb_driver during reset.
> We only return non 0 from the pre/post reset handles if we failed
> to ensure the device is in a known state.
>
> E.g. in uas_post_reset() we only fail if we failed to switch the
> device from the good old usb-storage protocol back to the UAS mode
> which it was in before.
>
> Continuing with the UAS driver bound, as if everything is fine,
> while the device is actually in longer in UAS mode is a bad idea.
>
> Summarizing this patch is wrong: NACK.
>
> ###
>
> I assume that you wrote this patch because of some bug report ?
>
> In such a case please always include a link to the bug (or forum
> discussion) in the commit message.

OK, got it, so far there is no bug about it. I just wrote some code and 
called usb_reset_device(), found it will trigger to call disconnect() 
and probe() in some cases. I found uas.c could trigger to call 
disconnect() and probe() in eh_device_reset_handler(), and could 
possibility introduce use-after-free issue. I thought resetting the 
device from the hub port is enough to let it back to normal work mode, 
if it doesn't, calling disconnect() and probe() will not help either. 
And I checked some eh_device_reset_handler callback in other drivers, 
looks like they don't trigger unbind and rebind, then I wrote this patch.

Thanks,

Hui.

>
> UAS problems typically are caused by people shoving a 2.5 inch
> or m2 SSD in an USB enclosure which is powered from the USB bus
> only. SSD-s can cause pretty hefty power-consumption peaks when
> high queue depts are used; and these bus powered devices typically
> cannot handle these peaks. Either because the port they are
> plugged in does not deliver enough current; and/or because they
> don't have enough buffering (capacitors) on the enclosure's PCB
> to deal with short but quite large consumption peaks.
>
> Regards,
>
> Hans
>
>
>
>
>
>
>
>
>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
>> ---
>>   drivers/usb/storage/uas.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/storage/uas.c b/drivers/usb/storage/uas.c
>> index bef89c6bd1d7..c66287448e34 100644
>> --- a/drivers/usb/storage/uas.c
>> +++ b/drivers/usb/storage/uas.c
>> @@ -1121,7 +1121,6 @@ static int uas_pre_reset(struct usb_interface *intf)
>>   	if (uas_wait_for_pending_cmnds(devinfo) != 0) {
>>   		shost_printk(KERN_ERR, shost, "%s: timed out\n", __func__);
>>   		scsi_unblock_requests(shost);
>> -		return 1;
>>   	}
>>   
>>   	uas_free_streams(devinfo);
>> @@ -1152,7 +1151,7 @@ static int uas_post_reset(struct usb_interface *intf)
>>   
>>   	scsi_unblock_requests(shost);
>>   
>> -	return err ? 1 : 0;
>> +	return 0;
>>   }
>>   
>>   static int uas_suspend(struct usb_interface *intf, pm_message_t message)
>>
