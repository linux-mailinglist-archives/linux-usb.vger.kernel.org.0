Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80596653F4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Jan 2023 06:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235391AbjAKFoL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Jan 2023 00:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbjAKFnk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Jan 2023 00:43:40 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3A48262B;
        Tue, 10 Jan 2023 21:41:18 -0800 (PST)
X-UUID: 8df0620e917211eda06fc9ecc4dadd91-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=iSRMa3URb6no/Wd7CjkH5X93Fu9KW1GnRk2pSZR1Mr0=;
        b=ePZsRTtO7y9a1Fy2XjBM7NjRXNsaxYTY/jIl2BU7FV31xgjskLleRGdAXeT3enkISpXhZeu/U6q4K0W6kw4bEnFDk91DVu0AKRvPUJdOp6os+JurLRIvEPXL8nmUEaAmC1ZvUyG7rdknuvOcrE44C4zBPUa9s0ang59kdJunqW8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:0550e88a-fcce-43b8-b394-7f27a3e12a82,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION
        :release,TS:45
X-CID-INFO: VERSION:1.1.17,REQID:0550e88a-fcce-43b8-b394-7f27a3e12a82,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
        elease,TS:45
X-CID-META: VersionHash:543e81c,CLOUDID:736779f5-ff42-4fb0-b929-626456a83c14,B
        ulkID:230111134112683MJ67Y,BulkQuantity:0,Recheck:0,SF:38|28|17|19|48|102,
        TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:
        0,OSI:0,OSA:0
X-CID-APTURL: Status:success,Category:nil,Trust:0,Unknown:0,Malicious:0
X-CID-BVR: 0,NGT
X-UUID: 8df0620e917211eda06fc9ecc4dadd91-20230111
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <macpaul.lin@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1391024548; Wed, 11 Jan 2023 13:41:11 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 13:41:09 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 11 Jan 2023 13:41:09 +0800
Message-ID: <add7a0ed-b676-142f-dea4-3a024a85a72c@mediatek.com>
Date:   Wed, 11 Jan 2023 13:41:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: enable USB device port for
 mt8195-demo board
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
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
 <20230105092809.14214-3-macpaul.lin@mediatek.com>
 <fb2a4f7d-f35a-2c48-ad31-3138a4fae247@linaro.org>
From:   Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <fb2a4f7d-f35a-2c48-ad31-3138a4fae247@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 1/6/23 20:56, Krzysztof Kozlowski wrote:
> On 05/01/2023 10:28, Macpaul Lin wrote:
>> 1. Enable USB device port (USB port0).
>> 2. Enable u2 speed for other USB HOST (USB port1/2/3).
>> 3. Configure mt6360 (TYPEC) related pinctrls.
>>
>> Note: Full dual-role switch capability requires TYPEC MUX driver and dts
>> update will be send in separate patches.
>>
>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 51 ++++++++++++++++++++
>>   1 file changed, 51 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> index 07a864cb8b54..207bb5f4c58f 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>> @@ -12,6 +12,7 @@
>>   #include <dt-bindings/input/input.h>
>>   #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
>>   #include <dt-bindings/regulator/mediatek,mt6360-regulator.h>
>> +#include <dt-bindings/usb/pd.h>
>>   
>>   / {
>>   	model = "MediaTek MT8195 demo board";
>> @@ -380,6 +381,22 @@
>>   		};
>>   	};
>>   
>> +	mt6360_pins: mt6360-pins {
>> +		pins {
>> +			pinmux = <PINMUX_GPIO100__FUNC_GPIO100>,
>> +				 <PINMUX_GPIO101__FUNC_GPIO101>;
>> +			input-enable;
>> +			bias-pull-up;
>> +		};
>> +	};
>> +
>> +	u3_p0_vbus: u3_p0vbusdefault {
> 
> No underscores in node names. Also does not look correct naming. Please
> run `make dtbs_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).

Thanks for the suggest.
I'm trying to request IT to setup for the environment for supporting 
"make dtbs_check". This should be fix in next patch.

>> +		pins_cmd_dat {
> 
> Same problem.
> 

Got it.

> 
> Best regards,
> Krzysztof
> 

Thanks!
Macpaul Lin
