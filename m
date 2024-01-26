Return-Path: <linux-usb+bounces-5550-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA5E83E367
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 21:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C2CC286ABB
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jan 2024 20:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B83F22374D;
	Fri, 26 Jan 2024 20:32:30 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4C249FE
	for <linux-usb@vger.kernel.org>; Fri, 26 Jan 2024 20:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706301150; cv=none; b=lN2s/tTwJ/wBrdJuIZs/tl+ZLLtcQqxYvj51l+k9x+C0OAvYTwg0Y8SrdTFb5vpa8JhwgySjc2fPL5usO3y79EoBQS/K1g9WU65jUQL8rqP9MBbrJ5OguMIiCnItkBZ6gJvu8ShrdVyoT9pnB+o/LTk+gFq0M+3jKFS/Sul5N8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706301150; c=relaxed/simple;
	bh=bf0py/Sz/+cRckqC2tlIzhYtdKG60TTCP+Np4esMzss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WGB9AR30WagHrWgnFOS2KjC/g90uKYxVz9vnD/tniwsXuBdcorkc/799fXiGyQ1vb5JPiTB+FkHWJDnOSBMEPDyADTJaVwKu4OBbZhmq1TB6FAW9c8cNKZjd68A2/5wPk9jY0ntXfDVc8Vp3bFI/YnBCyqLf6Xo2x8shcxRiGwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=48ers.dk; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=48ers.dk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0BFD8240002;
	Fri, 26 Jan 2024 20:32:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@48ers.dk>)
	id 1rTSsB-00APq3-0v;
	Fri, 26 Jan 2024 21:32:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Nazarewicz <mina86@mina86.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH v4] usb: gadget: f_fs: expose ready state in configfs
Date: Fri, 26 Jan 2024 21:32:08 +0100
Message-Id: <20240126203208.2482573-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: peter@korsgaard.com

When a USB gadget is configured through configfs with 1 or more f_fs
functions, then the logic setting up the gadget configuration has to wait
until the user space code (typically separate applications) responsible for
those functions have written their descriptors before the gadget can be
activated.

The f_fs instance already knows if this has been done, so expose it through
a "ready" attribute in configfs for easier synchronization.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v3:
- Take ffs_dev_lock as requested by Andrzej.

Changes since v2:
- Add ABI documentation as requested by Greg.

Changes since v1:
- Add documentation snippet as requested by Greg.

 .../ABI/testing/configfs-usb-gadget-ffs       | 12 +++++++++--
 Documentation/usb/gadget-testing.rst          |  8 ++++++++
 drivers/usb/gadget/function/f_fs.c            | 20 +++++++++++++++++++
 3 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-ffs b/Documentation/ABI/testing/configfs-usb-gadget-ffs
index e39b27653c65..bf8936ff6d38 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-ffs
+++ b/Documentation/ABI/testing/configfs-usb-gadget-ffs
@@ -4,6 +4,14 @@ KernelVersion:	3.13
 Description:	The purpose of this directory is to create and remove it.
 
 		A corresponding USB function instance is created/removed.
-		There are no attributes here.
 
-		All parameters are set through FunctionFS.
+		All attributes are read only:
+
+		=============	============================================
+		ready		1 if the function is ready to be used, E.G.
+				if userspace has written descriptors and
+				strings to ep0, so the gadget can be
+				enabled - 0 otherwise.
+		=============	============================================
+
+		All other parameters are set through FunctionFS.
diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gadget-testing.rst
index 8cd62c466d20..4ec6b775ebba 100644
--- a/Documentation/usb/gadget-testing.rst
+++ b/Documentation/usb/gadget-testing.rst
@@ -206,6 +206,14 @@ the standard procedure for using FunctionFS (mount it, run the userspace
 process which implements the function proper). The gadget should be enabled
 by writing a suitable string to usb_gadget/<gadget>/UDC.
 
+The FFS function provides just one attribute in its function directory:
+
+	ready
+
+The attribute is read-only and signals if the function is ready (1) to be
+used, E.G. if userspace has written descriptors and strings to ep0, so
+the gadget can be enabled.
+
 Testing the FFS function
 ------------------------
 
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 6bff6cb93789..be3851cffb73 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3445,6 +3445,25 @@ static inline struct f_fs_opts *to_ffs_opts(struct config_item *item)
 			    func_inst.group);
 }
 
+static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
+{
+	struct f_fs_opts *opts = to_ffs_opts(item);
+	int ready;
+
+	ffs_dev_lock();
+	ready = opts->dev->desc_ready;
+	ffs_dev_unlock();
+
+	return sprintf(page, "%d\n", ready);
+}
+
+CONFIGFS_ATTR_RO(f_fs_opts_, ready);
+
+static struct configfs_attribute *ffs_attrs[] = {
+	&f_fs_opts_attr_ready,
+	NULL,
+};
+
 static void ffs_attr_release(struct config_item *item)
 {
 	struct f_fs_opts *opts = to_ffs_opts(item);
@@ -3458,6 +3477,7 @@ static struct configfs_item_operations ffs_item_ops = {
 
 static const struct config_item_type ffs_func_type = {
 	.ct_item_ops	= &ffs_item_ops,
+	.ct_attrs	= ffs_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
-- 
2.39.2


