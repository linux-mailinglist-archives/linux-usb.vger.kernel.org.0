Return-Path: <linux-usb+bounces-32437-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D09ED389CE
	for <lists+linux-usb@lfdr.de>; Sat, 17 Jan 2026 00:23:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9AFC130FBEC1
	for <lists+linux-usb@lfdr.de>; Fri, 16 Jan 2026 23:21:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C64C32825F;
	Fri, 16 Jan 2026 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QgIyl2HZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F9VfDtcg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B420A31ED63
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605679; cv=none; b=tzRy0I8KHK1IyOFJQMCAUzDj4x2FeBkFcUbelzskZp1LTwPkIt/86uNxJr/DFIKWzHs6D01OMH4PJqEI5jNZaSgg0LoO0GCi6i3amcCin6RGmyA6DgSvymE+Tpydf0AtlCQhhyqOSo3ZWr/NMJxSxAiOoiO1XUaIfYJhpby1lTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605679; c=relaxed/simple;
	bh=v0VM1AbyGegd/JoyrZJcZY3z0tITTBhEtE8yYszRho0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u4HA5fzzexjIetgVN18++omPQF3xEqYyYQYiYLNEnTWKvIbIanQFv/xhgaNaum1jxfJ6bP182gFG95MB/5M1AVa5SybeCSGjAkYIJ7vv3glbv9QVFP5vwlHF0F/ANx0W3KHz8+IVd65hn0xoc8Amk7xmRJ3trXfnfGrhDKRfO0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QgIyl2HZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F9VfDtcg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNDp2x2647869
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LXiIQXFkT2b
	H+u++kC00u044e73Da6D4+783FXlcB7Q=; b=QgIyl2HZwu9EHWDw5czg9yRsxmm
	lufX/DGKoG7BNEyv6Rrb8cCgziMlfw3qSSD/yKIO+1PvrNQInKOeLlwmpwT+Ygon
	L7JBj1zT2e/KZ+FK3vC5xPvoKMGzUU5PDEirBpV7+RHAReaxnDdZ7zCsxCRv0TOA
	wzc11R/DTUv1X8st12KzWwL1NLT7tSCGg8vUxGaLXTgqUSprwQPSAvjR71rDmtn1
	UyduFWWrXhDEdjmL8hGH0kRUyxvdXJfFdDVNjKfFu/qmzUGyd/CIKe42hV+WztIB
	HntzwPspaykjZ2lgQzRZshe34Mz3O7fUJrCKbJYItDWuBrx13ZmPffQe+bA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvedrbjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 23:21:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11b9786fb51so15704685c88.1
        for <linux-usb@vger.kernel.org>; Fri, 16 Jan 2026 15:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605674; x=1769210474; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXiIQXFkT2bH+u++kC00u044e73Da6D4+783FXlcB7Q=;
        b=F9VfDtcgwqaeTcMPdgKTvNw20Jh3dsSwGPhiVDn65rKW5OrSvTLWaMGlCoh8oklHqE
         wKo8j8QdACMeGPVT4ryCOV1Idf6lWLVt/zedOOg/+w5WiHlSLQUm4r2RhEd9ySHixAwn
         hkg941QM5H7LDuhhOb34H01FGAy8110N1zuLwYFdSS1VlgMFi0SZ+SG3lzf9Qa2Lcfjc
         /pns3+dIPHOwaxx+o3bf/OteTVTuNEr0dDkVORuY+XAbB4jmDAVL7006m/qVBvkhEaI4
         hkTAOhfNumIVG0MNaqcBKAHPKOP7tUFIwfg4oQYSZpZk4DC2ldHQFTN4oQ9sBBLEh/oY
         bImg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605674; x=1769210474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LXiIQXFkT2bH+u++kC00u044e73Da6D4+783FXlcB7Q=;
        b=DyB0AuzFZaULd976psIJnQBhe1FNTTHqu9qJT6fJhoJsUS/eYdBHcm06maj0xVsvxV
         ObftIdRXOvqdHEMwnlAFiWben8gErp/bQMc2yX5QX9LX2P2/0IrAkNomB9+N1pG8ycXt
         6cyiEBj0lHl3Ug3SL0vvFI1FypKxq3QVZZFMqx+gcpM9h+/5ruAy1aC6EtRQKxxDuHbD
         lf8xdPnPPYO/qab4Nv7Qv2jch5BBqQLi2CrHzJiVvn+T7aCu5XtyQQoqu2Fzqfdxm2xN
         UQM8mEoOLVWGdKnySvBUSH+KHG4Tmhaqh1m+71Vsi92zEk4xAqxor+9myCzOZWylZcFX
         9Bmg==
