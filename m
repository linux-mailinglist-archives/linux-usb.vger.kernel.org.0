Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5AFE7645C6
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 07:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbjG0Fib (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 01:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232320AbjG0FiD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 01:38:03 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B0E135AC
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 22:37:14 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-3a43cbb432aso515584b6e.3
        for <linux-usb@vger.kernel.org>; Wed, 26 Jul 2023 22:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690436169; x=1691040969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EjWeTmshW9b7tciVrlbg2N18mlV88oSOvDpzyfZWagA=;
        b=QXRpeQZw8Gxer8E08fLZUMXwYVcxetcdR8vREY7f6yZOYu0sOS7drUt+68Xzz6/nEN
         fvlrJQW4Oj1UuL1T7TyQgwD10wVS1a8//CZ1lHoA4uC5FSvLp8WOTayLz+Rd9W6O1QiZ
         hSV+oGTPT5KgkXn9YPxk6m4/9lEBFkmTBW7zK/hdwLkiUkOqc9zv/Z8k1XbwOi9xaysf
         D6BmmQILqpH1L4fh5TaKaWkkoKomfdLVWhaoCG78dPnzyFyvydmybRoI+CqVzabwojHh
         vTSJuutm3J3LDdp/1jy85bMv4PoGVcO5apmTxZHBTtJ2QMDAhJ2R8u00YvRcao1an3E0
         7tkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690436169; x=1691040969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EjWeTmshW9b7tciVrlbg2N18mlV88oSOvDpzyfZWagA=;
        b=WeLKRa133TjH2B2+Pg3hkCBf9jxBJJ6KU8LWt8Mdzde/7LxyeoArODTszUGh/rbu3a
         LKqT3jeW1TsdfiupRTLxT/P7sQqVrGontOWDiknkhGJapBIxIo4914XaZ5YTXabcmAse
         qw8ZgDvD9fOKLpLUfaoGJcpNa/lrj3+/RbO969IfCMtU1cZQNoeut6Yw58WDQbhtKA+L
         KIm6dx7hWGbG/pm0b8Z0SllWrfyNvh0ymOt0w9y8YPijY+EM4IpC1BZ9Gb1AvHwvGP2P
         buK32e3nSRaCDvSXjTfQ6gDA7n2i3P05U8UydRavvDN0Pdv8ygeLsKKiGZv02yP3qFfI
         NntQ==
X-Gm-Message-State: ABy/qLYTe09upw3l7CupxkQfVrsKKr7k2LKAIsaKjlDPkIPr98mn5W1O
        8Qq6iJGRneCT6qtrcSdw671Xow==
X-Google-Smtp-Source: APBJJlEulTZCLGODm+NAd3ecDyamscG8lGxMWhXJb0osdpupjFIb23uSf8a0n7l34ZgLYMlYZ9UGXg==
X-Received: by 2002:a05:6808:1997:b0:3a4:3b56:6a4c with SMTP id bj23-20020a056808199700b003a43b566a4cmr2226626oib.50.1690436169598;
        Wed, 26 Jul 2023 22:36:09 -0700 (PDT)
Received: from [10.0.2.15] ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id n4-20020a637204000000b0054fe7736ac1sm487874pgc.76.2023.07.26.22.36.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 22:36:09 -0700 (PDT)
Message-ID: <6bea2a28-7d99-d459-d18a-182709ba027b@tuxon.dev>
Date:   Thu, 27 Jul 2023 08:35:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 04/30] usb: ohci-at91: Remove redundant msg at probe time
Content-Language: en-US
To:     Yangtao Li <frank.li@vivo.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230726113816.888-1-frank.li@vivo.com>
 <20230726113816.888-4-frank.li@vivo.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20230726113816.888-4-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 26.07.2023 14:37, Yangtao Li wrote:
> platform_get_irq() directly prints error information.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>   drivers/usb/host/ohci-at91.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/ohci-at91.c b/drivers/usb/host/ohci-at91.c
> index f957d008f360..439d8a16d7c5 100644
> --- a/drivers/usb/host/ohci-at91.c
> +++ b/drivers/usb/host/ohci-at91.c
> @@ -190,10 +190,8 @@ static int usb_hcd_at91_probe(const struct hc_driver *driver,
>   	int irq;
>   
>   	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0) {
> -		dev_dbg(dev, "hcd probe: missing irq resource\n");
> +	if (irq < 0)
>   		return irq;
> -	}
>   
>   	hcd = usb_create_hcd(driver, dev, "at91");
>   	if (!hcd)
