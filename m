Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35D2D69057F
	for <lists+linux-usb@lfdr.de>; Thu,  9 Feb 2023 11:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbjBIKqF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Feb 2023 05:46:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjBIKpR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Feb 2023 05:45:17 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456256951C;
        Thu,  9 Feb 2023 02:44:47 -0800 (PST)
X-UUID: c2f86d2ea86611eda06fc9ecc4dadd91-20230209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=DkedwfjcaQD4hYIWgCBqXCk7AYMg3rf0bUauXxMR93A=;
        b=fyCR0Pn2xeP2XJgvDvJo6OZk/z8ih9fPXDVshlXnon2dxYs8oP6gNVD7y2TcJ1aPgIqIqYg7Yp6aThYsJ0Yj21brmkigbHnAao9auStFw29ouOvLogrKtb/aC2QpNWO6FAZVwDW3nR1J5AHL2r3UOxZTuFcd8J/m+Aor6Q25Zoo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.19,REQID:9492656a-3a17-47f9-bb14-3a6c61f2cb83,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:45
X-CID-INFO: VERSION:1.1.19,REQID:9492656a-3a17-47f9-bb14-3a6c61f2cb83,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
        elease,TS:45
X-CID-META: VersionHash:885ddb2,CLOUDID:1364cb56-dd49-462e-a4be-2143a3ddc739,B
        ulkID:230209184443NIC7C8V2,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48|1
        02,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,C
        OL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: c2f86d2ea86611eda06fc9ecc4dadd91-20230209
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1958085959; Thu, 09 Feb 2023 18:44:42 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 9 Feb 2023 18:44:41 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 9 Feb 2023 18:44:41 +0800
Message-ID: <33b44e7c-eb2a-ae16-eb22-18adc874ee6a@mediatek.com>
Date:   Thu, 9 Feb 2023 18:44:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Content-Language: en-US
To:     Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Bear Wang <bear.wang@mediatek.com>,
        Pablo Sun <pablo.sun@mediatek.com>,
        Macpaul Lin <macpaul@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        <linux-usb@vger.kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        <yow-shin.liou@mediatek.com>, <ben.lok@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
 <0ae6a31c-9a7b-ff05-08e1-eed96e672bd9@collabora.com>
 <7851a7a2-a2bc-c460-a53a-52a8f94e3969@mediatek.com>
 <c834dc47-02f7-d6e0-60c6-ce42b3255c86@gmail.com>
From:   Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <c834dc47-02f7-d6e0-60c6-ce42b3255c86@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,T_SPF_TEMPERROR,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2/1/23 20:52, Matthias Brugger wrote:
> Hi all,
> 
> On 11/01/2023 06:37, Macpaul Lin wrote:
>>
>>
>> On 1/9/23 23:13, AngeloGioacchino Del Regno wrote:
>>> Il 05/01/23 10:28, Macpaul Lin ha scritto:
>>>> Introduce the split MT8195 laptop and iot USB configurations.
>>>> The hardware specifications for LAPTOP devices is different from IOT
>>>> devices. The major differences include some hardware constrains for
>>>> dual-role switch for USB controllers in different configurations,
>>>> especially for power management and other control flows as well.
>>>>
>>>> Here are some hardware specifiction differences listed:
>>>>    1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device 
>>>> mode).
>>>>    2. IOT devices must support multiple gadget devices and host mode.
>>>>    3. Dual-role switch is not fully supported. Only USB PORT0 support
>>>>       dual-role switch.
>>>>    4. Power management is designed in primary and secondary dominator.
>>>>       For a dual-role port, the device controller is the primary 
>>>> controller
>>>>       for power management; while the host controller is the secondary.
>>>>       LAPTOP devices should remove device nodes for avoiding abnormal
>>>>       behavior.
>>>>
>>>> This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
>>>> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
>>>>
>>>> To remove common USB configurations for mt8195.dtsi and switch includes
>>>> dtsi these new files for the boards will come in next patch.
>>>>
>>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>>
>>> I'm mostly sure that there's no reason to split the two configurations.
>>>
>>> I agree in that Tomato doesn't support gadget mode on the Type-A port 
>>> and I
>>> honestly don't currently know (and I'll test that later!) if it would 
>>> be possible
>>> to act as gadget on any of the two Type-C ports.
>>> Of course I agree on the fact that a laptop acting as a gadget may 
>>> not be useful,
>>> but that's not something that I want to judge, as someone may find a 
>>> usecase.
>>>
>>> In any case, even if Tomato does *not* support gadget mode on *any* 
>>> port at all,
>>> I wonder why we wouldn't be able to probe MTU3 (and correctly 
>>> describe the SoC)
>>> on Chromebooks but only on MT8195-based IoT boards...
>>> ...and in case there's any real issue, we can always force host mode 
>>> (with a
>>> generic  devicetree property!) on the MTU3 on Tomato.
>>
>> We are sorry it cannot be achieved by even setting "force host mode" 
>> to usb device node. At least, it cannot be done on MT8195.
>>
>> The basic reason is the power requirements for USB host on a LAPTOP 
>> are different from those on an IoT device.
>>
>> The main cause is low power management. The hardware of each device 
>> port is different on MT8195. Even the bit fields definition in 
>> registers were different.
>>
>> Some details such as sequence need to be coordinated with the SPM 
>> firmware. When a device hardware is involved in runtime PM, function 
>> like remote wakeup and other suspend/resume behavior will be abnormal 
>> for a LAPTOP device. If we split the dtsi for different devices, 
>> people can choose different configuration in SPM firmware in coreboot 
>> or in TF-A to meet the requirement. Hence we'd better not to get more 
>> messy code in Linux driver.
>>
> 
> I'm not sure I understand everything here. If the XHCI device is a child 
> of the mtu3 node then we have problems with some SPM firmware that is 
> not coordinated with the runtime PM functions of the kernel?

The behavior of runtime PM function, especially the behavior of USB 
remote wake up will be different if mtu3 node is involved, for MT8195.

> Fixing that in the device tree sounds wrong here. I think the real fix 
> would be, to fix the SPM firmware, so that it can deal with that.
> 
> Or is there more to it? If so what? In that case can we try to ignore 
> the runtime PM in the MTU3 kernel driver?
> 
> I'm not an USB expert but to me it looks very strange that we can have 
> the XHCI devices nodes as 'standalone' or as children of mtu3. We should 
> try to describe the HW as it is in DT.

After a discussion with MTU3 maintainer Chunfeng, we think there might 
be a way to give it a try to refactor the mtu3 driver.
That is to create an extra USB platform device to handle mtu3 and 
xhci-mtk as the children at the same level. Both mtu3 platform device 
xhci-mtk platform device will become the children of a common USB 
platform device. However, we are not sure if this could work and solved the
dependencies. It requires some development time and MediaTek need
to allocate some developer's resource to verify this approach.


> Regards,
> Matthias
> 
>>> Finally, if we're able to add MTU3 to Tomato boards, this means that 
>>> we won't be
>>> seeing these two DTSI files and that USB nodes are still going to all 
>>> lie in the
>>> main `mt8195.dtsi` file, without all this duplication that I'm seeing 
>>> here.
>>>
>>> What do you think?
>>>
>>> Regards,
>>> Angelo
>>>
>>
>> Thanks for the suggestion, we hope the next platform in the future 
>> could avoid this issue and reduce some duplicate dts.
>>
>> Macpaul Lin

Thanks
Macpaul Lin
