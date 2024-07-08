Return-Path: <linux-usb+bounces-12065-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E5D92ABFD
	for <lists+linux-usb@lfdr.de>; Tue,  9 Jul 2024 00:21:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C3341C22084
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jul 2024 22:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B781509AF;
	Mon,  8 Jul 2024 22:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b="LYId8oyb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8A814EC44
	for <linux-usb@vger.kernel.org>; Mon,  8 Jul 2024 22:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720477277; cv=none; b=CscKI4EuJ2fYEAeSoIyVx5XlwmsTBCxKaUR49yaRALc0zahWkJd5EKwgzJeeSGH8q6fcnJLOBlvZQGc9RxdfrsaPxHLlez6n7ZSgIllw8s91iHNPq4S6p2Lm1QQ9YRbRDOWmswqIzxbDsi1gz72BehS8W7+s5DIhfGoA77dr1OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720477277; c=relaxed/simple;
	bh=hbsWlZgrHZhDM0+dbo4GMS4oCsrlTnFf9Y6KyA3Oqx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CbrdqF3Xss9PJwchlp/mMUF2Dt+HFCWNHOLqO/Hn441TvRuZBfn6A8M+4oC4lo8mbIzNmgwVr30rrDk46UFjtUSv+5nZf8LuFx9F4hB9tocrL1kN7di0sOv3cjjrekuGwheIffyMgnJj4gLVsTyD0lIjS5hiunQfbXfIJaEfq9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de; spf=pass smtp.mailfrom=hauke-m.de; dkim=pass (2048-bit key) header.d=hauke-m.de header.i=@hauke-m.de header.b=LYId8oyb; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hauke-m.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hauke-m.de
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4WHz9L0XVXz9sc2;
	Tue,  9 Jul 2024 00:21:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hauke-m.de; s=MBO0001;
	t=1720477270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ltmh8VyQVMbxmp8r77gHT99SiaRNE50cgKBy0C7aGTc=;
	b=LYId8oybV8iJWLndA0E6gYMHC+LEfWilfhYnuxWuSMSubWIQM5LIsX3oDf8CZ7X0QM/vq5
	jZ/8EczSy4/jTzKDLCi/s2zLo3xGN5Ob2LiOd+HdcYurm7cPC6LJ5qf77XytZPTbLXIfup
	oYR2sKRcgXH6sbyMiRbm+HubRzLkomuVKqkNR0XNSlBV6r1Uz6fAOMhzjoJNOir1KY/WmW
	/ds/SBp7ZHZik9wvQTopmzpeNVT8IqxYiVop8TUogl4/Yqkrxxd9rMHvKim6iS50dmf0wR
	yNcww0nvxO/wBvcx89W5y4jRLay+yQHuSrC5OB52CArHPRK+XpBrTfOHM8PM+Q==
From: Hauke Mehrtens <hauke@hauke-m.de>
To: hminas@synopsys.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH] usb: dwc2: add support for other Lantiq SoCs
Date: Tue,  9 Jul 2024 00:20:54 +0200
Message-ID: <20240708222054.2727789-1-hauke@hauke-m.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of the internal RAM of the DesignWare USB controller changed
between the different Lantiq SoCs. We have the following sizes:

Amazon + Danube: 8 KByte
Amazon SE + arx100: 2 KByte
xrx200 + xrx300: 2.5 KByte

For Danube SoC we do not provide the params and let the driver decide
to use sane defaults, for the Amazon SE and arx100 we use small fifos
and for the xrx200 and xrx300 SCs a little bit bigger periodic fifo.
The auto detection of max_transfer_size and max_packet_count should
work, so remove it.

This patch is included in OpenWrt for many years.

Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
---
 drivers/usb/dwc2/params.c | 30 +++++++++++++++++++++++++-----
 1 file changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 5a1500d0bdd9..a937eadbc9b3 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -133,7 +133,15 @@ static void dwc2_set_rk_params(struct dwc2_hsotg *hsotg)
 	p->no_clock_gating = true;
 }
 
-static void dwc2_set_ltq_params(struct dwc2_hsotg *hsotg)
+static void dwc2_set_ltq_danube_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_caps.hnp_support = false;
+	p->otg_caps.srp_support = false;
+}
+
+static void dwc2_set_ltq_ase_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
@@ -142,12 +150,21 @@ static void dwc2_set_ltq_params(struct dwc2_hsotg *hsotg)
 	p->host_rx_fifo_size = 288;
 	p->host_nperio_tx_fifo_size = 128;
 	p->host_perio_tx_fifo_size = 96;
-	p->max_transfer_size = 65535;
-	p->max_packet_count = 511;
 	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 <<
 		GAHBCFG_HBSTLEN_SHIFT;
 }
 
+static void dwc2_set_ltq_xrx200_params(struct dwc2_hsotg *hsotg)
+{
+	struct dwc2_core_params *p = &hsotg->params;
+
+	p->otg_caps.hnp_support = false;
+	p->otg_caps.srp_support = false;
+	p->host_rx_fifo_size = 288;
+	p->host_nperio_tx_fifo_size = 128;
+	p->host_perio_tx_fifo_size = 136;
+}
+
 static void dwc2_set_amlogic_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
@@ -297,8 +314,11 @@ const struct of_device_id dwc2_of_match_table[] = {
 	{ .compatible = "ingenic,x1830-otg", .data = dwc2_set_x1600_params },
 	{ .compatible = "ingenic,x2000-otg", .data = dwc2_set_x2000_params },
 	{ .compatible = "rockchip,rk3066-usb", .data = dwc2_set_rk_params },
-	{ .compatible = "lantiq,arx100-usb", .data = dwc2_set_ltq_params },
-	{ .compatible = "lantiq,xrx200-usb", .data = dwc2_set_ltq_params },
+	{ .compatible = "lantiq,danube-usb", .data = &dwc2_set_ltq_danube_params },
+	{ .compatible = "lantiq,ase-usb", .data = &dwc2_set_ltq_ase_params },
+	{ .compatible = "lantiq,arx100-usb", .data = &dwc2_set_ltq_ase_params },
+	{ .compatible = "lantiq,xrx200-usb", .data = &dwc2_set_ltq_xrx200_params },
+	{ .compatible = "lantiq,xrx300-usb", .data = &dwc2_set_ltq_xrx200_params },
 	{ .compatible = "snps,dwc2" },
 	{ .compatible = "samsung,s3c6400-hsotg",
 	  .data = dwc2_set_s3c6400_params },
-- 
2.45.2


