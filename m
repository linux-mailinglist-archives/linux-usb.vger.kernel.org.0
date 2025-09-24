Return-Path: <linux-usb+bounces-28625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52501B9C9D5
	for <lists+linux-usb@lfdr.de>; Thu, 25 Sep 2025 01:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A96382D6D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 23:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A64A02BE658;
	Wed, 24 Sep 2025 23:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="phhJzxyw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B9627991E
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756915; cv=none; b=EkoPrxrZth8Kagbp605btU4B3XzEEfJ1YYDoJEq/nr8IFA6Svse5duypK3LLgLTwD8eJ0dqM/E333ATaY1pSUREfL6Xq/P42MUCXrkFZITCLu5f0r3Yld4k1Bx8QaQ102a+39Bv9/UDkMt5q0WkrdEvM3SvmvCb0Bytu9zA9qHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756915; c=relaxed/simple;
	bh=hU4ophAaEAd6H7eRZm1uuGkEAXFGtcDMUcpBkxQVHUs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SUrVjY08v4swWIOEpyq3wZu9vYppjh8Pd1+SCz5vsOSyIBPlDn8ffg/PhEzkJIBnYL/uEIDKH0Q/K4+9TKX4p8h8/UfEC5jO9SaCKUjqg1mktavFhaHc4RN6V1TaQRa/81KJTCHLFSrcZ2vEOm3D03zHxRIfJNUFTMu6KNRGaCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=phhJzxyw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODb2Bb019952
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PWqICJbVMy0RpODDALIty+rOGzCBRBu0xbDRo92ujfQ=; b=phhJzxywA9wrOq6t
	Cyty256UpxzAYkUiVTu9ZbneuG3pkOZBj+WsJ24fsAo5XF1pvHzwRqPRNi/nlJOU
	2xOzZaUSGo46reGxoTJ3VT2mp+76HBDPrMrdQjJbzUZJ8pA9HIDlKxAPiGbVrdMG
	9xXRxdPOPbe8QE8jJCZtGceKkgrI19Pnol1BlQyb6/Z7lq4zN0V58BFbFod81WOQ
	zjMx9d6VBrAEE6TXIa7LYQJBULY6DdsDPUtXoHvoit9/Qzk7YN6k0skexPLc1Y7W
	1Rtx1XarO7FBQUeGscxGHDazh4Hgn9S/kji3+y6d5mo+zw+OkgkUBD1amkYlialb
	rQTqPw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy918-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 23:35:13 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b56ae0c8226so209677a12.2
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 16:35:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756909; x=1759361709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PWqICJbVMy0RpODDALIty+rOGzCBRBu0xbDRo92ujfQ=;
        b=aJXkJvU1hbmSdIt+okfJRmczsV8+c0MdSmFqAmvoeA+315cz0qif9p/1ayvxkSqJ+G
         jRhRYxtG8XrIYK1tODIldBFfJqMPsjyeZRg0Z2VRNJPL483Wcn7Cz/OyFvHkndzyx0Tw
         gYDMHilTRsaVGEuUYCV99PnzZ3hXglS/MczmRv0KRazWYrz/FlYAtjwyuzDkB8oqt7xi
         UHWoakWhHnTisbZvoFmOkSN1QQXB7EC2MO6S9XSF1YsEMh5JtjZf++M6M1aGruVhWejT
         RsJtcXTdYQUMj6OvN71mJsLdSHa+gSey7cxOxNorTsw9pKmGtns56GNGfadWVKQvIIA2
         szJw==
X-Forwarded-Encrypted: i=1; AJvYcCVoUAKfCAJLnNSHCrJSq90cMvn2+LklpjtzrSfS3d9Jb2BlEXPkKddxPsIpHTNXQG56DzAypeAeao0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy708fhhkFJUtH42ewclZwmlSj51r6t3lVODcFENOMs0hPiigZj
	G1nJhgNqrm48xLzgWt1zioHXOcUNW82eKmwOee5rQPpZBfOklEE6F7uYA7tXRIJK1Z7Luj1qlwT
	XfNx+/uhu2SAVnnr4hotRNhrcYRbt+5CjGHMWB4Rcea9OEVmC8RDiunZl+mbq3eE=
X-Gm-Gg: ASbGncsuJfFUXrM/GIVZAHKTTYppKOUoYI1hh3bMJlFlIyIFxuBt184B+pR4Jb9C/vC
	ZkoBhbSUQcENSA8KSF4e403oiV2VVGNYYlil7NMtJUTRmojeTCXVW+oCCoCQY7PYburkqFfWbd9
	jTn3wIePAkSTTUGIEAB7y0vaubFqOPRJ1wzbnqwW8xBdBCjQy3l+8KxB+vsfhQAWs32oo4DumtQ
	4PlB3v0/5Txgc5gpSwpe8dq9m1Z/X0ugSyTM7Qoh6V8/mOMUosQB+n1SmS9zjo0P8hFOJpnsAmC
	E80A/ZzVy8bHzWglbeYSYyPME5b5mFyXQTQaNfYfo4Je3kXWjfKHRogbSvaoxFcB7/4N3zMh1Jm
	F38jhGnoaYWNXYSo=
X-Received: by 2002:a05:6a20:1588:b0:2d5:e559:d24b with SMTP id adf61e73a8af0-2e7cdda1022mr1646282637.32.1758756908652;
        Wed, 24 Sep 2025 16:35:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiJ/zMalK4Rfhi+KRWDxvhLRY72fdHDoPyo5I/09BwNd98hpdC08x8DXI7JsGifufRFFlfPg==
