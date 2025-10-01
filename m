Return-Path: <linux-usb+bounces-28852-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43252BB1EC4
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 00:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DCFD19C572D
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 22:07:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6702313284;
	Wed,  1 Oct 2025 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DueehUeZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23BA31283B
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 22:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759356347; cv=none; b=MpsXHoDyYeKqOLYXDfFOaJ3Yhho5LhzSlhh26EmaQ1ZrtjNNin4tUU5fNsxjDb/bnKA9OemP6bp1ViWbPbTKcUNJziYS3xg2tHUS2sJqoGoNeMava1JreVXSmOqJa1JCFrOsmpQ/NDXgzwDqRcxgAGYEhD/WTzbe+cvi3ClYbkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759356347; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SEZuAXRZ7AzqYEMcc4QXjuzMYRnBc+SXT53accg7JJCRaz3ocSteHLyFuZdoQJ6GKiPo+tGw3vLXEWnwBSKlpV54E4KLgRnb91NbrHCSELmHbX39kDHlqgb/sHDzjsIo4KXzOGSxSuPZXRIlsjAYjPFWkGMMaKjdC+0YST6M4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DueehUeZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 591IcGiX000949
	for <linux-usb@vger.kernel.org>; Wed, 1 Oct 2025 22:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=DueehUeZ+4geCNy8yp8SwdJiyHg
	Hz6h6cptSo4H/sSW4inm8OTiTt3cCWtnX7UpCJEJPk2scrUTJYOipJpUSH3tvbGM
	aZxZXI1Ozk1V4+EwGrkJ2mpkcgOgYfAl8n/Vz+yT64fJuOQEs946BY38DEFkyV3z
	8hrxMYo/0K0m9z/GejFvm/Aw4TNSZj6XllFb4Xiyr3UUPr+VhiDP1REzDPqeuxCH
	KmXzTOWqMjdeJKHvMaDV1bT5EhOAeUCu9aOYsi9jo2fZYFvz2Gkfm9umx9awLsTp
	lWKhRuvacWb60rmdLCeWOMd/G86OVUBS2y6HXRK7i3ELrlbRACyi/lIbj2A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5x45t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 22:05:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b588fd453d7so211742a12.2
        for <linux-usb@vger.kernel.org>; Wed, 01 Oct 2025 15:05:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759356343; x=1759961143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=C3J+UBDHRm+NPrDfxIV0djoLH8O1afX0XA7VlzrbEZBNtypOaJq6o6gqzVJW13Lln6
         hKex7QDzXDTBfn9sqC0wULopn3t1ooHzk78FvGwafHvnB7AuAuOUGN8n3YzemeWgTKsT
         qW9KQkZii/6emLFvqDuBXXr3TZHkE0y5sn/kAX0bMgWdwpRtBTfAe+0jSid6/43ecXdw
         StRiKZpQG+xIhXte1pxz99NQWoDH15rn8XivFRkaneq5Dm15pGsNdok8hRpcAEdA+FUm
         MlkXZx5JJ/9gbxQcSZJKla3Os2vM6Hc6koOj40wBWZN7R9LxUMAknKpI9jlC7ePvcJ+B
         Nt+w==
X-Forwarded-Encrypted: i=1; AJvYcCXpju0iWGdevjvdPC0BtU7QfqjNJAMD4SGf7BEoxfjQW68HYWPSFw3F7WPaeOvkZdYiP16minHCm7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ7nVsSD4R4mQjhELvHZaKCzihZp5uvOFjvdFOsS2Xl+Yf70pZ
	PYvHDJ1wzbpp/ghgbt7wjTOiHsl6CMDFRViR17tBIF4azgUQ+bPevB6ZUy3r58Ekm7hRRkSPBzl
	dtJu1yP9JD1Gbu1u/6Z3cAMl5QKYW7bCaC92+elXfIht+2rhu6JAhZ48DqF5vi6Q=
X-Gm-Gg: ASbGncvTl7auISPvL1OHXcL457EKnl4ZbN5zLOV/zB4lYhpiu0ttP7aotO+56ujfHYU
	VivsWH4dRs1OWlzBXGByV6U87eXyKZs+oxY2c9G+IDWqdB3UK/9duGsU7f1ISKMwhxmkyhOoocs
	Toktl8/VySZspoxVA625TcsKyKmj5aCUgXLB7TdiQbEGqLhLP0NhXy1Obkl5UOegaqZC4Y+J/61
	rLntnFSrGuXtiA4EcZRV/7kEAWhfhJcyp8m9vSm00AETfV/USyzJER5LSleDSs+ywUh1iONL5m2
	mGPGKtwsdIsT73murXsgWWpbKWOhEa7sDESY+nd+oGdKjtvntPPJC9A5GU0sQf9CL6dwcWxN964
	shj5nm/0deiQJVHMJTcJQtQ==
X-Received: by 2002:a17:90b:1b0f:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-339a6f3cde1mr5653494a91.21.1759356343291;
        Wed, 01 Oct 2025 15:05:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMYMlMROsnj4h+It/s+6vj6sTVkjqirS+NPrscbKY0wqq9o3/qEeNlWw+iTriGWj/gWEZ7vg==
X-Received: by 2002:a17:90b:1b0f:b0:32e:a10b:ce33 with SMTP id 98e67ed59e1d1-339a6f3cde1mr5653469a91.21.1759356342817;
        Wed, 01 Oct 2025 15:05:42 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339b4ea3c3dsm702085a91.5.2025.10.01.15.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 15:05:42 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v4 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Wed,  1 Oct 2025 15:05:28 -0700
Message-Id: <20251001220534.3166401-5-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-GUID: T2f77mk9JXLGYe2SBsUxVx1Pf7C6KnfI
X-Proofpoint-ORIG-GUID: T2f77mk9JXLGYe2SBsUxVx1Pf7C6KnfI
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dda5b8 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX+cVrkkFQnWSs
 66PJgskCvUtnTN1jkzso5i0AzbZo8RZv7hj3U9n63aSJSV7umZM01iRgGo/2rkEr38CUJSRofYL
 pVYzR6lj9A3lGx5S1c7ioPvRGC0qHaJZhNM0B4WZzxDaXTM7AzxWv1t1Ijuayh7yTyW6srLtAUe
 /8TIm1thTWm1o1OXiHMIfOGrNdJfhBUuAOw1Q+Ooxe6W0fkBJ/XyBTqepD0NOau+h2oMXB2CDZM
 vnCV1hPImVhjXoZ4+DQziGOYU38t+AP/n+dH6xDyCO3A7QZSN0niMTnU8MbHDSueWZDOxDTnL3O
 0MKpe4O/uAB+p8e4YcmjHFTsavq8Wvh7fn5OFPi+8oX4/sX1mTfXz8uNtdwi21c28U+3RCrkfnw
 LG7Wqh2igJcG9IeLzS4jM9WC8/WtXg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_06,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018

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

