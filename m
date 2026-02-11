Return-Path: <linux-usb+bounces-33274-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDHPGdkhjGm2hgAAu9opvQ
	(envelope-from <linux-usb+bounces-33274-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 07:29:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C32161219ED
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 07:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 951BF303982D
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 06:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE7F342539;
	Wed, 11 Feb 2026 06:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY64yhzw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LnYpGdyO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE5331A04D
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770791374; cv=none; b=fs4EbKxUN7YQ5Co461+VGfHWxxDsRSqsk2/bWANkkZckzix/Mepd/17pzLqWTS1wkQkjFHq4H/kmO3WKn76iFDp5bRMBiTFMNulpA/NOgmrgjUMFs2r0InSwTS/XrHq+2Qq6f3qMfrsehsQ4+0GXRT1EdgYMSgL7gO84aZ4VfT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770791374; c=relaxed/simple;
	bh=PsQTFSgjcvGxl3MLUggaPozJ27wxnUgUxhKCCQuiFU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jDIpzRNj9vx2gmdNSvCSttG6oiqeXyadrM0y2npvKulbv/9iwC4TyAUdEvOj01kF+39oGCkzO/ZK0XbLQ+gHo2LyhE+pEze7GcHYYlBFmhzsPAut0hnmn+0aEsY6FHOFTOAF8jGmLxDNcQWp4stm+xqT3AMlyjmgU5Ups8HTVJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nY64yhzw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LnYpGdyO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AMbk573919347
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=E6tA//vNS7IUDnw5yILXeqILaShUeChfWlM
	Yu0AvVaQ=; b=nY64yhzwudFvcBwFToKolDO4aeNDPe30ZJg+Rb6s8DkGHjUPxpF
	2EGB15DOwWbk3Gb4Srh1b5MOMVvYG62X2yZLkgsAO9xewfBcL9dwM71o1ko3nc8+
	CSB8/icHYRzhCDXe/3Elx9EQAC+Zwe9BsOucjZvErAxwvtDSU0EByRaEjG7DTBDL
	OaJIDr7QXmqx7jzupGysFqyLNisrhUZ42kMsF/1iOx3xzkm+HqSsu+Ri/8NUFbGM
	N48bLlfr8W8OdNziiee5VBRnkAdS+lsjWm9cKiqJi19TZgm6jnbbphsQdTbOVzwY
	Y8ntOwLO+2HB5BQkqFRWxL5gsZ4dfJ2yMbA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c86akjt5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 06:29:31 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8249e91bcfbso109361b3a.3
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 22:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770791371; x=1771396171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6tA//vNS7IUDnw5yILXeqILaShUeChfWlMYu0AvVaQ=;
        b=LnYpGdyOdVHCYRhJvpSYxjesa+AqVitINvvozXQQLwCVgLn1E/I5RgGOXIFbREHLe5
         C1NrJoXnamOxh+63QXxRP401BOzjX91JsEoZTcLj1NHjd0KFTE1TL4eM2xIuwwOogywl
         QgXees9Iw8dWfmsWMfwggrqWaz5jAH8yX09U9J1kQtvp0PIrQ+2eogVOu+0knPIgZy20
         8HY8ktlIvEeeQFxp4bLYMhi75UJSLUvr1OwdcM4qK2GOMvRRKM8sEXaFoTE0uqtJ0s+O
         gexP2AdTwnjWUw2uyAj9mhznBhs7s8WbRL//gtKz4KkqA5pC2lNvTTO/ELk+ex5SwrTK
         Pkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770791371; x=1771396171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6tA//vNS7IUDnw5yILXeqILaShUeChfWlMYu0AvVaQ=;
        b=i4v3a7RXxy5KrN8xSLVHzR7WQzXgVhIUeGN/H1Lal+ct67bi+0NK/V2qAiGEOIIhl1
         prDiFKvlVhd7Taf++sYeCJJij1e+2oyk/bxY1QTCrAbgKjjusI6KAFGOxwbxWWi4UfFm
         U8AFFM4v9OvwpJeoBonD6qOpAvprg4tjtBlegyCFDpK8CwnyaEbo/mHFmXfFtRuBkYRu
         z4DrZwg5l8r2u5IspiIkdAcXXCYoIdrLuWzTyFusJMC/XcKcBrOkCIIzXRmuRNlQrH4o
         Pvq375jKu5yMsQxmTn2TvN5IhQBNUMDZkEtKuQYNe8tlLAVFKdFkqENbH9jQarJjX4BK
         RAXg==
X-Gm-Message-State: AOJu0YwaEG8YZYdVP1NeLR2W1Grd5E7qzxGWHr67GNvoeObgNlhKtVpg
	diPLJUHeavWp+L6cJbIwNKo3UAzz2MDjHqzJhB/phEjFlsWVRq5BpDJC70WKr8+NClXAjzZqWgN
	Oro7hTGVaZz/H/mysA5f8Gp961LeJy4UK3lLmCe0KhF3i+r1L/ZOJe/rer2OwueM=
X-Gm-Gg: AZuq6aJzNC1EMTDlefLadEDvuNx8Roo+GvNj/ciZy820YOsnzc5BzFzeYdyxbN/OHKJ
	UrSTFRqy/+yFRKdPPHdydXLi9HmDAmAOfqgLKZ3Dih+LCdCaIeqw8Z8RySGPQ3dXUnw/qIIyOJW
	3mVfQVv6gZBwOugPoikJAIAdFMsDToJ/0sMMaYx1teYctqwYopH1FoADt6fJPWHexq/MHmTYE6P
	2KvvSSD5V3rkjhxWuNDQ82jqXfgtCocVG1LjZc9XXJWGIVHTdsHitnsZC4lKf/pZX5MSp251mop
	AnYOdM/HQ2An3O0CS1XPI55qrER9LdVO+6/aotUc0dzOFJssiY1Xp895dG/772jfbVLZCZj+cFv
	z74qPQqVx2nUy40xnomrseH7hsApwp0sSe+mkeLaGHQGIPbZ/hA==
X-Received: by 2002:a05:6a00:1494:b0:81e:63b9:5830 with SMTP id d2e1a72fcca58-8249fc87968mr957001b3a.18.1770791370725;
        Tue, 10 Feb 2026 22:29:30 -0800 (PST)
X-Received: by 2002:a05:6a00:1494:b0:81e:63b9:5830 with SMTP id d2e1a72fcca58-8249fc87968mr956984b3a.18.1770791370271;
        Tue, 10 Feb 2026 22:29:30 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e36809esm950905b3a.7.2026.02.10.22.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 22:29:29 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2 controller Micro-USB OTG
Date: Wed, 11 Feb 2026 11:55:51 +0530
Message-ID: <20260211062923.3794476-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HI7O14tv c=1 sm=1 tr=0 ts=698c21cb cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nDjxtR87dJjKcGfwTHQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: ZqdJOXVvUPzp_aVRad9a41AkmIBhENx8
X-Proofpoint-ORIG-GUID: ZqdJOXVvUPzp_aVRad9a41AkmIBhENx8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA1MSBTYWx0ZWRfX44zgbCBYqH8o
 QYIPPc6U+eOQMSnFXBb17KLj6X4v2JSgWRWzbI6u0MSm1+x5sJsN1Ve5fhioKot1ITwbZ79iRdV
 +Tm4ELJ8cQPUQ6MTSRFf9sXFFXOZpcjTZC71Q39hDcEaefuS8I+TsT7QaMfcfr7kjuSb8LZwYE6
 LJfFdXtQjQIGIMRhKBaZMStcOia062BDzxQLNxDnPBk9YBFmBwv/dv5eOEd+NAs74xEy37q4tQD
 719+jg5heV4WLZAEbZgPf9/Rp8SceWOCNWFCCvriuFR5gVXpdTOxG4YaQe2W9zWq0moJ6NGcbiN
 KKzP3CPZdk2dh16bfFV3bigphJe+VdrKIriw7PEH3x3JPonIosn6PXQAWeFPt0ekSZfbnOGpeRL
 zQdjYS9NBskPHKahTFk2TQBphZAuxYVinFasJmfUBAJdw/AwHt1KrsM7Y6IhtevULyOjuCRyaGC
 ZkXbRG2kfoc60W5O2UQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33274-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C32161219ED
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
- Configure &usb_2 in OTG mode with role switching enabled.
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
v3: Added empty line between reg and endpoint.
    v2: https://lore.kernel.org/all/2zztcabuf4hkixj445m3iiqdsmg7jju62e3fgupb6kaqirx5lq@2mhs5hcn3p7p/
---
v2: Fixed minor comments on v1: https://lore.kernel.org/all/ad294a50-027f-4caa-a9b4-e145f709b50a@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 66 ++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288..76f2c6b3d518 100644
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
@@ -262,6 +272,31 @@ active-config0 {
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
+
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
@@ -1137,6 +1172,12 @@ qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
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
@@ -1200,6 +1241,31 @@ &usb_1_qmpphy {
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
+
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


