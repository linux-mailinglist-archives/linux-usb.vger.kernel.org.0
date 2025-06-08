Return-Path: <linux-usb+bounces-24568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 385F0AD1333
	for <lists+linux-usb@lfdr.de>; Sun,  8 Jun 2025 18:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DC2D188B5F4
	for <lists+linux-usb@lfdr.de>; Sun,  8 Jun 2025 16:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432E21AA7BF;
	Sun,  8 Jun 2025 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K4yx41m2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6627B19F464
	for <linux-usb@vger.kernel.org>; Sun,  8 Jun 2025 16:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749398863; cv=none; b=Xxg4EtkGwttmWZHkb1t/C99pHt8/9regFWXe6Qc5pjIoUl+ju4wJq7pXCXQxP3GDfivcmM7mkgDOe7HYO7RSzTBcLaNEQ4HGSPhej7oqL7oV9CVP98xzFl7fQsDK9c2xnWrl7iEfuqQ6YL6xGmV7H5/6CJqNTlYdVuFDSYFTb/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749398863; c=relaxed/simple;
	bh=Ja7y+pGdQgwUzowAi5cmrMH/tc4IyP9MAX2i9fmwei4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZUDptNg2Qn1HZ3M6K6d3opvhLgRoaYouNFaYk1b5EBnn+WN3J+Lo2pKlRY0r+vH9x+vh0R0qnSRd82ZaCzSKlwh8dZIS6ykG0Z8YoTYcLI4acKGhP/GvI+/yxcD5JgSDHdGXIkwSOGb4vfJOpbiO+Gc3ymclqEMhrGx7WbzA2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K4yx41m2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558G0dg9007565
	for <linux-usb@vger.kernel.org>; Sun, 8 Jun 2025 16:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WjjsGKsB1xdYsLZ6YNVi3mtNLuj0pPjbrGZ/TI7MJeU=; b=K4yx41m2ilpKCZ2t
	5hMqhZJWt4cXL1Z9xyHe/2jMuP1h9vIu5im3C3dmJWmLZPJI8f4IahNsAbA6kLrC
	5p+rTQwHbvGxoB0bWfrpi6KYxIVymWVvbHEJ0MKIWdrAbSGJoRkLTRLFCXvYTVf9
	3zz+N3YC+tzuTsW6L+kPJs9gS7C2u+VgwUr0P98+GBKjpALw7V0fQ82lW0bsERYu
	s3U7bBPwP3rP2SZhZRorOL+62Jx58B9BPcb+JW3iqGxP5wmreQTJ9tliurx6TBjw
	6MgNrgralcZwvRm03ei7vCJC3zvjUXHNv/0uHmD3yyI0ohI4opV1gRMmZ8CnxD6o
	DRCfMQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcb36b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Sun, 08 Jun 2025 16:07:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f876bfe0so685862085a.3
        for <linux-usb@vger.kernel.org>; Sun, 08 Jun 2025 09:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749398860; x=1750003660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjjsGKsB1xdYsLZ6YNVi3mtNLuj0pPjbrGZ/TI7MJeU=;
        b=lEOAhXcY7YjvARWq+7Tr9UWR/LRPWhwcwd0nPV3cf62WfPCujjrkxWzJ6aLE6h4/cv
         GvX6rQMB6kdY6G5nzbxUOQSxq865hRTavohZf3IuZucSGF1NV6rlJdifiU60JTxcVnAW
         sJmp+yN7h+6k6J3t5xvvlhRYvH3U5pfsTnIdWzujDUNcLYQojN7mmiEculd+V3yTAGSd
         1dY+uxV04ucFxzYCGW/tD89Vval/G+SFSCZjut/aIpOxZS81RhalX/xZSxtG1lXaErx3
         0F8jIyfMZdnNDL/BALAWxuRiuQ7UmsbpysFT9sRdP58LGcP4Kmp0EdqzIdg0i9rMRUro
         FTOg==
X-Gm-Message-State: AOJu0Yzn3qxKU/rgpXiOl7OqK0ieelDYhxhlTDLnd3bWtUd1XtzSLnZL
	TlJ0R9DpjTB+o4yRppAWD/WXKbE8W23bmvxCxJwn69O6ZGfgMxtWxDzmz1UfaQmWMFQAYg+m0vZ
	s/dn11EqQGYA+59c7sSt0exnzOHrcsYUTRWgdXyDrEcDRi0UGK6qgo8wLScIz3eE=
