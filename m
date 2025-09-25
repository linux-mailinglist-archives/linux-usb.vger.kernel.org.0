Return-Path: <linux-usb+bounces-28631-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 496E4B9CEF6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:53:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB71C32800E
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B912DAFD7;
	Thu, 25 Sep 2025 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxNcja/f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAFD266B56
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761559; cv=none; b=pNOZ94BtqtS3NOZloyRVCMnkf8rcCN3WpdF7ha3C1lfJl78r5bpvGKCcrW7APHYDJHVAnfsXnDb5uYDurtqcx3n6JrEK7b55byciIGduv3ljDQ+F4+kOw8HHXxH2te664XOOQLIQZmKhnuXq8OskJ/8PXRYcEDJPyaoH5tfI4KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761559; c=relaxed/simple;
	bh=Li7Axgqj1Qyy3uX3oX9irsrd0UwAJw/MhTIJL1ssmMQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eDdK5+RQ3VgsvMBYeLa9Tj69cADZcQQDJJ1r2TLK8gBTqSpJY5V9w1loDpAk8kmtMg+1ktTAdfpdhKWF0MC6Mn1Z1opU6xslVjFQVO0/S2kPkM5lwq4ZGGc7xFOO44EBLsN3Or2Xc6Rxtx8ixPacLSAnesz8IyGRTF1L2Wft8o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxNcja/f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODGCb7002400
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NkSIvXe2PoZ
	kc0A70JhcEzpgbRLO6/8AmGazVnh8Tx0=; b=fxNcja/fF5TShCb/P5DbtfyILXs
	03XEYEGvzjC6BpBdXmWb6MPyBEkx2yTfbWNRZjypJ39s7Qiz72R579j80w+FjnhK
	atUKHcw7fxURRVB3lJYM2CClhJsDeWUhaSU0vPg2v1SKgVj/JOWB/RE5L9dHQpSQ
	eclIUBhytoH6a7OBIqWRuJNoxanSBgz3FjMD/lcbPwIGO9Uhhf1DeqSlqRMnbNpw
	4c6A7kAkCiSCzC2X6oKi5SfLUoOTuOaK1dzNj4BespaRQjVO8B5DDWhAdHQOL3rM
	dbJMwobrL9MfWo8N0S4XHwmtSHLS/95qfB4nvWKf0F96TCr7nDWc3Ccrr+g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98p7qn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-267fa90a2fbso14676905ad.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761555; x=1759366355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkSIvXe2PoZkc0A70JhcEzpgbRLO6/8AmGazVnh8Tx0=;
        b=uNVcOL8ixQU6nftO70QZKo6nO4TfOprdFm48S4OkpHJsD9h9HYLEHGwW+pNppKhYjt
         S33CjfwSpXszz1c6K/ovJrA6ftMSgndtyH3og7UFvs7Eg0JXz8EL+8WMQDSJNkm3WXXq
         d76piC9ZjveBMKwjn0OTLstkn/onbNnlxgPLN5DSa2lvtP5Ih3MXZyAspVp5rKs2yU80
         Zq9NKHXTPMpmz4KdOQeiPm+sWmvifsYalXL3sj3dKEw4TKt0zuIcR7xZFL77QKCJU7CY
         IfRmW5mPaex/YgmkNQh4scwFgEv2ELZaLewXelNFx/kIhsS0b7hoZD2qriFFCNE7dL9U
         psfg==
X-Forwarded-Encrypted: i=1; AJvYcCWhlD1hONPMgEs+tTFS1g110VBNgQrdE8eHNOj5d4zyIzqmWEDfo229i34Z28vOZCHKQK1QYldAyHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxteIxjSCsbwqOGOJDEoOBCjmAZjRPoBmWE+VOq7gsrxY5R1nUS
	PPRZ3GUKet38AgOUIs8Wh63sE21gzOO8ovlPXK62qyfT5hAWrnku7TF1Pv2LtOdXuCmufGFdlEy
	3wR3LMe1Kn7d7tSyXD4Kxe7dcjfgcD+d/wilAIdu2x7UPhMt4V7+cNVNcwIvmwJU=
X-Gm-Gg: ASbGnctjWvzs8miSCWPhVtblZjbPOfS4OikUdRhJbUNmWGdWCivEVmXDfACn016aCUw
	UXsEkBc2aF2W/Bu73sQKJxPSAnPoQv7lVtTY730gZeEo7+8eryvWnb0uscnDSrE1JzjVJMmghWc
	isHUwRcXornCKq+n3KHbhr+HcCCIAHnwtPLY1ygmFAVbarALtMzye1Yc1evN9Uy2xMx0/0NZxSW
	Ja5EOzdlw69Q1xIEKE9OtKq8tkW6AWFoyTYP1pHcgvikqV82x2d1SLyN90LeR9VAN4vnHAMddWn
	+DSxF/7SUc6SuZ51JBnYQVR7TxoaD5T+3oZkhPzF2uGVdymGOmeykoeW7ojRLWiFttff5jL0EFP
	ioHCv7q6UQhUAcVxn
X-Received: by 2002:a17:902:db11:b0:27c:3690:2c5d with SMTP id d9443c01a7336-27ed6780b92mr10331125ad.0.1758761555440;
        Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGD71bqcxeydKwo12qj/CeiC45HSksvyE7WjcM/YRZ+SXEC1DBAWRjoO9AkKTUboK+ohtAoJQ==
X-Received: by 2002:a17:902:db11:b0:27c:3690:2c5d with SMTP id d9443c01a7336-27ed6780b92mr10330885ad.0.1758761555019;
        Wed, 24 Sep 2025 17:52:35 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:34 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Wed, 24 Sep 2025 17:52:20 -0700
Message-Id: <20250925005228.4035927-3-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: -hnIPZKlb-xZ2QmoMBGfhqRdpGXt1_JD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX2bK7/XIoJ1Wu
 Ahilx0+tAS9/CjtofZxV7YMEry8WDfTTyxLugiFwLQaVGnQVq9XeQjJhgughTd+WXfkgjwYjmVb
 JwDthUxixrWymPHssKQqxmiAV7zkf5TS74PYr2ij/oIjVrVNDp65Y3BudtFhgQ5qMdouOuwVlof
 OOyjIU+dZf2J6AkaslKvhLQAxjzSAQGmrtptBJ++KL3DFAltcihwLObV+fdVh7GqqpjFT5Gaxx5
 2iYtxquGyMtsiNI8dg8fYXZzDdaV4XOTmNo1gXA0ko5/HOCgwZlsr21pR5pusEvzkxO7yE3NhDe
 xRbgMwS4MPogfXnYzdSfjL14vbCtsd7YZvIWwPudxGaDS/bduQ2fv5PJOoW/1JMVnKpdhk49iNT
 Cl4WZrI0
X-Proofpoint-ORIG-GUID: -hnIPZKlb-xZ2QmoMBGfhqRdpGXt1_JD
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d49254 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=e4LYGitkWRZSOGXTHbEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC.

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

