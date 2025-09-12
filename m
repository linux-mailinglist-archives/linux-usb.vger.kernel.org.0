Return-Path: <linux-usb+bounces-27986-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 41824B5415D
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 06:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 874FA1C82C99
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 04:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9326E1DE2BD;
	Fri, 12 Sep 2025 04:06:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3406842065
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 04:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757650009; cv=none; b=te2qFdGi8WLqT1jwxO2U/uLot/jPuqTrlGOYePOEc+gHfsZeZlod1PEAQefE+8IZNImag1vszmycatVXwwA4vuJ3uuHcGBJzvZV7iBI2P/Z5XlCRqfb0EfmL7UtELPEPS7GHYQCZiAPBcI9T2wjvXt0Fsnq4LPel74JX7Wbp6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757650009; c=relaxed/simple;
	bh=fF8vCfOt+S5aPG/1ijDb0Emw7dl6dGIA8UJSxeLfhok=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AouamNcWdqxAZF8+H2/v9gQZFv2EP7D+oMeGwfFZOwe4rgVwubcXhdq7YxiF/X/nNEqp9MuvVm0PiPd55FtSCSH/AJSTXiaOYPuMBUZuYud0eo79+3feext/SFaAguq/fHSfffgLtskMJROl0tcbWN7632dPiNTZGFXiEVfqJIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: FRrPLi8wSS+lI5YDg6DwmQ==
X-CSE-MsgGUID: wkeMHx1WSnK7LiJhOVY4Qw==
X-IronPort-AV: E=Sophos;i="6.18,259,1751212800"; 
   d="scan'208";a="152185542"
From: guhuinan <guhuinan@xiaomi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, "Ingo
 Rohloff" <ingo.rohloff@lauterbach.com>, Christian Brauner
	<brauner@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, Peter Zijlstra
	<peterz@infradead.org>, Sabyrzhan Tasbolatov <snovitoll@gmail.com>, Akash M
	<akash.m5@samsung.com>, chenyu <chenyu45@xiaomi.com>, yudongbin
	<yudongbin@xiaomi.com>, mahongwei <mahongwei3@xiaomi.com>, jiangdayu
	<jiangdayu@xiaomi.com>, guhuinan <guhuinan@xiaomi.com>
Subject: [PATCH] usb: gadget: f_fs: Fix epfile null pointer access after ep enable.
Date: Fri, 12 Sep 2025 12:05:06 +0800
Message-ID: <20250912040506.142146-1-guhuinan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJ-MBX17.mioffice.cn (10.237.8.137) To BJ-MBX05.mioffice.cn
 (10.237.8.125)

A race condition occurs when ffs_func_eps_enable() runs concurrently
with ffs_data_reset(). The ffs_data_clear() called in ffs_data_reset()
sets ffs->epfiles to NULL before resetting ffs->eps_count to 0, leading
to a NULL pointer dereference when accessing epfile->ep in
ffs_func_eps_enable() after successful usb_ep_enable().

Signed-off-by: guhuinan <guhuinan@xiaomi.com>
---
 drivers/usb/gadget/function/f_fs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 08a251df20c4..f4aae91e7864 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2407,7 +2407,13 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 	ep = func->eps;
 	epfile = ffs->epfiles;
 	count = ffs->eps_count;
-	while(count--) {
+	if (!epfile) {
+		pr_err("%s: epfiles is NULL\n", __func__);
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	while (count--) {
 		ep->ep->driver_data = ep;
 
 		ret = config_ep_by_speed(func->gadget, &func->function, ep->ep);
@@ -2431,6 +2437,7 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 	}
 
 	wake_up_interruptible(&ffs->wait);
+done:
 	spin_unlock_irqrestore(&func->ffs->eps_lock, flags);
 
 	return ret;
-- 
2.43.0


