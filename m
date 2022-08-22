Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E211459C1F2
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 16:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235550AbiHVOzr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 10:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235672AbiHVOz1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 10:55:27 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 655C0186E9
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 07:55:25 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id d21so2400597eje.3
        for <linux-usb@vger.kernel.org>; Mon, 22 Aug 2022 07:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=NbCrNY36tARZs/wSlHcWIofsvu23F4N0CrTwm8vtH9U=;
        b=oThclj6M9n2FysNC45lrjU2bCGH3/KPTx9lxKTe9fugY683mLzLEHrng+va4AgLSZG
         9fjsarb9N+JrTV9o858XkTwHuYJinMy8+qb/8x2VvohZ3EyShCT0Ik0XZZOQvK3d5gpZ
         U5gYMaPSlk8z2ei9V1sHTOMhSmbXaX/zqGw5d2BPBPvUTz7G3ERzYOf5ZNQ1P95ty2F8
         54QG2rGyROajsscTAU09dCC3yRpxOBmXoeJUjkOo3qYU1U8uwZDxA7cxfvjC3pWPr5Gn
         sf9nj1tvSCaf+5xOJ9mSDWL/WsG6LiXmYhL1Bi5MttkRGnBJKhk19ZoEUpINurqXbfsc
         o5hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=NbCrNY36tARZs/wSlHcWIofsvu23F4N0CrTwm8vtH9U=;
        b=vc3WOGWRJA98t73hi1znFqXMHJlVxszkZG3anHY8+tQHAl3hKlaxXGrPO2q4csnNvn
         0v/hGBAlaWtMPrlVYW1fsLSo2qj7/OKGlQNTjCtiYpn89v+nAQ8/8AZb+841KVCsZLO5
         lKf17tIfQpujWLZmwnH0h2LsEKDOz1UJ1PyTRb6DMasw8O3AP7K7MZfHHl/dRRwPIPxZ
         mYn/mG2VCCrBcV93XFe6PK92bGXbu+OxAzwWgcORktTr4WWLiJZBBJDl3Xi2/EKmeM8M
         z058y5Bifq8dMD1xEerPR5Cqfbx/xsKsBHNg4cPlJP4oW3I1DgxFEpvRZi8VLkTbZgeS
         +YgQ==
X-Gm-Message-State: ACgBeo1IY5HWgKhUtBiVnv8CwzEwJ3igYX/rpASy8rL5Vn7X+ZZt5Jul
        n5okm2wSWLry4JL0jhw07uSkEPymvr8=
X-Google-Smtp-Source: AA6agR5nacCOZ66hO3ObhKe9uvwU2JSuqzLG9V0yJf+ih9bpF/QUEeFavnprcpcIr34uXKoX6moq9Q==
X-Received: by 2002:a17:907:1b09:b0:72f:d49e:6924 with SMTP id mp9-20020a1709071b0900b0072fd49e6924mr13167981ejc.15.1661180123842;
        Mon, 22 Aug 2022 07:55:23 -0700 (PDT)
Received: from ?IPV6:2a02:3100:954a:8e00:e461:b75b:2aa2:ceb8? (dynamic-2a02-3100-954a-8e00-e461-b75b-2aa2-ceb8.310.pool.telefonica.de. [2a02:3100:954a:8e00:e461:b75b:2aa2:ceb8])
        by smtp.googlemail.com with ESMTPSA id q9-20020a17090676c900b0073d218af237sm4763921ejn.216.2022.08.22.07.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Aug 2022 07:55:23 -0700 (PDT)
Message-ID: <85ba1e59-de83-e3c9-1025-28b4642f66b3@gmail.com>
Date:   Mon, 22 Aug 2022 16:55:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] usb: dwc2: fix wrong order of phy_power_on and phy_init
Content-Language: en-US
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <f5632bde-0c34-9696-e979-497ef4fc9556@gmail.com>
 <f03187fc-59a5-a174-691a-687598c903a5@synopsys.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <f03187fc-59a5-a174-691a-687598c903a5@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 22.08.2022 11:39, Minas Harutyunyan wrote:
> Hi Heiner,
> 
> On 8/20/2022 9:45 PM, Heiner Kallweit wrote:
>> Since 1599069a62c6 ("phy: core: Warn when phy_power_on is called before
>> phy_init") the driver complains. In my case (Amlogic SoC) the warning
>> is: phy phy-fe03e000.phy.2: phy_power_on was called before phy_init
>> So change the order of the two calls.
>>
>> Fixes: 09a75e857790 ("usb: dwc2: refactor common low-level hw code to platform.c")
> 
> Added CC: Marek Szyprowski <m.szyprowski@samsung.com>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/usb/dwc2/platform.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
>> index c8ba87df7..4db7a18a5 100644
>> --- a/drivers/usb/dwc2/platform.c
>> +++ b/drivers/usb/dwc2/platform.c
>> @@ -154,9 +154,9 @@ static int __dwc2_lowlevel_hw_enable(struct dwc2_hsotg *hsotg)
>>   	} else if (hsotg->plat && hsotg->plat->phy_init) {
>>   		ret = hsotg->plat->phy_init(pdev, hsotg->plat->phy_type);
>>   	} else {
>> -		ret = phy_power_on(hsotg->phy);
>> +		ret = phy_init(hsotg->phy);
>>   		if (ret == 0)
>> -			ret = phy_init(hsotg->phy);
>> +			ret = phy_power_on(hsotg->phy);
>>   	}
>>   
>>   	return ret;
> 
> Shouldn't be updated function __dwc2_lowlevel_hw_disable() similarly, 
> according: phy_power_off must be called before phy_exit()?
> 
Indeed, this should be changed accordingly.
See kernel doc:

 * phy_exit - Phy internal un-initialization
 * @phy: the phy returned by phy_get()
 *
 * Must be called after phy_power_off().

> Thanks,
> Minas
> 

