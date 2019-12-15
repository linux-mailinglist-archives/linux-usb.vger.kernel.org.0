Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E6711F92B
	for <lists+linux-usb@lfdr.de>; Sun, 15 Dec 2019 17:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbfLOQlM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Dec 2019 11:41:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52499 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726136AbfLOQlL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 15 Dec 2019 11:41:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576428070;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pZXNOLSmIO4QRRkxs/U8mDeREkMLpc0KHW6n8y5dmes=;
        b=GCRGgl0WSSpUi2+kbB+95Yk9NX8o9LiIi6rrka6uhg5XkC4WxLNBPyMtsjqwiwCb0WkbLc
        4m+QSUzLbBX0m9cgsXH5t21NcvVYcuj8URmB7BtUHVSbhEyMf/QQWscfvtGkg0Hh2Mq6Dj
        Hm2WDwY3AfFOxhuyzRxVpSYiVG0oVDw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-igF67HvhPpS4zhj1rj4ZfA-1; Sun, 15 Dec 2019 11:41:09 -0500
X-MC-Unique: igF67HvhPpS4zhj1rj4ZfA-1
Received: by mail-wr1-f72.google.com with SMTP id c17so2397089wrp.10
        for <linux-usb@vger.kernel.org>; Sun, 15 Dec 2019 08:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pZXNOLSmIO4QRRkxs/U8mDeREkMLpc0KHW6n8y5dmes=;
        b=fi9Vtnmai/7sp6JGvZyXMCZX+H72SD82hDK1XWWByYmQY69SMfN7pcBa1enE3s/MFP
         1Wkv07okhlNZosyMqVkQXQ1ySV5/c4o3cb5tR0q7RtvezsHSG0mm1fC+UFfrcHKO9445
         x5XO+acaCPwbnIpssViTLxMQvUJqDDMJ2E/wItHeeaiDQFafVcs7kChubr+bmwXlSn9R
         fh7IF/lu/hjy54mAt8yvtjzvv5BypMFFyF0c3KMV7GtuMson9g9mP6AgFcdJegmLE04R
         fdFyUUFeq+s+3UdwWB62AADn18tSd7TRcACH1nXJNyNZn+Vy0FbIf0fLYnOgATc0KmA8
         0sNQ==
X-Gm-Message-State: APjAAAXvd1aIe8aoMlj8we9XYe0uiDBEH+Ub+vN8raJFo3DTef2cE9CX
        SbfnXLvDxqxM9F9CFehIwrqkOTKSPUK+V/6I7a3Gx3r/M+L4XaVqpAhzBuE3A5DxE9Csj/6w4YQ
        JqOdVniC3lqKjn6JX1k00
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr26179934wru.150.1576428068030;
        Sun, 15 Dec 2019 08:41:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqxZpHMRDXlQMMSABQl81Zs6vH911Sv5c05gA8+uaC03Yib3ITofNGLMXO4++fjZuO82cMlHjA==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr26179919wru.150.1576428067834;
        Sun, 15 Dec 2019 08:41:07 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id x10sm18280784wrv.60.2019.12.15.08.41.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Dec 2019 08:41:07 -0800 (PST)
Subject: Re: [PATCH] usb: dwc3: use proper initializers for property entries
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191213174623.GA20267@dtor-ws>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2a8a5e6b-9372-978e-03d0-350ab65a2d0a@redhat.com>
Date:   Sun, 15 Dec 2019 17:41:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191213174623.GA20267@dtor-ws>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 13-12-2019 18:46, Dmitry Torokhov wrote:
> We should not be reaching into property entries and initialize them by
> hand, but rather use proper initializer macros. This way we can alter
> internal representation of property entries with no visible changes to
> their users.
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
> 
> It would be good if this could go through Rafael's tree as it is needed
> for the rest of my software_node/property_entry rework patch series
> which I would love not to delay till 5.6.

Patch looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> 
> Thanks!
> 
>   drivers/usb/dwc3/host.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
> index 5567ed2cddbec..fa252870c926f 100644
> --- a/drivers/usb/dwc3/host.c
> +++ b/drivers/usb/dwc3/host.c
> @@ -88,10 +88,10 @@ int dwc3_host_init(struct dwc3 *dwc)
>   	memset(props, 0, sizeof(struct property_entry) * ARRAY_SIZE(props));
>   
>   	if (dwc->usb3_lpm_capable)
> -		props[prop_idx++].name = "usb3-lpm-capable";
> +		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb3-lpm-capable");
>   
>   	if (dwc->usb2_lpm_disable)
> -		props[prop_idx++].name = "usb2-lpm-disable";
> +		props[prop_idx++] = PROPERTY_ENTRY_BOOL("usb2-lpm-disable");
>   
>   	/**
>   	 * WORKAROUND: dwc3 revisions <=3.00a have a limitation
> @@ -103,7 +103,7 @@ int dwc3_host_init(struct dwc3 *dwc)
>   	 * This following flag tells XHCI to do just that.
>   	 */
>   	if (dwc->revision <= DWC3_REVISION_300A)
> -		props[prop_idx++].name = "quirk-broken-port-ped";
> +		props[prop_idx++] = PROPERTY_ENTRY_BOOL("quirk-broken-port-ped");
>   
>   	if (prop_idx) {
>   		ret = platform_device_add_properties(xhci, props);
> 

