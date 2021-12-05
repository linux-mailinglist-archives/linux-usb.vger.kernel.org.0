Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC386468D6F
	for <lists+linux-usb@lfdr.de>; Sun,  5 Dec 2021 22:13:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239236AbhLEVRO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Dec 2021 16:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235880AbhLEVRO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Dec 2021 16:17:14 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50185C061751
        for <linux-usb@vger.kernel.org>; Sun,  5 Dec 2021 13:13:46 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id u1so18183688wru.13
        for <linux-usb@vger.kernel.org>; Sun, 05 Dec 2021 13:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=K1Vdn/JoxogZaRppK4S12+mosVtDg1jUSJHdGkKbW1Q=;
        b=m7maktx/a8S/6CrAWbajBZKS9o4+MbLvIMWsTlt2UiMnOBTuscnXGZstAl1nQsc/AZ
         yeOzW8iw6OALCFcpN3fFWpJsah55MQqpeltmcUe0deKIun9WKUEQsWPVRunHkuz3dvQW
         +RqviILL8skyYqXHfWwJ7gAICFIXdmydtAEKlVfqmObDhLrDwqfSgNrypym/Ghj+Dfbj
         3tr7K6ZgE9fQxShLtP18Ocdlilx4BR1JOhHbQzobZn/8Qv2h7GO0rNs8KVB1B/LGaYyl
         bpy4Wi6RUBFoBndx+yk1DBL7nYFQZiHCQcW5Lhy82wgODE/1qpCksek0omPLAz6lVJ8Y
         9g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=K1Vdn/JoxogZaRppK4S12+mosVtDg1jUSJHdGkKbW1Q=;
        b=VAGeSb2/KJZ8l77p0gBZdahWFt1KElCGFPF8GL9x8m9majSAPx4pyAXBA9YW8rbYQS
         hLt94kxPXMimXPH9oX5TplemyHR299xjfPcOS//dHboJcdkgOuvn941sB+pw0hDRQXHs
         WQORDesa8PaVh4l02p0l1/pZg47fsUtScNPjasegGKikwdpoUnfZOZmBlS4qiWqnjx7b
         C8N5m/5tphPLqa2Og01QHEFTr8vP/AKqCUE+C3PUGWFsGCbTLuYmAUOgoQ7WFSkoW0Ib
         fna1mWrEjjaEXfPizpVn011j5bF5FWDKZlw12jEQDP9Z7lKhvGgnsXQs68gmsg1O3Yzb
         qGag==
X-Gm-Message-State: AOAM530UlKG7uX0zFKr0IquQjGy6NmSm1IuGc5rWd8NzgrNCUoi97Bqk
        uiYAtiR6uohaKk5HapwgO14jjWDEkVUk0w==
X-Google-Smtp-Source: ABdhPJxspRmpduQJv6xAihNQgqfTSKCpcGVgTRrsONSQ32mxBrBC0x0YeXNm9icFhIALyIjXz+DB3A==
X-Received: by 2002:adf:a285:: with SMTP id s5mr39395128wra.468.1638738822494;
        Sun, 05 Dec 2021 13:13:42 -0800 (PST)
Received: from [192.168.1.24] (203.247.120.78.rev.sfr.net. [78.120.247.203])
        by smtp.gmail.com with ESMTPSA id r7sm9211892wrq.29.2021.12.05.13.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 13:13:42 -0800 (PST)
Subject: Re: [PATCH v3 1/3] phy: amlogic: phy-meson-gxl-usb2: fix shared reset
 controller use
To:     Philipp Zabel <p.zabel@pengutronix.de>, khilman@baylibre.com
Cc:     balbi@kernel.org, jbrunet@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20211112162827.128319-1-aouledameur@baylibre.com>
 <20211112162827.128319-2-aouledameur@baylibre.com>
 <44f6cc1f52e75cbbb8aebb0d4648c94ae479ef43.camel@pengutronix.de>
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <76927781-c420-b6f6-78e9-c6e91dec6ef4@baylibre.com>
Date:   Sun, 5 Dec 2021 22:13:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <44f6cc1f52e75cbbb8aebb0d4648c94ae479ef43.camel@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Philipp,

Thank you for the review.

On 22/11/2021 10:03, Philipp Zabel wrote:
> Hi Amjad,
>
> On Fri, 2021-11-12 at 17:28 +0100, Amjad Ouled-Ameur wrote:
>> Use reset_control_rearm() call if an error occurs in case
>> phy_meson_gxl_usb2_init() fails after reset() has been called ; or in case
>> phy_meson_gxl_usb2_exit() is called i.e the resource is no longer used
>> and the reset line may be triggered again by other devices.
>>
>> reset_control_rearm() keeps use of triggered_count sane in the reset
>> framework. Therefore, use of reset_control_reset() on shared reset line
>> should be balanced with reset_control_rearm().
>>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>   drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/amlogic/phy-meson-gxl-usb2.c b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
>> index 2b3c0d730f20..9a9c769ecabc 100644
>> --- a/drivers/phy/amlogic/phy-meson-gxl-usb2.c
>> +++ b/drivers/phy/amlogic/phy-meson-gxl-usb2.c
>> @@ -110,8 +110,10 @@ static int phy_meson_gxl_usb2_init(struct phy *phy)
>>   	int ret;
>>
>>   	ret = reset_control_reset(priv->reset);
>> -	if (ret)
>> +	if (ret) {
>> +		reset_control_rearm(priv->reset);
> I don't understand this. If reset_control_reset() returns an error for a
> shared reset, it should have either
> - returned before incrementing triggered_count, or
> - incremented triggered_count, got a failed reset op, decremented
>    triggered_count again
>
> In both cases there should be no need to rearm.
>
I have checked this out and I agree with you, will remove this in next 
version.

Thank you for spotting this.


Regards,

Amjad

> regards
> Philipp
