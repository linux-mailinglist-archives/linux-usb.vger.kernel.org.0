Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F892686647
	for <lists+linux-usb@lfdr.de>; Wed,  1 Feb 2023 13:52:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbjBAMwq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Feb 2023 07:52:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbjBAMwp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Feb 2023 07:52:45 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A1F47096;
        Wed,  1 Feb 2023 04:52:42 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id hx15so31578949ejc.11;
        Wed, 01 Feb 2023 04:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s73ifM/SGJg1qWbb1F0qGdO4iVeRR4zkqzeI/0R0Puw=;
        b=f6DK+bZhL+XeyPDJMXKNl+cQLLt+ITGl2bvjR+uAQva8eH/MW4ccF2RBviJ3pr13lg
         XKMdz8aSkzbPWjIoMHSXrrBI7ZAuSbnKCx/B4uZ6GxmzBMrSKowQ3vSegozchswOKeH4
         9ESaDVsZ9FMT6edFyi4AyVjPnRgLj27xT6SAihfLOm8NzSxEDVDHM8eyUBzUcKNmwVlK
         8Q53G5jBXRKgqxIC3S7DiPSJ1lAY5Ec9bDB8JyFZhVaCsOev3ltYkrC33TSFz197e/Qd
         jDkcEYtqqp10QL0xoPJAqdaOclalYuNWPYZYhR9/CUM9/uuBmrBcondYqCp7QfFncYnQ
         yx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s73ifM/SGJg1qWbb1F0qGdO4iVeRR4zkqzeI/0R0Puw=;
        b=Gy5Jg2lfxGf19WyJyeLAH+qivmYwvEgnpU1It1Qkhek/XY9KLCVCYmrmhiAiK+QhlF
         QKGxsAO2vv5tb/d/DF3EiJBxmotVVQRAuouwEWFacih7zmlhlljzV63AxV/B7fT9T+T2
         27MtcgDMQHyVrksj/0Qq0GWK/nrNM9zwha2UZrH/Th9lMdH29Apug31fgBvJnImn0wqt
         TQSWZEkm3QwtRDe/3Csh1SJMW2tNtoYIGR46nmE6+B1LzZM6YGEJOdSwfLYBjORtCEbE
         eZfcSzBgkrTkz9vkFr0V04b1jO6ZJ5MDEV7rkxFNOsBZQ8VQH9yKZknLn41yJs+n/Gsy
         +HKg==
X-Gm-Message-State: AO0yUKV2AoyYx3YH+1j63sqnOc0BIfc2jbYUxxrm4umWtyUJJHduLo+6
        gYwNHY3eeRmUZit38yFKPYqQwKibsNk=
X-Google-Smtp-Source: AK7set8awN7Y3MaxfDGrUB6gIljlgp01+QdcLh12MEzoApuKmBvKlYENrQt6Rz0EOFT2k/2fZU9i1Q==
X-Received: by 2002:a17:906:4c86:b0:87c:81ec:4cc with SMTP id q6-20020a1709064c8600b0087c81ec04ccmr2392941eju.55.1675255960860;
        Wed, 01 Feb 2023 04:52:40 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m21-20020a1709062b9500b0086621d9d9b0sm9919484ejg.81.2023.02.01.04.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 04:52:40 -0800 (PST)
Message-ID: <c834dc47-02f7-d6e0-60c6-ce42b3255c86@gmail.com>
Date:   Wed, 1 Feb 2023 13:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To:     Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bear Wang <bear.wang@mediatek.com>,
        Pablo Sun <pablo.sun@mediatek.com>,
        Macpaul Lin <macpaul@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>, yow-shin.liou@mediatek.com,
        ben.lok@mediatek.com
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <0ae6a31c-9a7b-ff05-08e1-eed96e672bd9@collabora.com>
 <7851a7a2-a2bc-c460-a53a-52a8f94e3969@mediatek.com>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
