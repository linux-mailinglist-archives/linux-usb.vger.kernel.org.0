Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B281642402
	for <lists+linux-usb@lfdr.de>; Mon,  5 Dec 2022 09:03:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231847AbiLEIDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Dec 2022 03:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbiLEIDg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Dec 2022 03:03:36 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A83F42653
        for <linux-usb@vger.kernel.org>; Mon,  5 Dec 2022 00:03:34 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so17237343lfb.13
        for <linux-usb@vger.kernel.org>; Mon, 05 Dec 2022 00:03:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H+uTtN8xZ5dZQSWV9r1hcnd1qKrZ8UQsR2z3ws2RHkA=;
        b=qtCmKK6E6PIgMLP7oCS0itWhZU0DwUy3/+Zhj0EnOeAGLNJFnp4XAcUXWeamyoyfEx
         l1IqmygGR+Uem/VweGGugEbuLSw6KmABGZOQ0puLC8vSZPfC8lGrKYixlqP8PQ2pw+bQ
         j0n9f2/3ySrOQgavcF22Qs3xTfov+0nVlPDJf9iJ/+1su9YQQ/F73b0dKJuzeyO/z8Ed
         64liIYMO2F3L753Ym6QrWBcq0SwUXgPatJCmTdiTSSpCLbfJ/jhK1XruyV4ofAzB9WOb
         HTPj1IU2w8gaRhiAACPRDX9rG58N6x+Pa77gSVRcHEc/r+K45XW7LotU9mXZBSaOzpl5
         DoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+uTtN8xZ5dZQSWV9r1hcnd1qKrZ8UQsR2z3ws2RHkA=;
        b=HAGE/lJs/lEmOPYUfjDoq+N4mjniU0IprU0ZpnEeBct/NGEz8e/ZEeBu8kTZnOiSGJ
         G+aidssQ0+qFD0m/MojXnSYNKSVl06LQkfEyRlioayWFoU0cZGX9K7FpKnTB26+SsLMX
         ZsgHJOzSgTek4ZBi6mSaLGbC+WbwfPoEfmtdrlvUoJ9A+XDvdzMucNqv0EcAtH0RQxGN
         lU23KEzr3s6fgeW+GBcQhjy44L2DtrG87FxbVYoGpnnnxIdUMmYQ2GybgBnB9D9xCX/j
         CT5jLwUnJgW7f5rxPsLL/hf+WvAuxCsdJGc5kiqPkDGhWApj1rSDwPoaA05xURarlTho
         eX7Q==
X-Gm-Message-State: ANoB5plX0pEi/OwyDxgqfTDQiVjGxePUTIB3WktxM93Lomwl1KA9dcBg
        PAwaOGuDspQ6Wqw7hEDJgmU8Cg==
X-Google-Smtp-Source: AA0mqf5E/SarGgr2D2OXWZ/49zr2poOvPBDCHCLckhu/QV0t+EvkWqhoBZaJJ/UxTIbBIxDCzY/tjQ==
X-Received: by 2002:ac2:53a2:0:b0:4b5:29f5:8635 with SMTP id j2-20020ac253a2000000b004b529f58635mr8203988lfh.282.1670227412997;
        Mon, 05 Dec 2022 00:03:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512370f00b004b4b69af17dsm1623100lfr.214.2022.12.05.00.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:03:32 -0800 (PST)
Message-ID: <7b024087-cf20-a14e-2ab1-8bba71493135@linaro.org>
Date:   Mon, 5 Dec 2022 09:03:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v1 2/2] usb: host: add xhci-exynos to support Exynos
 SOCs
Content-Language: en-US
To:     Jung Daehwan <dh10.jung@samsung.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
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
 <ec0ce90c-b165-d84f-340d-4973b65609b3@linux.intel.com>
 <f633b0f3-9fdb-8beb-7edf-7967c7c0c3d5@linaro.org>
 <20221205023413.GD54922@ubuntu>
 <92df8e1d-eb7b-ec0b-264f-a1a090cececc@linaro.org>
 <20221205075342.GG54922@ubuntu>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221205075342.GG54922@ubuntu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 05/12/2022 08:53, Jung Daehwan wrote:
> On Mon, Dec 05, 2022 at 08:33:39AM +0100, Krzysztof Kozlowski wrote:
>> On 05/12/2022 03:34, Jung Daehwan wrote:
>>
>>>>> Am I missing something here?
>>>>
>>>> Because it is not a driver for Exynos... it's a driver for wakelocks for
>>>> their specific Android use-cases which the manufacturer ships for their
>>>> Android devices. Due to Google GKI, they try to squeeze into upstream.
>>>> But this is huge misconception what should go to upstream and Samsung
>>>> does not want to keep discussing. They just send random patches and
>>>> disappear...
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>>
>>>
>>> No. It's driver for Exynos. Currently It only has wakelocks but I will
>>> submit one by one. Please think as the first patch of exynos not
>>> squeezed.
>>
>> That's not how upstream kernel development works... Your code has
>> nothing for Exynos. It's Android driver, not Exynos. If you say there is
>> something for Exynos it must be visible here. Wakelocks are not relevant
>> to Exynos, so after dropping them there would be empty stub in upstream
>> kernel which obviously cannot be accepted.
>>
>> Best regards,
>> Krzysztof
>>
>>
> 
> Well, Exynos only uses wakelocks when I see mainline because it seems no

Exynos does not use wakelocks at all. Please explain me for what
hardware feature the wakelocks are needed when you do not use Android on
Exynos? Stop mixing Exynos with Android. One is hardware, second is
operating system.

> other driver use it. That's why I thought it could be a exynos specific.
> Do you agree that if I put wakelocks into xhci platform driver?

It's not related problem. Whether it suits there, I don't know.

Best regards,
Krzysztof

