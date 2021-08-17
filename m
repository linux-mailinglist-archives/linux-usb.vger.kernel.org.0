Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B764E3EE7F8
	for <lists+linux-usb@lfdr.de>; Tue, 17 Aug 2021 10:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234923AbhHQIGA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Aug 2021 04:06:00 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34387 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234733AbhHQIF5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Aug 2021 04:05:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629187524; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IP18U/WUYWLK4FqJlwhGoCHLRbbe5Kaoy1C9rhUEM40=;
 b=GRkLk2uhU89h+exh6YCHt2Wm8Nz5O1F8Jcp24jbV4bwCl7IMHOEOo8q6nrCUbtTjpNhbjHtz
 ATKNWbTODTKBzcWh6Nj/p72GiyfJYuGO+oi966jwmBFiGPZ2k7E/G8NUegoB8/0F2BrtymR6
 RMI2AxKfHtpyYqtSK6qE/kWmx7E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 611b6db1b3873958f519f564 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 08:05:05
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 53217C4360C; Tue, 17 Aug 2021 08:05:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0EB6CC4338F;
        Tue, 17 Aug 2021 08:05:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Aug 2021 13:35:02 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        vbadigan@codeaurora.org, sallenki@codeaurora.org
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sc7280: Add PCIe and PHY related
 nodes
In-Reply-To: <YQhGRB3wBgQ1Kw9E@google.com>
References: <1626443927-32028-1-git-send-email-pmaliset@codeaurora.org>
 <1626443927-32028-3-git-send-email-pmaliset@codeaurora.org>
 <YQhGRB3wBgQ1Kw9E@google.com>
