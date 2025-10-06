Return-Path: <linux-usb+bounces-28927-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE81BBFAB3
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8611898767
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38886218AD1;
	Mon,  6 Oct 2025 22:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BPSHGI4n"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52962212566
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789220; cv=none; b=Flw9u3W+jNm/VA1024N3oTK1THcji231396EN6GWtWoTGiH9yY4qegN2Ff570qTDOFvd0GEO+dN+NCM4E1X0/NZaG8Rsd/iBUT2yUMQlvGq1VM3aqEkSGQ5plCalqYMnLynW3oItJXYDRBTs22zgGrlmZ2qoLGPe4MZihi+jxj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789220; c=relaxed/simple;
	bh=WfcBDR9DIRDJLIXrzb9ShDflaFdoNyv5c5lXHKgErm8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GAyqV52FtL0X4Lssi6hxIK/lcx26rToDnc388psqgdCKKym0Ps4BbQWrl4JVLMAIueJVcnLq/ZJ6yGOdLppIpTcpizDV5MK/qAHKpiPXXtnLOcETG319PeGf+GBT0o51VM/HlXjhCn+Q5pzmITWlG4T9xz8YsHFOkCw3gfeGD90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BPSHGI4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EmORd018960
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kwVAXCKZYFJ
	vmBevVk49WwQx9cQq3YCpTTCCiPQjazY=; b=BPSHGI4nNgZYIza6e2xmMVNUpKh
	AgFkqW9hMAneI4jZIFgIcS7cEooZYKTK637AE/muzQkBEC84tZ6pe11M07C5HWTI
	2xrMwQWOP+FQ9mxK1fQdpzuwOaB+frF84SHXDxZQvi2evIVsqYhuXWAPZ3kUNp7w
	HX2likY0LEshp2HRmJMklrty+/QQBw+sntnrTwYG/ZJQFRufrPEgoD4FXj9oavO0
	2lkV/nYw3vrwvzntqXTwOUuMGh9IWBk0U5wJJ5H3vXplWuTjgy36rcfm+DpSrkEV
	ZNFULx97kOltnHz19G97iv/XhZD+SFaLrk1jfA/BvtkSmkMA0SrJ2IrEBcQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7n8wr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f5e6a324fso8485867b3a.0
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789208; x=1760394008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwVAXCKZYFJvmBevVk49WwQx9cQq3YCpTTCCiPQjazY=;
        b=VAolxQJS2DZO9yAhQuF/8S9VFv3XLHLK/rv1s5RA7lKw36y97ay2RD1Nac1xcyFkVD
         fWVh07ecc80kCugkPvY4pGXQqi0c7Fj0MQBH1rrOaCjkDNJmZXCJ/nht+6kCF+X8esIc
         4kN7/roS84NkgPQFL4hUrRuelEmkZ4ck+KOQaxuIGqGelu2p2jBjobW7aPvaOsdF1LML
         jUuhVSWkPphZOBJTfFNwARgnHGngvt303Oua51reyANqGwU3+8v1xbEDjXwxMbkQ+je1
         KfKbQw0qUJEjBvReD1rWgwKk+KzaXua8IqBWUH7Gy+GqglmfJidYp0rwj98pW6sT/kCj
         GKeg==
X-Forwarded-Encrypted: i=1; AJvYcCV8BZRHRHUAaYReg1R0htfJNCXQUVj/KdUALvThIKy+0ZFE31wjmTX7Wm4R5AhG2Qg/IEI0lizU6b8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwK5mLhLMwvo4DdRYKIcrpsmW0NgtWITZwx4AcsxcHPwGDECwIS
	CAHqt4t1lA0z6BVxrCi9WCVn9X256PsG0E9Knz1MQSQttQbGWhxgRsfEh2KGL2NZjUeYCqPIk2+
	uJgZgXouODK4Qv5Eu1xfu81p67HhfDWKrck+LQKUYq4EwYZb2kPF2DLhTZxv4hFI=
X-Gm-Gg: ASbGncuEbUf/TGmnlD1zkxbMD1xaJh03ikygE790ydWb8aXG4prk55ukJLZzRbhFdYv
	6ubDXqOZdqXlpA6EI3lkUpAOQvQT00S1/3UKeAvorfrGk/48k3v+t2L8zjlArIzVllye47k8nh0
	HiyxA+Nt7un/XVzrnt8Hh63qeaRIPKVPFlN1HGssmZdykGyBOBuz4OEbCCr8nmFXHzr1GbN5gYA
	JRQ1i2R9T0LRib2vqGxxnyM2W9KPZ+ug+ziRkS8BT5dNr8qCeQytUmgU+KDN1OWieo2oz0UiN4I
	GWrZkOSzkIgKIuFvDx/1rTDPuV/4qbMhKWgYCBIZNr4bzDVDGZdRdR5WNDcTbihjE8pMjx5dpw4
	Tzwwp53YVcryDnTcDI+xuEQ==
X-Received: by 2002:a05:6a00:2305:b0:781:1bf7:8c5a with SMTP id d2e1a72fcca58-78c98a40a3bmr18785130b3a.1.1759789208248;
        Mon, 06 Oct 2025 15:20:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5R1SLObP0kiPoqDNLoC1YWFmO7iQQWvlu+1UAlluy50qQoqzliZ7CViBxbPnbk0mDKuzpGg==
X-Received: by 2002:a05:6a00:2305:b0:781:1bf7:8c5a with SMTP id d2e1a72fcca58-78c98a40a3bmr18785097b3a.1.1759789207808;
        Mon, 06 Oct 2025 15:20:07 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:07 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Mon,  6 Oct 2025 15:19:53 -0700
Message-Id: <20251006222002.2182777-2-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX4pHcIHLt4HBk
 zR0jcZn8cx4wJoWgMWGBP/gBpwC4MZ8h+m8x+RwlW/BVZwCO0rCx/H1iXrOXdweawyGxbDiypyg
 +JZWBDv7suKK0H7ovj8InmbsmunkqRv6E6e7jw2BsTxr91zDif2QJmNp7uPKZjSsSYPkRuFhorZ
 0swifVrdtEE4O44OoDKAme6eTzy0oYWHDuC9NPpsVyuSVsm+SckFWh2M3e5gudrKLjPPUz76nZM
 KoB7pw4E8V5/7QKagXcjvfhZztTlraauFQlEqMWA3uaak0Mn5/iORSc8DWmMkJ3ntwqQzIKEzNf
 s7syG9+9uf6VfBL4I6lcfjPMCn6/Td4XWRh9bMBPTYagSdGyVyTZUMzAt463QgWCiYgBcep3BtG
 NmHOwPVNFWnCKMmTrhCdQ3ZNK4nSYQ==
X-Proofpoint-ORIG-GUID: b2Y5cHZJ2A3w7Se5886o1sx51bVPFJfT
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e440a1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=7IGZojk4TMugEFbIs7wA:9
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: b2Y5cHZJ2A3w7Se5886o1sx51bVPFJfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 72 +++++++++++++++++--
 1 file changed, 65 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..315723a87f4e 100644
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
@@ -105,6 +103,24 @@ required:
 
 allOf:
   - $ref: /schemas/usb/usb-switch.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,glymur-qmp-usb3-dp-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          maxItems: 5
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
@@ -117,17 +133,47 @@ allOf:
           maxItems: 5
         clock-names:
           maxItems: 5
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
         clocks:
           maxItems: 4
         clock-names:
           maxItems: 4
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
@@ -142,6 +188,18 @@ allOf:
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

