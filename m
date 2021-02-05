Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5977E3104FB
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 07:31:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbhBEGbo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 01:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbhBEGbm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Feb 2021 01:31:42 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9318C0613D6
        for <linux-usb@vger.kernel.org>; Thu,  4 Feb 2021 22:31:01 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id t25so3862333pga.2
        for <linux-usb@vger.kernel.org>; Thu, 04 Feb 2021 22:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dpZXNoj4B3OGspM38YbhIAuTV6A3/xzY5t93r6VNwpY=;
        b=OODcH9IqNDlyYG83xQcP8fjAKbNdiO6Kok0JA7/4+pTCMDEZFCYWafzIlIclakS6vX
         BZoCFCHM5uOTrtRfq+JkHU5T4xAtb1wAFU1WdKj8FKLFl0MAUtqOWG60jTp93SAjoQqN
         iWk7Xhi9Xcr8WiIXt3sMnSFPipuNstEqiI0AvIMwjebyBncQmLC0j12sqfLymgsjdzNL
         nw1ZKoerIPPylpVz6anW+FDnr7TmIpFPz1s4oZ1/xRnv/SpwPWUoyuir9kMpyomCbac+
         M/ObpdnLb9Tq4QsGI6TOjUeuSz3LVijdOGYU7w7BT4Cx/vU2yWe7GDd+WxuLksbVRVk8
         qi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dpZXNoj4B3OGspM38YbhIAuTV6A3/xzY5t93r6VNwpY=;
        b=FTgvPzZCrCGnWL8nI03BQzC0JSEPbC7bBkX+cOxQFlLkHLcFnG9vRDOTD/Ha7jVL4W
         X8XvbGmxTLNtpF39a6q3Bkxo2jZh69uUVsmWIPQDxUMZ+Kdw59suCGDYaXRRgWBFBhMw
         ini7NFOxjtYOgwN1eVKWvBWFpjczJLRT8QJ9MaqR8sIN33n+zWaMwZ56u9jA8XPEYC+J
         x/7auEVYXIhj0L0IeE/UDtlBh2NxJ0Pr0YvfY2DejMBV26tbZQFjQtNDEnslMMDr9NbO
         JuV7o95B/M9pIxVTTuOkAnD2ZG+28+7karQfYlKS7uBjekniZSQD/3MOpAjLOJlNyeXa
         TNSg==
X-Gm-Message-State: AOAM530+KFxX+/DL6v7SIfPX8tsabFDlczwQfPciXloK/1m5Q93pNRaO
        di8dFO8+ceR/T4mw7sauD5g=
X-Google-Smtp-Source: ABdhPJz5etaG5z9VGoDpU1ZhJ8vVg0iJQMd9/WSVnArpLVwtolqLT+k3BGgFO9yn6RJnZdWZJkFbgg==
X-Received: by 2002:a63:1865:: with SMTP id 37mr2868928pgy.206.1612506661474;
        Thu, 04 Feb 2021 22:31:01 -0800 (PST)
Received: from [192.168.1.5] ([110.77.230.44])
        by smtp.googlemail.com with ESMTPSA id n128sm9156671pga.55.2021.02.04.22.30.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 22:31:01 -0800 (PST)
Subject: Re: [PATCH 2/2] usb: serial: option: add AT ports for ZTE P685M
To:     Lech Perczak <lech.perczak@gmail.com>, linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>,
        =?UTF-8?Q?Bj=c3=b8rn_Mork?= <bjorn@mork.no>
References: <20210204215130.27656-1-lech.perczak@gmail.com>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <c0a94dc9-cb3d-090c-6e8d-d120de91d5fd@gmail.com>
Date:   Fri, 5 Feb 2021 13:30:57 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204215130.27656-1-lech.perczak@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/5/2021 04:51, Lech Perczak wrote:
> Only 1st (DIAG) port was supported, support ports 1 (PCUI) and 2 (Modem)
> on ff/00/00 too. Ports expose AT command interface.
> 
> The modem is used inside ZTE MF283+ router and carriers identify it as
> such.
> Interface mapping is:
> 0: QCDM, 1: AT (PCUI), 2: AT (Modem), 3: QMI, 4: ADB
> 
> T:  Bus=02 Lev=02 Prnt=02 Port=05 Cnt=01 Dev#=  3 Spd=480  MxCh= 0
> D:  Ver= 2.01 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
> P:  Vendor=19d2 ProdID=1275 Rev=f0.00
> S:  Manufacturer=ZTE,Incorporated
> S:  Product=ZTE Technologies MSM
> S:  SerialNumber=P685M510ZTED0000CP&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&0
> C:* #Ifs= 5 Cfg#= 1 Atr=a0 MxPwr=500mA
> I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 1 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=83(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=85(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
> E:  Ad=87(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=42 Prot=01 Driver=(none)
> E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Bjørn Mork <bjorn@mork.no>
> Signed-off-by: Lech Perczak <lech.perczak@gmail.com>
> ---
>   drivers/usb/serial/option.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 3fe959104311..087520afdbde 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1567,7 +1567,8 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1272, 0xff, 0xff, 0xff) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1273, 0xff, 0xff, 0xff) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1274, 0xff, 0xff, 0xff) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1275, 0xff, 0xff, 0xff) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1275, 0xff, 0x00, 0x00) }, /* ZTE P685M AT */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1275, 0xff, 0xff, 0xff) }, /* ZTE P685M QCDM */
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1276, 0xff, 0xff, 0xff) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1277, 0xff, 0xff, 0xff) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1278, 0xff, 0xff, 0xff) },
> 

You'll need to blacklist the net interface which also has the attributes 
ff/ff/ff, if you don't then the option driver could steal it.

You can simplify the entry for the device to:
{ USB_DEVICE(ZTE_VENDOR_ID, 0x1275),
  .driver_info = RSVD(3) | RSVD(4) },


thanks
Lars
