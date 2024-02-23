Return-Path: <linux-usb+bounces-6975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6638619FD
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 18:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D940D28866D
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 17:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7618E1384A5;
	Fri, 23 Feb 2024 17:33:31 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28DE12DD86
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 17:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708709611; cv=none; b=Krf+KENsCB0uariGsYQbnZ2tUbp48KuAMYawoasqu7yZans1Vb54uxJNS3DYsDkhvgekPUyGn/Ahl9YKrAQAId5WxH3hndUduu3in6tjeUkMXcfIi9OcBlfLv7FhCHfMAEi9YUvOwKHNHrCkmmiCv+XPKmllpYuQMXr+OolxQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708709611; c=relaxed/simple;
	bh=sUVPD3cE8oiL7dQ3UtSlwtO33eNclyCEctEOnjEWLVA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YhtKpTamiGc89rFWJfSLHTuAf9qeMJOol6ST1SLuvcojWZCZ6Uw1Yls+k8aVa3hhgVPoa7jlMf3NWQ1YyjN8H1I792rubVBUf9LrqxdM/Ai7fHZVzYfwTAVy+hbX7d79whaUrK+2/KiSibxGLAbbf8fdDlMp7lW5wOoq6T9uFqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQH-0000QG-AC; Fri, 23 Feb 2024 18:33:21 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-002SzC-DJ; Fri, 23 Feb 2024 18:33:20 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rdZQG-00AWsd-14;
	Fri, 23 Feb 2024 18:33:20 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel@pengutronix.de
Subject: [PATCH 1/2] usb: gadget: fsl: Add of device table to enable module autoloading
Date: Fri, 23 Feb 2024 18:33:15 +0100
Message-ID:  <d1bf63f3ffe58bbd113467b56443e37f96435492.1708709120.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708709120.git.u.kleine-koenig@pengutronix.de>
References: <cover.1708709120.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=sUVPD3cE8oiL7dQ3UtSlwtO33eNclyCEctEOnjEWLVA=; b=owGbwMvMwMXY3/A7olbonx/jabUkhtQb1+6cm19Q4bliatM/xsfSTC/OyqRu+Bxqu+/ynj+m4 hVzVzz06mQ0ZmFg5GKQFVNksW9ck2lVJRfZufbfZZhBrEwgUxi4OAVgImVy7H+F656vfJeVtVhO v8ZwcvKNFUt6Lqu88507VzbEzqZ9SYHlIZOe4zdqe5p6M++qT5qfcU+wy2O73TO76qSpx5T9bnT JOlgfc190u8mybKO4hl/d3Axe8dT0hYcV2d3q4x72c+w7ofFImtvBhuF4sXKP81cx34eye+p9uN +U2ey7bbb3tl3S20Oh97cve+SwgkFbXZw9plBUzlH95a+jIYZNcycrbUlLi2r6z5O1dtO0qA2OV 67/7xQ2vLv4SsnecqYDFXF/S8rzvA+2VCZVHQ4Kabnh9tYh4PrJx9kRQZNSv1b39f3P7jXlaZOW WarOWdnm5OVfeCY3Z+7yQ/MPN938mFzutolh8d6yPmkGAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

With this table added, the fsl_usb2_udc module is automatically loaded
by udev in the presence of a matching device.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/usb/gadget/udc/fsl_udc_core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/gadget/udc/fsl_udc_core.c b/drivers/usb/gadget/udc/fsl_udc_core.c
index e8042c158f6d..65346a322a77 100644
--- a/drivers/usb/gadget/udc/fsl_udc_core.c
+++ b/drivers/usb/gadget/udc/fsl_udc_core.c
@@ -2666,6 +2666,15 @@ static const struct platform_device_id fsl_udc_devtype[] = {
 	}
 };
 MODULE_DEVICE_TABLE(platform, fsl_udc_devtype);
+
+static const struct of_device_id fsl_udc_dt_ids[] = {
+	{ .compatible = "fsl-usb2-dr" },
+	{ .compatible = "fsl-usb2-mph" },
+	{ .compatible = "fsl,mpc5121-usb2-dr" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, fsl_udc_dt_ids);
+
 static struct platform_driver udc_driver = {
 	.probe		= fsl_udc_probe,
 	.remove_new	= fsl_udc_remove,
@@ -2675,6 +2684,7 @@ static struct platform_driver udc_driver = {
 	.resume		= fsl_udc_resume,
 	.driver		= {
 			.name = driver_name,
+			.of_match_table = fsl_udc_dt_ids,
 			/* udc suspend/resume called from OTG driver */
 			.suspend = fsl_udc_otg_suspend,
 			.resume  = fsl_udc_otg_resume,
-- 
2.43.0


