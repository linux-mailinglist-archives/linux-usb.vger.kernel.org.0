Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D40BF543024
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jun 2022 14:21:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238823AbiFHMVr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jun 2022 08:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238792AbiFHMVq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Jun 2022 08:21:46 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D2B1E9
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 05:21:44 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 99D0F3F197
        for <linux-usb@vger.kernel.org>; Wed,  8 Jun 2022 12:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1654690901;
        bh=sGA9dZic3HoKYVxlqMeol7j55+lBG94ICRpJGuIPQA8=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=abZe3hAT5y4+eimwLzIwyAHimH92tqcuSzP3kRiQUmzxtuuuOH/tqrCzlUuwsHq0e
         zc+3aW5qIHIt+1BjePyC5IHpIgSc22ma5ELoegV8CH0l34aJ17TRN1KqU7U8dKFPEi
         fPSJRjTArM1sI32QKgFsB15eHH3uKi5bv00Ks6RwZTjMwuhrtyrKvNS5QJtB/bcr2H
         gL5D9yNeI8qYYSkaN+QIdv7xxDgg7J5UVhrjGAHAuWav1+pfNl2MQ/ZY+orddOA1FC
         s35aJeMtwc8glt/un/Gp3pbBLnj5QZIQN8Yyx3PhmU23AMOSeKDvWrnYXQA/OHqdg/
         lQdRHfeYT8rzQ==
Received: by mail-wm1-f72.google.com with SMTP id n15-20020a05600c4f8f00b0039c3e76d646so6471840wmq.7
        for <linux-usb@vger.kernel.org>; Wed, 08 Jun 2022 05:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sGA9dZic3HoKYVxlqMeol7j55+lBG94ICRpJGuIPQA8=;
        b=m1Wdk9vV8SdKIWf4sO58DKqGUUWgl9z/yieohb1aBkmHrviDzlkSnetDeCMVmiJR1X
         61j9gVtDtuZt2CyxlLc5s6frsKiUIEZXQ8UnQ3J5clBmzMQG6z/Jp3I7XU7kJZhkQRUR
         /lLYL6zKeMp8FZ+oECXukqP1CaB06OdLy3otCWmxj6IDdnw8CxiC9AX9p2d/2/SqIi6a
         D7f73tljlrT0+lx2XIzxfwaYooL8udHZfaY84Ju3XZbh3G2b4oMSoyaeI/GCGk6BFhrT
         jc5oLD7lo+o1pesES0ZQCc3S5IEoqvjV9mPq7pLVnFJDrm6K++7Q/5SzJpxwmM7NDZwQ
         oiQA==
X-Gm-Message-State: AOAM533MneD0ilMnkb+0PHGXJVuDgeTgvFUeA3m2qfnWVswtjJHKpsYR
        BhDTOWEM2Ubi+LEDYOWuoSyO9UJSPrs4j/ugFGi6klzBxwdaebD/9mduyrOMI99rOwJgZKIYx2V
        /p4SVZxkHqSqQLb7nOBjFa3abBg4H7QJ4jTxO2g==
X-Received: by 2002:a05:6000:1b0f:b0:210:313a:ef2a with SMTP id f15-20020a0560001b0f00b00210313aef2amr32273801wrz.281.1654690901208;
        Wed, 08 Jun 2022 05:21:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZMMPD/zGJeGmHC/em1a13KMLY2FJCpjFs/lGpqxTvm4WuLFstyFGGh1b6rRmJG/iibHyo+w==
X-Received: by 2002:a05:6000:1b0f:b0:210:313a:ef2a with SMTP id f15-20020a0560001b0f00b00210313aef2amr32273777wrz.281.1654690900967;
        Wed, 08 Jun 2022 05:21:40 -0700 (PDT)
Received: from [192.168.123.67] (ip-062-143-094-109.um16.pools.vodafone-ip.de. [62.143.94.109])
        by smtp.gmail.com with ESMTPSA id n27-20020a05600c3b9b00b0039c64d0c4e8sm1540272wms.45.2022.06.08.05.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 05:21:40 -0700 (PDT)
Message-ID: <244df608-ef96-d3f2-2463-1cc82728e70f@canonical.com>
Date:   Wed, 8 Jun 2022 14:21:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/3] riscv: dts: microchip: fix icicle kit's dr_mode
Content-Language: en-US
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     Daire McNamara <daire.mcnamara@microchip.com>,
        Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-riscv@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bin Liu <b-liu@ti.com>
References: <20220607132204.746180-1-conor.dooley@microchip.com>
 <20220607132204.746180-4-conor.dooley@microchip.com>
From:   Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220607132204.746180-4-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 6/7/22 15:22, Conor Dooley wrote:
> The usb on icicle kit is actually configured for otg, not host mode.
> Swap it over.

To my understanding both host mode and OTG mode could  be supported by 
the hardware.

Jumper J17 on 
https://www.microsemi.com/images/10/MicrosoftTeams-image%201.png.
USB device mode selection - Open: USB client. Closed: USB host

Is OTG really the most important scenario for running the board? I 
personally would prefer to run it in host mode to add more peripherals.

What is missing on the driver side to enable host mode?

Can we detect the 5 Volt jumper setting via GPIO?

Best regards

Heinrich

> 
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
> Signed-off-by: Conor Dooley<conor.dooley@microchip.com>
> ---
>   arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index 044982a11df5..121b01c8784f 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -158,5 +158,5 @@ &syscontroller {
>   
>   &usb {
>   	status = "okay";
> -	dr_mode = "host";
> +	dr_mode = "otg";
>   };
> -- 2.36.1

