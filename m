Return-Path: <linux-usb+bounces-36829-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ImUNLNff9GkmFgIAu9opvQ
	(envelope-from <linux-usb+bounces-36829-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:16:07 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3970F4AE770
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 19:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 539D030164E4
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 17:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79A213D413C;
	Fri,  1 May 2026 17:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJ68d7ec";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHxT3As9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16982423A80
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 17:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777655208; cv=none; b=pQ/EM4hv3Fvl0XSS2WPs4ujO03izS5ZWts1CLZ0pP2WfExx1sjPY7WT+uQS6zxCG/mmVMwtnlJlinku9Sl6UAC6fcgZy4zr96NnjirW3N+YFB3lystagbmWFuBeUEBdK0P/tmlvPGLjghUe8qF4ZIZryBCecdENicSXB5UEtXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777655208; c=relaxed/simple;
	bh=Y1WK4FOxLS2Z8JGTPQKxCLLaX1hY2Z4D8mCYOE3lAX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AWiYN9cHOt7SSGQCbYWirUPKppHp0zUYTKahkf7Squz1RjiEjnx638dBIG4ULVg89KblU7wRkBzkwz0RywlmuEGyPHq5Qz74dsnxo//HXoYNJ6STz+eH+cuFZgMVf6pdjsd5+Db/iAX7n/FxeYU5kFAX4a9h3n4Q00t5zRUirtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJ68d7ec; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHxT3As9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641GLrHr987930
	for <linux-usb@vger.kernel.org>; Fri, 1 May 2026 17:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=X8L41HTjzwq
	EAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=; b=JJ68d7ecr92fhgl/HWK/jDP+OHC
	6Db4pkn+9aHdJUYi84pIFOP2QZMtTpoxPPAhjmA8Ge36aVkWLPDDDQQAxUSjt9O4
	KCqtRStv173QG0nQ58qswXJ7lkkuooAKI26g5XZIdGL7T6LAMZ1PfnHnrm3TmScK
	x1abk81zRyPZ18SiFn/mg/w6MYm7r5OnU4KQuHYafXaqiGlcH1JHsSkTVNK67+xg
	TVYYcEXU3VqwZMf2pEAuv8aocNs8LXaTPCpfBnR4G6aBTfsTRiMcWrmUoum8yhqP
	O80aYu9/AE89+D6Ipr9F5eLvyqltCAofhbiXkxuaze8amuXBKacpobUcP8A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dvjhst3mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 17:06:46 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c35f2c09dso2905063c88.0
        for <linux-usb@vger.kernel.org>; Fri, 01 May 2026 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777655205; x=1778260005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8L41HTjzwqEAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=;
        b=JHxT3As94VHYIqFCzxd889OfCbA47FVKKm0mA1IHm5fj3/WqqpJXjJhep6/hAklsBx
         Rlog9zcQGIHaEHi75XfAyGzKQJ6iPxynhXCBsjigpA8Svm+dxU1tuzjpa7mh3hkHU3Qe
         FsKBF1l8wm/8ytTQt/+uEBTmORJcZ1a7INQmaUrgLuwL7HYLfWYZSqMl5x++opoEXUt5
         oAKpQrV/Xu3DkLrGoHfZoXh/jBg1cHgbJmfAlu6mkfxehVp1ale+yLPD2wxyQYoqBXBe
         149kpRrUcSnbJa2fJkyG3F/c2uyTeltFVfWI1h0eW+i+J9D2U6t4RUyM/5gVMcAHx2a6
         iTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655205; x=1778260005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X8L41HTjzwqEAHHTicu9WDnxJN0Uofe905/Soc4E8Ak=;
        b=hO0RlmuUqiLCEql0LqAXnLRZFY59wmap9wd1TNFUpPTO4QDPRVfgzzHBQ4EARcx0jT
         OdovE4QrEj1lav3GoYumdK54Z9fI5jr589gZsCtE5VZPpiQmJjU7kAJkaQBYcxXVktWN
         else/rTN4Ns64ijyZtFgmWaVTI2fovwaktkswv9ySpUyeByyats2WnqT2jU+63W2p0ue
         kkWlKngT8Q1ftEwcAhodvz+xTnelCqvSSPfwQkaWWn6jB+KvKsQ7rbJc48NDGV6VbkXB
         5CHYRBZgZJ9v79tbbZx4vo/qGX1HnxC5TZejSYtRsU5UAdK4A9gkktMqww78xW+pXqAq
         Aw7w==
X-Forwarded-Encrypted: i=1; AFNElJ/wdzq4ek5LcjQ9+ey8+kZpm/XkZvWdjRcB1uIIBG4RZUHlT89I7q5M1z7UIDzplI8R5GSrZ0NYjzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvNGIeXhcpYG67pgGM0KyFRaSqcfRFUNMTAhLWnW1W0RU8zucE
	IvjY+bnWdj0a5gUMsQ5NyX/5y5TxDPjMaIbmgIENzGXCPJ/0bic8t3CPUISP7wNgFfQ9Ci1LebL
	9KTjrPDk8hDSD6ZqUmpb/s06SZlJPxbUtZE6EDKid1Zvi7dNchcahW0P0mlVFspg=
X-Gm-Gg: AeBDietET7Lnf3W5eRq2h/Q/AL5TNhjR8+8lNDieA7Ws/7lvnZmgZqBb77tsBqKEHXf
	Wr25zmVQy5ruOCeB5r7IT88rP0YECtrJacvtUF8aFtbvt91EPXQpPiwGgAd3o79m9oWOmsAMPnc
	h50lPz4OjtQkWGJ7b6uTWHFbOBKDNvwCQeH4ytwtBnA/B9+brjDY1sHmlK1A6h2pvDokzTTyImG
	14Y6wRpzLEr0N9R35rmQddfG4VB9JtdJrvAjm4WaQZJ4FM/exJJfd+fFviZrrDSrGfpLihlSsSr
	NJw1dIpodIhAaFvzQSJYJkAtE5aOhdkrSzYdOOixfUqonruEWz7kusyD15TcMiM/YOVF387DxW+
	QrVJoYI04oUDsq1MeYEWDRvx2zSyVGPbn2Lrc2FVAr6ns/+wVPkcz91MD94/oNLxNGo+F9JZh8s
	Sn18RSmPUgFA==
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-12dfd821474mr50083c88.21.1777655205166;
        Fri, 01 May 2026 10:06:45 -0700 (PDT)
X-Received: by 2002:a05:7022:6187:b0:12d:b2e9:b20f with SMTP id a92af1059eb24-12dfd821474mr50073c88.21.1777655204606;
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3537d300sm6655978eec.0.2026.05.01.10.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 10:06:44 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] arm64: dts: qcom: kodiak: Describe EUD UTMI path using child node
Date: Fri,  1 May 2026 10:06:34 -0700
Message-Id: <20260501170635.2641748-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Br6tB4X5 c=1 sm=1 tr=0 ts=69f4dda6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-Y8wEhFFMILef-Bpc8oA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: EZDa5OpKDUzZg0WeGrl9zumKZ1aa-1tK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDE2OCBTYWx0ZWRfX2nQ7p6adtqGa
 wJ+rfBwhHCDDclNvX/HSLgs/ifTvyrMDuJe6H7eC1XVbRrY/dtAhsz39udJ8F4wQsZBYdEMfqfH
 1mrIuPi5z6i+h3wfI+mPaQWBpylA59jl8+F0O3Fh37h6C9UHEtHMS/qgONLH9Zd1hte6bB8HD4k
 0M7VQDZMgzTr1xzXTrKypGYyjDdQDVMCIupU0PZd9+QYNTgsINjdf9tSiYZdut5Ya0htP50o36M
 HlE/AFZufwH9gxZgz6+JDUj39yUxthKwZmZ1z+4Mv8UsMqhNDCQtPKcsWTd1IOwFqTegVjoE+Jy
 FeNkuMWGHX+o9558MY1rQbLdy+6dl+GZg6PZ1t6YkkWRIPqHXSy0CTGH4COk9BS6EreUzGqFU8T
 DfG/nqkbtveqrScZy7K11kE2QPpNK/0qULvkCUYsVVTLJqL1wG+/N7yFTZ1rp76d3aySLKZxvLo
 z7Dqq4fgl1IXsxb/4Gw==