X-Received: by 2002:a05:6a20:1588:b0:2d5:e559:d24b with SMTP id adf61e73a8af0-2e7cdda1022mr1646245637.32.1758756908189;
        Wed, 24 Sep 2025 16:35:08 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238e9a9sm212379b3a.15.2025.09.24.16.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:35:07 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:34:54 -0700
Subject: [PATCH 1/4] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 Kaanapali QMP PHY
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-usb-v1-1-48bf9fbcc546@oss.qualcomm.com>
References: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
In-Reply-To: <20250924-knp-usb-v1-0-48bf9fbcc546@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756905; l=3174;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=KM21eRPw1BjO3tWglGr4aBncFUF2vQ3eFtUu9OugNJA=;
 b=zFJE8FT4iTnf2yqujsSkjV8dmDKm55xtIEX4wmJa8Y4mo4yvYckHXkpnIkbGaFnepoNyTcSZB
 PXaiYpG0fohCy3P3qBf6UPHN4u46CRHhqcgVPyUghKrv90jmiWpQKXi
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: BrWECQrPZ1_95QBQvaLTa0nUZeIDFsM8
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d48031 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2IkYd7TCTIqYiAcLhPQA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: BrWECQrPZ1_95QBQvaLTa0nUZeIDFsM8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX5CVaxhRx1epE
 4dNR3DqyNPvGjgdZyAjzNVgiz+4k1OXy/C/tOEwR4YMOwDjyv7LwnvBFOYpAhu9SMGkTvkKPCTP
 YRpKV8HDmfiEXisKecvy0K77A8LJcqoUM3ZH4xwYntG4W3cmMxMAwgQOxZJqlvB4hvIxfO5To5L
 gu1FTnhfqAwXQYVxHxiN0uDrk+cwp8bDdYyDJDujzWsxEVeUZ/EeNy2JLZGrXOFRlRULwCR1pqD
 vlsEvo+CAQ0+DlZ1UB1bY2kN0cl33VLWdjTCVOcBfutBEaEWUfM1AUW66Qu13KoJzTBsCjbecnz
 2xMiTeYchGdqSWzsApA9kqhET/LhhT42emUa+MKAshOiZKt2DJMVHFeNtliivKmGxC9nyOpGL/7
 ovQ0x5bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

From: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>

Document QMP combo PHY for Kaanapali. Use fallback to indicate the
compatibility of the QMP PHY on the Kaanapali with that on the SM8750.

Signed-off-by: Ronak Vijay Raheja <ronak.raheja@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         | 54 ++++++++++++----------
 1 file changed, 30 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index c8bc512df08b..8fa919ea3318 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -15,22 +15,27 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sar2130p-qmp-usb3-dp-phy
-      - qcom,sc7180-qmp-usb3-dp-phy
-      - qcom,sc7280-qmp-usb3-dp-phy
-      - qcom,sc8180x-qmp-usb3-dp-phy
-      - qcom,sc8280xp-qmp-usb43dp-phy
-      - qcom,sdm845-qmp-usb3-dp-phy
-      - qcom,sm6350-qmp-usb3-dp-phy
-      - qcom,sm8150-qmp-usb3-dp-phy
-      - qcom,sm8250-qmp-usb3-dp-phy
-      - qcom,sm8350-qmp-usb3-dp-phy
-      - qcom,sm8450-qmp-usb3-dp-phy
-      - qcom,sm8550-qmp-usb3-dp-phy
-      - qcom,sm8650-qmp-usb3-dp-phy
-      - qcom,sm8750-qmp-usb3-dp-phy
-      - qcom,x1e80100-qmp-usb3-dp-phy
+    oneOf:
+      - items:
+          - enum:
+              - qcom,kaanapali-qmp-usb3-dp-phy
+          - const: qcom,sm8750-qmp-usb3-dp-phy
+      - enum:
+          - qcom,sar2130p-qmp-usb3-dp-phy
+          - qcom,sc7180-qmp-usb3-dp-phy
+          - qcom,sc7280-qmp-usb3-dp-phy
+          - qcom,sc8180x-qmp-usb3-dp-phy
+          - qcom,sc8280xp-qmp-usb43dp-phy
+          - qcom,sdm845-qmp-usb3-dp-phy
+          - qcom,sm6350-qmp-usb3-dp-phy
+          - qcom,sm8150-qmp-usb3-dp-phy
+          - qcom,sm8250-qmp-usb3-dp-phy
+          - qcom,sm8350-qmp-usb3-dp-phy
+          - qcom,sm8450-qmp-usb3-dp-phy
+          - qcom,sm8550-qmp-usb3-dp-phy
+          - qcom,sm8650-qmp-usb3-dp-phy
+          - qcom,sm8750-qmp-usb3-dp-phy
+          - qcom,x1e80100-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -127,14 +132,15 @@ allOf:
   - if:
       properties:
         compatible:
-          enum:
-            - qcom,sar2130p-qmp-usb3-dp-phy
-            - qcom,sc8280xp-qmp-usb43dp-phy
-            - qcom,sm6350-qmp-usb3-dp-phy
-            - qcom,sm8550-qmp-usb3-dp-phy
-            - qcom,sm8650-qmp-usb3-dp-phy
-            - qcom,sm8750-qmp-usb3-dp-phy
-            - qcom,x1e80100-qmp-usb3-dp-phy
+          contains:
+            enum:
+              - qcom,sar2130p-qmp-usb3-dp-phy
+              - qcom,sc8280xp-qmp-usb43dp-phy
+              - qcom,sm6350-qmp-usb3-dp-phy
+              - qcom,sm8550-qmp-usb3-dp-phy
+              - qcom,sm8650-qmp-usb3-dp-phy
+              - qcom,sm8750-qmp-usb3-dp-phy
+              - qcom,x1e80100-qmp-usb3-dp-phy
     then:
       required:
         - power-domains

-- 
2.25.1


