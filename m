Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3F835F785
	for <lists+linux-usb@lfdr.de>; Wed, 14 Apr 2021 17:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234318AbhDNPXc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 14 Apr 2021 11:23:32 -0400
Received: from mr07.mx01.tldhost.de ([62.108.44.247]:44892 "EHLO
        mr07.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232358AbhDNPXa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 14 Apr 2021 11:23:30 -0400
X-Greylist: delayed 420 seconds by postgrey-1.27 at vger.kernel.org; Wed, 14 Apr 2021 11:23:30 EDT
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id BB3BB121990
        for <linux-usb@vger.kernel.org>; Wed, 14 Apr 2021 17:10:10 +0200 (CEST)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id B06AE121997; Wed, 14 Apr 2021 17:10:10 +0200 (CEST)
X-Spam-Status: No, score=-1.9 required=7.0 tests=BAYES_00,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id EA188121809;
        Wed, 14 Apr 2021 17:10:06 +0200 (CEST)
Received: from [147.161.165.23] ([147.161.165.23]) by
 webmail.kiener-muenchen.de (Horde Framework) with HTTPS; Wed, 14 Apr 2021
 15:10:07 +0000
Date:   Wed, 14 Apr 2021 15:10:07 +0000
Message-ID: <20210414151007.Horde.J64vHh1YCZnRSzK17hZ84sB@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     dpenkler@gmail.com
Cc:     linux-usb@vger.kernel.org, lyl2019@mail.ustc.edu.cn,
        guido.kiener@rohde-schwarz.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] usb: Add a lock when freeing data in usbtmc_disconnect
In-Reply-To: <91ca594b3f434040a54485339c0e320f@rohde-schwarz.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-PPP-Message-ID: <20210414151007.29308.41479@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Dave,

I just found this patch, which does not seem to be a correct solution  
to solve a race.
Maybe there is really an issue with the refcounting of data->kref, but  
currently I do
not have time to check this in home office.

At least I see a problem in usbtmc_probe()

After calling:
    /* Protect interrupt in endpoint data until iin_urb is freed */
    kref_get(&data->kref);
the refcounter is incremented again and if usbtmc_probe() fails, the  
counter is
only decremented with a single kref_put(..).

I don't know if this is the reason of Lv Yunglong's problem, but let  
me know if
you have time to track down this issue, and we will work on a correct  
and tested
patch.

Regards,

Guido


> -----Original Message-----
> From: Greg KH
> Sent: Tuesday, March 23, 2021 10:44 AM
> To: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
> Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v2] usb: Add a lock when freeing data in  
> usbtmc_disconnect
>
> On Tue, Mar 23, 2021 at 02:28:54AM -0700, Lv Yunlong wrote:
>> In usbtmc_disconnect, data is got from intf with the initial reference.
>> There is no refcount inc operation before usbmc_free_int(data). In
>> usbmc_free_int(data), the data may be freed.
>>
>> But later in usbtmc_disconnect, there is another put function of data.
>> It could cause errors in race.
>>
>> My patch adds a lock to protect kref from changing in race.
>>
>> Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
>> ---
>>  drivers/usb/class/usbtmc.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
>> index 74d5a9c5238a..44f1fcabbb1e 100644
>> --- a/drivers/usb/class/usbtmc.c
>> +++ b/drivers/usb/class/usbtmc.c
>> @@ -2493,8 +2493,13 @@ static void usbtmc_disconnect(struct  
>> usb_interface *intf)
>>  		usb_scuttle_anchored_urbs(&file_data->in_anchor);
>>  	}
>>  	mutex_unlock(&data->io_mutex);
>> +
>> +	spinlock_t *dev_lock = &data->dev_lock;
>> +
>> +	spin_lock_irq(dev_lock);
>>  	usbtmc_free_int(data);
>>  	kref_put(&data->kref, usbtmc_delete);
>> +	spin_unlock_irq(dev_lock);
>>  }
>>
>>  static void usbtmc_draw_down(struct usbtmc_file_data *file_data)
>> --
>> 2.25.1
>
> You obviously did not even build this patch, let alone test it :(
>
> Please do not waste maintainer's time by not doing the proper steps  
> when submitting patches.
>
> thanks,
>
> greg k-h



