Return-Path: <linux-usb+bounces-28923-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CBBBBFACE
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F78E3C5256
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99516264F96;
	Mon,  6 Oct 2025 22:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CClnthBI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5153317C220
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789219; cv=none; b=sfGiXRtrujr9uuG+uaa2IrQLCPKwJ4c7cis6H68RbLgEWYQduohKqXR/BFC31Cnr1W8rbYbYmkgIHBV33LyNt+vnA859/s6jWH5AVvpo9baJzehlUcilILxEBb1qtRbkX5e0p/THp1TjnO4FXGEZ86RjtA8IZ7v4eK2zLDSfeRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789219; c=relaxed/simple;
	bh=MCbqnX73P4uJn/n4jiAlTVZO9e/LGJ1yW50aiT4ZX9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H3HpH7SqhwxgrxtATVOhmGBcizKiZ3IVWCHMJQ+xBluKKL1kLV+WJfPUX3HYtQlfQgTGAbO8RATqXH6ow+zkv/BrtycKUXVIFlhK3bHRHm8Om5OiUKiuBm2x0R/e4zdpX3fr+t3wTgzhtFsRH/BrUkyhdAfIhzrh349muHJyWR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CClnthBI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596EpFpq020328
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YYQJM1FZM3o
	3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=; b=CClnthBIO3iEJu2ARKji9JHH1mZ
	oYZrU5EOAG++sJKc75hxLdQoFQQybFbSMEDTxbrn1f7xdz0+o3/pAqWmmbjwx7/D
	fH9JtGQp2BRLB/y6qnFnV9FVqdv0k854dRr/2Ie50gOF7GAR+PA2yyumMvYOYPuB
	BXGtAe89GTUGxI2RWWGj4MZXi05BiNxLeanXdvZWPjT2TCV2mgnnHfmliN1f5Syf
	gZzT6YxVH/EvOTlMGKBLJ2Q6XBVq47rGFY1yQH7/06OTdF4TIBBf2B0rlAWHDKRF
	LRi8JioD+LSEIcgM/LYdgFkIPLiGrWLNG0q9+EfuYAV4bR+cl42hYV/Fkkg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9dwhxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:16 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so5097488b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789210; x=1760394010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYQJM1FZM3o3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=;
        b=UJxzOmJEHHGXZem9aPv5fj/nNldSXAz58Nem8dvV5v20hJYSq2B6Cl//4kgFMBfDBv
         JVQnozIHHakzmr6TBjtYcDIXbGz9vXuK00fslJfb2SB/5bmpPwXNIeg+khZNwOEtB/jS
         TKx344i9TTqguq7UAjIhzrzA2P6SBim/pk6TwDiaHB7Uc2tLdpcogQN0iCUHsZucP2Vh
         dJfdY63mQBzGijez9Dy6szH+tp2skq/Sua9j7Vh3fYeKD0s5LbDdQ0WtmoBxxVcXImhM
         ruNkwmaqyDDby7eU8nypIiAKLLfRPit3G8kmnj3CCX8DTQob4Oc6gX+JSwjVZXH7PiVd
         715g==
X-Forwarded-Encrypted: i=1; AJvYcCUVe/rMOq5J8lrZUHXJwObiMH/DvHAdV74Yreu0C7KO5uIvZX6GQixZbl3WDRV/W6xUNrSAI1xIbWs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwabqKId3Ewbd7sCFgT+WnEx6lnQst76iePwf2tfBV3KWR0IgFi
	tuDSgIaaBH2chDkmkhC2dnHqD2Mx7LcM5vwlD9alQQKy19zGR3iHOQVNka4wZvUSYNp+nHx5D2o
	uPEaCnzYi+h1lZ0/L9/DTMCw4inS3Da+bLATH+qOf4nONdpDF+nFx6cE1Hp/xzqs=
X-Gm-Gg: ASbGncs8HFnqh72CGcLdtQqTwOcd+ilY3Olqtun8lMbdApOYi5sJZxEO/P3GdA1/rCw
	N89FvxxMkfmBQrNd3WE2C6qwUn/uX/OEGyLe2EzmeUq/oJJQuaxKeWTe76FFjjQIy2dTdc0oz99
	v1GpyrTlgkUmDVhEEhtQ9B11hgFTm2Y06AngVfWPm7GYBOZjNGlaiol9Dy5hE3fLcAFGenyjnta
	lSi58eD0r3WGiuyf8u2MrazD014bLxyPxXxot3wUAZOZpZcO1bydjShqsEYijwYuR969vWgNgES
	ygmaWzLXvke5pXGNnzHGkH2IN6sEfIBlESzgenKhSHih2FbzdW4O+VlDEJsI6jWiHK3D7FEKWvp
	S/pVQbOJ9VDZxbMEqgEnSqw==
X-Received: by 2002:a05:6a00:17a7:b0:77f:2b7d:edf1 with SMTP id d2e1a72fcca58-78c98dc4de8mr14323538b3a.16.1759789209673;
        Mon, 06 Oct 2025 15:20:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXaDx8BsYyj47bbtSutFI7Rk0z0Yzk+5Yo1y2hw0obgjXnbc1IezB2I/5mfA3p0GATJPUQIw==
X-Received: by 2002:a05:6a00:17a7:b0:77f:2b7d:edf1 with SMTP id d2e1a72fcca58-78c98dc4de8mr14323509b3a.16.1759789209163;
        Mon, 06 Oct 2025 15:20:09 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:08 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Mon,  6 Oct 2025 15:19:54 -0700
Message-Id: <20251006222002.2182777-3-wesley.cheng@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e440a0 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=e4LYGitkWRZSOGXTHbEA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: BHqe2lrTaWmafqqjRHlxevV1attsAOeh
X-Proofpoint-ORIG-GUID: BHqe2lrTaWmafqqjRHlxevV1attsAOeh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX0ZBB7HA+8qoT
 ETwRym5z08/5kgOSBRhsYwrvSaSOzTEGK3ad4UDveTJrNYM4ZOA7VY5l8kQpoSwXWdhXEa/GWUC
 5g+PfrPYlP18BraGHCk/bx8GFmZsX0/hBzp1/KUXxYu6sLRxdghfa3nFgQFPCZRzGKDxb4q18R5
 Baz37TJXyF+WW/BkbMlLEDBPpKCXo7LYE4Bhz0GMTveoyxvWXvyByQWFpVrWtdw+A+tj+14iyfN
 CMZkkLA83MMaEwvVoFSI1xeb3eGL4j3yVVQ8zoLQl5OYlItTnSvvAzuDharv5b8+LRNUoUUbR1m
 9C0k0z5n/oyGbtLx9w5nPqbulYWJYnsOyRxqENPt9NcdWdGS5eoiPfgkcLD08ySpf7+eWS0/T0q
 PJXi0ltM22MdhhVcuxH7K/f66n2lew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC, and
the required clkref clock name.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index a1b55168e050..b0ce803d2b49 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-uni-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy
@@ -62,6 +63,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 0
 
@@ -157,6 +160,25 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: aux
+            - const: clkref
+            - const: ref
+            - const: com_aux
+            - const: pipe
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
@@ -165,6 +187,19 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

