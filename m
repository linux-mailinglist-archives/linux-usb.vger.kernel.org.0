Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 162EF109E95
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2019 14:11:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbfKZNLY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Nov 2019 08:11:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:55413 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfKZNLX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Nov 2019 08:11:23 -0500
Received: by mail-wm1-f67.google.com with SMTP id b11so3134616wmb.5
        for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2019 05:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ugdp2jc0hj8kY9mNz4QotGpRxRC1rc0epA2aupuKJkc=;
        b=mILUIurVcLLmOJC4mJjnLc4K3R4Gtx/XLmXvbaVBtOb7SC+E2vnuukb5m3Vxe7bSPN
         DRiregu/mFtJfnKekW5iIORQaeXdzYRzUrGSagV/EYUke6PKWQtDCs7UIA21N7m/HuuF
         sWJ+fsw1RbIoKvim0f24axSEFUNzCSbg04EGE7DxodbAEEtUuz1VBKWk1qFJSCqWZVoV
         SFobUvuLuddBunIlYnoYsRLJZyvji7FO4jM7eEGzUSIiT1JrO8y6RuEnwpBsNPBqSTS7
         5MPk5zvXiYoyAexr8WKpiy7CXQ6HjapJNkyMwV7BiAsmq8vZKe1XrJl54p/YcnAj19pP
         K+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=Ugdp2jc0hj8kY9mNz4QotGpRxRC1rc0epA2aupuKJkc=;
        b=lUwNYWFxGvful6H9f1a1YbYUsAL6TIyRk6EuulmUTBHUnw0+XGLgqHE2amREsK+QZL
         a0g5yZ0TaP5AJv29Tq65c0Qd4DcbV3iFl7pewW1H3+ue18yD2cK/SJVnMnUiPjTQWKnF
         WD+2WikwTumJ3S1n/KZz3NqP1yBUp5Vk6YobJpUbi9r9uU7N0ZsI80CizPpbZLTzPxKB
         OBp0abt0Dlu5VM0imXbO3lza7Wb5TNYQkQvA1qXtWwLd/muTZZl9iYLN1AiIOoowDVIZ
         EMUsYH5nj+IImltsOUjQA7o27y+PC+M6ZglnyORwaek9kD6ZhD8veXrj6r0gcRnpqh7P
         FhhQ==
X-Gm-Message-State: APjAAAWk9aq7ve4F6FDptLcm/2PyJKvgM8Bz3WmRyHlGmLMO1Mx8lfmC
        N//6HCyVXGI5qVfto7AR9tyi4A==
X-Google-Smtp-Source: APXvYqyGzsSieidOv3KRzauV1VUcHtNkcUtf6gAhDqg4GANFtHZ2XfOuiiBCYWfeP+/hT8oNpZ+nNA==
X-Received: by 2002:a7b:c757:: with SMTP id w23mr2383458wmk.63.1574773879727;
        Tue, 26 Nov 2019 05:11:19 -0800 (PST)
Received: from [172.20.10.8] ([37.165.69.200])
        by smtp.gmail.com with ESMTPSA id r2sm3148119wma.44.2019.11.26.05.11.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Nov 2019 05:11:19 -0800 (PST)
Subject: Re: [PATCH 0/6] arm64: meson: Add support for USB on Amlogic A1
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hanjie Lin <hanjie.lin@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Kevin Hilman <khilman@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Yue Wang <yue.wang@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1574405757-76184-1-git-send-email-hanjie.lin@amlogic.com>
 <CAFBinCDA=ZekRC0hgQnPLRZM3LMnqBZ6TWCvXhyixAmgDyTAsw@mail.gmail.com>
 <5c0029ec-7377-4c1a-0062-3b59a87f8dea@amlogic.com>
 <CAFBinCBypbB4W42GOAc8ejAYHVQLTDRdat_z_L92TZvC2p+5rQ@mail.gmail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <272a7442-38b3-346c-4749-2b163464bd01@baylibre.com>
