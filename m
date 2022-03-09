Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02FA34D3793
	for <lists+linux-usb@lfdr.de>; Wed,  9 Mar 2022 18:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234785AbiCIR1A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Mar 2022 12:27:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237360AbiCIR0x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Mar 2022 12:26:53 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86CCB90245
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 09:25:54 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 013133F60F
        for <linux-usb@vger.kernel.org>; Wed,  9 Mar 2022 17:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646846751;
        bh=w8PSCKHgDHhX5Fk0xr0ksja4KZOk9BnJpb1vWvY5lY0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=fKf2GI6dK0Df4qLWn9gRCuhEJvETNM+Sl5/2fklaZ4uw/OpBB7YlI8atDjj/c3NQV
         DL8uiYvSQHhndMdLIwophJp/wtLllAGACmwTQYAmYoGrcUtnyL5hKwm3ICuR6lM5nE
         niaDRQzC8hdp+cPzCroEoG+eK72QNmxfKZWiNjNgVMG177riiEYNA5hP59y7L77wTT
         2zdzqU9OfDsNT/vn1/iBb/jq8j2inok14dyjpXo1yt8dAMrthkRvjXeg25twka31D1
         XHGT6ByRYYDVvk2XCKw55CmUNJhQ11mt3W5dlOwiV9IP+0KND+pGSbAnYz/Jb5nwqt
         Qyk+9xLe6eWZg==
Received: by mail-ed1-f71.google.com with SMTP id h17-20020a05640250d100b004133863d836so1682927edb.0
        for <linux-usb@vger.kernel.org>; Wed, 09 Mar 2022 09:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=w8PSCKHgDHhX5Fk0xr0ksja4KZOk9BnJpb1vWvY5lY0=;
        b=M3tPBQLpPf1WcsDQUMXvSkk9lnSawzey+Rlk59Ji4bMOvzcnxpUqhOOk7iLAFO0c+d
         MXgcXWoSBELenJQrwSzRTQmqtiK/zDNu/UXYg/iOMDxAOZbTb3E4dKSy/5M+aTXIyeUZ
         qTjBO3aF8k6uUGO2FcR7CcN2FzE1tYLv+C7kUnG2evYMq4hK/+/dLq+z3J9Ll9fLiF/5
         VEsz20WgMxPldoDBpBy4WQb2be7HHYtETyiRtu5pB7UtBc+NxBNawXAwMVJv7u6i1UiD
         NbB/xYVsVK/iiw1P5qvWMTiZHG/LBgaTto7vrv6pu4g/TTQ+smk6OKPG63xJ/vojfm0D
         z++Q==
X-Gm-Message-State: AOAM532JNslvv098yEnpkmATfh+jnk9jp8zjZ8z6tXY8UBbCtu6emuRw
        +6Fw0eSSeBB6atm14HDIP0BBdia+kzI6ZhZZ9zQRNUANVPYx9BeonVcmZ8bdRLCBc7Btpi277Y6
        7amN25X6IQY4+JweVMayEkX7wjOjEV3zxMSN8RA==
X-Received: by 2002:a17:906:c1d6:b0:6d6:e0a3:bbc7 with SMTP id bw22-20020a170906c1d600b006d6e0a3bbc7mr776331ejb.484.1646846750459;
        Wed, 09 Mar 2022 09:25:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz6x1VsSMjgBumRVLSBZgLWkRJGulfHwx4sCPHBQhOxMdDxarTS5BRj0fuRAdgAZPDfSlJmjg==
X-Received: by 2002:a17:906:c1d6:b0:6d6:e0a3:bbc7 with SMTP id bw22-20020a170906c1d600b006d6e0a3bbc7mr776305ejb.484.1646846750255;
        Wed, 09 Mar 2022 09:25:50 -0800 (PST)
Received: from [192.168.0.144] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id o2-20020a50d802000000b00410d7f0c52csm1103696edj.8.2022.03.09.09.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Mar 2022 09:25:49 -0800 (PST)
Message-ID: <a3fb72da-a9e3-04af-fa19-62765bf81c2b@canonical.com>
Date:   Wed, 9 Mar 2022 18:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 14/26] usb: gadget: s3c-hsudc: remove usage of list
 iterator past the loop body
Content-Language: en-US
To:     Jakob Koschel <jakobkoschel@gmail.com>,
        Greg Kroah-Hartman <greg@kroah.com>
Cc:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:USB GADGET/PERIPHERAL SUBSYSTEM" 
        <linux-usb@vger.kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
        Cristiano Giuffrida <c.giuffrida@vu.nl>,
        "Bos, H.J." <h.j.bos@vu.nl>
References: <20220308171818.384491-1-jakobkoschel@gmail.com>
 <20220308171818.384491-15-jakobkoschel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220308171818.384491-15-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 08/03/2022 18:18, Jakob Koschel wrote:
> If the list representing the request queue does not contain the expected
> request, the value of the list_for_each_entry() iterator will not point
> to a valid structure. To avoid type confusion in such case, the list
> iterator scope will be limited to the list_for_each_entry() loop.
> 
> In preparation to limiting scope of the list iterator to the list traversal
> loop, use a dedicated pointer to point to the found request object [1].
> 
> Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/usb/gadget/udc/s3c-hsudc.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/s3c-hsudc.c b/drivers/usb/gadget/udc/s3c-hsudc.c
> index 89f1f8c9f02e..bf803e013458 100644
> --- a/drivers/usb/gadget/udc/s3c-hsudc.c
> +++ b/drivers/usb/gadget/udc/s3c-hsudc.c
> @@ -877,7 +877,7 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  {
>  	struct s3c_hsudc_ep *hsep = our_ep(_ep);
>  	struct s3c_hsudc *hsudc = hsep->dev;
> -	struct s3c_hsudc_req *hsreq;
> +	struct s3c_hsudc_req *hsreq = NULL, *iter;
>  	unsigned long flags;
>  
>  	hsep = our_ep(_ep);
> @@ -886,11 +886,13 @@ static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  
>  	spin_lock_irqsave(&hsudc->lock, flags);
>  
> -	list_for_each_entry(hsreq, &hsep->queue, queue) {
> -		if (&hsreq->req == _req)
> -			break;
> +	list_for_each_entry(iter, &hsep->queue, queue) {
> +		if (&iter->req != _req)
> +			continue;
> +		hsreq = iter;
> +		break;

You have in the loop both continue and break, looks a bit complicated.
Why not simpler:

if (&iter->req == _req) {
	hsreq = iter;
	break;
}

?
Less code, typical (expected) code flow when looking for something in
the list. Is your approach related to some speculative execution?

>  	}
> -	if (&hsreq->req != _req) {
> +	if (!hsreq) {
>  		spin_unlock_irqrestore(&hsudc->lock, flags);
>  		return -EINVAL;
>  	}


Best regards,
Krzysztof
