Return-Path: <linux-usb+bounces-37757-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCAZKweDDWrUyQUAu9opvQ
	(envelope-from <linux-usb+bounces-37757-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:46:47 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7B158B06A
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:46:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9405A30479E2
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 09:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E663CD8A7;
	Wed, 20 May 2026 09:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jhlgwpdi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HkABHxes"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21D3C9EEF
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269962; cv=none; b=MXhRGk3GTqBXoACefJuMS2K20uBUtJ9Q9sA4j/+4JyXXVSmWx2Agsv0gp70rdhV2ZDJh1vN+uT6y7lBplWp5fQYQ69WfVDvMwfF98xoRszen9OGjNB48NRLX9VrDt3YfYPWcsHsxgwPgUVUGrD85TNu1DpzAZogqI/45j/cbqCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269962; c=relaxed/simple;
	bh=fCVtkWGaCzcd6oD7xUuIczhdltfjodINW9Bm1UkPecI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ndFBX3vlBe5ErJ11IiNm4P2MIr/XuR1W2v3xHgyC2snYo0SZOlm/S/By0xyKKADSeGHhI6EOI5G+q4+wy7iO6C9Ify7y/fzWwQROiiwQJpgAPVNm4/h6zvF7RvN9cdcjuUAQU2dg9qSIQ7Qo/HzkSvf/su7jSfw78UyIyDWEugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jhlgwpdi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HkABHxes; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7ABfW2143761
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Uuua3KjK+Zo
	CopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=; b=JhlgwpditmYOLAfmURlDLqUhcyr
	1o2KQGNICi7Md6JQdkQ28oW3A9bei5ptwvOKmpGKhy+K4qVwtA0vsDipvz7ITTc1
	AZBroVUjukr2JlFzrn5vFqsRjhEYFgVJyPRb4CFyLuOjCTUpMfy7Bs2xNsm7c1Vl
	8hmqHOdJ/sYV8Im4xgFSiZhEI2DTFCAEGXkDM7hsD7vtH7YhC9fXLHbnIPpOErwV
	aJROh+jaUszkXJvpCJ4oKisw44V9Uu1QPWeWrOnJYRMA/ytA/Hy5YthZ/fWLkOPR
	WIniRyBvrX1RIU8FGjE9TeEjw1yk+9q0og3cN0Js/8oIhoathM04DQh31zQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3tm3mm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:39:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso77119935ad.3
        for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 02:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779269957; x=1779874757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uuua3KjK+ZoCopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=;
        b=HkABHxesyzHK0XnG3Q/kW5lzTVoH8PwMht9oVk1KELwJ/3OMN6EeY5BET9MJ8cHx1l
         GMkUYmsOCkk0Pxsc3M7tMdsTpzPljmO4wUAbGtvni5rF5QKO2Eitgp4s1VGk2gzI0f8O
         j1pJX2P2RXXRYWDDAd353dZsiGPDkRESI4VOk8FA+XxKYPpDC0KHODJOwQdHliXfS3jK
         6p27qGQxp9Ksnv1iUbTiczHLJeC6bGFaLaxvz2uPZrB45WpVhZr2oKvxstB8j093RUiz
         jr+EclV4YMI1SoWVwjWFOMkAztVeQ51fy7KxweQ1RI8C2N80V+uwhnqRUOEXaAcBuJb7
         luaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779269957; x=1779874757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Uuua3KjK+ZoCopIZ43xbqZUEKr2+7zx5nC3pz19xRf8=;
        b=RR7hbSIDYdt6pAS9EjmcNGE49TjCBt7vh7GFxrI5B6u3YmvmI8iPIxsX4GJ2EV5hzM
         9phzihukG8bO42q4OucPnhHv13pLrdE+qt/CJspRZOFrED4dfI6zShcpUI6tvBdM/nvk
         sZ/szibqPOQluxCcHzBfwmqfbmqFE66dT3L8u3hefG+FaxAThkvTm7efG1CIjkCu89Gc
         ZeribSfEISO6Yo4n1z1xwDWAfBMwiAp6OB6PfYQmE+fstRhUrGhA4IZMqn/G0TVqw3oa
         JMN9e5EaZxRBMrsn7jm/0/ruKv1RTGjqXCnlhkzWU3VL9pdlK2fzDEwK7L5HnCGdqOaP
         Rljg==
X-Gm-Message-State: AOJu0Yy9TC++ALCqoekvy9d0LwpvRPNZSONmhmbTUpgiRyCsCIeKMkTW
	saAWCVWSukD/d6AUD8AZveVcc4jkphbDl7NXWKNmX7q/FBN/Qk3NcSequIlLi+KBeyYLlCOZLfR
	DAlC+rd3uA6J+q9yEdrsEVcpigFeELde1WYESsahAcNxr1C3UQwFt7uZ7zDE/CQs=
X-Gm-Gg: Acq92OGsy8emrVwPnhzn898Qf3XCJEy7gpD5FhgYSyj8CDv5LecEYsGUAT6n+VwdJqm
	YH62iIQ/Op9NHWpijmxBQrUhI14zDRboaVwHNsu/wsLIyo9WMG6ReuIK/dfPe5qRIWYlu0pFqh4
	iVk3lR+SfoX1Fn2JanAXVexvn8oeOOX+JmfZ8ajs1dcgNMHCf7kM3RIMq9v2jK9Pqwohm5am60z
	HgaMIAta74ABLrhKAgHLsLr4zHV5R268m2pdixz1nXAezTygSQLrEAGGWiPsOFSW33v6axN8A97
	lNvq91VaNY61Jyhr+idPLS+OxJaMUYkNSPurPQfXY6yCipSv7NgyRoyJNnjbgh/h5AZlyVeNMRL
	StNfFoc5IOtgaJ28+wu5gE0KEXmL69itFzHMZYHvOMy3oiU466Q==
X-Received: by 2002:a17:903:22cb:b0:2b4:63c8:ce18 with SMTP id d9443c01a7336-2bd7e83176fmr253997375ad.12.1779269957109;
        Wed, 20 May 2026 02:39:17 -0700 (PDT)
X-Received: by 2002:a17:903:22cb:b0:2b4:63c8:ce18 with SMTP id d9443c01a7336-2bd7e83176fmr253997055ad.12.1779269956587;
        Wed, 20 May 2026 02:39:16 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8baesm217052215ad.47.2026.05.20.02.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:39:16 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: monaco-monza-som: Enable USB0 DRD mode
Date: Wed, 20 May 2026 15:07:33 +0530
Message-ID: <20260520093902.2064730-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
References: <20260520093902.2064730-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=feCdDUQF c=1 sm=1 tr=0 ts=6a0d8146 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=UkWcZxrghjed5wiBs1AA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Yn57kazyQDEUdwvqFUn1Qt-UFrRsoGqS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5MiBTYWx0ZWRfXx+RTZfADYHZh
 r5uwrx5cWKAzqh3m0S7P3bf8NFy8I/r+MTDeu+vXUMg7YMqxkO2W2HOLtwY1cG3EiBMPLVldCGO
 EBBaX5sDFChWreXzzn/Ds3otX4O/iO0oR1VtOYUroD66iLjb80aEZpAASNWqY77NtYCIU41RIzA
 SEOWx8FLbVXy0RfdthSW+ZN4R+3hmuH92k1+ebfJ4tKVz+7p+ZtwUSzA81ZYhMZWcyKQCPh8x3w
 5JzJiUSUAVhPH76l35ZOLyLTBZVa2xDocaIPdvWqVxql0m9P2W5LrN4op7JgGOECFmqUrDkWXc7
 AQJL8cLuEsAvULpAbvAxhBZQBVUmlI9qlWAw9BCAHk3W4VyiKHtEYwkm2zgX0pa+OJagrBMZhLc
 A/pkx4EnmqPktZW+gSUkm2EdUBnMlYLmRIhfTfw4RA9VA7YN9GXDLLYJavSM5GpyLom+NuyESMH
 jjeaPQVlC/ViB2zGPJw==
X-Proofpoint-GUID: Yn57kazyQDEUdwvqFUn1Qt-UFrRsoGqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200092
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-37757-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,0.0.0.8:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0A7B158B06A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable USB0 dual-role mode on monza SOM using the Cypress CYPD6129 UCSI
controller.

Switch the controller node to I2C12, configure the required pinctrl and
interrupt settings, and wire the USB2/USB3 endpoints for the USB-C
connector.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/monaco-monza-som.dtsi | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
index 9b5ed55939b8..8e3af6018dfc 100644
--- a/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
@@ -194,6 +194,52 @@ &iris {
 	status = "okay";
 };
 
+&i2c12 {
+	pinctrl-0 = <&qup_i2c12_data_clk>, <&usb0_intr_state>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	typec@8 {
+		compatible = "cypress,cypd6129";
+		reg = <0x08>;
+		interrupt-parent = <&tlmm>;
+		interrupts = < 3 IRQ_TYPE_LEVEL_LOW>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_ss: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+	};
+};
+
 /* PCIe0 Gen4 x2 */
 &pcie0 {
 	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
@@ -227,6 +273,11 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&qup_i2c12_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 
@@ -295,6 +346,12 @@ dp_hpd: dp-hpd-state {
 		function = "edp0_hot";
 		bias-disable;
 	};
+
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio3";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 /* USB0 HS + SS */
-- 
2.43.0


