Return-Path: <linux-usb+bounces-32528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4C8D3C627
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 11:51:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0EE125C382C
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 10:35:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2063F23C0;
	Tue, 20 Jan 2026 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KECAyF2V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VpP3BnGa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516EF2E8DFC
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905271; cv=none; b=Z6vIWxZZBhlEMdaXlx5lb05/kN/YX7SseA6oXssJ7H2lX1TC8yvU4aToa8vhJ1Wp9q4HHi8KcPP+4Y19c0c8w6W09TIRoyp1UjnAj+wBugzoMyk4siGab/ksfhpBxWYgl6CMHoQTL/SM+1o0wUTLWE0HAXYsZT5pTEmRk7F+I8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905271; c=relaxed/simple;
	bh=6XBpg3UYjvv9dbN+i+Qa5FdC+lloQsQwn+x5XqW0Dqk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oB4b8z7HNgZVeKNuRYDTR3GsiHe/kvuJkt2q9dOe8rXDqQwCBQCOvKYaODvkThspBi4bKIhVP0ipexDYUwcqLSrmeby9rKacoGjjhN+KBFGTy+ClrIZC23aWRqGJdRBgh3zbLLChKYl4f+IVDJV2lsdVCW49JHo6EPhqinrjL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KECAyF2V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VpP3BnGa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K71Zin1408477
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0FZGZ8ftnsv
	rjxfmVyY7b7I9ZZQul5ymbIvpf/nMp9w=; b=KECAyF2VnRhdjvLQciBU1POo3GP
	09yI85JjHOMT4RgSA369q+l6uzTIdetz0JJnH2ZSIFR2XQtrifiW3vzpnkn1QMlQ
	KRtJr6OXY2CxbQ11ewO5lrq1ubFupeU+z2ekbCs2ByON7CALVN8d8J0hxDScTCJ9
	Cg9NgE4ulOMggp7wGsHcoIn1VcqF3H9WzfIZWr2CtjXlbcWUU6b4WWYaao7ULey0
	fpvFpVpum36UP8JOHXqjIXPLrTwfZ2OP9/M6pou+IglSsimFUhtncPSAIEee8vZT
	29aC1OAxTG6TXa93mTxWWpgvUe8oVPM9YeU3Ma2kj256WgveBA5UW3q8fcg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt4y2rnbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 10:34:28 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34ab459c051so10629105a91.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768905268; x=1769510068; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FZGZ8ftnsvrjxfmVyY7b7I9ZZQul5ymbIvpf/nMp9w=;
        b=VpP3BnGa7a8/pAgO7YbzwYeTUQUfsKBFzXo309oP8uoqzYxWn8qEfmHwvR1ejTI44G
         vlm8YabdddDeycQzMkuTf3SGtjMnOUZ5olS319CummukQ/Qx4WL62LOfX0z9LlJh+xVd
         4CsLFSCc+HxfBIbDG96dHfrB1kPRkcmzy+ufz3X82fK4wzH2/OgsAAfip4Ti7tGo8WXg
         eVdaJ3zbSawqW/tGkMJKYyb5E7X/Ft+jlQWszuhoZqsc/DQRykqCVvBpzOanW1J/T/Hb
         opqt+IjMIoU4dAwboEjYGc1XNPDRJaq6FrBmIXEDi888/dByl2UNIpRxbgNBuKlkS94p
         BLBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905268; x=1769510068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0FZGZ8ftnsvrjxfmVyY7b7I9ZZQul5ymbIvpf/nMp9w=;
        b=PLPCJ+0miccM+tvcYAj/2eq2SMxcwTObem5fuFAZH5yS5gkC6eis/C4dpPbakvxUxs
         FPK7H01787bP2OaeriBii/DactqJ6ots6mTZHgGFFwX1O5+fX9e5UqBnNTcTXTpAbHhC
         o3NY4/EzfZDp2FaKQece1tby85rvCNwygR3vkSc4mZzCM30d+S2uW7aMKZyAqD5/M8ru
         M0hs23yLcLRn/+jWoEnp8tbRjMpPEzkENfCvT0fSQwW3iC9hnk7cc5KwBecerpgCU0z+
         U7LNszjuQ7CtNLwOscBjncy1nNvyvhqRJ/ISoSRMJEM4XufsMuhLvPTXRYxYG1llZYCA
         evKw==
