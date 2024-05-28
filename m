Return-Path: <linux-usb+bounces-10634-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58268D1BB3
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 14:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B73B2854ED
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 12:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97AD16D9BA;
	Tue, 28 May 2024 12:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfnDEyPu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C3C16D4F8
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 12:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716900797; cv=none; b=twe5NDJ7jTOKW/93yMnTcOBKp29Kq/HiT+rLKtUfvR55KnTApe8HuXW0P2WWQrBVDLeZTiEFAvFWqMrxw2FMEB2Yz72jPsYU0Ox5zOnH7cWONb45wOCYR28n8b1VK/9kLU08YSfYBj/D8D9jM+Y7YlOqnNvPFBpwLegumYjvC+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716900797; c=relaxed/simple;
	bh=nmYSDivuU1fGiaHNtpmlfGXSTR8QMXOhtvK7Fro/hPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGNJlu1i7Xbe27r//GQX+BtZ/s21vPMLqPw7W6FstJWKje2bybcIA8guQRkwoGr7BcYzuq4MVMkvbMFrP79X5ad6DJyy/E7jJSWrydZG6kAK6dKLVjj7hpBTz/gfe9ppnj5U3D3ZXyrKGh1arC6ftN4EcWgYG/8RdqoPPA6yq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wfnDEyPu; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-529b79609cbso1372392e87.3
        for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716900794; x=1717505594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IhfLeEz31nnpbep1wtfE79deZVn4RTMnQcliKUfwmsk=;
        b=wfnDEyPuX2cffwaxTSNsjQBE5A09Ff0g1vx+EfuWWMJzCNm86zQ5MjkZdrtVi9YisN
         Y78RWXKmjraKp/baA5UCC/T2V4+hOGthPHeAwt/8Zk+EeV84LBR5TtNgeX9478VXtkmp
         kJr15kbQZxVcD+JCE7GnyIJ0vLiI8IaNvkL8HXNTvLBBtlOeD8V8mu1Z3ZssBYcIwmyD
         5tPQgASLDtG0y1BAA1oFA7H7+IotPsAG8/3sWCIqu03PJXwATSKkETCV36Ptl/9WYRF5
         o8408ChVQiPpylARuPy+hg7smzJem7Nv7D+f/8nxOB7H5Ho4Fu8P0vOQDBiRkZ9lE+3t
         x47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716900794; x=1717505594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IhfLeEz31nnpbep1wtfE79deZVn4RTMnQcliKUfwmsk=;
        b=hGK1FOMdrIidTUkWp9unS6+3Ae+aD2me0xe3WFDAzdEdn1SCOvXTeYMacXjUFomPGl
         ZhZDVBJbD9KUtMAofGMbSFcwC7gJVtyX3SSyQXPFGvhp7PTAhs2mUo0Umvb4JLlmbvLt
         EjvWmKEC+5Q5fE4d3IuGGuAPzDemmRX2ksnzOnyaBtmfdjCQM+wM4tKJskjEkjDD9vbU
         IIopYVo40OH90mK3sFm7DHhEpelADl2lr0BlxDFrh7Py1mhlu1hQH2pzzC5SQ0oPM0EB
         rkWaFZgtjqAEC6qEHeuk0nJR2Cx/NVjaveBhk6Cyo062hnyn3p+UonZH56RGt1J5eYeC
         cZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzsrlLX0OMeOVFD3LhJqum8KD2ZAmmfumG4VFUsz4ieP1qbp1dpTre1JZxp/OAsdTLcVB5UhhchCXeMbBIeHQui9SjoNb4hf5u
X-Gm-Message-State: AOJu0YychKq2FPVBZqZobe91tF76jyzBWy670lLRAP4M8rDPwaHiS/l/
	z0Ziho7Iv2/Vs5xc59p1e2OJT7AAEgF9IXSNyZentIjsevx33yjiLAowVcHy8ns=