X-Forwarded-Encrypted: i=1; AJvYcCUP7YScj+bZxGsEoh4/Wh/71PkNTW8ZO394fjY17nHIsGWcUcZE+6HBKCW6pDWV6yWcCfCGk/hOPOk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDttVNmJNb7uyFH1dCT8vP/eMYQdgpWlQeJpplXWntxd1hJ6xk
	Ku38P3YR8/GLJAn+NmYJlqL3RKZ4gJ2uI7icyDpWWxqJh+GzfskwmteFKX0DsmrDKVTqbPO8Xlm
	F0Kcb0/+/62HuzI9yAmV9sdXxZBGPKHJO8BID1HdNmJiTbiEvpNX/eidZZQOzzfI=
X-Gm-Gg: AY/fxX5fhfdey4p5gMj1UPRcCr31gG3sgXhrpND9YqlaWOKX3HLrDseCibonln9gtmQ
	rx3PsGuaVZXKs9us1rtBL5GWa0OlKw5YnQPfCNyr4eLzNZtRdkAo4xpI4EUKcOJe0kcaKf3VITP
	TPLKDULJ4liLaGYaQSpVj6VjZq8NuZBVQpW2hestpIqNMeO5ByTbEk4toatM/5t3RDTXscU40qK
	1bVgjH7ey52skhKwTBYwM9XS5zHY72RxwTpw9goab+r1xAolm0HgGOuHu7MpG8qwhtrRmbOIrAO
	vwl8GLryYJze2QljuODWmonXRMmHp421zD11f/U08zNmQxG0UwR2lKETXhH30jUN8uNTMUbmY8S
	J+3ASCW+rqFdTDInA+6zZEH6H7GQwtX0o8oZU1t73CMroGOgoiWFsZ1qFwDy0b8Y=
X-Received: by 2002:a05:7022:418c:b0:11d:e2a3:2070 with SMTP id a92af1059eb24-1244a7a208emr3987803c88.44.1768605674369;
        Fri, 16 Jan 2026 15:21:14 -0800 (PST)
X-Received: by 2002:a05:7022:418c:b0:11d:e2a3:2070 with SMTP id a92af1059eb24-1244a7a208emr3987785c88.44.1768605673885;
        Fri, 16 Jan 2026 15:21:13 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:13 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: qcom: kodiak: Align EUD node with binding
Date: Fri, 16 Jan 2026 15:21:05 -0800
Message-Id: <20260116232106.2234978-9-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GrSmg8YCDcncaSERF6hXr2ID-RsB0iTV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX5BiAKqJyAMpi
 pmlFJNV0Iltz1R7G1DA0w0SWmcGyKHPzEVJQ4V+gNx292btBs5LBzEkw/P90HkUxWvvsrIzPTSA
 l9qzeXRhj4/lRBXWjn5JpUoj18w2uaU/YhKmnTVpgc/orzyqAWNPSrCSDyynlaXWfATVajvgRNc
 MVRJWeuozvS+J6tnUV2Uj3thbm41sKsSCmGXaiZoT+sT+Ks0qauQUwRGKSUzYCawPGoSuzKENtX
 6PTMNBxADEPWhND6/MYc1dSwjsODYHJiig2aj/kDDRJf/QYt3eeJQum9/XMWJxvq1kjBG7ElbcL
 x6neRCJvglirexv3GBOn/tbXjQ9yW0R7x2vjGEdodEOuVoGu7P5hQmyyDLmObMMJUagNaTnNkE3
 RTWxozogsDdiUxy0gcTNKp7oRYQ3iVRP6NvJ1lLqwDP1cOdzBa86GtCA8QkJypSJLeTKYiq5s8z
 w4p4Lto30+JbOTxCUzA==
X-Proofpoint-ORIG-GUID: GrSmg8YCDcncaSERF6hXr2ID-RsB0iTV
X-Authority-Analysis: v=2.4 cv=A4Bh/qWG c=1 sm=1 tr=0 ts=696ac7eb cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=OcAoOLw2Dr_w_q-oR68A:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

The EUD node does not match the current binding and maps USB endpoints
to the secondary controller. This SoC supports EUD only on the primary
High-Speed USB path. The binding also requires a per-path PHY reference.

Model the primary UTMI path as a child node with the required PHY and an
empty ports graph. Leave endpoint mapping to board DTS files, and remove
the secondary mapping and associated ports so the description conforms
to the binding.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 33 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c2ccbb67f800..35c47a6b03f7 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -4284,12 +4284,6 @@ usb_2: usb@8c00000 {
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
@@ -4610,16 +4604,29 @@ eud: eud@88e0000 {
 			      <0 0x88e2000 0 0x1000>;
 			interrupts-extended = <&pdc 11 IRQ_TYPE_LEVEL_HIGH>;
 
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			status = "disabled";
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
+			eud0: eud-path@0 {
+				reg = <0>;
+				phys = <&usb_1_hsphy>;
 
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
+						eud_usb0: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						eud_con0: endpoint {
+						};
 					};
 				};
 			};
-- 
2.34.1


