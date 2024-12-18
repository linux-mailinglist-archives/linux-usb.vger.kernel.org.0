Return-Path: <linux-usb+bounces-18614-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 855409F5E4C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 06:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0BC018853FD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 05:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DD91154C17;
	Wed, 18 Dec 2024 05:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="TAquYron";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="O48jEEdS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F283224;
	Wed, 18 Dec 2024 05:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734499718; cv=none; b=ZqSGa83mmrb80DsMy9tx2vsJOlz6k86nzpbEQhVc2B0cyngmqZswuhU8Q71kQ9JQR8oxd93rmpYo2Poi8gh/gTa0P5C4DrrLCZSBDRLLubf2xt8gwKMXxJu6wKm22twuzfEd0rjSodI0hI0yZOz4fr1ivkUin9nYZvnQNkcCSRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734499718; c=relaxed/simple;
	bh=a+UBlam+BuwlVZTmhOAgChz86yiqFO6yC6B8NFGP8DA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hBrvoPcDHnsUhuU8oNFozw/x0oE5QFnUAWI9R8XFgPxo3HBxMdKzQT0+16Y4yp8mTDhfuRHvfrzMB8jpikYVaOVF1CULXedL6f71hKBiIkoUt3VCCILsRSS4+XR5SwP6mrRMYv6VihwSz1r4PB8z27IhWd+nhUhoEnA7Km5YE0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=TAquYron; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=O48jEEdS; arc=none smtp.client-ip=148.163.158.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0297265.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHNsfJQ025975;
	Tue, 17 Dec 2024 21:28:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	pfptdkimsnps; bh=3ATTw+HImnbnLS32R8Fta+4GX5bE3Ukp2RAUZPGNw1s=; b=
	TAquYronYHCeCilebRtUdYXIPu4YsYnTx/CNiUlX9sS5YKLEAy13W61aJuhtqGvA
	6mUqwp1xE1qx4Msbl4nD5MYJ47VXs6arMcX0G12txfhEMbAOPQ5VYLM3zrsMTikJ
	u7pIwxPhA0X+DTr3SZ3iI2IVbvqI/NPVV5A4aUFTn9MbM0tmOlyyk/dMWrgXBFTm
	t13Ygm7stO3bXzc8RRsOc1qWxxji5MNM1uCvkrgsn59YCWx3nYDLZgdJB36qfioZ
	D667tOrodiHZndO/nyJeq9LueQdZt5+iR2iPrSGqivpCpgYnquxi4YNhdOyjWHrQ
	ETSuTMOjiB2PD+jKq31+Hw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43kkcy9743-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 21:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734499697; bh=a+UBlam+BuwlVZTmhOAgChz86yiqFO6yC6B8NFGP8DA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O48jEEdSl3CELlpMx1TWFiPIqGtVCzofTuAA12qn1Zu+97RMtWZmaNNxyb8tGKhCS
	 Pkofil2dH/oYvosIlDPXeSykWdPZiMD6Oe/vGDTJ+5ZydXU8xO2qceZzt38Zxt+fat
	 xV91yV0L+DfI+RVwja3QcH9x2fKw7QSib/+K3FyBAtQM/LXYpRgzUJtmRxPwzELodH
	 t06ME41Gt2w4VP+3EkL3K+nO08wh3TZiVAUtSrfnaXcF8clJy3V27u2cNu00sweJKM
	 M2vjTyvq6aoictceKLt9GqWCpUVb3WpuFf+sH74Kj6+sM2gBpJfHVaMp36OFW1kEoI
	 cTUGRsZa2FMhA==
Received: from mailhost.synopsys.com (eudc-mailhost1.synopsys.com [10.213.161.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 9366040124;
	Wed, 18 Dec 2024 05:28:16 +0000 (UTC)
Received: from stormcs515.internal.synopsys.com (stormcs515.eudc.maas.synopsys.com [10.212.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id A7C18C0A19;
	Wed, 18 Dec 2024 05:28:14 +0000 (UTC)
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
        "Miao . Zhu" <Miao.Zhu@synopsys.com>
Subject: [PATCH v3 2/2] dt-bindings: usb: ptn5110: add TCPC properties
Date: Wed, 18 Dec 2024 06:28:07 +0100
Message-Id: <20241218052807.1812406-1-miao@synopsys.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <173448855676.4113446.18228420092453259118.robh@kernel.org>
References: <173448855676.4113446.18228420092453259118.robh@kernel.org>
X-Proofpoint-ORIG-GUID: F3v3A44v7VH00BUs0H_KxCpme3ysIedK
X-Proofpoint-GUID: F3v3A44v7VH00BUs0H_KxCpme3ysIedK
X-Authority-Analysis: v=2.4 cv=bt62BFai c=1 sm=1 tr=0 ts=67625d72 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=RZcAm9yDv7YA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=fJV_grPypyEusMyLlfIA:9 a=Lf5xNeLK5dgiOs8hzIjU:22
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

The TCPCI driver has flags to configure its protperties but
no way to enable these flags yet. Add these flags into DT
so that the driver can be compatible with TCPCI  Spec R2 V1.0.

Signed-off-by: Miao.Zhu <miao@synopsys.com>
---
V2 -> V3: Add description and type for new properties:
V1 -> V2: No changes
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


