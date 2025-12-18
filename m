Return-Path: <linux-usb+bounces-31589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E718CCC7BF
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 16:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 27FC5302CD5D
	for <lists+linux-usb@lfdr.de>; Thu, 18 Dec 2025 15:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7C83557FC;
	Thu, 18 Dec 2025 15:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="f9ErNRCA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-relay71-hz1.antispameurope.com (mx-relay71-hz1.antispameurope.com [94.100.132.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338AD35502A
	for <linux-usb@vger.kernel.org>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071327; cv=pass; b=gB9pdQiBYBth9eXz1DiqoEVXGLQxWTvB7JZF5Ogw4iDqFCWIw6mn46tPyhaZI2f/pkIDS2gyT28U0EdUxn9TbMqnqbhcjpyGfYQz54P6FzqlBEKqjmPz1Ivm7PqVEerdl5Q0//YOaQLPELx8nVjy04hqxbimdwl+MnP+2/dUS9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071327; c=relaxed/simple;
	bh=0QtQfNoo5zcJjIoBusJcUUqMqAgbQeNJiAM30UXwxcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P1f85Gb10gZtL4JXvTp3ICExehBSoTAlXfkAbPq4BAWT9uzWGihx7BDHmMilBrPpYvNMJNHNyBhtbvd1VCxyYru/C2Khzhvd23f2YM0z72GogRt9paJlWaY+iQLj1fZaYuurB3Siv4OGq5lR+0VbC/tIc4aj5GQF7InbujiawnY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=f9ErNRCA; arc=pass smtp.client-ip=94.100.132.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate71-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071295;
 b=QGXdpu+fC/Mpwrps9dBkA+hY+09XWtbsyJz0W1rNMNgUiz8XNUnQJch0cWyzjUyC8DAp0/wW
 yVim0vuhFrekfBgsGtocfciw9wEefgmF1qrO3gQ9HP1JCbUxsLh0kjZfCg5YOsf1hUHY/wXPT6g
 Ab+nwS66syhM49vL4WAerAPhgJweE/Ox/zR2soWLdwRdo8NWSaIsfQh2hW6ukcRt3piaHH6fqH+
 FnUiDg2E4J/AeU3LRnn28njcZnfNCDvzvu9qbKN+R5dKJgrxb37Xg4wzBEk9B7Xx3cAb0n2VO/T
 RJKGcAF8nOwjC3dq1uB2F0CqeIviqtE5xujRoZZPxh98w==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071295;
 b=AJB1xqsnl9tDibR4+Cuh+W4BvlBXeQoz1NGqT7aF9Fky0IU6+1vyGq8XsR+CvEHYJPqqSHPi
 TKIRu5rQHqLwe+ycEZfWhlN3+FcMr2l5nN7MvB7xLnhmmXyqTCB9twl9QxcGztneDn1+m9jhogK
 NMzb3U25UIrnOAzfZGIPPg+iiUub5a/+1FDxC3ee73AopirjqSfzFdyDcQyqxPCCmn3JRxjb+HG
 08Xbm5DUM4RjEeYcL64A2XVbWKz9wAudsOPKvlPRS40kL48qO3vw6qZYVmn3eLtp398e5e/Wffy
 gDvr+YHSeRWBQdEYdRso3+TSvy17vVoPDcPIwrQwuw3yw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay71-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:34 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6B138CC0D7B;
	Thu, 18 Dec 2025 16:21:10 +0100 (CET)
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
Subject: [PATCH 4/6] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 18 Dec 2025 16:20:51 +0100
Message-ID: <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay71-hz1.antispameurope.com with 4dXDs34QP3z3fwGG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:66d9300a35196336384c9a16144f2bee
X-cloud-security:scantime:2.419
DKIM-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071294; v=1;
 b=f9ErNRCA/kKS0yujUaMqIRbw6b4k+MVLiRwii4rlGn7h6LGjSvI2HldJG3q/ltLh2vVb3EC5
 Ocv8TtjOa6xyS2el2R11NCjifqJmfr7YNzo8zJbbHJApIFwfsrIuMM0CVUvXzdM4G+pD0ilwt3Q
 h0UaExYSKtZFSPYX7u7ItOBqFbKtM0WnvAYXxmrE/nYnpuO7yQC4MMcSAZbvAJLpaQKZSXeVkjs
 REoMR/V9+AFRtYx5Js4TH0J36MPHcMxkzUpmO3cCMdFCOyUFT9hWBm/BDhX8Z22zMe4Im9GyexW
 2bFGdbklXw4WJvAEUdfTaglhSX75JJ7MfZngVE5nn+9Nw==

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index dfe9fa5c4dbc4..6384b36b6f385 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1401,6 +1401,16 @@ properties:
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


