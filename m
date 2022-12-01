Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3088163EDE2
	for <lists+linux-usb@lfdr.de>; Thu,  1 Dec 2022 11:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230464AbiLAKdp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Dec 2022 05:33:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbiLAKdW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Dec 2022 05:33:22 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 122D6578FB
        for <linux-usb@vger.kernel.org>; Thu,  1 Dec 2022 02:33:04 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x11so1371437ljh.7
        for <linux-usb@vger.kernel.org>; Thu, 01 Dec 2022 02:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XwrQbOBiKU75Cv/78jGn299AlgNFY94s/4aL2Jtvkug=;
        b=U2APtYn8ADfJPtXk2bBZ5QmzwpCuGGm0/sHSwMgkMZ8K1wnozc+9t4sJxA6mcz7fdk
         LVh8POmMC5P6w/O/nSl1+2J5iZOWSAaT29DCXdfhTLapHWmBO0gDwMwxtnYWvQideWqn
         NWTHIwNQHyZQQxrdxXKva0i1Br+OPhz1u5pfjPgyZLftALrVzuvA5yWuFcJmfhkdB80c
         08Va70e3GGxA2DIpKEnLhObXCiZk0e1R3sR1U3LFM378eyMgTlEcb3YYGQQ6OtkBkz8o
         aAgcEpgVoZCS4fL5lb6U6xnmYwUnbB50riHTvUWcyb5iEMv929kNm0pVz9i7Zm/DKCHS
         AZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XwrQbOBiKU75Cv/78jGn299AlgNFY94s/4aL2Jtvkug=;
        b=kntvZU91fz9F8XiiQaaRv03Ep085KUkM5ekJF3VfEVkF2SjDXCIO5CHcGNYvjn12A4
         /4igtTgadmgYIKDHFtMWq+De4pfbr4HsScLpVE1sQ23uCm1HB9RV4VsfoLrpVVcCYllh
         u7KTcbceRXHGpEfJMnn4kAWo9lPp14k87sCq/X8bN7TdFHXJ0p5O0nfHudkzYYtyIjRi
         ZDPwFHdlkCZIfz/7tfS1cx3TWPylWi039YMFVp+l5CQD2bR13wwBTzvdr19SOcp7Jiak
         DCyM3vHkYMnFDQIQiN0EogNulz6n8ubsjtEMN8dSV/DPla31WBMJomjALP9HSDrkC92t
         bqrw==
X-Gm-Message-State: ANoB5pnNzkR5GfvmMPqX/LndFzOZaSDos/cTZHXfG63lWY7ErdCvvoxU
        jT/SxUl0wv+6sqXy0Unvt5Heug==
X-Google-Smtp-Source: AA0mqf4un9UBXikeqgMV0WRJT2NbBA+SqC0tiaRYqi1zzzkW5X1ace3hDaZ0+z+IqFfmFyQAeFvOrg==
X-Received: by 2002:a2e:a263:0:b0:276:be89:5616 with SMTP id k3-20020a2ea263000000b00276be895616mr13844272ljm.347.1669890782423;
        Thu, 01 Dec 2022 02:33:02 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p21-20020a2eba15000000b002796fb63dbdsm356393lja.13.2022.12.01.02.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:33:02 -0800 (PST)
Message-ID: <d00b6f5e-0966-3ab8-d559-b0f9e843845c@linaro.org>
Date:   Thu, 1 Dec 2022 11:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [RFC PATCH v1 2/2] usb: host: add xhci-exynos to support Exynos
 SOCs
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daehwan Jung <dh10.jung@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Colin Ian King <colin.i.king@gmail.com>,
        Artur Bujdoso <artur.bujdoso@gmail.com>,
        Juergen Gross <jgross@suse.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>, sc.suh@samsung.com,
        taehyun.cho@samsung.com, jh0801.jung@samsung.com,
        eomji.oh@samsung.com
References: <1669860811-171746-1-git-send-email-dh10.jung@samsung.com>
 <CGME20221201021942epcas2p2429ed37e1f6146b6e1a5bef23141b3f7@epcas2p2.samsung.com>
 <1669860811-171746-3-git-send-email-dh10.jung@samsung.com>
 <Y4hgnxGMEuizJumr@kroah.com>
 <c524cba6-4438-461a-ab05-9325fe09f832@app.fastmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c524cba6-4438-461a-ab05-9325fe09f832@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 01/12/2022 10:01, Arnd Bergmann wrote:
> On Thu, Dec 1, 2022, at 09:06, Greg Kroah-Hartman wrote:
>> On Thu, Dec 01, 2022 at 11:13:31AM +0900, Daehwan Jung wrote:
>>> This driver works with xhci platform driver. It needs to override
>>> functions of xhci_plat_hc_driver. Wakelocks are used for sleep/wakeup
>>> scenario of system.
>>
>> So this means that no other platform xhci driver can be supported in the
>> same system at the same time.
>>
>> Which kind of makes sense as that's not anything a normal system would
>> have, BUT it feels very odd.  This whole idea of "override the platform
>> driver" feels fragile, why not make these just real platform drivers and
>> have the xhci platform code be a library that the other ones can use?
>> That way you have more control overall, right?
> 
> Agreed, having another layer here (hcd -> xhci -> xhcd_platform ->
> xhcd_exynos) would fit perfectly well into how other SoC specific
> drivers are abstracted. This could potentially also help reduce
> the amount of code duplication between other soc specific variants
> (mtk, tegra, mvebu, ...) that are all platform drivers but don't
> share code with xhci-plat.c.
> 
> Alternatively, it seems that all of the xhci-exynos support could
> just be part of the generic xhci-platform driver: as far as I can
> tell, none of the added code is exynos specific at all, instead it
> is a generic xhci that is using the wakeup_source framework.

There is nothing here Exynos SoC related, it's only for the purpose of
using wakelocks. We do not use wakelocks in other drivers, so I wonder
what makes this one so special... It does not look like generic approach
to the problem (which is BTW not really described in commit).

Best regards,
Krzysztof

