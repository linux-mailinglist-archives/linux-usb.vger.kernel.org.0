Return-Path: <linux-usb+bounces-28850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D95FBB1EA9
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB1BC480724
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B54F3126CB;
	Wed,  1 Oct 2025 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hj4ciPud"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E121284884
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356343; cv=none; b=GbT0paMnaZwAXhfJFG1ZwTgeYIj9d/tyyfEGL3ovBX22lyky2YTTvQopdKQIG9fZYZ/H0y1FwVHGDdP5hSyU2Kf6H7g4K1WXVzQA3ArmtQs+bE3pG3YBK+0cb2D4ICPoAe3opWOPb0hUVg7f8qkxCpZQ20QDpohnICPSUg5maoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356343; c=relaxed/simple;
	bh=MCbqnX73P4uJn/n4jiAlTVZO9e/LGJ1yW50aiT4ZX9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EFssuzuBWmFBNPbvNvGm9qEY9STU18U1J4ME2XZVlfzmh3yTdkZSeeQJJkPg03TBk1E/a1oKxKxRr72F5oLJARjecofYCGRhm2HSE9pLqQppq5CyW01o35R0MTqjshE1rBlAu/Gs/m6U+HG7xbvInraVrAJclWC3b37nzTT4mzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hj4ciPud; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IccUZ010746
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YYQJM1FZM3o
	3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=; b=hj4ciPudSQPTU+U1pI5THoE1fAN
	0Fc3bwT1gTOt3MkyH6+BVYF+ABdncobayX/s5qw6WDfRtpJx76XsqkVgZOxP/PB/
	3pZRr6YfOiy2Xtn/Q5jkGEmL1jfE1uryTv7JUMJ3Byc+S6DUZu6gpiZzzFpakjFS
	3YITEzDydigo3lz9IpMeexwko8f7p5jMBfIfIAN0GQ6SYMQW6oKjTdIIlipG3/ze
	jtz8mWQqYIeAiOJyAaGLWwzZQjC4zZHOjOQXx29uSOfEaySQsD7O/l5+mrZ+orh4
	AZ+GQX9NWSusmaWdV2rC3Mx9YbaW+ZQlMd1TVD8XZS09dKJOmLeNT+KODWg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e93hnqjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-339a6d9defdso779094a91.3
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356340; x=1759961140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYQJM1FZM3o3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=;
        b=V44XQ55aC5yF+5iuOfMoX6QB9YudUblNfEboUcdMr9KjYcb8T7jLdQm6LpIog4If9z
         JyGI6r4rdBYnXkTVja5irdaBpziLGK/uM+r5HEvGpe53cfSBQ9Inzkm5onyKMipfQXAT
         QYqEsmKB/pCbXoDuWrmfCYmmuIuOxsE4+eVCgEXWWWEkNGTBeXVWNFZ3OnUXkJofpQzj
         qxc7kEFFMXkVPgPqOrTkH5I0E4nZFspiGoQhAkPZ8TcUpypEW+71lwG5VU6itiEugrlq
         wUMqp9T3b0Liy9UDSpIBRDl/U5tNG0EGDZh5DC51qD36pAXJ2Duzd5Cv09k9MbXbBWqF
         Qm9g==
X-Forwarded-Encrypted: i=1; AJvYcCXTxPU3AXyM67hdLLMlp42c4teGCk3t7aoLjz30eHqwEg5RSxOh5qu1l4s3/LR52xmzEjSmH9RDo1Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJR7T0b6K09aM6X0VPL/IcR4dzaC99hznsYn6CQE0sFMGJT4V8
	qNrwSLU2oSSSQXvVfxVMtLJPqXUktxZSZR29NOOd9yMiSU083gvxXmLBd5sRDb7wGGqsi9feHnb
	K9uuL0aI+VVveFXD3W947+i6fX59fWq4G3eNy1YGSHUpE82ey/LtLKfO8c2G7S3k=
X-Gm-Gg: ASbGncuhKpb7pl8NaB+7F7LilwLewZQ0dS+gxyIEOoqUIzOYp3h81jauGI3b0Zlpegr
	ioaI8O4NCShWa5HB/TRxKm8wWDooPgoC2RU3oQon4jG8xvNRklIEkiv56xCAbnbmUBg16z4vdjw
	WSY9eZs3A2ozm+k0HaYf8uGfLUSKpP3DRsoWVniFbXvHUdH55b02dCh81EHRO0PQ2RMjGOV/Tsr
	tngHbeisPcpQzwp4n/fqPyH3K2fGv3h5hKcQRELASlyym1jr5JDlBD2etgXagM85Fe+EcG3jYyN
	gnyWrhnxnqRWT2+BxOZQdpS0y+l9x2iqvAK12ZXdTM7ukRwe+jDF2vD97+GJ23uXNixnYVkunB9
	+Bcr8gRIQGsBf7IbFWOuW4g==
X-Received: by 2002:a17:90b:1b0d:b0:335:28ee:eeaf with SMTP id 98e67ed59e1d1-339a6f6b08dmr6125779a91.29.1759356340440;
        Wed, 01 Oct 2025 15:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnpFbmIm/22XzKrvgj3DpJIIWDvuNtoI8e9ISV9nBUIC51KNVUubMK51OjfPXVbhfl8vYXjw==
X-Received: by 2002:a17:90b:1b0d:b0:335:28ee:eeaf with SMTP id 98e67ed59e1d1-339a6f6b08dmr6125752a91.29.1759356340029;
        Wed, 01 Oct 2025 15:05:40 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:39 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Wed,  1 Oct 2025 15:05:26 -0700
Message-Id: <20251001220534.3166401-3-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDA0MSBTYWx0ZWRfX3jYUYMbpTf5X
 TxYHeFQ8eDy1dOwFDS5s/b2dVw+27YFtt0R7hLF6PhrkQn/Td+ENHJhU9u4g0JlYi4kHuAT0jFe
 E0pk9pyYUIMTUWRHwi8DnmmQNsRzCC8ypicLv3+SwxGuSSO4sy3VPNglxQ01o2QVp2WMk6gKQSn
 fcVpZN5YUlfQ8cxioVZ/ojR63V17NDRS50WGR4AZ4EfwH1WmfBXmBbVH0waiAH3ynY50DDWJOSq
 xCrbxiWhzOZRvVg3et0ph735rzfP1SfLG14JwjiMCREmC9lBi7nCONVRRO0v6JdrGGSmh1LhlgF
 8UcqvxTl8KR//GbwT4n72kWPh/VUsOapsJ9fUx5u9f5YtfooF3M0InOkWHA7umfOyoi8eflkbxg
 B2xJC/lYTzzs1FQb1s3th29ifwHYdw==
X-Proofpoint-GUID: 04G16GkmFnLuqOORvuj5a9AZ3JP3WrnL
X-Proofpoint-ORIG-GUID: 04G16GkmFnLuqOORvuj5a9AZ3JP3WrnL
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=68dda5b5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=e4LYGitkWRZSOGXTHbEA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270041

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

