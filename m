Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D610A1BF406
	for <lists+linux-usb@lfdr.de>; Thu, 30 Apr 2020 11:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgD3JUF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Apr 2020 05:20:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726127AbgD3JUF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Apr 2020 05:20:05 -0400
X-Greylist: delayed 52772 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 30 Apr 2020 02:20:05 PDT
Received: from smtp.domeneshop.no (smtp.domeneshop.no [IPv6:2a01:5b40:0:3005::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 437B6C035494
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2020 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
        ; s=ds201912; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=JGLc3a8ABGQstMR37awCEhI2dEUBYckj05oUPEzH5zM=; b=O4V/PgrcyNboVQMuC2pLT8XbA1
        oazmcsBDo3SqYAigfLRfcShWTqbVV+zQmLLQdIvnWneZYCjJ0syXrKnxBbIN2Tp0GNfSHwSDmt8nU
        7YvsfqrON1QdxVz12P8t17OwX73BerxvhHyE7EEiby7enzme4FvfnyfaZgC9NUmFksSOeMkaF9Zzf
        LU9jvsb0GGUIstsvUiQpgSa/tlC7zXm/2EbwiNI2F2FxGPbiQ3RY2WY3WIls513fuWRdVz5aZBzB8
        mhd1ukAowutdTTBkrXpzcVMSS7AgtDWr1Qs7kDIZ/a2zGzrXsckczG1T6GtQSxVd/XPQVbzC4JIpE
        yXxDftEw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61049 helo=[192.168.10.61])
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <noralf@tronnes.org>)
        id 1jU5MQ-0002XZ-G5; Thu, 30 Apr 2020 11:20:02 +0200
Subject: Re: [PATCH 01/10] backlight: Add backlight_device_get_by_name()
To:     Lee Jones <lee.jones@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>
References: <20200429124830.27475-1-noralf@tronnes.org>
 <20200429124830.27475-2-noralf@tronnes.org> <20200430083219.GC3118@dell>
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0fbc4eb5-cb39-5974-85bb-9f13278ecab4@tronnes.org>
Date:   Thu, 30 Apr 2020 11:20:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430083219.GC3118@dell>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



Den 30.04.2020 10.32, skrev Lee Jones:
> On Wed, 29 Apr 2020, Noralf Trønnes wrote:
> 
>> Add a way to lookup a backlight device based on its name.
>> Will be used by a USB display gadget getting the name from configfs.
>>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>> Cc: Jingoo Han <jingoohan1@gmail.com>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
>> ---
>>  drivers/video/backlight/backlight.c | 21 +++++++++++++++++++++
>>  include/linux/backlight.h           |  1 +
>>  2 files changed, 22 insertions(+)
> 
> Once reviewed, can this patch be applied on its own?
> 

If you can apply it for 5.8, then we're good. DRM has cutoff at -rc5 and
the driver won't be ready for that. This patch has this dependency
chain: usb -> drm -> backlight. So if you can apply it for 5.8, things
gets easier.

> My guess is that it can't, as the other patches in this set depend on
> it, right?  If this assumption is true, you need to send me the rest
> of the set.
> 
> FYI: It's normally better to send the whole set to everyone, as it
> provides visibility on current review (or lack there of) status of the
> other patches and allows each of the maintainers to discuss possible
> merge strategies.

dri-devel is the ML for backlight so I assumed you got the full set.
I have had trouble in the past with my email provider dropping parts of
a series when I had to many recipients.

Noralf.

> 
>> diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
>> index cac3e35d7630..92d80aa0c0ef 100644
>> --- a/drivers/video/backlight/backlight.c
>> +++ b/drivers/video/backlight/backlight.c
>> @@ -432,6 +432,27 @@ struct backlight_device *backlight_device_get_by_type(enum backlight_type type)
>>  }
>>  EXPORT_SYMBOL(backlight_device_get_by_type);
>>  
>> +/**
>> + * backlight_device_get_by_name - Get backlight device by name
>> + * @name: Device name
>> + *
>> + * This function looks up a backlight device by its name. It obtains a reference
>> + * on the backlight device and it is the caller's responsibility to drop the
>> + * reference by calling backlight_put().
>> + *
>> + * Returns:
>> + * A pointer to the backlight device if found, otherwise NULL.
>> + */
>> +struct backlight_device *backlight_device_get_by_name(const char *name)
>> +{
>> +	struct device *dev;
>> +
>> +	dev = class_find_device_by_name(backlight_class, name);
>> +
>> +	return dev ? to_backlight_device(dev) : NULL;
>> +}
>> +EXPORT_SYMBOL(backlight_device_get_by_name);
>> +
>>  /**
>>   * backlight_device_unregister - unregisters a backlight device object.
>>   * @bd: the backlight device object to be unregistered and freed.
>> diff --git a/include/linux/backlight.h b/include/linux/backlight.h
>> index c7d6b2e8c3b5..56e4580d4f55 100644
>> --- a/include/linux/backlight.h
>> +++ b/include/linux/backlight.h
>> @@ -190,6 +190,7 @@ extern void backlight_force_update(struct backlight_device *bd,
>>  extern int backlight_register_notifier(struct notifier_block *nb);
>>  extern int backlight_unregister_notifier(struct notifier_block *nb);
>>  extern struct backlight_device *backlight_device_get_by_type(enum backlight_type type);
>> +struct backlight_device *backlight_device_get_by_name(const char *name);
>>  extern int backlight_device_set_brightness(struct backlight_device *bd, unsigned long brightness);
>>  
>>  #define to_backlight_device(obj) container_of(obj, struct backlight_device, dev)
> 
