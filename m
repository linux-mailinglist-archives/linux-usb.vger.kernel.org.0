Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDD22B4A4E
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 17:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729795AbgKPQHl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 11:07:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbgKPQHl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Nov 2020 11:07:41 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA43BC0613CF
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 08:07:40 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f20so25183715ejz.4
        for <linux-usb@vger.kernel.org>; Mon, 16 Nov 2020 08:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8dpEnSlFlWYbP7x6fMlJnz9EZT4+x6lyJMRgAnR9Ya4=;
        b=F0UYXh68NyUqlfHt7dvr1w+ZAfaJVSKUo28fO9Wnyf5f3PZ9a7FjGo4YWXNZ8/KvHs
         B4qnkH+h0WqMlANUd9eqgDXSXgefGpljFlC6Ja3P115Wmcwm0N/7Uyal5ZHL4B7TMvid
         LaTIhwspJQVVO4PyolplaXOUrXqvuw3g5GUVainQ5wNQWXmLHmdZAM4edCurtzF6Ezr4
         XPLsS9FzcLGEtR0s+9T3xqRhucIzIhXiPjFfV2Z9rgNGh52YojJMgCewU1EE63oCdsKB
         vqHB7Koyw1p7h+LMWRb4Vs0iDuQQGg5qkt1fAVeerZQisVAFPNByC2dSIBPd5r8CP47s
         mVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8dpEnSlFlWYbP7x6fMlJnz9EZT4+x6lyJMRgAnR9Ya4=;
        b=GlVmAsIGmuvDDJuyvr8chzThcKnKk6t4SE7Kr4mSqtAmCn7FgEFzHrtlDxESIJrsAV
         +V8EjNeSf7DfEApTynBN14piv13zXCF0wIVl3JIn8dlk2ATVYiFkuPLUpnxk8BhSVzkF
         TOkn+TyIRXIbzfj8LahSaVdo5P2AsTIsPrnQdg2mIpYqT0Qw+uxkg0L2GDqbBbtxe+JI
         B7mJn9tBQ8Rf15CVJVS1Gd7f0uRntern/cFYACm5OAPfTqAleXQfM9QGzsfBvhAGjkZY
         Y1CmmVS1upfgkvPi+E3P5kxgMW+9+7AKl0vwu8LGuRINf0aG6DRQm8d5pnCzZlaMCXfI
         pDIg==
X-Gm-Message-State: AOAM532Lzk1yh46ZvsuGLSigB/X5eL9+icWh0EnthLWLby3HoYp8Fhia
        c7YKgR2nsFALnzeOrczecBY=
X-Google-Smtp-Source: ABdhPJyiJwv9kqgM4+Hd+k+Xzf7xsYEmt1eFg0Awdg9NIJpD9XT1UMzbirYygdI9cePYUUmTqqmhSQ==
X-Received: by 2002:a17:906:1989:: with SMTP id g9mr14286464ejd.62.1605542859466;
        Mon, 16 Nov 2020 08:07:39 -0800 (PST)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id a9sm11055104eds.50.2020.11.16.08.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2020 08:07:38 -0800 (PST)
Subject: Re: [PATCH 3/4] arm64: dts: rockchip: add rk3328 usb3 and usb3phy
 nodes
To:     Peter Geis <pgwipeout@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     frank.wang@rock-chips.com, zyw@rock-chips.com,
        linux-usb@vger.kernel.org, kever.yang@rock-chips.com,
        linux-rockchip@lists.infradead.org, william.wu@rock-chips.com,
        wulf@rock-chips.com, linux-arm-kernel@lists.infradead.org
References: <20201116151735.178737-1-pgwipeout@gmail.com>
 <20201116151735.178737-4-pgwipeout@gmail.com>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <ce2217b9-3627-df09-04d9-e47bef6c3572@gmail.com>
Date:   Mon, 16 Nov 2020 17:07:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201116151735.178737-4-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

