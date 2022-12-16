Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B62564E6DE
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 06:13:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbiLPFNS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 00:13:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbiLPFNQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 00:13:16 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 059344A5BF
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 21:13:15 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id r11so1060749oie.13
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 21:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hV7GON/TwLLqb993uwtDT+pFNyVjmV9sSQq5BBMzOjI=;
        b=n3ENj7ShXP2PB4hptflJwPoH/sCadWMT1WQS+iZcqMgwPs3x7kEyL9BMVTYFUbxOQB
         OJCyAm/1GgBjklNRTrVolpHyk9Xlqp0bAeYyiQzRDZwJ9X6qFGBHRdTEPoXYoTKFRtdq
         hkkz/loUs1UNlmko42F4LkfbhOJwSpBT5M7lXHX766Fee3uyE5/iMHY5pvDYwS75diNu
         ytmaCntNhIBf8o2NVHYfLFF7A1EepZzUfuLLeeGfMTNeBEbT+e6KsUwYCYkFD/1JxP0k
         CxaVOEdp5aCKpggEQwP8U0bAHm1q2PSI9jutrGrqIfS1D4CsZGQR92cKpsPSH37y7ixl
         /ZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hV7GON/TwLLqb993uwtDT+pFNyVjmV9sSQq5BBMzOjI=;
        b=Z1CNtYTjakC51DpmW1KMmx0e3kiGP1+SNvAyz/JVSLHVACmDZ9FcUrMzFK4I4hPFxV
         jIfbWu2cLfIiF+bcIYjQXD56OgtZWeFtI4Rm7WCfXe9peDIwn7IE6NDYn6yc+w9wtBfd
         up/Yskq8R68zvMjdb1MIzZzAwwV8h8SBI4pWDpBxmIRxquQRblFMohuJR8wAnbw+P4x6
         ovCcinKbKKNOK2bJcGeNxE6A32gOrCoiLL6uvpSKM3uJo8ug3QEJx1Tbv065iTzo132j
         q3umrRFZ/d59i0o3ugw71yk2c2uFOPyFct5NczcgNsv4eZylxrdDzGxf5eKnS4F1Hl8W
         t1vg==
X-Gm-Message-State: ANoB5plSn6QayoshSB8a0mFXFdlrdiUP0m7l7bMKRPwdlAaTpy2MCEI6
        jGSzbshZPRhSUHwe0cMPNkf+OzAbmhM=
X-Google-Smtp-Source: AA0mqf5IXS8YhWC5+1+yGp9AoY5bTPFw+C+/5LMVjyXgVtJh5u++l3/4NCcEgzzEQf+rY5GLAAkK4w==
X-Received: by 2002:a05:6808:1709:b0:35b:d7dc:9f2a with SMTP id bc9-20020a056808170900b0035bd7dc9f2amr16929665oib.3.1671167594217;
        Thu, 15 Dec 2022 21:13:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r25-20020a056808211900b0035c073aa0d8sm361432oiw.18.2022.12.15.21.13.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 21:13:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <acf0485c-8061-ef12-83d9-c3b22dc235ad@roeck-us.net>
Date:   Thu, 15 Dec 2022 21:13:12 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] usb: typec: tcpm: fix create duplicate
 source/sink-capabilities file
Content-Language: en-US
To:     Xu Yang <xu.yang_2@nxp.com>, heikki.krogerus@linux.intel.com
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, jun.li@nxp.com
References: <20221216033150.2683718-1-xu.yang_2@nxp.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20221216033150.2683718-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 12/15/22 19:31, Xu Yang wrote:
> After soft reset has completed, an Explicit Contract negotiation occurs.
> The sink device will receive source capabilitys again. This will cause
> a duplicate source-capabilities file be created.
> 
> And the kernel will dump:
> sysfs: cannot create duplicate filename '/devices/virtual/usb_power_delivery/pd1/source-capabilities'
> 
> This will unregister existing capabilities before register new one.
> 
> Fixes: 8203d26905ee ("usb: typec: tcpm: Register USB Power Delivery Capabilities")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>   drivers/usb/typec/tcpm/tcpm.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 904c7b4ce2f0..02d8a704db95 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -2371,6 +2371,9 @@ static int tcpm_register_source_caps(struct tcpm_port *port)
>   	if (IS_ERR(port->partner_pd))
>   		return PTR_ERR(port->partner_pd);
>   
> +	/* remove existing capabilities since got new one */
> +	usb_power_delivery_unregister_capabilities(port->partner_source_caps);
> +
>   	memcpy(caps.pdo, port->source_caps, sizeof(u32) * port->nr_source_caps);
>   	caps.role = TYPEC_SOURCE;
>   
> @@ -2394,6 +2397,9 @@ static int tcpm_register_sink_caps(struct tcpm_port *port)
>   	if (IS_ERR(port->partner_pd))
>   		return PTR_ERR(port->partner_pd);
>   
> +	/* remove existing capabilities since got new one */
> +	usb_power_delivery_unregister_capabilities(port->partner_sink_caps);
> +
>   	memcpy(caps.pdo, port->sink_caps, sizeof(u32) * port->nr_sink_caps);
>   	caps.role = TYPEC_SINK;
>   

Shouldn't usb_power_delivery_unregister_capabilities() be called from
the SOFT_RESET state handler ?

Guenter