X-Gm-Message-State: AOJu0YzezZl8j8kNxprQzh7q0ORynbbadd8cLaBGipPKAe22EKygs8nn
	sxtOfHRjHu5uitraUK7jJOXW4+kb1qGEqPkt7ir7wM69MA99WiPOXVNdBCYQk8OMgd4VNGjwlTw
	AHWfR6FVFVibEYYiQzIq+gIutBL/8/013gwV0YFDP8em0YPXarWnsy2/fXpIF/qY=
X-Gm-Gg: AY/fxX491YQm2VBwjXE2nEpVjwpK0Xx2+i5anMLNCE3wIUIWTaDxLfmcsaJP518XBgN
	TvPqb7j3YuurlDMdMBx9dMRTI7lg9nLnkSHJPW1g+zozHNdUxiKOANAGU2ekcXCkycSxZxUwKWC
	IlnL6d6RLlt9WjQj8RfW2gYChNENoedXsPf6nnWtyCU8zHUOGiIksiXEQuYCWjyZpJCeAnU87AF
	ZKkknbaEoEnwptxMGY/TEs32H/lLFqDSTk9Bc1s71RIw47dsCSE16483lLGBfPhI8PpO+ZWFpwO
	RttBnO3hhM940GkndboqUnkR5YYYv39xt/9uCY+Yeu0Tu1Uoa9T3YLNzdEnfjOm85XEKQELs8dk
	nj/HHGNevQngsl8u1mQRHB5slSnVb899qJT3jcMvGpms=
X-Received: by 2002:a05:6a21:9988:b0:34e:8864:793c with SMTP id adf61e73a8af0-38dfe62934fmr13174766637.8.1768905267803;
        Tue, 20 Jan 2026 02:34:27 -0800 (PST)
X-Received: by 2002:a05:6a21:9988:b0:34e:8864:793c with SMTP id adf61e73a8af0-38dfe62934fmr13174743637.8.1768905267298;
        Tue, 20 Jan 2026 02:34:27 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c5edf3791e5sm10050709a12.31.2026.01.20.02.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:34:26 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        =?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
        Pin-yen Lin <treapking@chromium.org>,
        Catalin Popescu <catalin.popescu@leica-geosystems.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v4 4/4] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
Date: Tue, 20 Jan 2026 16:03:12 +0530
Message-Id: <20260120103312.2174727-5-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
References: <20260120103312.2174727-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA4NyBTYWx0ZWRfXyE26neXBviLG
 /P22Tge+PPvNHv9OanSCijPjyaBVjHr+PZ6VZpKwTE7D9rSyUYt5VjTtgfZvFrwy8asYet94QO8
 A0ZmE6kZnnZFXsBE8yYScc+BH7y6dPnyIYyB1KYzfQiQfwduMpl++tj234QssuABkUFwRy93N7/
 +YtMbUMupupdv16BTN1Smw0hBZe2wTrDNyOlclXEzjE+QJRH8fTXz4Ili93PPoqV4Jn03TBGvvb
 lBsPvy2RFchu4e3bOMEddzdYmR54qhRLdeSgeTh3Yn6Umf4diFab3fMZInWk+fptVc+nfcf6LFI
 obtIFjcOzNGVJS8X1LpvOEASjzmBwyZRGvev3hyI+krRjaiLC1tw5QcA036W77cGB2GkHBJB5mQ
 1Ak5tsG3gercdKNFtaXVrzYnxkv1Z7xgJut/wW6dML/7Kl2ajrflMYrqIs5kRP6PQH5dPE4vsX9
 3mHOEBqi1+fO8vkqV8w==
X-Authority-Analysis: v=2.4 cv=Ds1bOW/+ c=1 sm=1 tr=0 ts=696f5a34 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5OhgTjSsxmRXjPuCaPMA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 4lDWa5oxBHzg7FDbvrjDfju8fsUuEmHi
X-Proofpoint-ORIG-GUID: 4lDWa5oxBHzg7FDbvrjDfju8fsUuEmHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200087

Enable secondary USB controller in host mode on lemans EVK Platform.

Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
having 4 ports The ports of hub that are present on lemans EVK standalone
board are used as follows:-
1) port-1 is connected to HD3SS3220 Type-C port controller.
2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
for Bluetooth. This port is to be used only if user optionally replaces the
WiFi card with the NFA765 chip which uses USB for Bluetooth.

Remaining 2 ports will become functional when the interface plus mezzanine
board is stacked on top of corekit:

3) port-2 is connected to another hub which is present on the mezz through
which 4 type-A ports are connected.
4) port-3 is used for the M.2 B key for a 5G card when the mezz is
connected.

Mark the second USB controller as host only capable and add the HD3SS3220
Type-C port controller along with Type-c connector for controlling vbus
supply.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 209 ++++++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 074a1edd0334..328b30576a0b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -68,6 +68,45 @@ usb0_con_ss_ep: endpoint {
 		};
 	};
 
+	connector-1 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "host";
+		power-role = "source";
+
+		vbus-supply = <&vbus_supply_regulator_1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_1_in_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb1_hs_in: endpoint {
+					remote-endpoint = <&usb_hub_2_1>;
+				};
+
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb1_ss_in: endpoint {
+					remote-endpoint = <&usb_hub_3_1>;
+				};
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -141,6 +180,16 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
 		enable-active-high;
 	};
 
+	vbus_supply_regulator_1: regulator-vbus-supply-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_1";
+		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -536,6 +585,32 @@ hd3ss3220_0_out_ep: endpoint {
 			};
 		};
 	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+
+		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_1_in_ep: endpoint {
+					remote-endpoint = <&usb1_con_ss_ep>;
+				};
+			};
+		};
+	};
+
 };
 
 &i2c18 {
@@ -699,6 +774,14 @@ usb0_intr_state: usb0-intr-state {
 		bias-pull-up;
 		power-source = <0>;
 	};
+
+	usb1_intr: usb1-intr-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
 };
 
 &qup_i2c19_default {
@@ -868,6 +951,12 @@ usb_id: usb-id-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart10 {
@@ -922,6 +1011,126 @@ &usb_0_qmpphy {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	usb_hub_2_x: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+
+		peer-hub = <&usb_hub_3_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_2_1: endpoint {
+					remote-endpoint = <&usb1_hs_in>;
+				};
+			};
+
+			/*
+			 * Port2 is connected to another hub which is present on the interface
+			 * plus mezz through which 4 type-A ports are connected.
+			 */
+			port@2 {
+				reg = <2>;
+
+				usb_hub_2_2: endpoint {
+				};
+			};
+
+			/*
+			 * Port3 is used for the M.2 B key for a 5G card when the interface
+			 * plus mezz is connected.
+			 */
+			port@3 {
+				reg = <3>;
+
+				usb_hub_2_3: endpoint {
+				};
+			};
+
+			/*
+			 * Port-4 is used for the M.2 E key on corekit. Standard core kit uses
+			 * UART for Bluetooth. This port is to be used only if user optionally
+			 * replaces the WiFi card with the NFA765 chip which uses USB for
+			 * Bluetooth.
+			 */
+			port@4 {
+				reg = <4>;
+
+				usb_hub_2_4: endpoint {
+				};
+			};
+		};
+	};
+
+	usb_hub_3_x: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+
+		peer-hub = <&usb_hub_2_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_3_1: endpoint {
+					remote-endpoint = <&usb1_ss_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_3_2: endpoint {
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_3_3: endpoint {
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				usb_hub_3_4: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
-- 
2.34.1


