Return-Path: <linux-usb+bounces-4132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EFB8119DD
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 17:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D0661F216A5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Dec 2023 16:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E624C3A9;
	Wed, 13 Dec 2023 16:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XsBXlv5D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE23364CB
	for <linux-usb@vger.kernel.org>; Wed, 13 Dec 2023 16:43:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38E4C433CB;
	Wed, 13 Dec 2023 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702485796;
	bh=/VgfUvsmvX2n019MxXLrjKmvUFShp1H3MaszHsAPHGk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XsBXlv5DeBhXUIpcPuRuzSfg8SfGeHati6aAXIoHbRuo9LG+Q0hQq9DwpNqR5erpU
	 1bZAemhQZ6c0x1GGAjt+lCl0lAouPl3cx+lmaBEONDONKH8hfJWdy2hdycCC/rs+H+
	 4bHr8O1sItmqYGRbqHcIjQundVi/ie3WWHbOQXATp3WoH7wraD7/o3wS71+qjUBdue
	 QcXqX5sN1aoPYitYQN+lqR9tMtWuq7I65TDfDkgWhq2GlcxRTfk1l8ywfHZmGrh9qY
	 iqwVKRqva9DnVXB4Nsomot0VsTMY2oV/ivfmHUv+s5qNVvPUpNvON73Pzosf9dk57q
	 h1PRp1wcEK3Ew==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 10/12] usb: mon_text: Replace snprintf() with the safer scnprintf() variant
Date: Wed, 13 Dec 2023 16:42:39 +0000
Message-ID: <20231213164246.1021885-11-lee@kernel.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231213164246.1021885-1-lee@kernel.org>
References: <20231213164246.1021885-1-lee@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a general misunderstanding amongst engineers that {v}snprintf()
returns the length of the data *actually* encoded into the destination
array.  However, as per the C99 standard {v}snprintf() really returns
the length of the data that *would have been* written if there were
enough space for it.  This misunderstanding has led to buffer-overruns
in the past.  It's generally considered safer to use the {v}scnprintf()
variants in their place (or even sprintf() in simple cases).  So let's
do that.

Link: https://lwn.net/Articles/69419/
Link: https://github.com/KSPP/linux/issues/105
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/usb/mon/mon_text.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/mon/mon_text.c b/drivers/usb/mon/mon_text.c
index 39cb141646526..2fe9b95bac1d5 100644
--- a/drivers/usb/mon/mon_text.c
+++ b/drivers/usb/mon/mon_text.c
@@ -352,7 +352,7 @@ static int mon_text_open(struct inode *inode, struct file *file)
 	rp->r.rnf_error = mon_text_error;
 	rp->r.rnf_complete = mon_text_complete;
 
-	snprintf(rp->slab_name, SLAB_NAME_SZ, "mon_text_%p", rp);
+	scnprintf(rp->slab_name, SLAB_NAME_SZ, "mon_text_%p", rp);
 	rp->e_slab = kmem_cache_create(rp->slab_name,
 	    sizeof(struct mon_event_text), sizeof(long), 0,
 	    mon_text_ctor);
@@ -700,46 +700,28 @@ static const struct file_operations mon_fops_text_u = {
 
 int mon_text_add(struct mon_bus *mbus, const struct usb_bus *ubus)
 {
-	enum { NAMESZ = 10 };
+	enum { NAMESZ = 12 };
 	char name[NAMESZ];
 	int busnum = ubus? ubus->busnum: 0;
-	int rc;
 
 	if (mon_dir == NULL)
 		return 0;
 
 	if (ubus != NULL) {
-		rc = snprintf(name, NAMESZ, "%dt", busnum);
-		if (rc <= 0 || rc >= NAMESZ)
-			goto err_print_t;
+		scnprintf(name, NAMESZ, "%dt", busnum);
 		mbus->dent_t = debugfs_create_file(name, 0600, mon_dir, mbus,
 							     &mon_fops_text_t);
 	}
 
-	rc = snprintf(name, NAMESZ, "%du", busnum);
-	if (rc <= 0 || rc >= NAMESZ)
-		goto err_print_u;
+	scnprintf(name, NAMESZ, "%du", busnum);
 	mbus->dent_u = debugfs_create_file(name, 0600, mon_dir, mbus,
 					   &mon_fops_text_u);
 
-	rc = snprintf(name, NAMESZ, "%ds", busnum);
-	if (rc <= 0 || rc >= NAMESZ)
-		goto err_print_s;
+	scnprintf(name, NAMESZ, "%ds", busnum);
 	mbus->dent_s = debugfs_create_file(name, 0600, mon_dir, mbus,
 					   &mon_fops_stat);
 
 	return 1;
-
-err_print_s:
-	debugfs_remove(mbus->dent_u);
-	mbus->dent_u = NULL;
-err_print_u:
-	if (ubus != NULL) {
-		debugfs_remove(mbus->dent_t);
-		mbus->dent_t = NULL;
-	}
-err_print_t:
-	return 0;
 }
 
 void mon_text_del(struct mon_bus *mbus)
-- 
2.43.0.472.g3155946c3a-goog


