Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869083DD185
	for <lists+linux-usb@lfdr.de>; Mon,  2 Aug 2021 09:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhHBHuH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Aug 2021 03:50:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:53664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232648AbhHBHt4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 2 Aug 2021 03:49:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D120360F4B;
        Mon,  2 Aug 2021 07:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627890578;
        bh=ia4skGu22GWamVS/H0OEFzTFngi0+m5/uInJYvYY1VE=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=a+PlT9bu0sIAxt9qUC3etxg85rtItFsjKSz6Kc2LItImFVZ7Rq1LdgwgQS7shbDrG
         dJudLetoY2+pZQLIzpAQO2fyW/+mqKDBv4uZZi+etXtUhSjG9TofMfOfjwrROUwwyx
         obbC3EmR2c9mJJK9dKvTw6MCfXTOOz5pWi6Ry16q50Kc1GNmuX4rzJHR1GphNa9Hnt
         PuOufLy819zJ6CujrzAcNDIVWl6Z5Xm9PbHKhYnprvXf6rdscIvgV1iwxJNO3VhP4t
         sd6RlpKnBBljyBDOQ7uyTQtklb7iyKxeIpOJnD7Q6Dk/eK0jenN6gL2uw473o2vFss
         vUg0+N39aw4Og==
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
 <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87h7jggch0.fsf@kernel.org>
 <VI1PR04MB59354B7D5843B612D50937B589579@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <YJo5Tl7SDuv4Yu6D@kuha.fi.intel.com>
 <VI1PR04MB5935DE5731476311DE94009A89539@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87o8dhfwo8.fsf@kernel.org>
 <VI1PR04MB59351ED2E6FFEC074D9F9A2B89EF9@VI1PR04MB5935.eurprd04.prod.outlook.com>
User-agent: mu4e 1.6.0; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Jun Li <jun.li@nxp.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Date:   Mon, 02 Aug 2021 10:49:04 +0300
In-reply-to: <VI1PR04MB59351ED2E6FFEC074D9F9A2B89EF9@VI1PR04MB5935.eurprd04.prod.outlook.com>
Message-ID: <87czqws2up.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Jun Li <jun.li@nxp.com> writes:
>> Jun Li <jun.li@nxp.com> writes:
>> >> > > > Good suggestion, but if extcon notifier listener can't work for
>> >> > > > me, my understanding is this *teach* in glue layer driver still
>> >> > > > need access
>> >> > > > dwc3 core instance struct, right?
>> >> > >
>> >> > > for now, maybe. But it may be better to implement a notifier
>> >> > > method in role switch class.
>> >> >
>> >> > I am not sure if introduce notifier in role switch class is a good
>> >> > idea, I had the impression extcon is not encouraged to use if possible.
>> >>
>> >> I'm not against role switch notifiers. They were proposed before
>> >> already couple of years ago, but at that time there just were no
>> >> users them notifier, so the patch was just dropped from the series [1].
>> >> But I don't think anybody was against the idea. Please feel free to
>> >> add them to the class if you have use for them.
>> >
>> > So I had the incorrect impression.
>> >
>> > Yes, that's the Felipe was referring to, I think.
>> >
>> > I will pick up [1] and improve my driver as Felipe suggested.
>> 
>> sounds great, thahnks Li Jun
>
> Got chance to check this, but it turns out this glue driver
> still has to be care of the dwc3 core and its probe completion,
> because the role switch class is created by dwc3 core in its
> probe.
>
> dev_pm_set_dedicated_wake_irq() is a good solution for case
> a sperate/glue driver is not required, in my imx8mp case, I
> need a glue driver anyway, so this seems can't make my driver
> much simpler. Rough change please see below:  
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index 9f7c7f587d38..bcb63bcf27be 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -874,7 +874,6 @@ usb3_0: usb@32f10100 {
>  			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
>  				 <&clk IMX8MP_CLK_USB_ROOT>;
>  			clock-names = "hsio", "suspend";
> -			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
> @@ -891,7 +890,9 @@ usb_dwc3_0: usb@38100000 {
>  				assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
>  				assigned-clock-rates = <500000000>;
> -				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +							<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "irq", "wakeup";
>  				phys = <&usb3_phy0>, <&usb3_phy0>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  				snps,dis-u2-freeclk-exists-quirk;
> @@ -915,7 +916,6 @@ usb3_1: usb@32f10108 {
>  			clocks = <&clk IMX8MP_CLK_HSIO_ROOT>,
>  				 <&clk IMX8MP_CLK_USB_ROOT>;
>  			clock-names = "hsio", "suspend";
> -			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
>  			dma-ranges = <0x40000000 0x40000000 0xc0000000>;
> @@ -932,7 +932,9 @@ usb_dwc3_1: usb@38200000 {
>  				assigned-clocks = <&clk IMX8MP_CLK_HSIO_AXI>;
>  				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_500M>;
>  				assigned-clock-rates = <500000000>;
> -				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +							<GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-names = "irq", "wakeup";
>  				phys = <&usb3_phy1>, <&usb3_phy1>;
>  				phy-names = "usb2-phy", "usb3-phy";
>  				snps,dis-u2-freeclk-exists-quirk;
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index b6871ee5e8ca..4dac7cd98a31 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1615,6 +1615,12 @@ static int dwc3_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	dwc->wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
> +	if (dwc->wakeup_irq == -EPROBE_DEFER)
> +		goto assert_reset;
> +	else
> +		dev_err(dwc->dev, "the wakeup irq No. is %d\n", dwc->wakeup_irq);

why is this an error?

-- 
balbi
