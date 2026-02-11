Return-Path: <linux-usb+bounces-33286-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIi5G8B3jGktpAAAu9opvQ
	(envelope-from <linux-usb+bounces-33286-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 13:36:16 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F711245CA
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 13:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B91E301D4D7
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 12:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8B9357A34;
	Wed, 11 Feb 2026 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="S/D2Q953"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay95-hz2.antispameurope.com (mx-relay95-hz2.antispameurope.com [94.100.136.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFEE30E0F2
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813366; cv=pass; b=oOv26qLy16LHyCtov+vzHwSMXapnbq881elhaFHgBOun6SxZF65b+JiNKvndrCPpnLt1aBVLIKRTsFajT6dEDw7jtqxCqiB8GCQeR/BinOQRM2VL3Uxv0uHk6Ca1uyss+w+e5QXsTuoSm+ocTUvsSS3t7k1GgpOeD51VaFaAi5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813366; c=relaxed/simple;
	bh=wJazHtN9709bx5vXU3VSNca9S8moIeQOsgpt1xQauOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOe1hG6+ECJ8LsEaKsDxKgs0unHfTTbqnqA0ljjoLPOMiJWeuU3nxL7dZ+qvFLwUhcrLc6339/TthFMiuQS1VJU4UtRxXItYT1w1XbJf11ZKzVAGm571BxirvfVYLSlPmVFakDxE4OUpkOF3+La4zJM38MmRjOQhd/tr/Cai22o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=S/D2Q953; arc=pass smtp.client-ip=94.100.136.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ls/S0m9WGUgqWCy8vJncgSdsx/isbkuq3kh3sRBurJc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813308;
 b=k4pz4jxco0Oo2nF4+80tRjV3uvxNg47f7tDHZSD4W026XXebjG8Zl+ZECtsWmHH04xMgiPpz
 Bg1HTpI53mGk/VxKdMdoZzNMq4dHhc1+fucSu9MX+3xRo1CfQniP0IdJGZWVzK0hBHV74rdSfvV
 mGkGxSG/A+YD8iUmuWszJGAiG/e40YWauZwdb9yApK/WCWzPYz75OQF3J6NsavycPVK74bpwio7
 A9AgmN0MB0Nn4ZUEPX7kDdQcEzEyODDTPDnMH35K5RGocRpt9MV3BFGNPc6rBk3/sXGpQ3JYsGT
 Eet76/T9z/h/JIFl0AF9Pu+mTqpINfhA0PBQ09hLv3Rng==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813308;
 b=eLjlAfuEZefjrEM1t0ZqkfjVGPtkezGPyRmX/M2MtIuGCn8Wx9fTXzf663VVKrEH+uFDty2b
 mCriqQh6eHW5LKDQ0pOeOE/800+4cUQO0S7sWVJp/UrFsG9HCcVl0X1/zIaKL0B9d0DfZa8CioM
 vTD7mWPACvO9gj/ntwMjMIOFLBddkZZ1Ek+g+C3OedCQ62C3CIh2mHaFo45R2FjjQsWGLMYF56w
 ah97BDe3rkOyupoappGbvJGJbkPO5oj8d+QqJyiTG9trOwmMZT1SPH/EibEyk9nKqsDGw/XNDZd
 m9Fv2AgCduuCqU+PuNoEx8SQEz9Gcyuvw6GXSkOW28piw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Wed, 11 Feb 2026 13:35:08 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9C0BC5A0F22;
	Wed, 11 Feb 2026 13:34:46 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH v2 3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Wed, 11 Feb 2026 13:34:30 +0100
Message-ID: <20260211123436.1077513-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-usb@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4f9yYg6lFBz2F1Th
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ddedd737b3f16a1ef86df4ac688a2a62
X-cloud-security:scantime:1.584
DKIM-Signature: a=rsa-sha256;
 bh=ls/S0m9WGUgqWCy8vJncgSdsx/isbkuq3kh3sRBurJc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813307; v=1;
 b=S/D2Q953ni6zmQjvCFFa5w92+LVxXjGO9wx751sQ9vXesmXy2vf7w3blJSLlvoB32EG/qT3j
 tYi7pfSVM9dbjlSfPRbuqB71fwSfl0efQau5UfNIzJYVow1pw1EuhWNDz9wyvdWf4Nhh4qudoK1
 HvCDvl4qGibvei7cbg/ixC+32YEIRsRCxgbr4CU8WptgeoYiavFdWtNjxKUJ+OiJreNN+g/Jylv
 Xyy3Uvsr8zTQBGrqYicqE4Ba3IyU/LKppqKkJoRRbemAYjKBuMWxRbmKRWN4ExGblPtH/VKe1/3
 sr9M08J5GBPLLE1HcnJzpYNJp6XW/V4NxhGshFwFJA5TQ==
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ew.tq-group.com,reject];
	R_DKIM_ALLOW(-0.20)[ew.tq-group.com:s=hse1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,glider.be,baylibre.com,cadence.com,linuxfoundation.org,pengutronix.de,gmail.com,denx.de];
	RCPT_COUNT_TWELVE(0.00)[26];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33286-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.stein@ew.tq-group.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ew.tq-group.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,tq-group.com:email,ew.tq-group.com:mid,ew.tq-group.com:dkim]
X-Rspamd-Queue-Id: 29F711245CA
X-Rspamd-Action: no action

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
* Collected Rob's R-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..ad6edd75c4ff7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1420,6 +1420,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