X-Google-Smtp-Source: AGHT+IH1jsEV56zssrINk6gB/epPAKvvSKLlj9VGr4Avz+U+gixZrxxt6NkzNDHCNSWzzaaBtLHF6g==
X-Received: by 2002:a19:380a:0:b0:516:d18b:eae8 with SMTP id 2adb3069b0e04-52964caa6damr6901115e87.41.1716900793703;
        Tue, 28 May 2024 05:53:13 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c97:23a9:35bc:df2e:d894:2c76? ([2a00:f41:c97:23a9:35bc:df2e:d894:2c76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529712f1c0fsm949009e87.279.2024.05.28.05.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 05:53:13 -0700 (PDT)
Message-ID: <e8e714ac-610e-4507-82ed-27a38c7be8fb@linaro.org>
Date: Tue, 28 May 2024 14:53:09 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] arm64: dts: qcom: sc8180x: Add USB MP controller
 and phys
To: Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>
References: <20240525-sc8180x-usb-mp-v1-0-60a904392438@quicinc.com>
 <20240525-sc8180x-usb-mp-v1-8-60a904392438@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240525-sc8180x-usb-mp-v1-8-60a904392438@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/25/24 20:04, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The SC8180X platform comes with a multiport DWC3 controller with two
> ports, each connected to a pair of HighSpeed and QMP SuperSpeed PHYs.
> 
> Describe these blocks.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc8180x.dtsi | 146 ++++++++++++++++++++++++++++++++++
>   1 file changed, 146 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8180x.dtsi b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> index 9ef3fa40e1d8..0950dc7adb20 100644
> --- a/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8180x.dtsi
> @@ -2511,6 +2511,34 @@ usb_sec_hsphy: phy@88e3000 {
>   			status = "disabled";
>   		};
>   
> +		usb_mp0_hsphy: phy@88e4000 {

Even though the register names are MPn, I think this is a bit confusing..

There's only one MP controller, so perhaps usb_mp_hsphy0?

[...]

> +			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
> +				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
> +				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;

PIPE_1_CLK

> +			clock-names = "aux", "ref", "com_aux", "pipe";

This could be a vertical list

> +
> +			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
> +				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
> +			reset-names = "phy", "phy_phy";
> +
> +			power-domains = <&gcc USB30_MP_GDSC>;
> +
> +			#clock-cells = <0>;
> +			clock-output-names = "usb2_phy1_pipe_clk";
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
>   		usb_sec_qmpphy: phy@88ee000 {
>   			compatible = "qcom,sc8180x-qmp-usb3-dp-phy";
>   			reg = <0 0x088ee000 0 0x18c>,
> @@ -2662,6 +2738,76 @@ gem_noc: interconnect@9680000 {
>   			qcom,bcm-voters = <&apps_bcm_voter>;
>   		};
>   
> +		usb_mp: usb@a4f8800 {
> +			compatible = "qcom,sc8180x-dwc3-mp", "qcom,dwc3";
> +			reg = <0 0x0a4f8800 0 0x400>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			dma-ranges;
> +
> +			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_MASTER_CLK>,
> +				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
> +				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
> +				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
> +				 <&gcc GCC_USB3_SEC_CLKREF_CLK>;

This is used by the secondary DWC3 (non-MP). Are you sure?

Actually, are we sure that these clocks are really supplying the DWC3s?

> +			clock-names = "cfg_noc",
> +				      "core",
> +				      "iface",
> +				      "sleep",
> +				      "mock_utmi",
> +				      "xo";
> +
> +			interconnects = <&aggre1_noc MASTER_USB3_2 0 &mc_virt SLAVE_EBI_CH0 0>,
> +					<&gem_noc MASTER_AMPSS_M0 0 &config_noc SLAVE_USB3_2 0>;
> +			interconnect-names = "usb-ddr", "apps-usb";
> +
> +			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
> +					  <&gcc GCC_USB30_MP_MASTER_CLK>;
> +			assigned-clock-rates = <19200000>, <200000000>;
> +
> +			interrupts-extended = <&intc GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&intc GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 59 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 46 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 71 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 68 IRQ_TYPE_EDGE_BOTH>,
> +					      <&pdc 7 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pdc 30 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "pwr_event_1", "pwr_event_2",
> +					  "hs_phy_1",	 "hs_phy_2",
> +					  "dp_hs_phy_1", "dm_hs_phy_1",
> +					  "dp_hs_phy_2", "dm_hs_phy_2",
> +					  "ss_phy_1",	 "ss_phy_2";
> +
> +			power-domains = <&gcc USB30_MP_GDSC>;
> +
> +			resets = <&gcc GCC_USB30_MP_BCR>;
> +
> +			status = "disabled";
> +
> +			usb_mp_dwc3: usb@a400000 {
> +				compatible = "snps,dwc3";
> +				reg = <0 0x0a400000 0 0xcd00>;
> +				interrupts = <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH>;
> +				iommus = <&apps_smmu 0x60 0>;
> +				snps,dis_u2_susphy_quirk;
> +				snps,dis_enblslpm_quirk;

sa8195-usb.dtsi lists a bunch more fluff:

snps,has-lpm-erratum;
snps,hird-threshold = /bits/ 8 <0x0>;
snps,is-utmi-l1-suspend;
snps,ssp-u3-u0-quirk;
snps,dis-u1-entry-quirk;
snps,dis-u2-entry-quirk;
snps,dis_u3_susphy_quirk;
snps,force-gen1;
maximum-speed = "super-speed";

the irq numbers look good

Konrad

