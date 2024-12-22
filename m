Return-Path: <linux-usb+bounces-18727-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 699779FA7E8
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 21:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A465B18865B8
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 20:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B26192B84;
	Sun, 22 Dec 2024 20:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="I4G2XPUU"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425E718F2CF;
	Sun, 22 Dec 2024 20:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898436; cv=none; b=PMyEKVnQXSUJwJsJbO0gWVvd/O6355f2YfeZHGe2h25r4YYnnYD8LJVZiCAGmPCpO7CR4DglSdvwrrH/eAmDpliHh6W/swcR/YsJvd1OTt2oYsfPrTOASTlfhJon9n24aM0teN8iin08zQ9Zn6Sv8LPYX0WBwsAaMllnMMfEryY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898436; c=relaxed/simple;
	bh=XiaigyMkzhHX0XHNnYke8oWYVDhi3eQnjtdAWB2AnVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ULoHpx9N+cyY/UghZoUFAmCxUmPvIXndpFaj8/vC14F9cyVhP/5QkrvWQ2ydmbqAStecpuHElKPQrlFvjBFfXx5s42Tce4X81j/S6Ugt/ujm/kxp8z+fjYAmGIWUdn/d2dDUjXh4IUNoXMbo41e/g1U8loJfwjUlZzR0FeZ3H+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=I4G2XPUU; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734898432;
	bh=XiaigyMkzhHX0XHNnYke8oWYVDhi3eQnjtdAWB2AnVs=;
	h=From:Date:Subject:To:Cc:From;
	b=I4G2XPUUn4WVFNIw9QEG3e7wLkd7Wh428uyHwqcGrRT+MMxefex/MPpQq04QOZCAc
	 pzVop4V/h2lOnhgSH99svQIa1v3XbqxDctOnz53mC5dXGaJbdu0IaQ+AI+sW8izhia
	 R96TmzBWLvK9X7uXc0lHy7iwCGo5cMGwmI3DKYiU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 22 Dec 2024 21:13:48 +0100
Subject: [PATCH] usbip: vudc: Constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241222-sysfs-const-bin_attr-usbip-v1-1-20d611a9bfa4@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAPtyaGcC/x3MwQpAQBAA0F/RnE3ZQcmvSNplMJelnSWSf7c5v
 st7QDkIK7TZA4FPUdl8gskzGFfrF0aZkoEKqgwRod46K46b14hO/GBjDHiokx2J6to5Q2VjJ0j
 BHniW68+7/n0/Xx14smwAAAA=
X-Change-ID: 20241222-sysfs-const-bin_attr-usbip-2255bb1238ad
To: Valentina Manea <valentina.manea.m@gmail.com>, 
 Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734898431; l=1996;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=XiaigyMkzhHX0XHNnYke8oWYVDhi3eQnjtdAWB2AnVs=;
 b=9g7t3NLcARWIr20JkNRl7sR9EfEXLw7wjK/Ha1VdbNWjhmMjd0Gxa7QwXkaKK35Qo/Quo7tiS
 ZBG+Ko1eDE1ChZL85c87FMjjOCAbFXOBL+Qj8A4GHglZJ0CeqnzCtPP
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/usb/usbip/vudc_sysfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/usbip/vudc_sysfs.c b/drivers/usb/usbip/vudc_sysfs.c
index 907a43a008964d647d19f9631faf4a443bc00019..2aae3edfc81369e3f84aadec7050356a4347c104 100644
--- a/drivers/usb/usbip/vudc_sysfs.c
+++ b/drivers/usb/usbip/vudc_sysfs.c
@@ -67,7 +67,7 @@ int get_gadget_descs(struct vudc *udc)
  * Exposes device descriptor from the gadget driver.
  */
 static ssize_t dev_desc_read(struct file *file, struct kobject *kobj,
-			     struct bin_attribute *attr, char *out,
+			     const struct bin_attribute *attr, char *out,
 			     loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -88,7 +88,7 @@ static ssize_t dev_desc_read(struct file *file, struct kobject *kobj,
 	spin_unlock_irqrestore(&udc->lock, flags);
 	return ret;
 }
-static BIN_ATTR_RO(dev_desc, sizeof(struct usb_device_descriptor));
+static const BIN_ATTR_RO(dev_desc, sizeof(struct usb_device_descriptor));
 
 static ssize_t usbip_sockfd_store(struct device *dev,
 				  struct device_attribute *attr,
@@ -252,14 +252,14 @@ static struct attribute *dev_attrs[] = {
 	NULL,
 };
 
-static struct bin_attribute *dev_bin_attrs[] = {
+static const struct bin_attribute *const dev_bin_attrs[] = {
 	&bin_attr_dev_desc,
 	NULL,
 };
 
 static const struct attribute_group vudc_attr_group = {
 	.attrs = dev_attrs,
-	.bin_attrs = dev_bin_attrs,
+	.bin_attrs_new = dev_bin_attrs,
 };
 
 const struct attribute_group *vudc_groups[] = {

---
base-commit: bcde95ce32b666478d6737219caa4f8005a8f201
change-id: 20241222-sysfs-const-bin_attr-usbip-2255bb1238ad

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


