Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B724635AA46
	for <lists+linux-usb@lfdr.de>; Sat, 10 Apr 2021 04:13:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234157AbhDJCNu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Apr 2021 22:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232796AbhDJCNt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Apr 2021 22:13:49 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45DCAC061762
        for <linux-usb@vger.kernel.org>; Fri,  9 Apr 2021 19:13:36 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so1773143ooe.9
        for <linux-usb@vger.kernel.org>; Fri, 09 Apr 2021 19:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3v0n6iWIoq76pdhDLY7+wnk0FIJ8yGMwK6yquXGLGkA=;
        b=KiKOtnJt6QLBFDEUiRANT2rAbxliXz1FLzqAIIAyaq8kB0lfQqq0Sj5JSYJDI7hJw5
         6C0XRLszVpJiKSGU1p0cmF8SP0z0QRrkbFgnbKVCqVuPyVZfff05gToS8lBpUxRejvUv
         rQDYi/2Sy5zt8Wi/bQhHiE5XRDj+HZKe5PdTrvdHX1xgDuDluS1DjuLAChsx3y739V3Q
         BHOGzWsymtD+LbwIbdEGGx1bBa64KMIzrzAhjNoMkSQ5NuA38aqoKHB6k1Ft+VetiFvD
         GoIkXSVWHZGKYCy682alFdRaekdCqgmTKj8LkOK/6yl5+RAlrnquVUiZWtfw7qRxXqRt
         9xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3v0n6iWIoq76pdhDLY7+wnk0FIJ8yGMwK6yquXGLGkA=;
        b=qR+9qGuzr1VJqQSLzBx2fJKS84+J696ZCfpXyfMqI+oHoT3X3aM/05m16b4L7XDwce
         pMD20z/GYMlXg1Q1ICV33+/pHJnu+B7Q4clujWp+ahW5dbwEeS4cuznSUQllco3md51t
         tBtrsKfi86ug/qvXS8L5KgKb4sME7dqUoF2ePIPY9JJtUXrNW4pKsUm1Mh5hlNuUi6hR
         gdr1lo5h7RD2NTD9Mc07cDkSh6UzfRMkeNIosjt+nIkEvSG0IEQ3KcJX7cksHwel8OJf
         LzovkXETcdYx9XyMA0oQ4AgFtuaUBvAwU7wdmZT1mXKL4z441WUblsRvCwrbf5Q+aVYL
         RsQQ==
X-Gm-Message-State: AOAM530WQczuIohe+hYynMQ8mqCYlcauZY+Tw6t2aqSkQbCP3agus1d+
        3jYAtK6Hu1hiGztybKcRVl2je8/ppMw=
X-Google-Smtp-Source: ABdhPJyEijf9yXivvJqsCAA+Y5N4NIW7lOKyrCRky41gDejRW3M1fr+goSMAQGhzaqXXVTj7mYNIZg==
X-Received: by 2002:a4a:e643:: with SMTP id q3mr14405342oot.46.1618020815477;
        Fri, 09 Apr 2021 19:13:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id o64sm872977oif.50.2021.04.09.19.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Apr 2021 19:13:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/3] platform/x86/intel_cht_int33fe: Add displayport
 altmode fwnode to the connector fwnode
To:     Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
References: <20210409134033.105834-1-hdegoede@redhat.com>
 <20210409134033.105834-4-hdegoede@redhat.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <d9768c3e-2d44-9aca-3050-8080dcd99f7c@roeck-us.net>
Date:   Fri, 9 Apr 2021 19:13:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210409134033.105834-4-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/9/21 6:40 AM, Hans de Goede wrote:
> Add a displayport altmode fwnode to the usb-connector fwnode,
> devices which use this driver support display-port altmode through
> the PI3USB30532 USB switch, this enables support for this.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  .../platform/x86/intel_cht_int33fe_typec.c    | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_cht_int33fe_typec.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
> index 48638d1c56e5..b61bad9cc8d2 100644
> --- a/drivers/platform/x86/intel_cht_int33fe_typec.c
> +++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
> @@ -124,12 +124,31 @@ static const struct software_node usb_connector_node = {
>  	.properties = usb_connector_properties,
>  };
>  
> +static const struct software_node altmodes_node = {
> +	.name = "altmodes",
> +	.parent = &usb_connector_node,
> +};
> +
> +static const struct property_entry dp_altmode_properties[] = {
> +	PROPERTY_ENTRY_U32("svid", 0xff01),
> +	PROPERTY_ENTRY_U32("vdo", 0x0c0086),
> +	{ }
> +};
> +
> +static const struct software_node dp_altmode_node = {
> +	.name = "displayport-altmode",
> +	.parent = &altmodes_node,
> +	.properties = dp_altmode_properties,
> +};
> +
>  static const struct software_node *node_group[] = {
>  	&fusb302_node,
>  	&max17047_node,
>  	&pi3usb30532_node,
>  	&displayport_node,
>  	&usb_connector_node,
> +	&altmodes_node,
> +	&dp_altmode_node,
>  	NULL
>  };
>  
> 

