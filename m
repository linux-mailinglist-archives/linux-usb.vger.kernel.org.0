Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9A075D832
	for <lists+linux-usb@lfdr.de>; Sat, 22 Jul 2023 02:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231157AbjGVAcf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 20:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjGVAce (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 20:32:34 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA20D1731
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 17:32:32 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1bb29ae5975so598375fac.2
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 17:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689985952; x=1690590752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OXA4WFzZ0VY5hwN2PPnfgBn2bOmyEfTGP4+a7Pqpyv0=;
        b=S2eajCBfWRP1rI4pA1k5uJs/0YW3FEoGeHDGDcC+nhWVgJfNTH8iZColxOGIlk2dks
         3bYgFhgbv3fm9UxmN9wmLcbaNWRdxT4OUH4S6JBgrCOKbBMM9O8la653lV+Ht1/boWuG
         fy/g1HGrziLOoyT5P0wf7vbZNBCOZX9B3dSfoVil3kfvaDKtNwkI7lY4LdcdojUuOiHO
         3/rvlzE4xi47kxeOhA2p9mblDzQioiBayYcXXSUB/kKcaGgF3sh2QM7IY2RPMmKJ8iyY
         YrNejhf4f8Xlv323ENRKObTdqPmVI2aib6uZ48sRPoTYZpcgvTaDdQOjD915tN5t5Bwi
         VSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689985952; x=1690590752;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXA4WFzZ0VY5hwN2PPnfgBn2bOmyEfTGP4+a7Pqpyv0=;
        b=kIkjILTB2LW4GT7KbzCwxPGawJP1RjK26nmq7Pvo9X4HJAyoEk7p3m1E7FYKYpPKeZ
         vPrRacNsSTeQpO+JyYZYejoqmQvZJmlBVtCS5yT7lOZ5UqqdATft6Jxtf4kUraXPFRRW
         3uhb8IuGtsldgpDH73p0EJsUmQeYDk4A338lBtk0HQYqm4mR3YhLhvePx1hv5OSEv43N
         jX71tJsT5zJmYpt1wj3hdMiu4hP/msaCR7nVpuqICrgwktqUpRnAjukH/tpS38jOSp0F
         1CZejHxv6ouGDZOI7jW8h2CsovINXrKdQnr3r7eBPr0bQ8DsftpKrFWwmv5XRL365Pfq
         bp6Q==
X-Gm-Message-State: ABy/qLZuPqK35Ad/GwbJhrToV8ri2S155qPmJLOuXpUBbg2icAiS5iKS
        mbYN7JQLaPH9TsrXVo68ZHmQXW1iWMNBjw==
X-Google-Smtp-Source: APBJJlFaDo4NZEbuANIGJ5NyC0z6AvuNRLmREjpgwVwuiD7ifZ/7ubSbpi5GYFneQE2faWvhEIRiaA==
X-Received: by 2002:a05:6871:89f:b0:1ba:caf2:acc3 with SMTP id r31-20020a056871089f00b001bacaf2acc3mr3682318oaq.5.1689985952016;
        Fri, 21 Jul 2023 17:32:32 -0700 (PDT)
Received: from [192.168.1.9] ([159.192.85.211])
        by smtp.googlemail.com with ESMTPSA id n18-20020aa79052000000b0066a4e561beesm3591950pfo.173.2023.07.21.17.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 17:32:31 -0700 (PDT)
Message-ID: <84196e5f-31fc-28ff-b047-3f234f1a1a4f@gmail.com>
Date:   Sat, 22 Jul 2023 07:31:58 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] USB: serial: option: add Quectel EM05G module support
 with product ID 0x030e
To:     Martin Kohn <m.kohn@welotec.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <AM0PR04MB576480684AA0896B32D32975973FA@AM0PR04MB5764.eurprd04.prod.outlook.com>
Content-Language: en-US
From:   Lars Melin <larsm17@gmail.com>
In-Reply-To: <AM0PR04MB576480684AA0896B32D32975973FA@AM0PR04MB5764.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/22/2023 1:26, Martin Kohn wrote:
> Add Quectel EM05G with product ID 0x030e
> 
> T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  8 Spd=480  MxCh= 0
> D:  Ver= 2.00 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
> P:  Vendor=2c7c ProdID=030e Rev= 3.18
> S:  Manufacturer=Quectel
> S:  Product=Quectel EM05-G
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
> I:* If#= 3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=option
> E:  Ad=87(I) Atr=03(Int.) MxPS=  10 Ivl=32ms
> E:  Ad=86(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> I:* If#= 4 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
> E:  Ad=89(I) Atr=03(Int.) MxPS=   8 Ivl=32ms
> E:  Ad=88(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> E:  Ad=05(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
> 
> 
> Signed-off-by: Martin Kohn <m.kohn@welotec.com>
> ---
>   drivers/usb/serial/option.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 288a96a74266..cbe35c3db45a 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -256,6 +256,7 @@ static void option_instat_callback(struct urb *urb);
>   #define QUECTEL_PRODUCT_BG96			0x0296
>   #define QUECTEL_PRODUCT_EP06			0x0306
>   #define QUECTEL_PRODUCT_EM05G			0x030a
> +#define QUECTEL_PRODUCT_EM05GV2			0x030e
>   #define QUECTEL_PRODUCT_EM060K			0x030b
>   #define QUECTEL_PRODUCT_EM05G_CS		0x030c
>   #define QUECTEL_PRODUCT_EM05CN_SG		0x0310
> @@ -1186,6 +1187,8 @@ static const struct usb_device_id option_ids[] = {
>   	  .driver_info = RSVD(6) | ZLP },
>   	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G, 0xff),
>   	  .driver_info = RSVD(6) | ZLP },
> +	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05GV2, 0xff),
> +	  .driver_info = RSVD(6) | ZLP },
>   	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_CS, 0xff),
>   	  .driver_info = RSVD(6) | ZLP },
>   	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_GR, 0xff),


That doesn't look right to me for many reasons, one of them being that 
you let the option driver bind to the qmi net interface.
You have also reserved interface 6 but there is no interface with that 
number in EM05GV2.

Thanks
Lars