X-Gm-Gg: ASbGncvC7HXmHVnGJiPmDhZgWx7vI+PiW4f835BixLn4n7tju+Xisr+UM9MruLVBok+
	iStUlMJ1qDReSpg2dN7zZlLgvoVMNzdbDJuvFcs1Z87jXXY6EzP7dE+BpwXUxfouxe1wE07VFfl
	nyACyZoPDCxUuVqYlPI7/TepWjU02cQ39wTAWlNY3ovvR4Le/fL0XuiUQylKJ6bQGXWj/c1nz7B
	8129+GJQiWFwxFdDqVqhwJwyH3NfSm0zVCGmQAklu5oS7k4ghacNrb/rfKFS9CNYqzth487w+/x
	2RX+IGdMnwkDFK1c4642awomXxjsWPMG1wj6albTRsRQa0RVrFyPlMOBagTOouRa4PBX9yOu6PL
	Wb2s8Gukcpbgx50h3cLULGD+t
X-Received: by 2002:a05:620a:471f:b0:7cd:3b13:c5b4 with SMTP id af79cd13be357-7d22986f383mr1316408285a.24.1749398860200;
        Sun, 08 Jun 2025 09:07:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkAkK134bF8HAhnjIeMvEJ6gzJOUf5lkkbjTlj+NO8H3oRmYxxEvdr+8qCIH19fwewJMeiTA==
X-Received: by 2002:a05:620a:471f:b0:7cd:3b13:c5b4 with SMTP id af79cd13be357-7d22986f383mr1316405485a.24.1749398859844;
        Sun, 08 Jun 2025 09:07:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a9d2sm818970e87.186.2025.06.08.09.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:07:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 08 Jun 2025 19:07:31 +0300
Subject: [PATCH 2/2] dt-bindings: usb: genesys,gl850g: add downstream
 facing ports
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250608-genesys-ports-v1-2-09ca19f6838e@oss.qualcomm.com>
References: <20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com>
In-Reply-To: <20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Ja7y+pGdQgwUzowAi5cmrMH/tc4IyP9MAX2i9fmwei4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoRbVHZHbuZNbk37VsDq7RZ3NX8JKLnVMNJCYDU
 B1rJrBhkhyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaEW1RwAKCRCLPIo+Aiko
 1RS3B/oC8pc4ycmRKSl/KifoG28GEHRpiKouJURhSXjX48DWgKNWVVqojEcx3P5pcg1z2ErbCXH
 w7STIo+XWcU6Vu6ayifDnOM4aCHPB6KSgaD3eEkjUuIfQmdSmTCuPrbR66LRYcFm1OQx+FUhoXW
 JyiWFvD9R5JG4qL9gREe/xwcFPnAhIkUU8wlyGRKxB07Ls02t2MY7tgtn44vwowmtklZg+c50HQ
 5betlQVjY4+up+GpR4ynXFegvyswGQsqjtzyfm5XITNT7QhWYXpiOfcYtUQxyu9C3VL7h+KO8y+
 GfVt9BDI56lBA1CrC90upWf4VspGf2vwSBR19N6okh+1Yi5+
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA4MDEyOSBTYWx0ZWRfX0QkK9zsGKzzW
 ixSySQGyQmpPAwIxUQYlv0gLM6qDsbMaDsILYCo2faZ2M63Md0a3WXsKqf/GLNVDG+s5nHAHhdr
 aG94ri2QPYe1HLKk/kkyggTmMBSCZ6TymnIHrEQsU5tLhPjadEqcYq6vzAiNjFc8oDzkt4GvrVW
 36uUhFtxcRC73KS2Pk3v2iAvWUlCOdGSvVp2au9wgqtaZobaYu/JImeoEMe8Su007oqoximsEfQ
 MrncjunO7jY6Ng45mYBd4EQ0/EoNWhygigoERU6Np/yPbzKvMTvMVKCAWByAX7d8DkGLQyl+J9G
 apOXPytAwh2Ja4S3OKCgWnLUrlI/4Qz2s10cKUO1EimDqOASkyAyk1OftkB4T+CU16KRvNi7eEd
 GoYEEb3DhYLkv8LpfWhGEMzHJ49H4DNlIb/RH6B0rIbFT1QlIendcDiCtQ373Ede9uhFwTlh
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6845b54d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=YHzl7gtIdm5AkKPMTYkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ZQcU8LMNo_jhW4g4hPXEzcDpRsS33j0K
X-Proofpoint-ORIG-GUID: ZQcU8LMNo_jhW4g4hPXEzcDpRsS33j0K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-08_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=822
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506080129

In order to describe connections between Genesys GL850G hub and
corresponding Type-C connectors, follow example of RTS5411 and describe
downstream facing ports. Unline normal case of ports being connected to
a USB device, hotplug ports use OF graph representation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index 7f74f181b75c5924f18d3a1b09f713ca03cf9d8c..9a94b2a74a1eb26025a183583702e9ea02372a74 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -28,6 +28,18 @@ properties:
 
   peer-hub: true
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port@':
+        $ref: /schemas/graph.yaml#/properties/port
+
+        properties:
+          reg:
+            minimum: 1
+            maximum: 4
+
 required:
   - compatible
   - reg

-- 
2.39.5


