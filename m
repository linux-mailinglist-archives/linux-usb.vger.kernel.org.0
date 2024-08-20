Return-Path: <linux-usb+bounces-13728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D53989585F2
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 13:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55AED1F225B9
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 11:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B46918F2DA;
	Tue, 20 Aug 2024 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eohhIqGZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BF918DF9F;
	Tue, 20 Aug 2024 11:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153690; cv=none; b=I8ALqktXAtcnz0S5d4tGhPW+sR8FtPxta7M0KDtkH2lRp54HRAat2AO0kf6pjO8FGbz0OnFQYMCNs/hzZ5fF68SzZFj8jnMZ33WhU+UgEahHzvGcLQUEGBwMAGqSJOdMNFCA54jU9nKZ9x6s66GAJztU3gOfKS81LDZc2XNWxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153690; c=relaxed/simple;
	bh=4HHwrA+gztk4eOxLTUujMc7xdSZYpYt+4oqCUJjkJ3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=THFaeNZoUZOBUMRdsWZqpgzSh4cmm327M+ZwaXdq2rH2qxY6p68Xu89KQhYmb6Srzy4O8X0hR4Hp4hLHbZHAiUbje7Gax7HxDKf+pqPpog8j+1cMOxde60+x8dE+k3d+SnfaZldMw40byBAE9fNF4EvKZ7bnxrFBf+fSaCZ1myw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eohhIqGZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CF2C4AF09;
	Tue, 20 Aug 2024 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724153690;
	bh=4HHwrA+gztk4eOxLTUujMc7xdSZYpYt+4oqCUJjkJ3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eohhIqGZ+uetL0cLCrwSnn50qXsG4GVxOlE+qXvrPN6t/0kjRbA/RXS8AYgoLBjX3
	 IB/O2HYnq+NweHBUI5NMDim4kr2eWRu/ZR52ei1z58cOMvyNFEqqQIw591qsTF94/S
	 iT21+pLBsWVh5vDwCqJnYldHsTRbEsrZ1X9djBrgK3qxA57inDYKCj4nvoVCHqqpsA
	 wAgohHnyyrzQqUvGERSIXr8FWWYyHvKWDdgz7BoC6S613GmRjmnMdlRaeoYqqe3WBf
	 j5DavWSXxb1ckjnmT3GJ788MQmF5rEUqX2XIZrGmMYv3k+eLxH/TxSrCJ0Rk/rRaAl
	 nDnEi/D0by5SA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 Aug 2024 13:34:23 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e80100: Add USB Multiport
 controller
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240820-topic-h_mp-v2-2-d88518066372@quicinc.com>
References: <20240820-topic-h_mp-v2-0-d88518066372@quicinc.com>
In-Reply-To: <20240820-topic-h_mp-v2-0-d88518066372@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krishna Kurapati <quic_kriskura@quicinc.com>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724153674; l=5806;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=ba0XE1krupm97HOEf9T7zJfMWm9+IaxaBTPl7l2kt/0=;
 b=PvfY63lWpa3PesCXepJp0H8P3vklWZYPiPJDZ+wzS7vmXktC/zCwsmw0A/rbDntj/DcvkQSwp
 S5L+sF1bhYyDxnZEdHLzOoWci8W2GqpFL8N/ilXpzrFMZgHC+ZGRkOP
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

X1E80100 has a multiport controller with 2 HS (eUSB) and 2 SS PHYs
attached to it. It's commonly used for USB-A ports and internally
routed devices. Configure it to support such functionality.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 170 +++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 74b694e74705..6abff8258674 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3866,6 +3866,90 @@ usb_2_hsphy: phy@88e0000 {
 			status = "disabled";
 		};
 
+		usb_mp_hsphy0: phy@88e1000 {
+			compatible = "qcom,x1e80100-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0 0x088e1000 0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB3_MP0_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_hsphy1: phy@88e2000 {
+			compatible = "qcom,x1e80100-snps-eusb2-phy",
+				     "qcom,sm8550-snps-eusb2-phy";
+			reg = <0 0x088e2000 0 0x154>;
+			#phy-cells = <0>;
+
+			clocks = <&tcsr TCSR_USB3_MP1_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
+
+			status = "disabled";
+		};
+
+		usb_mp_qmpphy0: phy@88e3000 {
+			compatible = "qcom,x1e80100-qmp-usb3-uni-phy";
+			reg = <0 0x088e3000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			power-domains = <&gcc GCC_USB3_MP_SS0_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb_mp_phy0_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_mp_qmpphy1: phy@88e5000 {
+			compatible = "qcom,x1e80100-qmp-usb3-uni-phy";
+			reg = <0 0x088e5000 0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
+				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			power-domains = <&gcc GCC_USB3_MP_SS1_PHY_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb_mp_phy1_pipe_clk";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_1_ss2: usb@a0f8800 {
 			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
 			reg = <0 0x0a0f8800 0 0x400>;
@@ -4040,6 +4124,92 @@ usb_2_dwc3_hs: endpoint {
 			};
 		};
 
+		usb_mp: usb@a4f8800 {
+			compatible = "qcom,x1e80100-dwc3-mp", "qcom,dwc3";
+			reg = <0 0x0a4f8800 0 0x400>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
+				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
+				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
+				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "noc_aggr",
+				      "noc_aggr_north",
+				      "noc_aggr_south",
+				      "noc_sys";
+
+			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MP_MASTER_CLK>;
+			assigned-clock-rates = <19200000>,
+					       <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 52 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 51 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 54 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 53 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event_1", "pwr_event_2",
+					  "hs_phy_1",	 "hs_phy_2",
+					  "dp_hs_phy_1", "dm_hs_phy_1",
+					  "dp_hs_phy_2", "dm_hs_phy_2",
+					  "ss_phy_1",	 "ss_phy_2";
+
+			power-domains = <&gcc GCC_USB30_MP_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_MP_BCR>;
+
+			interconnects = <&usb_north_anoc MASTER_USB3_MP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_USB3_MP QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
+			wakeup-source;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			usb_mp_dwc3: usb@a400000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a400000 0 0xcd00>;
+
+				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
+
+				iommus = <&apps_smmu 0x1400 0x0>;
+
+				phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
+				       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
+				phy-names = "usb2-0", "usb3-0",
+					    "usb2-1", "usb3-1";
+				dr_mode = "host";
+
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,usb3_lpm_capable;
+
+				dma-coherent;
+			};
+		};
+
 		usb_1_ss0: usb@a6f8800 {
 			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;

-- 
2.46.0


