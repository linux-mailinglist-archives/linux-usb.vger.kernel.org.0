Return-Path: <linux-usb+bounces-5229-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CACD831BB6
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 15:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52933285382
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 14:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10221DA36;
	Thu, 18 Jan 2024 14:48:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476F7635
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705589297; cv=none; b=h7syz/JKUT9SQJ9Wp8iLyW6aPG2Ooc5ltfpeegR7ivTAwDmqLDoHFtRpQsRIYTbrCNF5F1lxBpvKCu4/YZ1DjlJ/WxTPhYLLSNoINdOwqaNBWmlh40+Xa3L4hc+1VJn90YP29mcW/2vfCNLG4lteTMrYcwS4Skf6pOv6IYz70As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705589297; c=relaxed/simple;
	bh=X+YUuTsAz4YB01ziqXo80T27ALqcVaZZ6+DlLjH+wQs=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-GND-Sasl; b=MjNxDb8L5jnCwks3fwqfrzHsI0wNbwIzVmmmAGOiK0BdzZ6DDVFzrKK+lf2z33UDdLXe/CsTHf8Tq51l4qiCdbs+9NOSgWXMPoKAxRzpaJiv39RDxfkIDMQ9XtTgd9JYpcaySp1+tc1v6w6vGik8yhojOR3v/14+1KA+EbgICEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=48ers.dk; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=48ers.dk
Received: by mail.gandi.net (Postfix) with ESMTPSA id C564660005;
	Thu, 18 Jan 2024 14:48:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@48ers.dk>)
	id 1rQTgg-00GpMa-0M;
	Thu, 18 Jan 2024 15:48:10 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Nazarewicz <mina86@mina86.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH v3] usb: gadget: f_fs: expose ready state in configfs
Date: Thu, 18 Jan 2024 15:48:08 +0100
Message-Id: <20240118144808.4010679-1-peter@korsgaard.com>
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
Changes since v2:
- Add ABI documentation as requested by Greg

Changes since v1:
- Add documentation snippet as requested by Greg.

 Documentation/ABI/testing/configfs-usb-gadget-ffs | 12 ++++++++++--
 Documentation/usb/gadget-testing.rst              |  8 ++++++++
 drivers/usb/gadget/function/f_fs.c                | 15 +++++++++++++++
 3 files changed, 33 insertions(+), 2 deletions(-)

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
index 29072c166d23..fcbd8bb22db4 100644
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
index fdd0fc7b8f25..ae44dd5f3a94 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -3446,6 +3446,20 @@ static inline struct f_fs_opts *to_ffs_opts(struct config_item *item)
 			    func_inst.group);
 }
 
+static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
+{
+	struct f_fs_opts *opts = to_ffs_opts(item);
+
+	return sprintf(page, "%d\n", opts->dev->desc_ready);
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
@@ -3459,6 +3473,7 @@ static struct configfs_item_operations ffs_item_ops = {
 
 static const struct config_item_type ffs_func_type = {
 	.ct_item_ops	= &ffs_item_ops,
+	.ct_attrs	= ffs_attrs,
 	.ct_owner	= THIS_MODULE,
 };
 
-- 
2.39.2


