Return-Path: <linux-usb+bounces-18613-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2492B9F5E43
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 06:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03DE4188F946
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 05:23:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A131547FF;
	Wed, 18 Dec 2024 05:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JmVgy3y7";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="JGATRaXl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD927726;
	Wed, 18 Dec 2024 05:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734499397; cv=none; b=aj9WcUNdZ/sEZEzLEXkt8COJbHfMl2M0tyZ/RhhfMnXX6XXQBO10hS3WsGhVTNwiwB08pqSND2edyVWSpQvGQzlko1qpSlzZVJI85H1ScTDaMR/r1Uy/T0/T7JM7ABzHLl2SVlY5qoPfBmemOO9CZ20P4NH+KDIASGJhKdAuQKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734499397; c=relaxed/simple;
	bh=JB94LtXCVzGjKZHgG6vWdxASXrY4u4kAZCcTqfbV87Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hAP/AGKqdOMAXvyfFGgeJz6GqwjHaxGJsdObGuGlJaMPOTGtYYvSQGE1+7U1kbGuPb+L/c7Jf202hDJ7MWnxg2qKifQQ7aABNc/D9k8vt5DUyEv9hyefA+LFs+PXSEf9IeUZigdK9Xt2wZDpywNJHJAyIFYa/zfn84EEof7feKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JmVgy3y7; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=JGATRaXl; arc=none smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHNsmGK026157;
	Tue, 17 Dec 2024 21:22:45 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	pfptdkimsnps; bh=gzleMx6NAEIz9mMvFvK+VMmSCxl4zYzuSRVj+w9d6to=; b=
	JmVgy3y77+2Trash5ho4xpe6iXODwfatKvSw+fBMCngtdoPI9VL5W0leIiL+rVFL
	4gE1y6SRfPlkceB58IMFeW22t3kh1wkFhNxXYldZBXfOPRLaOfiYeEdtw3VoZVf8
	WMqbRCct7Fs2v0VpPE0KlQpSLK60PO5Vp/qQbmnjDDWvcCcDzg6ldkIvNInG3Z6J
	RD2JYmiptylRJZfs9mdCRAZleYzuX9/dO6gbjaJy9tB/Vhq9nRtmNPBxZDvfJDy0
	5PXy1nycwxbYccHs10bF8gwY/wVgmiabFqdvPISXtkPuwuLjXRfT6smlIrKDN/GL
	vd86gi8RTU8hO/ITpCF2kw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43kkcy96ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 21:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734499364; bh=JB94LtXCVzGjKZHgG6vWdxASXrY4u4kAZCcTqfbV87Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JGATRaXltsB0uFaiI6QF84FGDJeDqLX29/PSPOUJErSCBLeA4euelMXBCZHgFwL4y
	 H5LAOtQD6MX3J0wRbvEr8SUsKwFH4n9Vn+i0g2gfo1pihy/UOGlPxUTC5F4YU5Ox8G
	 lIj6P5PX4w2VgYdbpWPlZToIqTMV0XM2tE8VMsJddaQqtzA03prcqsl50eyJbNzitj
	 jEn59rqg8jvY05d/fFb8NXE2pyvzh5LT1PQ6OZOH0cDQoHb+CzTEYTAA8+O6BhuPat
	 oLeu56jbT8Ccbpj6Q3D4dVAcHi3VNVyVSELV1uqzGPRc1zKiCgQd8cfurzCcdJJThb
	 rAq6vLjsVkSAA==
Received: from mailhost.synopsys.com (eudc-mailhost1.synopsys.com [10.213.161.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EB4114024D;
	Wed, 18 Dec 2024 05:22:42 +0000 (UTC)
Received: from stormcs515.internal.synopsys.com (stormcs515.eudc.maas.synopsys.com [10.212.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 1950AC1435;
	Wed, 18 Dec 2024 05:22:41 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Miao.Zhu" <Miao.Zhu@synopsys.com>
To: robh@kernel.org
Cc: James.Li1@synopsys.com, Jianheng.Zhang@synopsys.com,
        Martin.McKenny@synopsys.com, Miao.Zhu@synopsys.com,
        andre.draszik@linaro.org, conor+dt@kernel.org,
        dan.carpenter@linaro.org, devicetree@vger.kernel.org,
        emanuele.ghidoli@toradex.com, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, jun.li@nxp.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        m.felsch@pengutronix.de, rdbabiera@google.com,
        u.kleine-koenig@baylibre.com, xu.yang_2@nxp.com,
        Miao Zhu <Miao.Zhu@synopsys.com>
Subject: [PATCH v3 2/2] dt-bindings: usb: ptn5110: add TCPC properties
Date: Wed, 18 Dec 2024 06:22:14 +0100
Message-Id: <20241218052214.1808006-1-miao@synopsys.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <173448855676.4113446.18228420092453259118.robh@kernel.org>
References: <173448855676.4113446.18228420092453259118.robh@kernel.org>
X-Proofpoint-ORIG-GUID: qpDN9B0Pd5lHYzkck4ojE3mvdPTZVNe0
X-Proofpoint-GUID: qpDN9B0Pd5lHYzkck4ojE3mvdPTZVNe0
X-Authority-Analysis: v=2.4 cv=bt62BFai c=1 sm=1 tr=0 ts=67625c25 cx=c_pps a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17 a=RZcAm9yDv7YA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=fJV_grPypyEusMyLlfIA:9 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180041
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>

From: Miao Zhu <miao@synopsys.com>

The TCPCI driver has flags to configure its protperties but
no way to enable these flags yet. Add these flags into DT
so that the driver can be compatible with TCPCI  Spec R2 V1.0.

Signed-off-by: Miao.Zhu <miao@synopsys.com>
---
V2 -> V3: Add description and type for new properties:
---
 .../devicetree/bindings/usb/nxp,ptn5110.yaml       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 65a8632..29d6aed 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -21,6 +21,28 @@ properties:
   interrupts:
     maxItems: 1
 
+  TX_BUF_BYTE_x_hidden:
+    description:
+      When set, TX_BUF_BYTE_x can only be accessed through
+      I2C_WRITE_BYTE_COUNT.
+    type: boolean
+
+  RX_BUF_BYTE_x_hidden:
+    description:
+      When set, RX_BUF_BYTE_x can only be accessed through
+      READABLE_BYTE_COUNT.
+    type: boolean
+
+  auto_discharge_disconnect:
+    description:
+      When set, TCPC autonomously discharges vbus on disconnect.
+    type: boolean
+
+  vbus_vsafe0v:
+    description:
+      When set, TCPC can detect whether vbus is at VSAFE0V.
+    type: boolean
+
   connector:
     type: object
     $ref: /schemas/connector/usb-connector.yaml#
-- 
2.9.3