Date:   Tue, 26 Nov 2019 14:11:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBypbB4W42GOAc8ejAYHVQLTDRdat_z_L92TZvC2p+5rQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 25/11/2019 23:02, Martin Blumenstingl wrote:
> Hi Hanjie,
> 
> On Mon, Nov 25, 2019 at 8:53 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>
>>
>>
>> On 2019/11/22 15:52, Martin Blumenstingl wrote:
>>> Hello Hanjie,
>>>
>>> On Fri, Nov 22, 2019 at 7:55 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
>>> [...]
>>>>   dt-bindings: phy: Add Amlogic G12A USB2 PHY Bindings
>>>>   dt-bindings: usb: dwc3: Add the Amlogic A1 Family DWC3 Glue Bindings
>>>>   phy: amlogic: Add Amlogic A1 USB2 PHY Driver
>>> drivers/phy/amlogic/phy-meson-g12a-usb2.c seems very similar to the A1
>>> USB2 PHY you are introducing here.
>>>
>>>>   usb: dwc3: Add Amlogic A1 DWC3 glue
>>> drivers/usb/dwc3/dwc3-meson-g12a.c is also very similar to the dwc3 glue.
>>>
>>> I have two questions:
>>> - how is the PHY and the dwc3 glue different from G12A (or SM1)?
>>> - why do we need a separate set of new drivers (instead of updating
>>> the existing drivers)?
>>>
>>> We try to use one driver for the same IP block, even if there are
>>> several revisions with small differences (for example the SAR ADC
>>> driver supports all SoC generations from Meson8 to G12A/G12B/SM1,
>>> because 80-90% of the code is shared across all revisions).
>>>
>>>
>>> Martin
>>>
>>> .
>>>
>>
>> Hi Martin,
>>
>> thanks for the comment.
>>
>> 1, G12A have usb2-phy0/usb2-phy1/usb3-phy0 three phys and an interrupt to support host/peripheral/otg modes.
>>    A1 has one usb2-phy0 phy and only support host mode.
> dwc3-meson-g12a treats PHYs as optional
> so if you only pass "usb2-phy0" and skip usb2-phy1/usb3-phy0 then it
> will still work fine
> (I didn't check whether the binding also reflects this)

Exact, a simple match data could make max-phys to 1 for A1.

> 
>> 2, G12A glue/phy drivers are for G12A SoCs, there are some diffrences to A1.
>>    G12A glue driver have dr_mode and interrupts two attributes to support otg mode while A1 hasn't this requirement.
> dwc3-meson-g12a ignores the interrupt for HOST-only mode
> (I didn't check whether the IRQ is optional in the dt-binding)

Interrupt support and OTG manual switch is optional and can be easily bypassed.

> 
>>    G12A glue driver has a hard coding vbus regulator code to support otg mode while A1 hasn't this requirement.
> my understanding is that whether a board has a VBUS regulator depends
> on the board design. it has nothing to do with the SoC itself
> 
>>    G12A glue driver has a hard coding support phys while A1 only supports host mode.
>>         enum {
>>                 USB2_HOST_PHY = 0,
>>                 USB2_OTG_PHY,
>>                 USB3_HOST_PHY,
>>                 PHY_COUNT,
>>                 };
> this goes together with comment #1 - you can skip USB2_OTG_PHY and
> USB3_HOST_PHY and the driver should still work fine

Exact

> 
>>    G12A glue driver only supports one clock while A1 needs four clocks.
> indeed, the dwc3-meson-g12a needs to be updated to support this
> I don't think that I have used it myself yet but there's the
> clk_bulk_data framework
> it seems to fit this use-case pretty well: define an arbitrary number
> of clocks for G12A/B an another set of clocks for A1 - then use the
> clk_bulk_data framework to enable/disable them all at once

Exact, a simple conversion to clk_bulk_* would be enough

> 
>>    G12A and A1 phy drivers have different register configurations since hardware differences.
> other drivers have similar requirements: (mostly) identical register
> layout but different values per SoC
> here are two examples (I'm not sure if they are good examples though):
> Lantiq/Intel SoC [0] and Allwinner SoCs [1]
> 
> I compared your driver with phy-meson-g12a-usb2 and only found four differences:
> 1) PHY_CTRL_R18_MPLL_DCO_CLK_SEL is set for A1
> 2) PHY_CTRL_R13_UPDATE_PMA_SIGNALS is not set for A1
> 3) PHY_CTRL_R21 is updated twice for A1 (once for earlier gen SoCs)
> 4) A1 doesn't reference the "xtal" clock
> 
> Difference 4) seems to be a general problem because there seems to be
> a PLL inside the PHY registers and that PLL must be fed by some input
> clock
> So I believe that there is some clock input (which is currently
> missing from your A1 USB2 PHY driver)

These differences are trivial to add with a match data structure.

> 
>> 3, We have estimated these differences and we thought it's more clear and readable to have a dedicated glue/phy
>>    driver for A1 SoCs, so also dedicated dt-bindings.
> I think we should separate the driver and dt-bindings
> 
> Based on what I have seen so far my preference for the PHY is:
> - use the existing dt-binding, because it seems to be the same IP
> block with different register configuration
> - use the existing driver because there are only three different
> register values (to me it feels like a dedicated driver for these
> means more overhead for little benefit)
> 
> for the glue I think:
> - extend the existing dt-bindings and make some of the PHYs and the
> interrupt line optional. making the PHYs optional will be needed when
> adding GXL/GXM/AXG support anyways
> - use the existing driver and make the clock inputs depend on the SoC
> - everything else should already work as is
> 
> please let me know if I missed something:
> comparing/reviewing the new and existing drivers is harder than just
> copying the existing one and modifying that copy
> (this is one of the reasons why I think that duplicating code makes
> the drivers harder to maintain)
> 
> I also thought about the negative consequences of extending the
> existing driver(s).
> modifying the existing code could break the driver for existing boards.
> however, I think that is not a problem because BayLibre's Kernel CI
> labs have good coverage for G12A, G12B and SM1.
> so if you add some A1 boards there (or host your own lab with A1
> boards) any breakage will be found early (the Kernel CI bot even does
> git bisect and sends emails)
The overall architecture is the same since the GXL SoCs, we also plan to
move the GXL/GXM USB complex into the G12A usb-ctrl driver because the architecture
is very similar.

For A1, the changes will be quite minimal, please try and post a RFC version so we
can evaluate.

Thanks,

Neil

> 
> 
> Martin
> 
> 
> [0] https://github.com/torvalds/linux/blob/d2912cb15bdda8ba4a5dd73396ad62641af2f520/drivers/phy/lantiq/phy-lantiq-rcu-usb2.c#L47
> [1] https://github.com/torvalds/linux/blob/c942fddf8793b2013be8c901b47d0a8dc02bf99f/drivers/phy/allwinner/phy-sun4i-usb.c#L862
> 

