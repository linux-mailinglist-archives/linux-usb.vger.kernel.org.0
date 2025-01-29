Return-Path: <linux-usb+bounces-19835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EC68FA21B5B
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 11:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C61D16532D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2025 10:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C71771BBBD3;
	Wed, 29 Jan 2025 10:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Xuur70nj"
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795001B395F;
	Wed, 29 Jan 2025 10:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738148186; cv=none; b=GNxGTwnklxDoy7BfRqtvV9y+DQ1dIjYHB5155U1EXksaNUkemQfu5a2CW+PJ7lJOrMRdkE2uh4oRe+x9y1rm11IEFynFtK9L2tUh8GP+Q4hdcsVfCAp9jdQpGln55nrI/fcQ2TMbAY2RUoHsXKrTaKB6M7xHxB9SsDZxTuBQOek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738148186; c=relaxed/simple;
	bh=E3sZpO2ZDDdSerDkEqctEBCeBfsGAZxxuJQiFQglbxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M/+LZsjOkkA+BbzAI6b4J+G2pyYo57L5aENCUYNOFyaCXvxsCYDobMd7xCPU04m8J+nyvJAHYDHMlZF3QzAm/Shp4T4xDk4B2T2u6pNb8yEmFwR/hnIln0ivapttT0MhnZLKPddmxwlasUqpSgFekHlsJAEMmIozWl1nRC4lNQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Xuur70nj; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE173FF80B;
	Wed, 29 Jan 2025 10:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738148177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBpZYyQZvSnDBWS4b3Zllq0kdljgm85ce8KMv3JTfrI=;
	b=Xuur70njlrt0mR6eVn3AVQuetPQmAl/MM4NnsMTBifG/Dyjwf8MiVSPMTw3WflFBI73aVw
	GPxVhZxCxOPDfwD8esnOvRR1cOeH9eo22CB4BVptjDhfM/8A2w/RZxqbuUZe8qv4KQqZ1G
	dwKklEo3hRLOaHcJ3GcveSWB0/Rc3sNwzeX8pV5WwhePRb7o7nk+tXp571FcBssVrj2bAt
	noIqsPeAWiAl5kCcs8krBkv7AyU/g9YLH3PP/0/IB9Hk1PJIU5z7ayDRMK85Iz28ufv6Rg
	ALAVL1ydm0zVjL3X82YshtqYle37KbwPZzahsZn7F3wFchhu6IExMyaMPfqQ/Q==
From: =?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>
To: theo.lebrun@bootlin.com,
	mathias.nyman@linux.intel.com
Cc: rogerq@kernel.org,
	peter.chen@kernel.org,
	pawell@cadence.com,
	gregkh@linuxfoundation.org,
	mathias.nyman@intel.com,
	gregory.clement@bootlin.com,
	thomas.petazzoni@bootlin.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/9] usb: cdns3-ti: run HW init at resume() if HW was reset
Date: Wed, 29 Jan 2025 11:56:08 +0100
Message-ID: <20250129105613.403923-4-theo.lebrun@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
References: <D7EHVKGXIFM4.3IDSI7TDG85AV@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: theo.lebrun@bootlin.com

At runtime_resume(), read the W1 (Wrapper Register 1) register to detect
if an hardware reset occurred. If it did, run the hardware init sequence.

This callback will be called at system-wide resume. Previously, if a
reset occurred during suspend, we would crash. The wrapper config had
not been written, leading to invalid register accesses inside cdns3.

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
---
 drivers/usb/cdns3/cdns3-ti.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/cdns3/cdns3-ti.c b/drivers/usb/cdns3/cdns3-ti.c
index 2863249665c2..225993f7bdb6 100644
--- a/drivers/usb/cdns3/cdns3-ti.c
+++ b/drivers/usb/cdns3/cdns3-ti.c
@@ -186,6 +186,12 @@ static int cdns_ti_probe(struct platform_device *pdev)
 	data->vbus_divider = device_property_read_bool(dev, "ti,vbus-divider");
 	data->usb2_only = device_property_read_bool(dev, "ti,usb2-only");
 
+	/*
+	 * The call below to pm_runtime_get_sync() MIGHT reset hardware, if it
+	 * detects it as uninitialised. We want to enforce a reset at probe,
+	 * and so do it manually here. This means the first runtime_resume()
+	 * will be a no-op.
+	 */
 	cdns_ti_reset_and_init_hw(data);
 
 	pm_runtime_enable(dev);
@@ -230,6 +236,24 @@ static void cdns_ti_remove(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static int cdns_ti_runtime_resume(struct device *dev)
+{
+	const u32 mask = USBSS_W1_PWRUP_RST | USBSS_W1_MODESTRAP_SEL;
+	struct cdns_ti *data = dev_get_drvdata(dev);
+	u32 w1;
+
+	w1 = cdns_ti_readl(data, USBSS_W1);
+	if ((w1 & mask) != mask)
+		cdns_ti_reset_and_init_hw(data);
+
+	return 0;
+}
+
+static const struct dev_pm_ops cdns_ti_pm_ops = {
+	RUNTIME_PM_OPS(NULL, cdns_ti_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
 static const struct of_device_id cdns_ti_of_match[] = {
 	{ .compatible = "ti,j721e-usb", },
 	{ .compatible = "ti,am64-usb", },
@@ -243,6 +267,7 @@ static struct platform_driver cdns_ti_driver = {
 	.driver		= {
 		.name	= "cdns3-ti",
 		.of_match_table	= cdns_ti_of_match,
+		.pm     = pm_ptr(&cdns_ti_pm_ops),
 	},
 };
 
-- 
2.48.1


