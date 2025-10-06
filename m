Return-Path: <linux-usb+bounces-28926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BECBBFAD7
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 00:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 966513C5D6F
	for <lists+linux-usb@lfdr.de>; Mon,  6 Oct 2025 22:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C90F42D7DCC;
	Mon,  6 Oct 2025 22:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICoNp2R4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262CD21B9DB
	for <linux-usb@vger.kernel.org>; Mon,  6 Oct 2025 22:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789220; cv=none; b=noZqA3SxeiZ/23ffwvTcMSvEL2CGuRI7BIfYL2ffXiNEqpaC3rVy3p3G40jjhg6ghA47eFCZIEZOp6bI61oFaG7owGxC0b3zOXuv1fI35GS3DKhQWskRryDxTf+fSjE7eKYpikR3FP3onxXI/sZHUsx43IzEZmPykjwVGyYefY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789220; c=relaxed/simple;
	bh=y84fa6fvuCZpJxjEsWR6XfroWoXIZOXTyVARiLBoUh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nouYT/K8ynKsTcaXBveF1gbD1sM3JvSKNxsIwAGbV27ie/uaMu2otLLygPHJA8CcVF4/3ugd62693C/dg8pDUoqTyf1KBsuhm67NxWkJG+QwcVqzi3O7ZU8WL4fpYN8Xt7Iw0qT4y5tr8wXtY4YfFoLO8ztjP6dmAqJtDwNnaes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICoNp2R4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596ErJfe001386
	for <linux-usb@vger.kernel.org>; Mon, 6 Oct 2025 22:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g6hGIMMv3wb
	uPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=; b=ICoNp2R4zS26XwjqroKXK5XltGH
	CswvdsstUgTIoEjd12evPOYEDG/cUADcf/2e+dAvOIGX64SEGFu8+zagkdQsBYHE
	tTrLiGsjCDnMoPDr64FNK00D7jhudTTraCimJSZpOZyCrC+xAgZKjv7XSoxW2YsW
	mLrVwoLx/pVHZi1Fioa4mrxDlkrsUCjFPzR762PjZ3o4foM6n6z/7ExBPIHJ8+y8
	TZPPEHGYXUZBg9tMrAiwGKF0t1ZBdQtK/dRbaI+uZSOsz3trSFtZ9uT7Z/XS+kcz
	UucLm2y1evG37Rz4Y+4a/jDGLT4apOeEMbTvVj6cX9LZVOHbzftp/b4Tp2A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jvv7n8ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 22:20:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78102ba5966so4729106b3a.2
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 15:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789212; x=1760394012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6hGIMMv3wbuPomMpx8H8k/GiKEKmx7JPEl9gfJaIng=;
        b=gIF36b6yUSWTG3E482dyFneETAMAhdcWWqvWzQd0HO6Y2qxMTLPvyZ4KUaUWekRp9W
         iAtH+8PchHunm9QODPv9xJdk3GEUwScndXlWlvzelwSoZ8VqK2C3/YyVeBmg1HDrQtLV
         ZP3k8MW9t0PzWG8MBon6iUGgw6wDusfGAp7uVQ1lTR4OiD8ydsO1TM/tVijLuHGF2B6Z
         jQAxf/ZVe0A1I83PnBO+DMi7neF4TfiUngQfax740NdQ4w4CwbStLV1JQNlTKBts0Cb5
         NQ7JzUgm9min4IJJuPCsA7Rr/hZPDIDUzSWUP3BmXMGWlIMdHFmcq9QSrhohdVr/PV5A
         VS1A==
X-Forwarded-Encrypted: i=1; AJvYcCW1v3C9u/HqScAUz3d/PUEXqnc4rF8r2jDAFmYJ16Pu3L9ycK1uxNJvfpXeBV8xo1/wbVNk0lSv4cM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ6TDl+SSzF/iIRtqv1s59JAxz5rwCuhSGTLy6bIX/ByulbzU5
	o3pQj31eoOHbXJCXPuyTPpgce0J6JO/Xa6X36gn+q1Wk8WRaayKCIuIX222c3vfLNNDFWES+eyE
	iu6ZEOh5WzcVMBYNMmNzg+UfGTgEuw72Yos+NDCkIsf6lFsNAatQf5cPLklEOwvA=
X-Gm-Gg: ASbGncvNU1k+orZfZ9TRuzNctgihuj4ixizaigGYV78+ASbD9ShOTwrvavlHtahrAyB
	iZIRD2WjAQCYb3KXxpDO0MkYyxsc5Nt+71kcnOaB3axucHDkS4QY3G/7Kd13p7p3EXbIzEEFGyc
	FYXJSut1iRN5HzIUQoEEoNV7DO3ZL+9c3TaOw8U90jjD6fSlec28LV/4/R8axKhywCsof3Pxutg
	elnlsWUkP/fut8fxVxC7s+exFxNl01zgNtnGscZSC2atI9KW8E+0jH0Z52LrgyTO/d5a9lzIYeR
	EmJJVyan3dkfDbURLPOzDms2W8BQmILVLRJuKyDk0zY+wnin5XY1+yoYbu6NLPxksTcj7i0IMds
	umgLiber0PdKIBSjDYwCDTA==
X-Received: by 2002:a05:6a00:3e1b:b0:792:574d:b1d with SMTP id d2e1a72fcca58-792575c7065mr731265b3a.14.1759789212556;
        Mon, 06 Oct 2025 15:20:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwVIZrtgir0jsxXPAjMTVqs04hKUgCAEt4yAQwrK5Enm7r/n2TXNbFI5l+MOzSFJexLm8MIQ==
X-Received: by 2002:a05:6a00:3e1b:b0:792:574d:b1d with SMTP id d2e1a72fcca58-792575c7065mr731243b3a.14.1759789212105;
        Mon, 06 Oct 2025 15:20:12 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:11 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 04/10] dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible
Date: Mon,  6 Oct 2025 15:19:56 -0700
Message-Id: <20251006222002.2182777-5-wesley.cheng@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAzNyBTYWx0ZWRfX45sm/LnQVSNf
 3rbp+URHj/fNvyITLQVJWqs3gz1hCgZyoG4GGZm9mkbxnGlbic5aF+EVxhLkhwh5GbrXgV/vxiN
 3xcfY7BoOHZqsyFEW9GZw/qz4bDGuFL2Ao+b8WjWLdCPHcCaR7T+2nBFHGlmfXQuGhFqIacRkKN
 n+UJHLijmLqSS/vFXJUE/iGIz3uFtv3yexyxuL4Q/qpUfUBUvz6SyLnqmFxKD31uPIP6d0yVjLD
 Bx+EqjM+pYjuVYckdBDCLOz1zBN5+GN0pH4G2/PyEGodYYnqiHg3tSIX1Qk2oZOVQ9MyhfVJV8G
 g3/SZ+xtaL3k8uEZdeTbAfRfgcsW5WN9WdE/fmFXLB4wJSO/4aiEWPjbtCTbgUOGp2eAgutHQ8k
 U6ep9pSA6XIK1fXLKq/gXyo+GBO0dQ==
X-Proofpoint-ORIG-GUID: w9KQHa5CuADr0-981Py7t8qn8IPEZEFN
X-Authority-Analysis: v=2.4 cv=WIdyn3sR c=1 sm=1 tr=0 ts=68e440a1 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=JYTQWVwI1XGucIoeipMA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: w9KQHa5CuADr0-981Py7t8qn8IPEZEFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040037

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

