Return-Path: <linux-usb+bounces-28633-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 89593B9CF0B
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 02:53:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 947EE1BC405D
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 00:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3832DC79E;
	Thu, 25 Sep 2025 00:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkMLuuqs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D882DC336
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758761562; cv=none; b=qaJPkFH/RJpdL/ttGx4L8WgGGIndfyD1jYRYL62kD5B8LtszunNkzZpccjYPlLUFxJ8wEiehbeYAgFCNpykWGE/SjRf1GpAjgFYsz/TKYkjScAf89Vtq9HM6ySqe5pqnjbY3eZsYZxnTMCspktIRf+A3+eV+WJ80KpCNpF8H9Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758761562; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AEwL34B1hiDWV5mHC3jVJbcDPIY6MSPj3b0dPo5H5jgtyIIlBI1W9rprAKvnj+x0ez3FCkJu4C+KdOW+UI/yq4d3iMH9NAAormeyNhQFbsLbDYENVD3QLpWOu0VAkb0L68IHKWloVvVGUP3ui/Ij6nYeknDGC7DQgq6VIFSkOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkMLuuqs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OD1OkZ025119
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=QkMLuuqsFM29KbrDAK/a+azVlvh
	YnT80zPogffOPos/f7UhMCxbu8q8dg6fw2va0FA4lDlJNTygR1GmoLIiI/gNjYAU
	RRyFkrHEm8JmqfN7RBUHDFT/R2c26xLpD1lGNmAsdM5gQZ+LTCSGl4ZbrktblIAl
	hlbaNy2aPmXqx0lf3jd22IyFnuSzga2dTFEn8vxDFp5SrllI6T/IMrSAAGRr7d0L
	wgFo9Ynh0Yyd6zU6jBtGT5qLUFawM9jb7Tm5RA957Io1oPcRulDaxeKdj+O3iKHu
	iqzoBu69UWqPxV/xIRGnyEjVTQNpW+RAFi/AsEbSnS1Nsv+o/DCXkvThaPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv1683w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Thu, 25 Sep 2025 00:52:39 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2697410e7f9so8596885ad.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 17:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758761558; x=1759366358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=iiyiO1pI37PgrMS9WS2iYJdvFz5N3J3eooS4wR6RZJDWaxP6xRYtryVqZxV485b9fT
         nOy5tCMPMYNbEaLV6V6sxA5PtPB7u7E1OFB8fXHl9lFzgbh5PPMeRXjt1i1fLPK1qpWg
         0GWDirQhHfpcw+CDsYbFF/ICv9kGdHT6IMD5m3gopfx6G0ZSg1GrHzBwFEAUETxCs9bt
         GJkJH2RNBoxxo36JPtcs0ugPGZ5B0/ibOHrLUOV9zj6xLCDzIpDOcPdHKcw8YDEiNO4P
         TV8Ja6Fg5U4cWt+zkoqjxBLJ6/tpGuWxokgY7tw5KDGAgJd4w3Us3hm//DEd/mZ5uzul
         elwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWVumkVS9eHP+6uATbH7iEjXCyVldCaDz4cCY7XODMkm0qem3aeWvTdWrlVbIukwGhgQy8nl8ymZY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuqFKlnLKiACaL2rMdgul5RUWqSGnUK9tVeCMoCljX7GDMNMiN
	BdDMbZDE365MmAh5pK0tUqgRWrhgxyMxW0VNx2/zjf2YCGVZwnlP+6YC+L4P1QI4gcBMbgHxW5A
	NtpGMNV2sgswi7IOu/m7XatngSOUy6ncUy3vIkD898yhHo5zW8/moeAbLstkW9wU=
