Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10F291CC2CD
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2020 18:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728287AbgEIQhO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 9 May 2020 12:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727787AbgEIQhO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 9 May 2020 12:37:14 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC690C061A0C
        for <linux-usb@vger.kernel.org>; Sat,  9 May 2020 09:37:13 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id v12so5530418wrp.12
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2020 09:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=we46FIk+yEWMBMHgbSqPJ/2W+VM8O37RwWGSP9VSwog=;
        b=CjyOLtI5Vf6zJUjIHGQ0rnuAZdktroS/UUIsJ1qXmlKpkauo0V8SqUzjMQL2ubkZrY
         Zr4CsT6+GWNmvejXbce8CpFXkMPB4/1bdogbKppq1/5rU3Zvqiy3WN8KBrUyB1+sbzF+
         8Cza3vK09tz9ONJm3bZ6Z5CX/dFeUMsbYyDtftFTFNDRNFdRFklS8y/Z0OJKckKWFa60
         KEPIBk/jglytnDysls94a6jk6WYH8Iz+nmUDgBvm15jFesJ4Jjxl0w3VuS/PhX/C3MvG
         BKCn1XBRCBR068oGscEHX/JlHOaoq4ixlHy2bNOb8WqwVvVRUgOhHh1wnT6f2DIdn/Jo
         UnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=we46FIk+yEWMBMHgbSqPJ/2W+VM8O37RwWGSP9VSwog=;
        b=rq0zMOXhtHhU11DP8i3cOJyhK+qSZXC2meOjI2N21ypd1uXnwl1VyQW37PelvgD4uS
         JMrlUJGMfIBdWcKgPKrGbLGozkZ0kpsF63mCvdW4R2J/X3us0ow5pawSTnkDq2TsSLZh
         xd9oQmd2JZ/9YfwnKKwHFo5vB8uut2TjG4W+TWJ2ilg2ERkj8OKjYKrHYMoeq7VI9svW
         UNDLStW3gZZFSm39FMruMVxMHmwfhTEMCp4EgYIBL+kQWFAcb+cRBvXOze8DwHehKCyA
         TBt1rSJzSgU0NCeNWmvx+hoKG3vjBQQ1uCZ4SX8fPqWlX6KXcYKTlNwwjhyI1LM4zNtV
         rutw==
X-Gm-Message-State: AGi0PuZ34XsM6y3O0arIOLS1SWdGBDgh73Y3QjA4NeegEWykXAey7e9j
        MmdifLNI0/X1qMrmBmba6x/Kig==
X-Google-Smtp-Source: APiQypLa82q6Cj7QuABjnJFI0GlnqDZs3cRKpiuWLDsGG/Kc2bCtzgNvYiDtrM1+elacNGtdMy8SYA==
X-Received: by 2002:adf:f907:: with SMTP id b7mr9332246wrr.203.1589042232419;
        Sat, 09 May 2020 09:37:12 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c190sm19379331wme.4.2020.05.09.09.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2020 09:37:11 -0700 (PDT)
Subject: Re: [PATCH] usb: roles: Switch on role-switch uevent reporting
To:     Wen Yang <wenyang@linux.alibaba.com>,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Cc:     Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        chenqiwu <chenqiwu@xiaomi.com>, linux-kernel@vger.kernel.org
References: <20200508162937.2566818-1-bryan.odonoghue@linaro.org>
 <fbd660ca-fe2a-8ca7-5076-f898acd1ca74@linux.alibaba.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <10ca119e-ff09-70e7-311d-420aba612df6@linaro.org>
Date:   Sat, 9 May 2020 17:37:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <fbd660ca-fe2a-8ca7-5076-f898acd1ca74@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 09/05/2020 04:24, Wen Yang wrote:
> 
> 
> 在 2020/5/9 上午12:29, Bryan O'Donoghue 写道:
>> Right now we don't report to user-space a role switch when doing a
>> usb_role_switch_set_role() despite having registered the uevent 
>> callbacks.
>>
>> This patch switches on the notifications allowing user-space to see
>> role-switch change notifications and subsequently determine the current
>> controller data-role.
>>
>> example:
>> PFX=/devices/platform/soc/78d9000.usb/ci_hdrc.0
>>
>> root@somebox# udevadm monitor -p
>>
>> KERNEL[49.894994] change $PFX/usb_role/ci_hdrc.0-role-switch (usb_role)
>> ACTION=change
>> DEVPATH=$PFX/usb_role/ci_hdrc.0-role-switch
>> SUBSYSTEM=usb_role
>> DEVTYPE=usb_role_switch
>> USB_ROLE_SWITCH=ci_hdrc.0-role-switch
>> SEQNUM=2432
>>
>> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Wen Yang <wenyang@linux.alibaba.com>
>> Cc: chenqiwu <chenqiwu@xiaomi.com>
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/usb/roles/class.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
>> index 5b17709821df..27d92af29635 100644
>> --- a/drivers/usb/roles/class.c
>> +++ b/drivers/usb/roles/class.c
>> @@ -49,8 +49,10 @@ int usb_role_switch_set_role(struct usb_role_switch 
>> *sw, enum usb_role role)
>>       mutex_lock(&sw->lock);
>>       ret = sw->set(sw, role);
>> -    if (!ret)
>> +    if (!ret) {
>>           sw->role = role;
>> +        kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE);
>> +    }
>>       mutex_unlock(&sw->lock);
>>
> 
> Hi, we may also need to deal with the return value of kobject_uevent(). 

For an KOBJ_ADD you'd return an error.

grep -r "= kobject_uevent(" *
drivers/misc/cxl/sysfs.c:	rc = kobject_uevent(&cr->kobj, KOBJ_ADD);
drivers/uio/uio.c:		ret = kobject_uevent(&map->kobj, KOBJ_ADD);
drivers/uio/uio.c:		ret = kobject_uevent(&portio->kobj, KOBJ_ADD);
drivers/visorbus/visorchipset.c:	res = 
kobject_uevent(&chipset_dev->acpi_device->dev.kobj, KOBJ_ONLINE);
drivers/visorbus/visorchipset.c:	int res = 
kobject_uevent(&chipset_dev->acpi_device->dev.kobj,

For a KOBJ_CHANGE I guess we could print an error

if (kobject_uevent(&sw->dev.kobj, KOBJ_CHANGE)
     dev_err(&sw->dev, "failed to signal USB role-switch uevent\n");

Nobody else seems that bothered about it.

grep -r "if (kobject_uevent(" *

> Should we move it under the line mutex_unlock(&sw->lock)?

I think probably not. the mutex serializes the notification. In theory 
outside the mutex you could get an out-of-order notification.

The main reason I put it where it is, is we already test ret and should 
only notify the change, when the role-switch has suceeded.

As I say, in theory anyway, the mutex enforces the signalling, whatever 
about the reception, of the role-switch change, so IMO inside the bounds 
of the mutex is the right place to put it.

---
bod