Message-ID: <d456e200f9ddd4ad0b03c331d3d74db4@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-08-03 00:53, Matthias Kaehlcke wrote:
> On Fri, Jul 16, 2021 at 07:28:45PM +0530, Prasad Malisetty wrote:
>> Add PCIe controller and PHY nodes for sc7280 SOC.
>> 
>> Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 125 
>> +++++++++++++++++++++++++++++++++++
>>  1 file changed, 125 insertions(+)
>> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index a8c274a..06baf88 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -15,6 +15,7 @@
>>  #include <dt-bindings/reset/qcom,sdm845-pdc.h>
>>  #include <dt-bindings/soc/qcom,rpmh-rsc.h>
>>  #include <dt-bindings/thermal/thermal.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> 
>>  / {
>>  	interrupt-parent = <&intc>;
>> @@ -546,6 +547,118 @@
>>  			#power-domain-cells = <1>;
>>  		};
>> 
>> +		pcie1: pci@1c08000 {
>> +			compatible = "qcom,pcie-sc7280", "qcom,pcie-sm8250", 
>> "snps,dw-pcie";
>> +			reg = <0 0x01c08000 0 0x3000>,
>> +			      <0 0x40000000 0 0xf1d>,
>> +			      <0 0x40000f20 0 0xa8>,
>> +			      <0 0x40001000 0 0x1000>,
>> +			      <0 0x40100000 0 0x100000>;
>> +
>> +			reg-names = "parf", "dbi", "elbi", "atu", "config";
>> +			device_type = "pci";
>> +			linux,pci-domain = <1>;
>> +			bus-range = <0x00 0xff>;
>> +			num-lanes = <2>;
>> +
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +
>> +			ranges = <0x01000000 0x0 0x40200000 0x0 0x40200000 0x0 0x100000>,
>> +				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
>> +
>> +			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "msi";
>> +			#interrupt-cells = <1>;
>> +			interrupt-map-mask = <0 0 0 0x7>;
>> +			interrupt-map = <0 0 0 1 &intc 0 434 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 2 &intc 0 435 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 3 &intc 0 438 IRQ_TYPE_LEVEL_HIGH>,
>> +					<0 0 0 4 &intc 0 439 IRQ_TYPE_LEVEL_HIGH>;
>> +
>> +			clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
>> +				 <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
>> +				 <&pcie1_lane 0>,
>> +				 <&rpmhcc RPMH_CXO_CLK>,
>> +				 <&gcc GCC_PCIE_1_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
>> +				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>> +				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
>> +				 <&gcc GCC_DDRSS_PCIE_SF_CLK>;
>> +
>> +			clock-names = "pipe",
>> +				      "pipe_mux",
>> +				      "phy_pipe",
>> +				      "ref",
>> +				      "aux",
>> +				      "cfg",
>> +				      "bus_master",
>> +				      "bus_slave",
>> +				      "slave_q2a",
>> +				      "tbu",
>> +				      "ddrss_sf_tbu";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
>> +			assigned-clock-rates = <19200000>;
>> +
>> +			resets = <&gcc GCC_PCIE_1_BCR>;
>> +			reset-names = "pci";
>> +
>> +			power-domains = <&gcc GCC_PCIE_1_GDSC>;
>> +
>> +			phys = <&pcie1_lane>;
>> +			phy-names = "pciephy";
>> +
>> +			perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +			pinctrl-names = "default";
>> +			pinctrl-0 = <&pcie1_default_state>;
>> +
>> +			iommus = <&apps_smmu 0x1c80 0x1>;
>> +
>> +			iommu-map = <0x0 &apps_smmu 0x1c80 0x1>,
>> +				    <0x100 &apps_smmu 0x1c81 0x1>;
>> +
>> +			status = "disabled";
>> +		};
>> +
>> +		pcie1_phy: phy@1c0e000 {
>> +			compatible = "qcom,sm8250-qmp-gen3x2-pcie-phy";
>> +			reg = <0 0x01c0e000 0 0x1c0>;
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +			ranges;
>> +			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
>> +				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
>> +				 <&gcc GCC_PCIE_CLKREF_EN>,
>> +				 <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
>> +			clock-names = "aux", "cfg_ahb", "ref", "refgen";
>> +
>> +			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
>> +			reset-names = "phy";
>> +
>> +			assigned-clocks = <&gcc GCC_PCIE1_PHY_RCHNG_CLK>;
>> +			assigned-clock-rates = <100000000>;
>> +
>> +			status = "disabled";
>> +
>> +			pcie1_lane: lanes@1c0e200 {
>> +				reg = <0 0x01c0e200 0 0x170>,
>> +				      <0 0x01c0e400 0 0x200>,
>> +				      <0 0x01c0ea00 0 0x1f0>,
>> +				      <0 0x01c0e600 0 0x170>,
>> +				      <0 0x01c0e800 0 0x200>,
>> +				      <0 0x01c0ee00 0 0xf4>;
>> +				clocks = <&rpmhcc RPMH_CXO_CLK>;
>> +				clock-names = "pipe0";
>> +
>> +				#phy-cells = <0>;
>> +				#clock-cells = <1>;
>> +				clock-output-names = "pcie_1_pipe_clk";
>> +			};
>> +		};
>> +
>>  		stm@6002000 {
>>  			compatible = "arm,coresight-stm", "arm,primecell";
>>  			reg = <0 0x06002000 0 0x1000>,
>> @@ -1185,6 +1298,18 @@
>>  				pins = "gpio46", "gpio47";
>>  				function = "qup13";
>>  			};
>> +
>> +			pcie1_default_state: pcie1-default-state {
>> +				clkreq {
>> +					pins = "gpio79";
>> +					function = "pcie1_clkreqn";
>> +				};
>> +
>> +				wake-n {
>> +					pins = "gpio3";
>> +					function = "gpio";
>> +				};
> 
> This could be essentially any GPIO, right? Does it really make sense to
> have this node in the SoC file? I would say it belongs in the board 
> file.

Hi Matthias,

Thanks for your review and comments.

Sorry for the delay in acknowledging. I would move this entry in IDP 
file in next version.

Thanks
-Prasad
