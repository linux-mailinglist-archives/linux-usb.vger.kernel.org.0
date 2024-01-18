Return-Path: <linux-usb+bounces-5215-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84045831902
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 13:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FEEDB2329C
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 12:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C33F324A01;
	Thu, 18 Jan 2024 12:18:26 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4967B24218
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 12:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705580306; cv=none; b=D5/eyUj+uMERJfYsiG6h/TqSe1Cxr4CClepSyNGLfSDCtT9kGxTd5ImGVXRYHdFD52Ut9Ae6i2rdTxfJeB4Jw+WukyEzIJPQKaT01HZ1WNI5bvW6a6nPtCVgaI8EfwVtnKOx4DjMvExnhKwR1X0Z3/tJS75+NmWfGSN+PmGZWn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705580306; c=relaxed/simple;
	bh=1CPTCnmzYbKS7iPd39f4bVckEm7Bl0i/3bMQWlAH1aE=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-GND-Sasl; b=ekp/pmpQ3JlAqsie3tvXqK86Ofw020hA7jYBEoxNrUX57nQwjGQpZk3SP+q3a4rdMN3S/XRltFCNgAKoDIphyvO0oyn9gCx53KQ6523v/bLZCL5HU7hgKIF5YBAMmRCQ0grTfmHle9YyIirHSVn86Ow4GZuuUc4cA5t2x0g4C5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=48ers.dk; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=48ers.dk
Received: by mail.gandi.net (Postfix) with ESMTPSA id 86D481C0009;
	Thu, 18 Jan 2024 12:18:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peko@48ers.dk>)
	id 1rQRLe-00Gkfm-1t;
	Thu, 18 Jan 2024 13:18:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Nazarewicz <mina86@mina86.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Subject: [PATCH] usb: gadget: f_fs: expose ready state in configfs
Date: Thu, 18 Jan 2024 13:18:16 +0100
Message-Id: <20240118121816.3992645-1-peter@korsgaard.com>
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
 drivers/usb/gadget/function/f_fs.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

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