X-Gm-Gg: ASbGncv3Unc2RwaXLqjdu9oyLPeXuiMVgED5lwhvbAapAjAps8eYhKTAhT2RZJuuJe0
	iL86CBs/Wbeh2V5TQmLtNhtIsfKqmpNxRdbnV0xDisswvqytZx93IoXAOLhkap1J9rFl5jYiAdc
	m22rHYB8/DTKXBlDnmQAaAJXMAP/BTRXMw/ye2vpVb7rMGeNBx5Byaa1YcrGF0pLO9einakGdu+
	oPRqiwDCvqD7YytgK0ET7ZTP/X7DHb4BS5C5jsRQaUx0Q6K8B7z3dpQDuvfA2Ncz21ffLbvRt99
	3h3hKV9z6h8JEsZE/uQhGAEpKwhXLtziWjgkcBk8/09siURcNW8wJ7HqHIIbJ/JgR3QBWdBPCRK
	k0k7NG3VrYlMav7E4
X-Received: by 2002:a17:902:e84f:b0:26a:8171:dafa with SMTP id d9443c01a7336-27ed49df04amr17503595ad.21.1758761558244;
        Wed, 24 Sep 2025 17:52:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhvOp7wNsS51SpI6EOA2HUs8VBQEy/ZyUwfDL4ym4Id0/ZhPRPzk6mTrQR2czfWa7itiQZ0Q==
X-Received: by 2002:a17:902:e84f:b0:26a:8171:dafa with SMTP id d9443c01a7336-27ed49df04amr17503285ad.21.1758761557758;
        Wed, 24 Sep 2025 17:52:37 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6ac27d4sm5238105ad.135.2025.09.24.17.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 17:52:37 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v2 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Wed, 24 Sep 2025 17:52:22 -0700
Message-Id: <20250925005228.4035927-5-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: v9LIi1vUB0hEvVNVLJxfGzQEm4NU6ei8
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d49257 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX2bbjS2cbfTx5
 81MZ/sUAfZfmJMnTIKiVp8/kqdRKdMCU1E7/6+9qnFTOIP0A/ixyHNfrxMVzMuQdWN/y0hxFxW5
 bwp1MS+N03QspohCdXghxkVm8aIIcKZAvbhVSDg4gehgfynSwgqY79skj0V7HqrqPhSj1XKCB9u
 Xfau5YYEdrA+GOh+38bbCwsX9nvgK7MYrKtcXJUuHr5lU9HJE5fVT6RnQSsxf0W+tpRRye/B6Nb
 h2q2OdJ7mqH/mMkF4cHFof3j5lQ5ya0WRfcm6K6VsuKVNDPeUCJ7pyw4WAQBfBLpebUUysiV1JO
 MU04+wTmnzqT/y9Oig5AvBlQg1KaBK+evv+0wtBSkDxDd/owGb+GIV6GFmQfZAgDhRUTNhQvabo
 sLIv0Xk8
X-Proofpoint-ORIG-GUID: v9LIi1vUB0hEvVNVLJxfGzQEm4NU6ei8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

Introduce the compatible definition for Glymur QCOM SNPS DWC3.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../bindings/usb/qcom,snps-dwc3.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
index dfd084ed9024..eaa0067ee313 100644
--- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
@@ -24,6 +24,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-dwc3
+          - qcom,glymur-dwc3-mp
           - qcom,ipq4019-dwc3
           - qcom,ipq5018-dwc3
           - qcom,ipq5332-dwc3
@@ -386,6 +388,28 @@ allOf:
             - const: mock_utmi
             - const: xo
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-dwc3
+              - qcom,glymur-dwc3-mp
+
+    then:
+      properties:
+        clocks:
+          maxItems: 7
+        clock-names:
+          items:
+            - const: cfg_noc
+            - const: core
+            - const: iface
+            - const: sleep
+            - const: mock_utmi
+            - const: noc_aggr_north
+            - const: noc_aggr_south
+
   - if:
       properties:
         compatible:
@@ -455,6 +479,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3
               - qcom,milos-dwc3
               - qcom,x1e80100-dwc3
     then:
@@ -518,6 +543,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-dwc3-mp
               - qcom,sc8180x-dwc3-mp
               - qcom,x1e80100-dwc3-mp
     then:

