Return-Path: <linux-usb+bounces-28849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB81BB1EA3
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41AB617EAA7
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA226311C3F;
	Wed,  1 Oct 2025 22:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dKwbLIsf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A236F27281D
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356343; cv=none; b=B4Gp7YUmlPzAv7viz8Y2IBCNwfVQVvqIRWIqBZ+0ZL2Vi3tgHEfh8RFn5W0kvGhZlpuNOxO5SViUwNW51Se6L3VbgBjk8KgPn4hQOSMqTsR4N5TE2MHDoQNvYmRfTWjMOuI9jKLU/5jvLgxxLbXGekFsgKrZRc12O19t2ON150s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356343; c=relaxed/simple;
	bh=TVZ4vO3uGIzpCM4u8IVGrjfHwbiG9Wik0Cp+NPxTO8o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hDV8IdVqKVxZYetulrSulOtI/S4uCKUYn0kJwk+vL8YzRv9zZKyO/8DDQmoYpbSnt724uIMY/LO6nsY6iDKL01F+RTfVZ5dLs+sJCnEOcgxwq2hskycEMpmrSYXpkMbZOEsDb4dWj9nvKpKssm7TJjcGfgjEtqjwfAYYMz1dLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dKwbLIsf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcEnv012624
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AmSkEJDa8qK
	4eI1/7mGS5TmnjFBscoeycTZ9zBe5108=; b=dKwbLIsfNPcO+ULRRhRe8w2TZNd
	u0L3Z45LLgosIMKpaS2NImZTRpqIK6FbG1ReVPFsh01J39vhuXQixvDGODvTcw8+
	ch54TADP3v3w+SdQaAgftGS9jpjHQCNcAM3Ljr31+no+3EEd/TVqZFviw6kGtxhd
	gNIdFAl01QH7NT3/qHFliVIBz4EkEl08G0LjgZQsvGhy4RB9h/YfaTkRnexXseOA
	GGcpRMxSgEVyj7CQ7kZYv1GHRR7AkmWsta887au533dP75ZZBppTu/TFaHS8Y3r0
	2EVtTA/94Rl8ZW58aCGEmfsSP7JskCRX+5azKAdbTvQqzGGEPz9AiXoJptA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e80tx5ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-27ee41e062cso2945225ad.1
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356339; x=1759961139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AmSkEJDa8qK4eI1/7mGS5TmnjFBscoeycTZ9zBe5108=;
        b=YtMkisqnn3OXxkv5VL2ylu4DImzRwgcTaw2VgsqUyGfML6Fr90i4XC7i6dXO3+6db4
         Vzwt/+sJi1Sf1iqz4zl4vdJJEY7kB3M/bVCLrfFnLLXwlhtbWqauAPDLwSpm5D/cfir7
         Z7OM131gQ0vfHFoiovRhBBcG9B+Ty/w1uSBWxKRBLjdXr0xsD8eMKTT6NvAjGXPY1Ekx
         xq+OZMS9mSuaJ96ZQglDKoI/zelDqwbXKIEOXqGEApvLfqw9v4x3Rf/u5pIS3HnZavXT
         Svlyrk5wTR8CrJCQbzqmuvWqFoXKJl44dxl8wzYvU9VxcLtsypYzRSSD2O4Eo+8KAGcg
         HHcA==
X-Forwarded-Encrypted: i=1; AJvYcCUKNhvAmE2qxPxc+H0rWw0ifj9WzE+sPXlrpQKODdS0LwBTOWrsJ3qwrt3IVely53xKSmfDHG4//8I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ToZWmVm/o8CGsM6Xsug5DlkwhQPifcRUtkH5AddLC1uNe90k
	sAqS4OZn7b6DId3Ti9/Lp1B5ZdoGq4I0d5AfTES2reJM3GGmG9O1qd7IOmieoQ9QQvu9XxDMMhz
	ibpIr2+Ecg7pHIX/qp9AyKRt/qhtS3YhM3qsEAfwIKDq6cCrFMrBEu39O8l1/LyM=
X-Gm-Gg: ASbGnctDo0vHiccRiiryZ2j3Wv43vw0NDHbJ5QBCu80nkuB6R+KVLYzC0lZQI8TS88w
	P0BBEgcXVpc2+vT66aHdu51neQnhBxdyhJj4sm3n3UkOGbOiQd+JDDuKeGPvbq2FpGbdG0eE5Lt
	5KgYgQTgf/0UwlZwwwCph9745TMLBM75mHyj2Eek0M2YzCQb3vWdNg8vCi/LCrsRMFVK+xHhlGF
	QCU/rR+Qvh+iDwHU5lL0MopjCQSQm7WFYgOzItQe+QJtTAciA7RSlPbuMYHK33ojISvZrp/hTMy
	h1DfBl2++oka/lUk/X8ZpUryxugXiv8JshvzvMTHS1tFAggJAv/KNgAHDU6Bnk1z1LP/k6a2gA2
	qLVV1RC5HwPNmHAUMz2WNRQ==
