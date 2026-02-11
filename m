Return-Path: <linux-usb+bounces-33270-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOTSCf4RjGnnfwAAu9opvQ
	(envelope-from <linux-usb+bounces-33270-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 06:22:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0E512153B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 06:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 76B94304DC98
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 05:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14D8334D926;
	Wed, 11 Feb 2026 05:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8W52fv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuAm0ZwA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7794F2750E6
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 05:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770787317; cv=none; b=kxTy9IHk9LQKa77RTt/EUmsEEWq3fr4pQ4phdFgGLYPiaDR1BQI5fQa+qApBwaF1pxreSgT8ziEMEnKQBul/8EMMFQjjIrWblZPqfHsaBLWuQiO/b/h2vRI1PiiRuhMjyeSkuheWbDsMfFqk9xhgfYyInx22w+uCmBW4IF5Osmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770787317; c=relaxed/simple;
	bh=PcGaK6KgYnSrAyu1cmf9etzsXUS1gTw7ofw0nqD0/uI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJgm97b8MMLTgD+qIcYqBwt0Yc0k6AQy20UwYLKH9yQuZQoXU1KrPJ1kaM1x35ii2uKQEBcS0pWwq+YnZ8Aay8BVyEdlt7TtWz8+kS/COo4gfNjTaAimQx74gZljvoWKNXNTz04KJ98V/PoVQBjgFtFa3p2BAqgETe34t+61bfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8W52fv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuAm0ZwA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B3C7QP2396810
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 05:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2mGekC0M2yjAAuN4WY4fhNZAavvVZXR8J38
	63w8fhoc=; b=Z8W52fv6Q1x+IAYV2CWEo06m4vLrbMKwNr2+VnXXadWYc2/c92o
	xuM4GWS4rg6WL8/BBBMRv46eGun8l0sfCTTbf5LzZri6VLqgtYm+/WkTEGECzLho
	2BjzvBopk3f8T+r40D0PlTireYvUj9uEm9FFw9etyysQLpudZsqcsYLEbAF/K7W0
	83UPKMx90yNT8Mfe/gvseQ295jdHJ/OBv+JE5ZhrqXAdPot9JZDuMHVpOYFl1Fug
	I8lVgj++S8sJLjr74V1hVELlOiq3bQCpf3K4G0/hdNnaraFkWjsDc98rgMlTsS7j
	2VhusliRD+8NXmZ1Me/cu2lzMux11x2rycA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c88wqj0t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 05:21:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e1dab2235so65830a12.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 21:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770787314; x=1771392114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2mGekC0M2yjAAuN4WY4fhNZAavvVZXR8J3863w8fhoc=;
        b=fuAm0ZwAz/i8fd0/Z9fLwY3jlNupotHfcJK4HrtlrvJKKOWdR+sS5MSLDvl8i2JcSE
         Xq8lvs87s43nZ5u9R1CJ0FIM/1EaOk3JVMN7k1JrMXLZxPxQyD4BZIWIyC1T/5nDofbt
         GW9IfFYqTrNp0OmLLnVM29mcLsaSi/eLVdVjokoDQqWA6SMd6ac+2mMyBmMCe3pnkU+E
         RYiNOENUkB6ny5aiHvlFtzSYLQBDpJI46obFQDMam9g2/Z0G0ieSnkjaGRmUxbBjOZv4
         sXZMw9QEDH4QZZTFmkFh0YsWhnXIbi2RkApw4DULMHmCaqrTt3BIuusLuUr739Twiyr2
         5KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770787314; x=1771392114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2mGekC0M2yjAAuN4WY4fhNZAavvVZXR8J3863w8fhoc=;
        b=EU3FGUz8kbm7IP763qJ4CfPfCR7JbHjGFRLg1FAMmnOMBeQZUlLS1c0VdD01d8zuWK
         Mc4Sw0QomFKQPvXxHBZR4lKBDTPsoPVnOMXNbDly8PMEYo4bi+tg5uXQVWh21OaYxoq5
         PqIvCa1BjAeFurf8Fwjdxfy6mBVpNHJ7+/89BmLid9yl07U4waU6LaBsjgC8Oh0N+TVV
         wjpGmYVRYXfvOBlDzUCzkPriWxQHCVOQdDcKD3hUQ/8nCCzyCinb8+mCaPjx2BaDoNhB
         nIxTLzKdnRyyP+4E2Hzjh4Be6Xh0/hejS709Tjx7GtzHS0K7Ktun3Uyqyl5uMr3ExAPI
         iKvA==
X-Gm-Message-State: AOJu0YzZ7o1Yhrf07TqtZmP92NPnk8AG1G5hdlu9+kLrHG+A4cP6fLHj
	XVUdRTCm/wiMXgyPFHYOBEr2Dioz4hNMN3PaERVr7rkYCwzG26PVe7Du1PUw3OrxgdOh9+TTVyB
	pSsrmnvN5Yg318HVNvhMcfuTVILdfqs4xELyUuhNhGioxKp9QmVfDty5A5BcBYL8=
X-Gm-Gg: AZuq6aL/U/WnD5qjz/rI4NKit71U+lVqPhUbz8hgQJgGczyqBpR8oK7ELnrKVIN75J5
	4KARZNszlO9IJh6Ai557RWXS4k9v/LNZMi4SBQysfMap3RGAlZqcwi5xjMmzVBW89QXSvn8XUbU
	IVY6mRpSMWe5uYB5X2GGSkkBuzWB+ox1sMd54tG8h6QDgP2RKs0KzTx7VoC2ISNH8+vuiFUJxRt
	2p8Rq1guOhaDCCWg/TWZfmKZEndzJqJEJIMQwdZJhDN639HdyfMN6Yp0fGPhVK4xYIVTYJh7t3e
	Mp5LIIf/eQxor2e3HpyNlmWGrEt7Pe1DqARhC4p1hrQisKm1I3GjqX7U5nEwiZSf68FXmQydAcK
	H7bNVfm9PquOSO1arsUoBGJ1c7Q3vdXYd6rgbbSKZppm1thYwYA==
X-Received: by 2002:a05:6a20:431e:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-39432253f51mr949292637.6.1770787314355;
        Tue, 10 Feb 2026 21:21:54 -0800 (PST)
X-Received: by 2002:a05:6a20:431e:b0:38d:ebdc:3558 with SMTP id adf61e73a8af0-39432253f51mr949267637.6.1770787313862;
        Tue, 10 Feb 2026 21:21:53 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567e7d8eb9sm864675a91.1.2026.02.10.21.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 21:21:53 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2 controller Micro-USB OTG
Date: Wed, 11 Feb 2026 10:48:18 +0530
Message-ID: <20260211052146.3760500-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA0MSBTYWx0ZWRfX4hvBINXcdJEU
 IerHqhRmPnclpusOINoslUbKUsiCaUrYUVUR3dKfCChMv5DvCl7fGHjmy7Ve0OqJjIxJJwHRiaz
 lYlOORu5gUFWJoPqNj85JQbAka9ctny0soQO04Sr8hq0IuLl0jWg0x30hru6r+4/iRAkWcDa0On
 cHXFaEs7d1usgldtZ1FeKsFd5qfe9e1V4E6hwv3aan6Esh5qKPUNhmGZRKYK8E45FabPXPIl7Jr
 Pj1TijUm4i2XJHR3Mp90TXHcabnfyl+VnfTaQDKCrKWwowjVr/ClNNAA1Hxl8wNCa3t0zGsDAUm
 O5ZXzJH9YfITPJ08ekoiFF51sUBDCZQslbE2vSOBAQ7EX+/SfQtvn3GXF2gyieH7uKRxLtFn98p
 v/EwhXJWfXirugWgmrQIocSaS0KN7sv2hjqJIMcOD2ISbPBM/Utoc+re6ll+GsvLsX9Izmd8WSk
 eXdnBkTV8sP47FIyUWQ==
X-Proofpoint-GUID: pKCrA18MCZ_sWxQjWu_L8ncreyigC1fW
X-Authority-Analysis: v=2.4 cv=W7Q1lBWk c=1 sm=1 tr=0 ts=698c11f3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nDjxtR87dJjKcGfwTHQA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: pKCrA18MCZ_sWxQjWu_L8ncreyigC1fW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110041
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33270-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CF0E512153B
X-Rspamd-Action: no action

Enable the secondary USB controller (USB2) and its High-Speed PHY to
support OTG functionality via a Micro-USB connector.

Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
compatible to handle ID and VBUS detection. Link this connector to the
DWC3 controller via OF graph ports to satisfy schema requirements and
enable role switching.

Specific hardware configuration:
- ID pin: TLMM 61
- VBUS detection: PM7325 GPIO 9
- VBUS supply: Fixed regulator controlled by TLMM 63
- Define a gpio-usb-b-connector node for Micro-USB support, mapping the
  ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
- Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
  supply VBUS to the connector.
- Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
  detection.
- Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
  VDDA 1.8V, VDDA 3.3V).

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 64 ++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288..af21c8ab48fa 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -217,6 +217,16 @@ pmic_glink_sbu_in: endpoint {
 		};
 	};
 
+	vdd_micro_usb_vbus: regulator-micro-usb-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "MICRO_USB_VBUS";
+	       gpio = <&tlmm 63 GPIO_ACTIVE_HIGH>;
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       regulator-boot-on;
+	       enable-active-high;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -262,6 +272,30 @@ active-config0 {
 		};
 	};
 
+	usb2-connector {
+		compatible = "gpio-usb-b-connector",
+			     "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		id-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&vdd_micro_usb_vbus>;
+		pinctrl-0 = <&usb2_id_detect>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				usb2_connector_ep: endpoint {
+					remote-endpoint = <&usb2_controller_ep>;
+				};
+			};
+		};
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -1137,6 +1171,12 @@ qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
 		 */
 		bias-pull-up;
 	};
+
+	usb2_id_detect: usb2-id-detect-state {
+		pins = "gpio61";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart5 {
@@ -1200,6 +1240,30 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb2_controller_ep: endpoint {
+				remote-endpoint = <&usb2_connector_ep>;
+			};
+		};
+	};
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+
+	status = "okay";
+};
+
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&redriver_phy_con_ss>;
 };
-- 
2.43.0


