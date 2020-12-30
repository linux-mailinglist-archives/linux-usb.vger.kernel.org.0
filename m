Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B6F82E7876
	for <lists+linux-usb@lfdr.de>; Wed, 30 Dec 2020 13:20:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbgL3MTi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Dec 2020 07:19:38 -0500
Received: from mr07.mx01.tldhost.de ([62.108.44.247]:37111 "EHLO
        mr07.mx01.tldhost.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgL3MTh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Dec 2020 07:19:37 -0500
X-Greylist: delayed 479 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Dec 2020 07:19:36 EST
Received: from mx01.tldhost.de (localhost [127.0.0.1])
        by mx01.tldhost.de (Postfix) with ESMTP id E8C5612186B
        for <linux-usb@vger.kernel.org>; Wed, 30 Dec 2020 13:04:55 +0100 (CET)
Received: by mx01.tldhost.de (Postfix, from userid 1001)
        id D9D9E121866; Wed, 30 Dec 2020 13:04:55 +0100 (CET)
X-Spam-Status: No, score=-1.9 required=7.0 tests=BAYES_00,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.2
Received: from server12.tldhost.de (server12.tldhost.de [84.19.26.112])
        by mx01.tldhost.de (Postfix) with ESMTPS id 17A881215B3;
        Wed, 30 Dec 2020 13:04:54 +0100 (CET)
Received: from fw-emea.rohde-schwarz.com (fw-emea.rohde-schwarz.com
 [80.246.32.33]) by webmail.kiener-muenchen.de (Horde Framework) with HTTPS;
 Wed, 30 Dec 2020 12:04:52 +0000
Date:   Wed, 30 Dec 2020 12:04:52 +0000
Message-ID: <20201230120452.Horde.nt_C9QbqEnNCVZ_Dfj_1Bjc@webmail.kiener-muenchen.de>
From:   guido@kiener-muenchen.de
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, dpenkler@gmail.com,
        Guido.Kiener@rohde-schwarz.com, john.harvey@non.keysight.com,
        jian-wei_wu@keysight.com, gabe.jones@ni.com
Subject: Re: [PATCH 4/4] USB: usbtmc: Bump USBTMC_API_VERSION value
In-Reply-To: <8cbd8ae5bfb24bde9c41fdb4dbd53597@rohde-schwarz.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-PPP-Message-ID: <20201230120453.5391.36773@server12.tldhost.de>
X-PPP-Vhost: kiener-muenchen.de
X-POWERED-BY: TLDHost.de - AV:CLEAN SPAM:OK
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> The previous patches in this series have changed the behaviour of the
>> driver and added new calls.
>>
>> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
>> Reviewed-by: Guido Kiener <guido.kiener@rohde-schwarz.com>
>> Tested-by: Jian-Wei Wu <jian-wei_wu@keysight.com>
>> ---
>>  drivers/usb/class/usbtmc.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
>> index d2fcc698c745..74d5a9c5238a 100644
>> --- a/drivers/usb/class/usbtmc.c
>> +++ b/drivers/usb/class/usbtmc.c
>> @@ -25,7 +25,7 @@
>>  /* Increment API VERSION when changing tmc.h with new flags or ioctls
>>   * or when changing a significant behavior of the driver.
>>   */
>> -#define USBTMC_API_VERSION (2)
>> +#define USBTMC_API_VERSION (3)
>
> Why is this needed?  You should be able to detect new calls by just  
> doing the ioctl and checking right?
>

The ioctl USBTMC488_IOCTL_READ_STB has changed the processing of the status
byte. The majority of users will not detect a difference, but we have learned
that every change can break a specific application of some users.
Now we think we have the correct and best implementation for the ioctl
USBTMC488_IOCTL_READ_STB and it will make most users happy.
Nevertheless we have added two ioctls that give people a chance to read
the bare status byte and service request for optimizing their applications
or to communicate with their non conformant USB488 devices.

Knowing the USBTMC_API_VERSION give users a chance to create an effective
workaround (e.g. calling the ioctl USBTMC488_IOCTL_READ_STB twice).

> I'll take this for now, but versioning apis is not a good thing to  
> do in general.

Thank you. Yes, checking the existence of other ioctl is an alternative way
to determine the behavior of the driver. But I think increasing the API
version gives more clarity when people want to trace back the changed
behavior.

Currently we do not plan further extensions to the USBTMC driver.

Regards,

Guido



