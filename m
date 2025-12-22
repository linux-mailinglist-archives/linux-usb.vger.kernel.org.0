Return-Path: <linux-usb+bounces-31676-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F1CD6858
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 16:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81EC830E25AE
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 15:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3849932BF25;
	Mon, 22 Dec 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sYL/njUG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640E3009C8;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416957; cv=none; b=UBOneyKh0G/LvpZRtwBKZtCHJOaFfi43u8nyIaMKekqsgmW2fX/A8PcKtAdRONuG3OyDwr43Qnf3p6e2cFDG+xploLqQDFwKuH/JcfIWZ4c2rIzK9B1Vaol2TJWxskIdLTNlqSN2iU+dvZPiFphFzYkd6YTOZyCP5CmSzW83Nj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416957; c=relaxed/simple;
	bh=8fW+Z73RcTNh3BgzzUdyKHdSBEmxZQxZhID6E0JNdlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZ4UrazCQy6/iuw8tr8diqI5jL3qL19VQJ7lT0uQyBegNauM2aSgcBt9URmNgJvfmaLSzX/opOSXMkDHyAsqqUGwMbsZaFTldyc31NkHtQSCVU/ikRzmjkC2Bp+/JnAAlt/6Rg0RVkhkEEJKLJkSMCJyHGPe4fNOPP6Z7ZDBqZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sYL/njUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F19C113D0;
	Mon, 22 Dec 2025 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766416957;
	bh=8fW+Z73RcTNh3BgzzUdyKHdSBEmxZQxZhID6E0JNdlY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sYL/njUGGEFnaPE16lkqo29XgDqH41LB+bNEMlUZJghaXXnWinIlxbzD3Ei7rLgGV
	 UYBqWtTk8ebQtgMTOEx0q5O2gfx21yk6LyBnCPo3Vw49oxwCFqifqIl210Ob3k3fUc
	 y5jfg44C4TCG18uFsEcCGDUWlJBWkkCp6R3rUve24YKz2PoKkS9j3fnVIm7aNQsDVm
	 rG1KFE9yxd2TC2D8kkMK8N9W8j5zBzb+bhz4foQ09ql5rQiXZfgcAHvTIH4VJY9/UZ
	 v9CFZ7F9nSKwROorezdf4isPVRgQEopOuCEGUK6sdAXWRaCmYbVaaBgAUTQX4d5rCq
	 LzIKRPnRKUYhQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vXhkB-000000000kg-0g37;
	Mon, 22 Dec 2025 16:22:43 +0100
From: Johan Hovold <johan@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Pooja Katiyar <pooja.katiyar@intel.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 2/4] Revert "usb: typec: ucsi: Enable debugfs for message_out data structure"
Date: Mon, 22 Dec 2025 16:22:02 +0100
Message-ID: <20251222152204.2846-3-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251222152204.2846-1-johan@kernel.org>
References: <20251222152204.2846-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 775fae520e6ae62c393a8daf42dc534f09692f3f.

The new buffer management code that this relies on is broken so revert
for now.

It also looks like the error handling needs some more thought as the
message out size is not reset on errors.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/typec/ucsi/debugfs.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index 90d11b79d2c0..924f93027553 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -110,30 +110,6 @@ static int ucsi_vbus_volt_show(struct seq_file *m, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(ucsi_vbus_volt);
 
-static ssize_t ucsi_message_out_write(struct file *file,
-				      const char __user *data, size_t count, loff_t *ppos)
-{
-	struct ucsi *ucsi = file->private_data;
-	int ret;
-
-	char *buf __free(kfree) = memdup_user_nul(data, count);
-	if (IS_ERR(buf))
-		return PTR_ERR(buf);
-
-	ucsi->message_out_size = min(count / 2, UCSI_MAX_MESSAGE_OUT_LENGTH);
-	ret = hex2bin(ucsi->message_out, buf, ucsi->message_out_size);
-	if (ret)
-		return ret;
-
-	return count;
-}
-
-static const struct file_operations ucsi_message_out_fops = {
-	.open = simple_open,
-	.write = ucsi_message_out_write,
-	.llseek = generic_file_llseek,
-};
-
 void ucsi_debugfs_register(struct ucsi *ucsi)
 {
 	ucsi->debugfs = kzalloc(sizeof(*ucsi->debugfs), GFP_KERNEL);
@@ -146,8 +122,6 @@ void ucsi_debugfs_register(struct ucsi *ucsi)
 	debugfs_create_file("peak_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_peak_curr_fops);
 	debugfs_create_file("avg_current", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_avg_curr_fops);
 	debugfs_create_file("vbus_voltage", 0400, ucsi->debugfs->dentry, ucsi, &ucsi_vbus_volt_fops);
-	debugfs_create_file("message_out", 0200, ucsi->debugfs->dentry, ucsi,
-			    &ucsi_message_out_fops);
 }
 
 void ucsi_debugfs_unregister(struct ucsi *ucsi)
-- 
2.51.2