Just some comments...

The compatible "rockchip,rk3328-dwc3" is currently under test in:

https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git/

I think we should let it go in mainline first
(if the maintainers agree?) and then you can base your serie on that.

The compatible "rockchip,rk3328-usb3phy" needs to be added to a document
as well.

Add increase version number after previous series.

Is there any change in code or on how you detect?

On 11/16/20 4:17 PM, Peter Geis wrote:
> Add the usb3 controller and usb3 phy nodes to the rk3328.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 65 ++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index bbdb19a3e85d..9fea9203d114 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -853,6 +853,40 @@ u2phy_host: host-port {
>  		};
>  	};
>  
> +	usb3phy: usb3-phy@ff470000 {
> +		compatible = "rockchip,rk3328-usb3phy";
> +		reg = <0x0 0xff460000 0x0 0x10000>;
> +		clocks = <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
> +		clock-names = "usb3phy-otg", "usb3phy-pipe";
> +		resets = <&cru SRST_USB3PHY_U2>,
> +			 <&cru SRST_USB3PHY_U3>,
> +			 <&cru SRST_USB3PHY_PIPE>,
> +			 <&cru SRST_USB3OTG_UTMI>,
> +			 <&cru SRST_USB3PHY_OTG_P>,
> +			 <&cru SRST_USB3PHY_PIPE_P>;
> +		reset-names = "usb3phy-u2-por", "usb3phy-u3-por",
> +			      "usb3phy-pipe-mac", "usb3phy-utmi-mac",
> +			      "usb3phy-utmi-apb", "usb3phy-pipe-apb";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		status = "disabled";
> +
> +		usb3phy_utmi: utmi@ff470000 {
> +			compatible = "rockchip,rk3328-usb3phy-utmi";
> +			reg = <0x0 0xff470000 0x0 0x8000>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		usb3phy_pipe: pipe@ff478000 {
> +			compatible = "rockchip,rk3328-usb3phy-pipe";
> +			reg = <0x0 0xff478000 0x0 0x8000>;
> +			#phy-cells = <0>;
> +			status = "disabled";
> +		};
> +	};
> +
>  	sdmmc: mmc@ff500000 {
>  		compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
>  		reg = <0x0 0xff500000 0x0 0x4000>;
> @@ -983,6 +1017,37 @@ usb_host0_ohci: usb@ff5d0000 {
>  		status = "disabled";
>  	};
>  
> +       usbdrd3: usb@ff600000 {
> +		compatible = "rockchip,rk3328-dwc3";
> +		clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> +			 <&cru SCLK_USB3OTG_SUSPEND>;
> +		clock-names = "ref", "bus_early", "suspend";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		status = "disabled";
> +
> +		usbdrd_dwc3: dwc3@ff600000 {
> +			compatible = "snps,dwc3";
> +			reg = <0x0 0xff600000 0x0 0x100000>;
> +			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru SCLK_USB3OTG_REF>, <&cru ACLK_USB3OTG>,
> +				 <&cru SCLK_USB3OTG_SUSPEND>;
> +			clock-names = "ref", "bus_early", "suspend";
> +			dr_mode = "host";
> +			usb-phy = <&usb3phy_utmi>, <&usb3phy_pipe>;
> +			phy_type = "utmi_wide";
> +			snps,dis_enblslpm_quirk;
> +			snps,dis-u2-freeclk-exists-quirk;
> +			snps,dis_u2_susphy_quirk;
> +			snps,dis_u3_susphy_quirk;
> +			snps,dis-del-phy-power-chg-quirk;
> +			snps,dis-tx-ipgap-linecheck-quirk;
> +			snps,xhci-trb-ent-quirk;
> +			status = "disabled";
> +		};
> +	};
> +
>  	gic: interrupt-controller@ff811000 {
>  		compatible = "arm,gic-400";
>  		#interrupt-cells = <3>;
> 

