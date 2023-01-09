Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 69F356629A3
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 16:16:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbjAIPP3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 10:15:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237040AbjAIPOv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 10:14:51 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E244414D05;
        Mon,  9 Jan 2023 07:13:57 -0800 (PST)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id C78DE660036F;
        Mon,  9 Jan 2023 15:13:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1673277236;
        bh=OeYfEBPCu7fJ1Kg0yM6/gC8R+9+zgNLojttt7HhxyLI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oQiqv5huad9LHUBf0CGIxLMsqCtsYrfsUR7kGCWr5AtfR3BTH20CFsO1Aj0SaNt0W
         KGkbggcMOtua5QIykkC8nkJunPbyEAX/ONUiT2oHLxYoQWEUP43jXH5sZAuLEtdTHM
         ixuY+g56jyCmHPzhgykZxkXiO1h2N01vkJZvi+ZddoMheoSwMho3smTm98K0wmPrp5
         VhgnGqdPdm80L9pOOAtrWRAXDBhCeGOe4AjMuWcEh0u0QgxOOy27sBXeEFxLbA7Omg
         kn3pIE7NaYSJfkhX3aXTi8bbZBoCvpo6A1bAwAw8CGn4+5iJfYeMz04YIvgSh0jCD+
         TAhCTxfoWqYSA==
Message-ID: <0ae6a31c-9a7b-ff05-08e1-eed96e672bd9@collabora.com>
Date:   Mon, 9 Jan 2023 16:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: Introduce MT8195 LAPTOP and
 IOT's USB configurations
Content-Language: en-US
To:     Macpaul Lin <macpaul.lin@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Bear Wang <bear.wang@mediatek.com>,
        Pablo Sun <pablo.sun@mediatek.com>,
        Macpaul Lin <macpaul@gmail.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tinghan Shen <tinghan.shen@mediatek.com>,
        Rex-BC Chen <rex-bc.chen@mediatek.com>,
        Chen-Yu Tsai <wenst@chromium.org>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230105092809.14214-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il 05/01/23 10:28, Macpaul Lin ha scritto:
> Introduce the split MT8195 laptop and iot USB configurations.
> The hardware specifications for LAPTOP devices is different from IOT
> devices. The major differences include some hardware constrains for
> dual-role switch for USB controllers in different configurations,
> especially for power management and other control flows as well.
> 
> Here are some hardware specifiction differences listed:
>    1. LAPTOP (Cherry Tomato boards) don't support USB gadget (device mode).
>    2. IOT devices must support multiple gadget devices and host mode.
>    3. Dual-role switch is not fully supported. Only USB PORT0 support
>       dual-role switch.
>    4. Power management is designed in primary and secondary dominator.
>       For a dual-role port, the device controller is the primary controller
>       for power management; while the host controller is the secondary.
>       LAPTOP devices should remove device nodes for avoiding abnormal
>       behavior.
> 
> This modifcation is to add USB configurations "mt8195-laptop-usb.dtsi"
> for LAPTOP devices, and add "mt8195-iot-usb.dtsi" for IOT devices.
> 
> To remove common USB configurations for mt8195.dtsi and switch includes
> dtsi these new files for the boards will come in next patch.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

I'm mostly sure that there's no reason to split the two configurations.

I agree in that Tomato doesn't support gadget mode on the Type-A port and I
honestly don't currently know (and I'll test that later!) if it would be possible
to act as gadget on any of the two Type-C ports.
Of course I agree on the fact that a laptop acting as a gadget may not be useful,
but that's not something that I want to judge, as someone may find a usecase.

In any case, even if Tomato does *not* support gadget mode on *any* port at all,
I wonder why we wouldn't be able to probe MTU3 (and correctly describe the SoC)
on Chromebooks but only on MT8195-based IoT boards...
...and in case there's any real issue, we can always force host mode (with a
generic  devicetree property!) on the MTU3 on Tomato.

Finally, if we're able to add MTU3 to Tomato boards, this means that we won't be
seeing these two DTSI files and that USB nodes are still going to all lie in the
main `mt8195.dtsi` file, without all this duplication that I'm seeing here.

What do you think?

Regards,
Angelo

