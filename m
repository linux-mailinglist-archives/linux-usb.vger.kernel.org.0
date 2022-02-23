Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C9D14C15F6
	for <lists+linux-usb@lfdr.de>; Wed, 23 Feb 2022 15:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241800AbiBWO7K (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Feb 2022 09:59:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231814AbiBWO7J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Feb 2022 09:59:09 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBB9AEF36
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 06:58:41 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id i11so42895222eda.9
        for <linux-usb@vger.kernel.org>; Wed, 23 Feb 2022 06:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=H6CuaNKLLI2/1Qz4pat/xAVJ4Xn+Ipul0udW4Bn7T30=;
        b=bFsBi5tqY3Cd44/rf1jeE1bPeKQk06nH2OyklALLukt+sAVLHbGNbhageoU+SwNoCP
         gmcgpd/lvptRnTv0tP8x43GMJkHxzpSlHGUmmb3dqgAJLCednCx79T6bY3j3SrREFzsS
         BxnJptlJqIzGPAlXurYr5TBBxPg481MzREpHF1M0Q22U5vqTkfvtfeOecoJbA9c+eH5u
         9eBY5XE++IUpkmBHImpo9CIVV4iukuCgwinL/zCeh/qrRBfsO0ODuirjWzfweF2MwYJU
         qk8VkCQ0krvFohW8mQqmdjUB4BNgNavW3am9FPLJVEvJboEUB/X4bSRv6qmTv+/d6cm+
         qdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=H6CuaNKLLI2/1Qz4pat/xAVJ4Xn+Ipul0udW4Bn7T30=;
        b=FbSrI/P7AS8toXEdfeD1EUOJUhVybFxA3PuDCNGu5Rhh5qXBtjydABRFtfWADePVJO
         Exy+sYy3W2Xi6dgUF/YXr42cppqkKiVSkL3juTvD4nKdktXimq51vaty+cLRjh/n/UEt
         rXq6Zh14T/JneBkKJy0FN/C5wwacmSYDyjTF4m+Cl60AKGy5opwnl1+eodzzctzNFu50
         NKmLizByKHvSDzu39NMdigMXso9yy/oGbpPSHontXH2MNyN1rmaRrs4Y7J4dArBADv5n
         nJv4VBSFxgawOnbOi6OtOiQ1/F0FvT2KgQM0ZWplrDah79MIP+jMQbtkZHHADaNI+Q9L
         oG9w==
X-Gm-Message-State: AOAM532DMav/1cp/e5nmqBhU9gj23xjiT3x89rbUFpl88szT/7l4hdwh
        f/sW7sy6XX9PSF08HAOtM0SLErEMawQ=
X-Google-Smtp-Source: ABdhPJxcOqM1hcfvEKf83xdwNhrJ6+T9XQfFi4sUeZHRKRiMyRh+Xj+CUzmGij3v31z9O1tUKA79iQ==
X-Received: by 2002:a05:6402:38e:b0:410:c1a9:60aa with SMTP id o14-20020a056402038e00b00410c1a960aamr32183906edv.336.1645628320406;
        Wed, 23 Feb 2022 06:58:40 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:19e2:181b:94d8:8cf0? (p200300ea8f4d2b0019e2181b94d88cf0.dip0.t-ipconnect.de. [2003:ea:8f4d:2b00:19e2:181b:94d8:8cf0])
        by smtp.googlemail.com with ESMTPSA id b6sm7549843ejb.80.2022.02.23.06.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 06:58:39 -0800 (PST)
Message-ID: <4f818e25-1c39-b4a3-ed09-370cb4a2c2a7@gmail.com>
Date:   Wed, 23 Feb 2022 15:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] usb: core: improve handling of hubs with no ports
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <994d8963-ca4d-d4cb-a3f6-988d6aa9bcd7@gmail.com>
 <YhWXgyJ4lk8OpT57@rowland.harvard.edu>
 <4701f080-ef18-dbb2-7dd9-d9171a73411f@gmail.com>
 <YhZB9C/xGaoslZzT@rowland.harvard.edu>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <YhZB9C/xGaoslZzT@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 23.02.2022 15:17, Alan Stern wrote:
> On Wed, Feb 23, 2022 at 01:26:23PM +0100, Heiner Kallweit wrote:
>> On 23.02.2022 03:10, Alan Stern wrote:
>>> On Tue, Feb 22, 2022 at 10:13:09PM +0100, Heiner Kallweit wrote:
>>>>
>>>> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
>>>> index 83b5aff25..e3f40d1f4 100644
>>>> --- a/drivers/usb/core/hub.c
>>>> +++ b/drivers/usb/core/hub.c
>>>> @@ -1423,9 +1423,8 @@ static int hub_configure(struct usb_hub *hub,
>>>>  		ret = -ENODEV;
>>>>  		goto fail;
>>>>  	} else if (hub->descriptor->bNbrPorts == 0) {
>>>> -		message = "hub doesn't have any ports!";
>>>> -		ret = -ENODEV;
>>>> -		goto fail;
>>>> +		dev_info(hub_dev, "hub has no ports, exiting\n");
>>>> +		return -ENODEV;
>>>>  	}
>>>>  
>>>>  	/*
>>>
>>> How about instead changing xhci-hcd so that it doesn't try to register 
>>> a USB-3 root hub if the controller doesn't have any USB-3 ports?  I 
>>> think that would make more sense.
>>>
>> Right, this would be better. I checked and it seems to be a little bit
>> bigger endeavor. If I let register_root_hub() fail, then this removes
>> the USB3 bus/host (shared hcd), but also the USB2 bus/host.
>> It took an additional change to xhci_plat_probe() to make it work on my
>> system. Not sure what the impact could be on systems not using
>> xhci_plat_probe(). Users may face the same issue like me, and having
>> a USB3 hub with no ports may remove also the USB2 bus/host.
> 
> Don't change register_root_hub().  Just change xhci_plat_probe(); make 
> it skip the second call to usb_add_hcd() if there are no USB-3 ports.
> 
How would I know the number of USB-3 ports before calling usb_add_hcd()?
get_hub_descriptor() can be called only later in usb_add_hcd().

> Alan Stern
> 
>> What I can do: submit my patches as RFC, then there's a better basis
>> for a discussion.
>>
>>> Alan Stern
>>
>> Heiner

