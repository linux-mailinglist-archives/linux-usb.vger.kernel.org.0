Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EC6168B048
	for <lists+linux-usb@lfdr.de>; Sun,  5 Feb 2023 15:27:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229705AbjBEO1F (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Feb 2023 09:27:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229646AbjBEO1C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 5 Feb 2023 09:27:02 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7036E1BADE
        for <linux-usb@vger.kernel.org>; Sun,  5 Feb 2023 06:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675607175;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6ovV0qxfXRlGuR+HK7ss8YuGnGDnO7QYRjF7EXEvhUA=;
        b=V4B2+LNT1rNOk6HDYgdsOH6UvdY5njRtzu8xfa6/MA+pGeoxhT/gq6ZuvQYDABrm+aj9UZ
        CBVeAt8OhDMWkejea1qJ/qV0+pSdjt0of0pXNpNl4nuANcWMfVXXpwYjLzJGkWAs0yaPly
        +2EptlS34RYYrHlFlmvAlFjXEuOicT0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-460-kxPFChMwNlK4iw8FMv66bw-1; Sun, 05 Feb 2023 09:26:13 -0500
X-MC-Unique: kxPFChMwNlK4iw8FMv66bw-1
Received: by mail-qv1-f71.google.com with SMTP id jo26-20020a056214501a00b0053aa15f61d4so4668788qvb.7
        for <linux-usb@vger.kernel.org>; Sun, 05 Feb 2023 06:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ovV0qxfXRlGuR+HK7ss8YuGnGDnO7QYRjF7EXEvhUA=;
        b=GfhD3IkLfW1R+os+G0dHYcz2BAfKBYMRKEWEWGfEK4I5ptoDzTrb/BIvp4hOvwnAhn
         +uVCPxpXBixvLtEipSv9SJHHXodx5/KdC0RG7Bbvgo4ETB8DrCuHqT3S2tzhb/FiUmYa
         S88N00fnvXwunwZK1rFs18SzkzcJcog8ar1zogt+uTzVKqFqCDjrHHbmmgf3XJUQs1a5
         mE4S4B4mIfD23Wi8MP2J24C+QDJtr0QnMF4jlGTGJtDnryZBlSkAhs7q3N502RC37ije
         gGYB0T419byLE/tsS2oiScpXomUPsl4jJtPj2+sPrG7V2wPHFMXsbHcoxH0Jh/F9KFaN
         JBsA==
X-Gm-Message-State: AO0yUKVYU5iRacZnAgcBsiyEeNXkkuHlmHgeQCXzdJ/0Rfv3lH9t2iVO
        4SysojiUEH7fYCaftZrmfOZ0m3z3sgxYilwXoz7MlHTDkT3QN3a/qEr+iOJH1AAJu8FQ9UU7QF0
        FlZnprbSFciYpb2kgJmFa
X-Received: by 2002:ac8:5a4d:0:b0:3ba:247a:3fb7 with SMTP id o13-20020ac85a4d000000b003ba247a3fb7mr1415594qta.53.1675607173449;
        Sun, 05 Feb 2023 06:26:13 -0800 (PST)
X-Google-Smtp-Source: AK7set9qppldBLGixlkM3q2z0IzkIe25wC7YU9wx75EHtd9OGiPGAXNIBI/Tm/BuoBQtjl1T0a1TKg==
X-Received: by 2002:ac8:5a4d:0:b0:3ba:247a:3fb7 with SMTP id o13-20020ac85a4d000000b003ba247a3fb7mr1415568qta.53.1675607173179;
        Sun, 05 Feb 2023 06:26:13 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id 131-20020a370689000000b0072b5242bd0bsm5586740qkg.77.2023.02.05.06.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Feb 2023 06:26:12 -0800 (PST)
Subject: Re: [PATCH] usb: host: USB_XHCI_RZV2M depends on USB_GADGET
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "artur.bujdoso@gmail.com" <artur.bujdoso@gmail.com>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "colin.i.king@gmail.com" <colin.i.king@gmail.com>,
        "tmaimon77@gmail.com" <tmaimon77@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230205021227.3017634-1-trix@redhat.com>
 <OS0PR01MB592285E3E3B9AA7FD8C291A286D59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Tom Rix <trix@redhat.com>
Message-ID: <46943159-4cd0-41d7-e63c-28239c17445a@redhat.com>
Date:   Sun, 5 Feb 2023 06:26:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <OS0PR01MB592285E3E3B9AA7FD8C291A286D59@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 2/5/23 12:52 AM, Biju Das wrote:
> Hi Tom,
>
> Thanks for the patch.
>
> Arnd send a patch for refactoring the USB_XHCI_RZV2M KConfig dependencies related to USB_GADGET on [1] and
> is in usb-next. Do you see this issue after applying[1]?
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=ec5499d338ece9db9b7590649d3cfcc4d7f9603d

 From reviewing, it will likely work.

Tom

> Cheers,
> Biju
>
>> -----Original Message-----
>> From: Tom Rix <trix@redhat.com>
>> Sent: Sunday, February 5, 2023 2:12 AM
>> To: gregkh@linuxfoundation.org; arnd@arndb.de; linus.walleij@linaro.org;
>> artur.bujdoso@gmail.com; miquel.raynal@bootlin.com; colin.i.king@gmail.com;
>> Biju Das <biju.das.jz@bp.renesas.com>; tmaimon77@gmail.com
>> Cc: linux-usb@vger.kernel.org; linux-kernel@vger.kernel.org; Tom Rix
>> <trix@redhat.com>
>> Subject: [PATCH] usb: host: USB_XHCI_RZV2M depends on USB_GADGET
>>
>> A rand config causes this link error
>> ld: drivers/usb/host/xhci-rzv2m.o: in function `xhci_rzv2m_init_quirk':
>> xhci-rzv2m.c:(.text+0x13): undefined reference to `rzv2m_usb3drd_reset'
>>
>> xhci_rzv2m_init_quirk build is controlled by USB_XHCI_RZV2M
>> rzv2m_usb3drd_reset build is controlled by USB_RZV2M_USB3DRD
>>
>> USE_XHCI_RZV2M does select USB_RZV2M_USB3DRD, but USB_RZV2M_USB3DRD depends
>> on USB_GADGET, so now does USE_XHCI_RZV2M.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/usb/host/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig index
>> 2b80ce9587c1..2dd9e95a5b86 100644
>> --- a/drivers/usb/host/Kconfig
>> +++ b/drivers/usb/host/Kconfig
>> @@ -100,6 +100,7 @@ config USB_XHCI_RZV2M
>>   	tristate "xHCI support for Renesas RZ/V2M SoC"
>>   	depends on USB_XHCI_PLATFORM
>>   	depends on ARCH_R9A09G011 || COMPILE_TEST
>> +	depends on USB_GADGET
>>   	select USB_RZV2M_USB3DRD
>>   	help
>>   	  Say 'Y' to enable the support for the xHCI host controller
>> --
>> 2.27.0

