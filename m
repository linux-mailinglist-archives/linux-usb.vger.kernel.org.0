Return-Path: <linux-usb+bounces-18629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3FB9F609E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE7897A42C5
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4BF1990DD;
	Wed, 18 Dec 2024 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iV+D0s2Z";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ABHZw3+h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0F1990A7;
	Wed, 18 Dec 2024 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734512456; cv=none; b=CdF+FWxQAxM+mTrZZC1NMpO+6kDz82jxYR/ctQeP1ai7Vs61a0zGLZFDyFEAOiBCjF6I04C1ZqR1pOEj8EXze+L/s4fauXpOGL6A0aliSmP4JRGOup+TykM/No9LSXVjklHcb9rMG9ilRyhpVFozyMi3I2NXvgbfFG4oUDT1kKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734512456; c=relaxed/simple;
	bh=dK/sMq+X+Z6muZK4g6LypQgMGJzSoRT96/nDx3zE1ds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hmUXD1Ee6K66GxrDT/mkMa8UCCcOVhHrD0Ya8sO8KxPbgSFY41fUDWDciWqO0FbuOP20jaXE6hFWFt9ViaxcTpTqpo/NjMDh/e6/IQkNrWPSHxXx17Sx8egxIeJSahH0mo/o8JzVsoI849CQ+1FmNfuRMwuA6wMbsjbMB7ExAEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=iV+D0s2Z; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=ABHZw3+h; arc=none smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI75cCP029621;
	Wed, 18 Dec 2024 01:00:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	pfptdkimsnps; bh=NQgxk92II7osSODej+t7Eevy4Q2lRvBE21mcmentBnM=; b=
	iV+D0s2ZuzglAeu6YP7Os7d7gRK93sFvEuy0bQ5yXQz6Gl5uyMJx1HAFLUwDt8ay
	kMuCqEv96TfU7ph6WbrJRfUvFsg96ZOok2/GcJipflegNVwGGPMinPyJw4DROakH
	MebaX2JdQiXpxKR/uY7uejwfUPi689q9CzbN0kEQC8k7wXg5QYUCSK72Qz/Q6/Fn
	fDYemaIfwg6WyFKtlOq4LfnKf+zAPWbML/6ZOsxIi+GO6okWYCpuGWe37qK6nvEj
	A/WQklZ3qpdGpMhVhH0c7SY5V6xFekXSpXuKI2uCjzfztucXudetbNfmq/UqnVZc
	JJKWi9fL30ONAAROQgbtsA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 43kjw226dk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 01:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1734512438; bh=dK/sMq+X+Z6muZK4g6LypQgMGJzSoRT96/nDx3zE1ds=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ABHZw3+h0bUcvf9tZhbjbgRdSCjTfVGCjstNK4wQKoFrqdOTEFiwuYh0gesYX+XAB
	 PEDV+lYhNMxlBxrviSPLKWELvvChvblwJC/7BAUXWFiU9P+UF5yRQC1sUnmbFjpVlQ
	 iXchEqoZfaY/MA6exPATd0RNpm4LAEONY/IwBl/8UalqSz16SH+LlzrjErzjmFeh7G
	 4vAPk5T9/xkI904apEG/HYtcq7lsu6s1DPC1E6AT3py6ep04Y2+wvo08oBo23jkmhT
	 23wcpBmC1KCR6YkZxtCMwSrOMtBUeeuURfzJNjf963cRMY11moAdzJ5HiaawQSntz+
	 EjcjW+yPJGjNw==
Received: from mailhost.synopsys.com (eudc-mailhost1.synopsys.com [10.213.161.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 57CE54011C;
	Wed, 18 Dec 2024 09:00:38 +0000 (UTC)
Received: from stormcs515.internal.synopsys.com (stormcs515.eudc.maas.synopsys.com [10.212.40.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 2CD9AC07CA;
	Wed, 18 Dec 2024 09:00:37 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: "Miao.Zhu" <Miao.Zhu@synopsys.com>
To: gregkh@linuxfoundation.org, robh@kernel.org, xu.yang_2@nxp.com,
        andre.draszik@linaro.org, dan.carpenter@linaro.org,
        emanuele.ghidoli@toradex.com, heikki.krogerus@linux.intel.com,
        m.felsch@pengutronix.de, rdbabiera@google.com,
        u.kleine-koenig@baylibre.com, conor+dt@kernel.org, jun.li@nxp.com
Cc: "Miao.Zhu" <Miao.Zhu@synopsys.com>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Jianheng.Zhang@synopsys.com, James.Li1@synopsys.com,
        Martin.McKenny@synopsys.com
Subject: [PATCH v4 2/2] dt-bindings: usb: ptn5110: add TCPC properties
Date: Wed, 18 Dec 2024 09:59:33 +0100
Message-Id: <20241218085933.2790127-3-miao@synopsys.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20241218085933.2790127-1-miao@synopsys.com>
References: <20241218085933.2790127-1-miao@synopsys.com>
X-Proofpoint-GUID: 3ZeWQdsYjUHSBOO7S2a6rxBCbwxp2WB3
X-Authority-Analysis: v=2.4 cv=HYHuTjE8 c=1 sm=1 tr=0 ts=67628f36 cx=c_pps a=8EbXvwLXkpGsT4ql/pYRAw==:117 a=8EbXvwLXkpGsT4ql/pYRAw==:17 a=RZcAm9yDv7YA:10 a=qPHU084jO2kA:10 a=jIQo8A4GAAAA:8 a=fJV_grPypyEusMyLlfIA:9 a=Lf5xNeLK5dgiOs8hzIjU:22
X-Proofpoint-ORIG-GUID: 3ZeWQdsYjUHSBOO7S2a6rxBCbwxp2WB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxlogscore=999 malwarescore=0 spamscore=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412180071
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
V3 -> V4: refine description to follow DTS coding style
V2 -> V3: add description and type for new properties
V1 -> V2: new patch
---
 .../devicetree/bindings/usb/nxp,ptn5110.yaml       | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
index 65a8632..f5059dc7 100644
--- a/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
+++ b/Documentation/devicetree/bindings/usb/nxp,ptn5110.yaml
@@ -21,6 +21,28 @@ properties:
   interrupts:
     maxItems: 1
 
+  TX_BUF_BYTE_x_hidden:
+    description:
+      True when TX_BUF_BYTE_x can only be accessed through
+      I2C_WRITE_BYTE_COUNT.
+    type: boolean
+
+  RX_BUF_BYTE_x_hidden:
+    description:
+      True when RX_BUF_BYTE_x can only be accessed through
+      READABLE_BYTE_COUNT.
+    type: boolean
+
+  auto_discharge_disconnect:
+    description:
+      True when TCPC can autonomously discharge vbus on disconnect.
+    type: boolean
+
+  vbus_vsafe0v:
+    description:
+      True when TCPC can detect whether vbus is at VSAFE0V.
+    type: boolean
+
   connector:
     type: object
     $ref: /schemas/connector/usb-connector.yaml#
-- 
2.9.3


