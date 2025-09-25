Return-Path: <linux-usb+bounces-28632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 593DDB9CF02
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B121BC3D56
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7691D2DC335;
	Thu, 25 Sep 2025 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FSWa39dH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C892D9EEF
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761560; cv=none; b=ticSQnzM+3ivEqLTt8BZl28OFh+EspvLmEyj7p46TL7GxYRsL2eVYgnHq9o1L0B7mtg7wdLV+6oZ+WW5mym2+YcMIUBFxhKcL1yjcehUGsyDEi/KTKvDQVC2v5vyyEHZ9VHcpBTa0XiuqyhliRaDIuRwQ7Q2sQTRhaoIYePPkT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761560; c=relaxed/simple;
	bh=cfM3s21T8CQ3sOfi9Dc1sx2mJ27UuKxMJmEc0kjDpws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XtxJRDB6HXNN1XSYFe/lnKt1NBFNVhFZlTzAybqJVioFsYO4r3Z69dCX9NbJnYniIC+jPiQ1W71viPOpBgpQBdpltNNFSMcNmHHNb5hyQJsaBG0V2DRdaRUc/h/vr8uNcngZlQJIsnls8odYybcNO7ooD6K+DO1G5q3Ax6qaH6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FSWa39dH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0VeLV025075
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YaQd3cF9DM3
	ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=; b=FSWa39dHzVr5D1x7oDJ1YZOq1NR
	kqC4z3QlZD4ysF3as5fPvv/NXIKMrPywjeMZbY0nbZQSfgazk1HfpAT8TSwIK6KD
	kmI9zgYXBqwa457Mrrzk0xS1Z3KOT7GvopGTikzmBkLl1oRWyRzMXAQerbek79my
	OEqrxDnX8b1+MRoemETvUc9wrFGay82wkKOZOzlTenaqd6bD12A5IHM/n6JfXdIW
	SEAaifaeNf4hJWjC1hx2XQs01fAebtceiybHFljzC2J7F98+XLd906ndR4JBzy6k
	lIvsityAVOhvII5tP4Iw8XtTOV+nwtzjINiWt2MkDCG/gt8b8dYCpNG6pKw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyexhq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2699ed6d43dso4151435ad.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761557; x=1759366357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaQd3cF9DM3ZawONJKkUUZT5oOk1utb/PQbw+Tb9ZII=;
        b=cNaszDVe/Oa4sn773JTOx/iUDmyuaKZILDqn7u13dQwzU/HYVO8gJqk586ynW9argG
         3hXFxoEOC8ucwxDobGyk41Siac4I8nUEfMWukxB2CnOMVvrgFaFh/u31iz2g3/JAuCKS
         LLtEtnw3Df80BNyGnj5czmBRydBsnKdfXIxJWsBMvzOatF2PlIPw7LW/uhBH/sUkyVu9
         VMhZnueJifyd/OIzzdJ6VTpIRebWGnWpjvIgB8k/53yPxXVzI0QFx1cEYG7oOJcb7BBL
         aluW+Pepn7uAXUlTcoR2Fxr2fjrwSEoS3AGMHEfxQIfjz3Igd68IMdw7LNyGM1MApuZq
         tZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVT4QbbUTH4CJOX7lAjuhCIpfWiOAXfM/qdoBV+nGUk+SsvwspRYiDmnzliRNgPMuEUuk7hsb6PcIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFPWMgZaAoMp69ae/FOCEbPS1jpqI4Xvk+jejtd0BUHhVWflq2
	6drwqEk86XTJXm6p8sDMpnSUhCcSbv97Phhi3A+lQlNZUxsOmnmT8Nfd7Kb+nS+iv6qTkZOc6hi
	aSM+R4XUPgJfuruFKdj+C5x/RdkCTR3kpGruJFWxF4jQ1e9v8YMhEj/twtHAfeUY=
X-Gm-Gg: ASbGncvMTIo3PaZ+tMyS7mvrg52WmgIbM11cGXmtf6gxUyp1f0dbWMzzngAYopm7/D4
	emXiL11DBtxFeq+w6ewJN8zfIE9FIdYWvngIIXwZELOFWpsNqNDAobecwueEfi3ngeiJSqhkrzI
	wS1D5u9oBZ9i8wHF+TuEf62DwtNchn6E/Yr6jBgdSGYJ7ttRT2Vn9MICQho6wD5S6rr31vbBAaZ
	3qxWrqy/CcD4MLisxMXVe7IH1rX5QHYIba4Wu5vgXUQeT+hpMa/RNhhXg8Lygfktoy/XSA2fKka
	rFQMhrgyWBpVJFtpC2cRDSAZa+3mPCd71l1uH95Sg8FmmfmnmveAkDuh5DClCBFYbf4+GxcKl1b
	7pgo3bta+tr3KpHCS
X-Received: by 2002:a17:903:1a06:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-27ed4adeeedmr12621345ad.53.1758761556911;
        Wed, 24 Sep 2025 17:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkdWp6F5xl7z3+kp7g4Jtt7h4BtMeBXJCqbB57Ib1mwFswvS7CDTGv4fLa3p0hqGsMWqWbYg==
X-Received: by 2002:a17:903:1a06:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-27ed4adeeedmr12621135ad.53.1758761556419;
        Wed, 24 Sep 2025 17:52:36 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 03/10] dt-bindings: phy: qcom-m31-eusb2: Add Glymur compatible
Date: Wed, 24 Sep 2025 17:52:21 -0700
Message-Id: <20250925005228.4035927-4-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
References: <20250925005228.4035927-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wwc7Flu81ekCuqV3c9fEdGLYQ6vXh8Oo
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d49255 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dJG6SERxbJy7wEyxA2sA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfXyyMATyaI8FAo
 9C0Z9rSLdcnh5FZEwmb33c7VqdnSFDGRsryJBi+ZM0f1BxqsUu9vXCPNGupIIx8qVoHEjJcEzi2
 9Y1Zbuv83pl1IxT851fHNBfdd/oc0VXoV/ZpgECEgun3Vd9tVvBi2xLGXai07/u+2HtygO9wuTN
 5W7GEqmJzOhvIPLFkeYC7DWe/WuU+34D4J/PxYA3KZYoeY6TA+kZjzXKFdEGeaqZSbBgeu9XqdJ
 1xHlu+e3S16LWq8A1BQllzC++Tn9YJ/L833e4pOfLftaFauT95wEIUw7x8d061mhsRpb+oaVMt/
 zWdqa6Dv5nzlSF7quBp7uZEpYxqzdAtvtGOsXYn7r9PstW778RqoRxwCrLolazt+5kwESZo21xa
 DWoSdNNs
X-Proofpoint-ORIG-GUID: Wwc7Flu81ekCuqV3c9fEdGLYQ6vXh8Oo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004

Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
the fallback.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml      | 21 ++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c84c62d0e8cb..0d5db71e0ad8 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,sm8750-m31-eusb2-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,glymur-m31-eusb2-phy
+          - const: qcom,sm8750-m31-eusb2-phy
+      - const: qcom,sm8750-m31-eusb2-phy
 
   reg:
     maxItems: 1
@@ -53,12 +56,20 @@ required:
   - compatible
   - reg
   - "#phy-cells"
-  - clocks
-  - clock-names
   - resets
   - vdd-supply
   - vdda12-supply
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,sm8750-m31-eusb2-phy
+    then:
+      required:
+        - clocks
+        - clock-names
+
 additionalProperties: false
 
 examples:

