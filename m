Return-Path: <linux-usb+bounces-28630-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20919B9CEE1
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:52:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 241B21BC3D09
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:53:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735732D9EC4;
	Thu, 25 Sep 2025 00:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YknGhvU2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE92D8398
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761557; cv=none; b=V/Po02ikOtj5ni8fhPuGoWeNt0Az+SQjVFkn8FOrS/+ek5Q8aaTUcszqqdm+lJLXLd4uSB6KWoGB9uXY/5slAoGSiZx85jjAVgyRlgRIsdrnxX5lQbsbnCvbnUK55Ga/wi/VKzNmjLe3uSmKZ4p5QUFXl5M1BBlMeQAGKl/DOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761557; c=relaxed/simple;
	bh=hRao4UrERcNdb8WEbncfpT8mndQ9UcxF3KEWBpC5u2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=n37yva0YY5YMki/UHGrWl2WbLLll/3Y/46xwmT8rnOnb0lvr6OmoKx6dEr5F+H9DsPtV2QWGI0evf6pBNwczZbMkxLVYBIEal9EWdNv+AfNHdy8QKE2sjvB6m+cEdyfM4/Etfh+gfTbbBSPcvQbXfwS45Pe1EgIGbPlFsRl7k4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YknGhvU2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P02AVX025120
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Xn4sEHzNAa+
	rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=; b=YknGhvU2ad4B5JZ51NAbfxbq5CP
	B+J0ADTRSvaUnyAE2Gcf5XEivQcaFbrm6sd8D3am9X2WkrHM1cHcqILtRCigmr0p
	6h7PjnUNdR104FzHy3g6quV9LhDHEwXcAMr/DTy6o1K5CM3JYkwp2SQc/eFb3slP
	HB1IMrWHSO1XLBdQubqvW1C1iHUiehrLFGvyjlqtw6oEsTyizlIg94E1Z4EhWIHk
	aREXCHASackBMHLWFU8Ij7o+QAFxNLqMH58RP7UScN4TN5BfGb4fCbegMZJe6cjf
	zJuegYMpa429dvlImEKhZBkbzhcX11w4n+2Yv2PjE5y6YzeeHdTi+SIceNw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv1683j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581ce13aso6721135ad.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761554; x=1759366354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xn4sEHzNAa+rFACXl1zYTLnQ9MM2kFlvsIN0wm59uEQ=;
        b=DqRfC8TlvJp1IK+ydqJP5dv4zWBAPK3I7+wI3/9ZKize/Ma0w3AYEMI5BPVVVaTI9o
         TM9mbWFVIsB4BCWqVpz9n8ik1M1bzSYZgPOtXTXQ237wn0PoSStk3qVXUn9x2XbKjPrx
         m+A6MIaBgpIdpesZZuISUlGpf+0f2kZfQ/p1dTxrjgOZrjtIQZSqAEyXGD4c3pm8nb5w
         FVffpLq943k3/po4Ihvar9CsTC8R6Ljywi80PEtD47j0GeRbVzJbCkGukfGqOaUury7j
         gXlQhh2QajeCOFxZUnnhhhxxHHwGmdrGSRheBDbElHV5QZxkYoi+V0ADKrtUORleaIJy
         B8dA==
X-Forwarded-Encrypted: i=1; AJvYcCU3fDpHyeDRmG+Q2a7wwtd4RGJ6lw2CJcVvix/nT7mvd1+ZaSxiPGK/DE897rs+aeCNHE814hnNthI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0M6LJuE8+2ANHEOHtTum1PW1gKBOSbhd7pBqUYo5DbUO2L1si
	qbhkjaaaObucwHFPD8PooTl8SngW9ScfLWsIrVCN3c19ViC/DlPzOK1uucNcw9Cg+Q15GWuC1nq
	fyHqHCDO6IvwJOUZF01jh7HXA/cTIV9HTXmb/+BDnsUOz9VWTh4Vup6zqz7bMxiQ=