X-Proofpoint-GUID: EZDa5OpKDUzZg0WeGrl9zumKZ1aa-1tK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010168
X-Rspamd-Queue-Id: 3970F4AE770
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [6.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36829-lists,linux-usb=lfdr.de];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	GREYLIST(0.00)[pass,body];
	RCPT_COUNT_TWELVE(0.00)[12];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.684];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,8c00000:email,88e0000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,0.0.0.1:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c09:e001:a7::/64:c];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Spam: Yes

The existing EUD description uses a legacy single-path representation
that assumes uniform UTMI routing. This was sufficient for minimal
configurations where the USB port operated only in device mode and role
switching was not considered.

Update the description to explicitly model the topology using eud path
child node and add a role-switch declaration to reflect role-dependent
UTMI routing. Also on this SoC, the EUD hardware intercepts only the
primary UTMI path. So remove the USB endpoint mapping to the secondary
controller and associate it with the primary controller.

With the UTMI path now accurately described, enable the EUD by default.
The connector side of the path is left unspecified, allowing board-level
DTS files to describe the physical connector mapping.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 35 +++++++++++++++++-----------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 988ca5f7c8a0..cad1d78f9e62 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4400,12 +4400,6 @@ usb_2: usb@8c00000 {
 			phy-names = "usb2-phy";
 			maximum-speed = "high-speed";
 			usb-role-switch;
-
-			port {
-				usb2_role_switch: endpoint {
-					remote-endpoint = <&eud_ep>;
-				};
-			};
 		};
 
 		qspi: spi@88dc000 {
@@ -4729,16 +4723,28 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
-			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				usb-role-switch;
 
-				port@0 {
-					reg = <0>;
-					eud_ep: endpoint {
-						remote-endpoint = <&usb2_role_switch>;
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						eud_usb: endpoint {
+							remote-endpoint = <&usb_1_dwc3_hs>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con: endpoint {
+						};
 					};
 				};
 			};
@@ -4965,6 +4971,7 @@ port@0 {
 					reg = <0>;
 
 					usb_1_dwc3_hs: endpoint {
+						remote-endpoint = <&eud_usb>;
 					};
 				};
 
-- 
2.34.1


