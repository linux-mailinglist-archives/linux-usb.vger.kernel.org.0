Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB184CFDEC
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 13:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239753AbiCGMOu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 07:14:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238900AbiCGMOr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 07:14:47 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8172B4D255
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 04:13:52 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3382F3F61F
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 12:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646655229;
        bh=m0uKneq0JoikL42mXxDjF/EwLxNv6F4NkgutMu3gMRo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=WvaTfynE4KQaTwqdBxdrpmRJ2BEBHjRB6Nj+PQkigjHBJjAeaMLWOD7HPZFrrHUeS
         2KITcgZjFxJGFEjNQIgeyKQZ6AqdyQQgI+KcqrNcC0XwpsMBJnMjJKU8RdJMSZUZD6
         BsT+f/NZ7n08agwHRr38iNf55ZXLQ3EZNraLEck/8sYqcTLT+zewc7d9hV0du3FPw+
         Z9OWl1MUpnj91WNY5KaX2FPpLcjr8oTBrku6MEaLc9XVCCKhbOS1MFqJl1it3a1X6/
         e+v2w1v1L0zbDRvJRA8Qu64IkLdHm6COzJzeU01Pu6iuZci13HL+ih1SBIBIX0lf40
         6pS55geeEaS2Q==
Received: by mail-ej1-f72.google.com with SMTP id m4-20020a170906160400b006be3f85906eso6901569ejd.23
        for <linux-usb@vger.kernel.org>; Mon, 07 Mar 2022 04:13:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m0uKneq0JoikL42mXxDjF/EwLxNv6F4NkgutMu3gMRo=;
        b=C83y35KB7IE8qsClMd1Th5cqemamr8rsRkzWq2ikKuds7ZcI6UMT9uvfHPdhkojCUl
         d3plGcTbhp2unTDmOdx1Qia+p7PYzZi2uK8c31odSAJ3UCEFanGHS58cs6sm3bSpZT26
         h/bVb+N+mHh8lCCk0CLbghg6Lfpsue6GF3LH5YceHReeLBXNfqtMgvGbuQqaPq1Qdz1P
         UjREW/ntR+j89oIVbrpVVWdWM4QjNRAJRia9LBbJ0xBqbkRaWB36oRqAkDjYjbiKXZIR
         lX4mNVe+PUTKAfbB7EIFktaoTF4e9IqTDcUkUPLyMBSTbcPEhlFWeBjyUCmm2WvGLh/l
         /19A==
X-Gm-Message-State: AOAM531NQEOmk0sW6iYda1/vSsYWbu8huMNfG0n990JFLIjVLE5YAyYw
        u2+M7Y91UDbxlQjve9Z5WhqOqdBAwyVKnJ5Ml4bRZOC03z9uAqDAmF2iSHIWu/4CYQFTPTTkY9H
        hG6KpDq0uv9L6ZieXvJ+QOSsFVf7vRD//wXHjuA==
X-Received: by 2002:a17:907:961b:b0:6d9:acb0:5403 with SMTP id gb27-20020a170907961b00b006d9acb05403mr8706954ejc.568.1646655226221;
        Mon, 07 Mar 2022 04:13:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywT7IBmPGMfvXgI54h2O/sp9f7H0qBKfZ5y5SAFWqU5Vcyr1g+IKctTsIB2+Ivgs7cal6HeQ==
X-Received: by 2002:a17:907:961b:b0:6d9:acb0:5403 with SMTP id gb27-20020a170907961b00b006d9acb05403mr8706919ejc.568.1646655225992;
        Mon, 07 Mar 2022 04:13:45 -0800 (PST)
Received: from [192.168.0.142] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fq6-20020a1709069d8600b006db088ca6d0sm2164801ejc.126.2022.03.07.04.13.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Mar 2022 04:13:45 -0800 (PST)
Message-ID: <3655d921-3798-0a01-1b7a-32261389dde5@canonical.com>
Date:   Mon, 7 Mar 2022 13:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 26/26] usb: gadget: udc: s3c2410: replace usage of rc to
 check if a list element was found
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
References: <20220306175034.3084609-1-jakobkoschel@gmail.com>
 <20220306175034.3084609-27-jakobkoschel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220306175034.3084609-27-jakobkoschel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 06/03/2022 18:50, Jakob Koschel wrote:
> To move the list iterator variable into the list_for_each_entry_*()
> macro in the future it should be avoided to use the list iterator
> variable after the loop body.
> 
> To *never* use the list iterator variable after the loop it was
> concluded to use a separate iterator variable [1].
> 
> This removes the need to check the rc value to determine if the
> break/goto was hit and can be made more obvious
> by checking if the variable was set within the list traversal loop.
> 
> Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
> ---
>  drivers/usb/gadget/udc/s3c2410_udc.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/s3c2410_udc.c b/drivers/usb/gadget/udc/s3c2410_udc.c
> index e3931da24277..fe6ecb0d16d1 100644
> --- a/drivers/usb/gadget/udc/s3c2410_udc.c
> +++ b/drivers/usb/gadget/udc/s3c2410_udc.c
> @@ -1265,7 +1265,7 @@ static int s3c2410_udc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  	struct s3c2410_ep	*ep = to_s3c2410_ep(_ep);
>  	int			retval = -EINVAL;
>  	unsigned long		flags;
> -	struct s3c2410_request	*req = NULL;
> +	struct s3c2410_request	*req = NULL, *tmp;
>  
>  	dprintk(DEBUG_VERBOSE, "%s(%p,%p)\n", __func__, _ep, _req);
>  
> @@ -1277,16 +1277,17 @@ static int s3c2410_udc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>  
>  	local_irq_save(flags);
>  
> -	list_for_each_entry(req, &ep->queue, queue) {
> -		if (&req->req == _req) {
> -			list_del_init(&req->queue);
> +	list_for_each_entry(tmp, &ep->queue, queue) {
> +		if (&tmp->req == _req) {
> +			list_del_init(&tmp->queue);
>  			_req->status = -ECONNRESET;
> +			req = tmp;
>  			retval = 0;
>  			break;
>  		}
>  	}
>  
> -	if (retval == 0) {
> +	if (req) {

I saw comments from Greg about it, so please keep similar approach here
as in patch 25. I propose to keep retval.

With retval restored:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