X-Gm-Gg: ASbGncujhrQRU2zsS7ckOqa122JB3dkZNz7V2thbOqfu6Ls19YPcB66dwAQPNaxMlZw
	426zp/f7vVT9K7RA0Cynf5y+Fia+HZRf8ztYVyKCnowswUCi0IecSNQR/xwdCd2NI9Cj6kBaD9Z
	bCDI/gV0/Z8NIyCcNTzSRQxlOcF0DF+ngp1CtkbdX4h+JQTRGACV4gDgLz8903NcAfLGM69iKvW
	sdqJMprES38ATjVvBjM9dW7NvQJidB3E6Y5kam3c6n+lJYfruJa0S7wI+c947g4Uwdk3KpDsEFx
	TrviHv22YBsF7wm2zzhAZja+vuC4QWTQOtjvXJjQppIX+awwn8L/JkgHpzjza65ZDuIG6+1wqgU
	xLszFKIgCY6XjL838
X-Received: by 2002:a17:903:946:b0:271:49f:eaf5 with SMTP id d9443c01a7336-27ed4a30d16mr18646445ad.30.1758761554090;
        Wed, 24 Sep 2025 17:52:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0BLBhfqoLRlN6qFMkJxr7vlacqg8A7EpkzWtOHvCyZqAcmJHOiOE6WNsUjzSArIKZUFj+xQ==
X-Received: by 2002:a17:903:946:b0:271:49f:eaf5 with SMTP id d9443c01a7336-27ed4a30d16mr18646155ad.30.1758761553655;
        Wed, 24 Sep 2025 17:52:33 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:33 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 01/10] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add Glymur compatible
Date: Wed, 24 Sep 2025 17:52:19 -0700
Message-Id: <20250925005228.4035927-2-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: tj5zYJS9k0uAlAwpSQmXMPTv6qfXBFtd
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d49253 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=tYbxrAoMRz_Rh0uxvwoA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX0caWDy7c5wQ5
 oCZP7JqD2kCMoupwBkKK3cJ1+4D6YPHX1rPPb147sxQ80PYdICCYjVDsW0FbMmG64ZApHJUvXKm
 G1BNFv9xIwldT73UoFFgENQfRFzSKX4kkoBpuXq8Blz1hJIAjU7R9ktkPkGd0Sy1MtJ7Kz2Xetk
 6RcgABM367GMpueChFEa8nNxiJ3TrRJ4aj37noeFsHr03JibW5vzFBNaDVaJZNk5dVQJ578F//g
 G8CwCKB/+cWAdqkJzM2dxP4mEp6YO0dZs1Jlm2sH42TNK0D8L5hiGyzLi7Y1zUInekzybCuDhnZ
 SYLomRLr7NX++hhF86l+N5h7s08Ofq6Pyv1/uWLA/MvpCA6SY6PlSx4xOrKsw2fgZRpmI/K6aZ8
 tiXUrqA3
X-Proofpoint-ORIG-GUID: tj5zYJS9k0uAlAwpSQmXMPTv6qfXBFtd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Define a Glymur compatible string for the QMP PHY combo driver, along with
resource requirements.  Add a different identifier for the primary QMP PHY
instance as it does not require a clkref entry.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..2f1f41b64bbd 100644
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
@@ -46,7 +47,7 @@ properties:
       - const: ref
       - const: com_aux
       - const: usb3_pipe
-      - const: cfg_ahb
+      - enum: [cfg_ahb, clkref]
 
   power-domains:
     maxItems: 1
@@ -63,6 +64,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 1
     description:
@@ -109,6 +112,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sc7180-qmp-usb3-dp-phy
             - qcom,sdm845-qmp-usb3-dp-phy
     then:
@@ -128,6 +132,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-qmp-usb3-dp-phy
             - qcom,sar2130p-qmp-usb3-dp-phy
             - qcom,sc8280xp-qmp-usb43dp-phy
             - qcom,sm6350-qmp-usb3-dp-phy
@@ -142,6 +147,18 @@ allOf:
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

