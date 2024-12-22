Return-Path: <linux-usb+bounces-18726-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2669FA7E6
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 21:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 844D318827AD
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 20:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFAA6191F98;
	Sun, 22 Dec 2024 20:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sy9+DM47"
X-Original-To: linux-usb@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B326E18FDA9;
	Sun, 22 Dec 2024 20:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734898340; cv=none; b=nFc6nb8kVsY3F/8X6LY5y3vaEUQod5op3H3z2I52M0v493Wioo3Tqgrq6/ph867F38mgO3fMNTws3HVMsAmk7UF29LPyUSN7cx9mvMxeWqk2qQ1HbraUOCccioKtKbjGau9ic8pA20lNQiS5fcNV8bSchdE2qDTWU9odkqo0SnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734898340; c=relaxed/simple;
	bh=6FGpWh3w+14vFPuNhzbBOP2W2UrYVN3Y1Zg7VP/hknw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t13dSjI9WS6MEeBgoBSAFdBOp70pWPuXdCa6dk8AMvhQ9z+r2ClqkLc8puNeK6OumNHDJxSlzJvBQNhI8976vzzq1Y+6HNhNpyLO6kbbENXYlynpziSXdSMunBdKW+/WGTSc1/IkkBQswIHU2ONr8LUUdEvlYucT/ae0M+cMmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sy9+DM47; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734898335;
	bh=6FGpWh3w+14vFPuNhzbBOP2W2UrYVN3Y1Zg7VP/hknw=;
	h=From:Date:Subject:To:Cc:From;
	b=sy9+DM47sX/eDnqT4zIdi/i/p7GPlbIfF6XcYSfc+uZ6RPMyQnla7+o4Sm/YAptBl
	 E7jdOoMpB6yQN6etXCekkwM1YY3ZyNUe5Pln6A/Y6Bv9F9B9d3H0dgGw8w74aDUW2z
	 FzfRz5qkO1Nhoqelp1zOOqGg2tQvSk3H+gxFPwy4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 22 Dec 2024 21:12:13 +0100
Subject: [PATCH] usb: core: sysfs: Constify 'struct bin_attribute'
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241222-sysfs-const-bin_attr-usb-v1-1-19a137c0f20a@weissschuh.net>
X-B4-Tracking: v=1; b=H4sIAJ1yaGcC/x3MTQqEMAxA4atI1hNogz/gVUSGVlPNpkpThxHx7
 haX3+K9C5STsEJfXZD4JypbLLCfCqbVxYVR5mIgQ7UlItRTg+K0Rc3oJX5dzgkP9diG0LWmcab
 pLJR8Txzk/66H8b4ffFZu+2oAAAA=
X-Change-ID: 20241222-sysfs-const-bin_attr-usb-6ff7605a0571
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734898334; l=2411;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6FGpWh3w+14vFPuNhzbBOP2W2UrYVN3Y1Zg7VP/hknw=;
 b=3UnW/hW2hni3ClyqqzV5gy5+x6fuB3NSFuOhBVutNC+XjnpcqyMX+sncvmt4SV/7OU68IXoNR
 LAKt0uJyxQcCDNp6xIGCOxF+9POXTxAU6O5twUTN27XnhP0vs6WCusQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/usb/core/sysfs.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index b4cba23831acd2d7d395b9f7683cd3ee3a8623c8..23f3cb1989f408ecb6b679e6cbe4857384188ae4 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -854,7 +854,7 @@ static const struct attribute_group dev_string_attr_grp = {
 
 static ssize_t
 descriptors_read(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr,
+		const struct bin_attribute *attr,
 		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -890,11 +890,11 @@ descriptors_read(struct file *filp, struct kobject *kobj,
 	}
 	return count - nleft;
 }
-static BIN_ATTR_RO(descriptors, 18 + 65535); /* dev descr + max-size raw descriptor */
+static const BIN_ATTR_RO(descriptors, 18 + 65535); /* dev descr + max-size raw descriptor */
 
 static ssize_t
 bos_descriptors_read(struct file *filp, struct kobject *kobj,
-		struct bin_attribute *attr,
+		const struct bin_attribute *attr,
 		char *buf, loff_t off, size_t count)
 {
 	struct device *dev = kobj_to_dev(kobj);
@@ -913,12 +913,12 @@ bos_descriptors_read(struct file *filp, struct kobject *kobj,
 	}
 	return n;
 }
-static BIN_ATTR_RO(bos_descriptors, 65535); /* max-size BOS */
+static const BIN_ATTR_RO(bos_descriptors, 65535); /* max-size BOS */
 
 /* When modifying this list, be sure to modify dev_bin_attrs_are_visible()
  * accordingly.
  */
-static struct bin_attribute *dev_bin_attrs[] = {
+static const struct bin_attribute *const dev_bin_attrs[] = {
 	&bin_attr_descriptors,
 	&bin_attr_bos_descriptors,
 	NULL
@@ -944,7 +944,7 @@ static umode_t dev_bin_attrs_are_visible(struct kobject *kobj,
 }
 
 static const struct attribute_group dev_bin_attr_grp = {
-	.bin_attrs =		dev_bin_attrs,
+	.bin_attrs_new =	dev_bin_attrs,
 	.is_bin_visible =	dev_bin_attrs_are_visible,
 };
 

---
base-commit: bcde95ce32b666478d6737219caa4f8005a8f201
change-id: 20241222-sysfs-const-bin_attr-usb-6ff7605a0571

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


