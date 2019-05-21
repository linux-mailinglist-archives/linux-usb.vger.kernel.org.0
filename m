Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74053247C8
	for <lists+linux-usb@lfdr.de>; Tue, 21 May 2019 08:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727867AbfEUGI0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 May 2019 02:08:26 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:11432 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725885AbfEUGIW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 May 2019 02:08:22 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ce395d70000>; Mon, 20 May 2019 23:08:23 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 20 May 2019 23:08:21 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 20 May 2019 23:08:21 -0700
Received: from [10.19.108.117] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 May
 2019 06:08:19 +0000
Subject: Re: [Patch V3 5/8] arm64: tegra: Add xudc node for Tegra210
To:     Nagarjuna Kristam <nkristam@nvidia.com>, <balbi@kernel.org>,
        <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mark.rutland@arm.com>,
        <robh+dt@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <1557988772-15406-1-git-send-email-nkristam@nvidia.com>
 <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
From:   JC Kuo <jckuo@nvidia.com>
Message-ID: <9a2f3c3f-1010-8390-26b4-4e2129879a2e@nvidia.com>
Date:   Tue, 21 May 2019 14:08:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557988772-15406-6-git-send-email-nkristam@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558418903; bh=jB2F7CpPLqJoP3h+uRcRuTAavPJYRjygQVt4pTWGiC4=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=cugZYLcHlNRgjlsWn3HfqEeVzRmKRFKM5Gfba8c88ltVTyObQ+7skZ5+hCLnho3lY
         ICdBaLTNR/pwm/UsvCdX0Mx1vAJoiY4rZlPxvF7aikNuJ7GLmrIDyQ/9mPT6cIXDGg
         DjZ5mSZt9Yb4raIriWhLNFpp40x/H/rlKp9ueKZ2c5a1geUL7U0g98ybk62jKfqu7c
         hz1ENH8rPujqCQFOlSuaacxaZcpTJQZPaS90tCtkvqKuf6h7o9snlB+5tD8P5zhsua
         jDeaMNMOePVm9ytRyhdZRKRvJ1WFnuMfhiOJySwuUcz9GBHBQ+IMjNNsdFfSPThQZC
         9egbOOgmgldiA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Reviewed-by: JC Kuo <jckuo@nvidia.com>

Thanks,

JC

On 5/16/19 2:39 PM, Nagarjuna Kristam wrote:
> Tegra210 has one XUSB device mode controller, which can be operated
> HS and SS modes. Add DT support for XUSB device mode controller.
>
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index a550c0a..edef00b 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -1184,6 +1184,25 @@
>   		status = "disabled";
>   	};
>   
> +	xudc@700d0000 {
> +		compatible = "nvidia,tegra210-xudc";
> +		reg = <0x0 0x700d0000 0x0 0x8000>,
> +			<0x0 0x700d8000 0x0 0x1000>,
> +			<0x0 0x700d9000 0x0 0x1000>;
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&tegra_car TEGRA210_CLK_XUSB_DEV>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SS>,
> +			<&tegra_car TEGRA210_CLK_XUSB_SSP_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_HS_SRC>,
> +			<&tegra_car TEGRA210_CLK_XUSB_FS_SRC>;
> +		clock-names = "dev", "ss", "ss_src",
> +			      "hs_src", "fs_src";
> +		power-domains = <&pd_xusbdev>, <&pd_xusbss>;
> +		power-domain-names = "dev", "ss";
> +		nvidia,xusb-padctl = <&padctl>;
> +		status = "disabled";
> +	};
> +
>   	mipi: mipi@700e3000 {
>   		compatible = "nvidia,tegra210-mipi";
>   		reg = <0x0 0x700e3000 0x0 0x100>;
