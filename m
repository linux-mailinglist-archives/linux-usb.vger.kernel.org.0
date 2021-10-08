Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 218F3427282
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 22:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243150AbhJHUta (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 16:49:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243035AbhJHUt3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Oct 2021 16:49:29 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B57C061762
        for <linux-usb@vger.kernel.org>; Fri,  8 Oct 2021 13:47:33 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id c26-20020a056830349a00b0054d96d25c1eso13079111otu.9
        for <linux-usb@vger.kernel.org>; Fri, 08 Oct 2021 13:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XCq1DA6NhRqrCVulTyM8OJLjSTK+m3+KuoXtzUSU6LQ=;
        b=onJiWfBlJjFN9/Ye0SfNxBF5RxjZJGkc9neHnkau/l7O3EPG5Nvx1l4HT1pgi77hc9
         DzGBWoCyoVCw8/jIFCLJY73dAHVmWKMLjxXTdbp5LGxVdTl42kLfOhLKGoI/HdFWIRC0
         Aa/qd16mg81VXFZjX/TM3lQoQA4j9yqIoXUYjLwAxlH0vf4F0MOinbINk3U7DZPM2ht3
         HXho0Yt/CmDdiIsq/8HtcNTy4u9mSOCSMVhoc4dFYdsxz1xlPf9YR+GMIdFVldf+Jktg
         4pPrpJdXTbIY+SYSHjAWZ32coKzrwIuSyd0ji6aW78fgjQrX3WZtymycOspN2/h1v/eQ
         Eufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XCq1DA6NhRqrCVulTyM8OJLjSTK+m3+KuoXtzUSU6LQ=;
        b=ib/vbDo7eUddv3RuHZ+1fOyk488gfbxm+m3KGucb4gTcbsJkxO+ZgOqF8Bz3ztQhJW
         6VFgQqXI8M3wC0n+WDsfZ17ijb7o0xHVb15pdNhz8IYG1llcHnvBuPiyQnoLsKd4xr3b
         CDvtIbEljvookmLttqD025DcAamPzCh9MTCoCOk32Zfdz2+OdwahpJ0iyZxYLnuNO5o0
         vEZ6bBqrVUv10I6AhwhoJsjWBVIH2N8hHmnDZiIpnXJQEGtUhwlo4h1LLR8dBJqehnM3
         ax1NPu0mN0+Fm1fwbaMzEVgg9GhIXcgkcBzps06Ov68/ZxBCjM0FdTTzLSwkEsM90HSv
         HGoQ==
X-Gm-Message-State: AOAM532RfeQTZi+o/QkGwTngd4wMnjS+mbj9B9DGcXEzQTqFm+Sy98sJ
        cGmumgQF2DOCn0s9xhO9wZS9oyNEy3M=
X-Google-Smtp-Source: ABdhPJxF0QpbBXEnDOebWTU6OnlrWoDY3jlDvxX7eGTJlEux3la+tKQP0fpRmwTIvC4VjupgFPO66A==
X-Received: by 2002:a9d:705e:: with SMTP id x30mr10166974otj.221.1633726052678;
        Fri, 08 Oct 2021 13:47:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u12sm91417otq.20.2021.10.08.13.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Oct 2021 13:47:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Gianni Pisetta <gianni.pisetta@gmail.com>,
        linux-usb@vger.kernel.org
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        stable@vger.kernel.com
References: <20211008201455.8739-1-gianni.pisetta@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] usb: typec: tcpm: ignore data role mismatch with a
 GoodCRC Message
Message-ID: <7d81a8ef-faa1-f8a6-cccc-493cc8bff085@roeck-us.net>
Date:   Fri, 8 Oct 2021 13:47:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211008201455.8739-1-gianni.pisetta@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/8/21 1:14 PM, Gianni Pisetta wrote:
> The data role check in tcpm.c cause the port manager to enter a loop with a
> hard reset on some chargers.
> By the spec in a GoodCRC Message the other end does not need to comply with
> the data role, so ignore a data role mismatch in a request when the message
> type is GoodCRC.
>>From the USB PD spec:
> "If a USB Type-C Port receive a Message with the Port Data Role field set
> to the same Data Role, except for the GoodCRC Message, USB Type-C error
> recovery..."
> 
> Below are the log of a Pinebook Pro attached to a PinePower Desktop Supply
> before the patch:
> 
> [226057.970532] state change SNK_DISCOVERY -> SNK_WAIT_CAPABILITIES [rev3 NONE_AMS]
> [226057.975891] pending state change SNK_WAIT_CAPABILITIES -> SNK_READY @ 310 ms [rev3 NONE_AMS]
> [226058.134384] PD RX, header: 0x53a1 [1]
> [226058.134389] Data role mismatch, initiating error recovery
> [226058.134392] state change SNK_WAIT_CAPABILITIES -> ERROR_RECOVERY [rev3 NONE_AMS]
> [226058.134404] state change ERROR_RECOVERY -> PORT_RESET [rev3 NONE_AMS]
> 
> Fixes: f0690a25a140b
> cc: <stable@vger.kernel.com>
> Signed-off-by: Gianni Pisetta <gianni.pisetta@gmail.com>
> 
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 5d05de666597..02ebf7e03c41 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2887,11 +2887,11 @@ static void tcpm_pd_rx_handler(struct kthread_work *work)
>   
>   		/*
>   		 * If both ends believe to be DFP/host, we have a data role
> -		 * mismatch.
> +		 * mismatch. Must perform error recovery actions, except for
> +		 * a GoodCRC Message(USB PD standard, 6.2.1.6).
>   		 */
> -		if (!!(le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
> -		    (port->data_role == TYPEC_HOST)) {
> +		if (!!((le16_to_cpu(msg->header) & PD_HEADER_DATA_ROLE) ==
> +		       (port->data_role == TYPEC_HOST) && type != PD_CTRL_GOOD_CRC)) {

Unless I am missing something, this could also be a PD_DATA_SOURCE_CAP
or PD_EXT_SOURCE_CAP_EXT message.

Guenter