In-Reply-To: <7851a7a2-a2bc-c460-a53a-52a8f94e3969@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

On 11/01/2023 06:37, Macpaul Lin wrote:
> 
> 
> On 1/9/23 23:13, AngeloGioacchino Del Regno wrote:
>> Il 05/01/23 10:28, Macpaul Lin ha scritto:
>>> Introduce the split MT8195 laptop and iot USB configurations.
>>> The hardware specifications for LAPTOP devices is different from IOT
>>> devices. The major differences include some hardware constrains for
>>> dual-role switch for USB controllers in different configurations,
>>> especially for power management and other control flows as well.
>>>
>>> Here are some hardware specifiction differences listed:
>>>    1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device mode).
>>>    2. IOT devices must support multiple gadget devices and host mode.
>>>    3. Dual-role switch is not fully supported. Only USB PORT0 support
>>>       dual-role switch.
>>>    4. Power management is designed in primary and secondary dominator.
>>>       For a dual-role port, the device controller is the primary controller
>>>       for power management; while the host controller is the secondary.
>>>       LAPTOP devices should remove device nodes for avoiding abnormal
>>>       behavior.
>>>
>>> This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
>>> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
>>>
>>> To remove common USB configurations for mt8195.dtsi and switch includes
>>> dtsi these new files for the boards will come in next patch.
>>>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>
>> I'm mostly sure that there's no reason to split the two configurations.
>>
>> I agree in that Tomato doesn't support gadget mode on the Type-A port and I
>> honestly don't currently know (and I'll test that later!) if it would be possible
>> to act as gadget on any of the two Type-C ports.
>> Of course I agree on the fact that a laptop acting as a gadget may not be useful,
>> but that's not something that I want to judge, as someone may find a usecase.
>>
>> In any case, even if Tomato does *not* support gadget mode on *any* port at all,
>> I wonder why we wouldn't be able to probe MTU3 (and correctly describe the SoC)
>> on Chromebooks but only on MT8195-based IoT boards...
>> ...and in case there's any real issue, we can always force host mode (with a
>> generic  devicetree property!) on the MTU3 on Tomato.
> 
> We are sorry it cannot be achieved by even setting "force host mode" to usb 
> device node. At least, it cannot be done on MT8195.
> 
> The basic reason is the power requirements for USB host on a LAPTOP are 
> different from those on an IoT device.
> 
> The main cause is low power management. The hardware of each device port is 
> different on MT8195. Even the bit fields definition in registers were different.
> 
> Some details such as sequence need to be coordinated with the SPM firmware. When 
> a device hardware is involved in runtime PM, function like remote wakeup and 
> other suspend/resume behavior will be abnormal for a LAPTOP device. If we split 
> the dtsi for different devices, people can choose different configuration in SPM 
> firmware in coreboot or in TF-A to meet the requirement. Hence we'd better not 
> to get more messy code in Linux driver.
> 

I'm not sure I understand everything here. If the XHCI device is a child of the 
mtu3 node then we have problems with some SPM firmware that is not coordinated 
with the runtime PM functions of the kernel?

Fixing that in the device tree sounds wrong here. I think the real fix would be, 
to fix the SPM firmware, so that it can deal with that.

Or is there more to it? If so what? In that case can we try to ignore the 
runtime PM in the MTU3 kernel driver?

I'm not an USB expert but to me it looks very strange that we can have the XHCI 
devices nodes as 'standalone' or as children of mtu3. We should try to describe 
the HW as it is in DT.

Regards,
Matthias

>> Finally, if we're able to add MTU3 to Tomato boards, this means that we won't be
>> seeing these two DTSI files and that USB nodes are still going to all lie in the
>> main `mt8195.dtsi` file, without all this duplication that I'm seeing here.
>>
>> What do you think?
>>
>> Regards,
>> Angelo
>>
> 
> Thanks for the suggestion, we hope the next platform in the future could avoid 
> this issue and reduce some duplicate dts.
> 
> Macpaul Lin