X-Received: by 2002:a17:902:d2ca:b0:26c:4085:e3f5 with SMTP id d9443c01a7336-28e7f328c06mr62014615ad.50.1759356339082;
        Wed, 01 Oct 2025 15:05:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhj3DfDVsTx4QSOHS/bgok/IQ+EqC9h4ebMhcNTaCNyglT/+UWr5/pqQ8NnXHTWARe0GdZ6A==
X-Received: by 2002:a17:902:d2ca:b0:26c:4085:e3f5 with SMTP id d9443c01a7336-28e7f328c06mr62014215ad.50.1759356338559;
        Wed, 01 Oct 2025 15:05:38 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:37 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Wed,  1 Oct 2025 15:05:25 -0700
Message-Id: <20251001220534.3166401-2-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
References: <20251001220534.3166401-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAyOSBTYWx0ZWRfX0G6N0sT3uctZ
 2XGbFKN9XoXVpUq0b59EeDnf1rmYvVO5cN6u52NoEAEHBpb6tU0QEkl5cHDRz9b6ObgwnjronTl
 U5lbvrXo8dLDFuHeKz1ebSaAttgVBVpUabitFjFtCtVNpbo7bCdgHM0Q/jJtyln94r3emvLYgzo
 IyYGEq+cwAHvtY5yxxna+bBX78BCTOYeRtiqVIo2sm9ppigGQDVcoLY1wZlLDt29Hg1CqG0vkS3
 7KEmJ4FDK438TgtEpftqEY6BKBBWvXcaXkUIwLKLiSx1goaycOCGznBhsVLU4bmmHRkcZ9mGUwl
 xKSFK4ugxc/FbNf1LBvh2FcMWeWpq9UR4MJIOTCr/i38RhqwRN2yz83COt+dZ+zdULWanWxkHA5
 Sr6s6cHUSEpjxI6UJtf7lZVbvJwW5Q==
X-Proofpoint-GUID: pb1OvBb1lb_qf70oNUBuYCkoIHi8exuw
X-Authority-Analysis: v=2.4 cv=OMkqHCaB c=1 sm=1 tr=0 ts=68dda5b4 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=eoTMOhb7NpBO2Q1ca4UA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: pb1OvBb1lb_qf70oNUBuYCkoIHi8exuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270029

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  This adds a new requirement for a clkref clock-name
for each QMP PHY.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 76 +++++++++++++++----
 1 file changed, 63 insertions(+), 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..377d830f0855 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-dp-phy
       - qcom,sar2130p-qmp-usb3-dp-phy
       - qcom,sc7180-qmp-usb3-dp-phy
       - qcom,sc7280-qmp-usb3-dp-phy
@@ -41,12 +42,7 @@ properties:
 
   clock-names:
     minItems: 4
-    items:
-      - const: aux
-      - const: ref
-      - const: com_aux
-      - const: usb3_pipe
-      - const: cfg_ahb
+    maxItems: 5
 
   power-domains:
     maxItems: 1
@@ -63,6 +59,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -105,6 +103,22 @@ required:
 
 allOf:
   - $ref: /schemas/usb/usb-switch.yaml#
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: clkref
+
   - if:
       properties:
         compatible:
@@ -113,21 +127,45 @@ allOf:
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
       properties:
-        clocks:
-          maxItems: 5
         clock-names:
-          maxItems: 5
-    else:
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
+            - const: cfg_ahb
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sar2130p-qmp-usb3-dp-phy
+            - qcom,sc7280-qmp-usb3-dp-phy
+            - qcom,sc8180x-qmp-usb3-dp-phy
+            - qcom,sc8280xp-qmp-usb43dp-phy
+            - qcom,sm6350-qmp-usb3-dp-phy
+            - qcom,sm8150-qmp-usb3-dp-phy
+            - qcom,sm8250-qmp-usb3-dp-phy
+            - qcom,sm8350-qmp-usb3-dp-phy
+            - qcom,sm8450-qmp-usb3-dp-phy
+            - qcom,sm8550-qmp-usb3-dp-phy
+            - qcom,sm8650-qmp-usb3-dp-phy
+            - qcom,sm8750-qmp-usb3-dp-phy
+            - qcom,x1e80100-qmp-usb3-dp-phy
+    then:
       properties:
-        clocks:
-          maxItems: 4
         clock-names:
-          maxItems: 4
+          items:
+            - const: aux
+            - const: ref
+            - const: com_aux
+            - const: usb3_pipe
 
   - if:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +180,18 @@ allOf:
       properties:
         power-domains: false
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

