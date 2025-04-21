Return-Path: <linux-usb+bounces-23272-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 124E4A958C5
	for <lists+linux-usb@lfdr.de>; Tue, 22 Apr 2025 00:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7FB43ADC67
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 22:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E04221FCE;
	Mon, 21 Apr 2025 22:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dkyW8X8B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC1221287
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272845; cv=none; b=hacrcfENM7SFvZxW97pcKCuypuMkhclqJIRClLFjN5qBZj7rfqUyJUI3QlXhwGeq0AJfX3wjEsqxC2DxUhsMigSRirAS3ftftfM3s0IDfN7rDNumz4CUSk+3VRBJMOW4s1dJE/p6b6jGBbNaaud+/gqVF1usPdYFgfD6+bJea0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272845; c=relaxed/simple;
	bh=WFJ/zuemwNSPDCt//DRf+9EkltzAN/b7Vb2Re8J8QEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xe2VZ/xsbAw86gLJrTtgSiKegiikDOpnfVxI+QtK/7YxvpuHaurQGIL76btIH41TZ2S/3xbE6hVbHMOszK/Aoqrn8i3vpDTHGveWWTeg791bDFzpAuEZnPW20BV+j/ElrBNJB1uNn/ChpdeHo9POrHXFiQ/SYPJwp18YUs7smrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dkyW8X8B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3v5v021107
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LOcJf/+hCGJ1lo3aUSpdv3asRvUubHkWKkkzwGshJEA=; b=dkyW8X8Bu8EyS7YB
	eNRDj02/westbQCkm9czXZoUTFZanGpFO2C4IhdxFoKhGp37jbHJXgXpFLQrjgxK
	2/zfkJ3KKF8jsAnfjs5zeILS8gGh9d994w1W4zNn1MS/e/zwfUtoBrF91U/p85x7
	B2r3roXU3dOR+WIAkjVfHbkaKGt33beX+TnIqHMyeRF58GX5dTZSDkTZA5rqVrSL
	XKRiZ7gJ+GNfNk9K2WkbHmVwK/whsPrH4zpxHZDFOBGiMGENMK7R6H45PIywl1BJ
	uOmunn0WRbt87dX/C0zTJFNOrFOotyiePd7rj3IdFZhfKKRJYRqVbUx1JaLtmPnd
	R3IcEw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46416qwkgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 22:00:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73bfc657aefso3229975b3a.1
        for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 15:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272838; x=1745877638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LOcJf/+hCGJ1lo3aUSpdv3asRvUubHkWKkkzwGshJEA=;
        b=G2JJq6brh4a9KHF72scBsaOqbgN+NONW7r1r/h4MzZLyTTpub79qdlwczjnRnEI4af
         RLHfPiH+hTNYG4QKc+4LvvSdqGy8EciF0gfvzvyWmckZMlLw7hT2LjNQpCuizRplgymp
         l3B8furNXad94Md8kYBsDG3VnHXMyMlSuONkxD7nQzZmMt5+8lrhDQ6JYZGRQTtISCmd
         4Jjv9OyLoj2tWVUH1TTgA+x472aqw/GPHCWemPlE4K/W7KMn2X0GA1ZuDUHf5B2s8Rd5
         OogAddfm3wB7B4uTMlM8nv+fM2cP21HS9xy2z0G1niP8UURZ08hwrsL70n9MKfjFB5QW
         DMiA==
X-Forwarded-Encrypted: i=1; AJvYcCWA60O720ORzdB9VZlo014TJDh0VI6oq5BPEcC6jme+x+HN1xn9W1haQ9xESnpzEuiOQrupSjrupnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx62eRL0kuO1t+lYEBJhARG2Tsd++puYHSkCVb5aZr2ZpV21ZZK
	d0CkGk86OJgOslJZtnxL4MnFKbhc+FBNAfaCrR3j5VfxRd3Dmj7aVI/XKuQECSA3l3NhxSN7kId
	GWlNjcTA1OiaolUvubi7d9bcCGChBrtFzi/bsHxLnkHqixToLDoJ+VwB+WRk=
X-Gm-Gg: ASbGncvromwLfc93FVgpD45S+Tk+OYI56tUE9yoJPaVh96ycKtg74/Zl7/mokpS8k3R
	ENBWC5wDq0c+3qSLKM+uJ1euNIDqMdo2lDSeFS3wW5DFel9fF2Xqbmnk9osF09MMJ5amt8+Ja0j
	9gl/PrXKD39EN8kWvBqeHv82Hpne7diu4nuorcXvZBxauql6qOoA6WTJmpu9njv0UGRkcVIZcib
	9qWQbbCpJALJXQ4qeDnW+NU4MedqNuvUS/oy/9kxoj5/hAd4zMQ0WE9cLC+f4zGhx4zuTyy0FXn
	0khwrAhOaRLUfPkQjk1mYIghDvAnZfcKP3aiDB2gLgpZbo05GRnhmj7wfYA1pChdGMI=
X-Received: by 2002:a05:6a00:21c4:b0:736:3979:369e with SMTP id d2e1a72fcca58-73dc14800ecmr16537808b3a.9.1745272837809;
        Mon, 21 Apr 2025 15:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEC/WIyN/zzwPMIk8piIlWQP/OhDZ/6RypB4+glSwYIGcUuGs/MLF6X8PeAqs/R5gaLWV87PA==
X-Received: by 2002:a05:6a00:21c4:b0:736:3979:369e with SMTP id d2e1a72fcca58-73dc14800ecmr16537758b3a.9.1745272837290;
        Mon, 21 Apr 2025 15:00:37 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:36 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:14 -0700
Subject: [PATCH v5 07/10] arm64: dts: qcom: sm8750: Add USB support to
 SM8750 SoCs
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-7-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=5552;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Q0k33i4HxZvC68BlUWHg5gu7bOT2UCXbF0VtdJqp1kg=;
 b=Vh4JoxA+0y1N5zsD1P0LxkjnYj4Fed06LU8EPx45ozETGB/DeoXaiwc0xJgVJ1rxyl9YHCTBa
 50sW1r2tWknCq5Om/2yXfcwvPXBoYoSCmo7oycDV+Ax+vC3YHcG7VWT
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=N7UpF39B c=1 sm=1 tr=0 ts=6806c009 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=n1SQX4eW7R_9Zp26JX0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w0TBI-v41HPeZYLATok4MSfG2Niyb7KQ
X-Proofpoint-ORIG-GUID: w0TBI-v41HPeZYLATok4MSfG2Niyb7KQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

From: Wesley Cheng <quic_wcheng@quicinc.com>

Add the base USB devicetree definitions for SM8750 platforms.  The overall
chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
(rev. v8) and M31 eUSB2 PHY.  The major difference for SM8750 is the
transition to using the M31 eUSB2 PHY compared to previous SoCs.

Enable USB support on SM8750 MTP and QRD variants. SM8750 has a QMP combo
PHY for the SSUSB path, and a M31 eUSB2 PHY for the HSUSB path.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..e45075cd47a544aabf575065893a432fb20ef4ad 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interconnect/qcom,sm8750-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
@@ -2462,6 +2463,169 @@ data-pins {
 			};
 		};
 
+		usb_1_hsphy: phy@88e3000 {
+			compatible = "qcom,sm8750-m31-eusb2-phy";
+			reg = <0x0 0x88e3000 0x0 0x29c>;
+
+			clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,sm8750-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsrcc TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,sm8750-dwc3", "qcom,dwc3";
+			reg = <0x0 0x0a6f8800 0x0 0x400>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x0a600000 0x0 0xe000>;
+
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+
+				iommus = <&apps_smmu 0x40 0x0>;
+
+				phys = <&usb_1_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+				phy-names = "usb2-phy", "usb3-phy";
+
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,usb2-gadget-lpm-disable;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,is-utmi-l1-suspend;
+				snps,usb3_lpm_capable;
+				snps,usb2-lpm-disable;
+				snps,has-lpm-erratum;
+				tx-fifo-resize;
+
+				dma-coherent;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+						};
+					};
+				};
+			};
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

-- 
2.48.1


