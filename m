Return-Path: <linux-usb+bounces-28097-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F010CB574F0
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 11:31:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98E063B571D
	for <lists+linux-usb@lfdr.de>; Mon, 15 Sep 2025 09:31:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065FD2F39C5;
	Mon, 15 Sep 2025 09:31:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from outboundhk.mxmail.xiaomi.com (outboundhk.mxmail.xiaomi.com [207.226.244.123])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D86221DA5
	for <linux-usb@vger.kernel.org>; Mon, 15 Sep 2025 09:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.226.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757928661; cv=none; b=VnykxIX4rRY0qmWCqCTheaDx2ZwfOx22q3KjiSNF4LaGOjwqSl53cCILHrQ+v8hCMyce4uo9Rnpe1IK72QoFFdSJU1xZUtf926LirQcGP0wfl6s93zBpIXAzeZrp2UDT+vemZrAypb/KRcIyQms+o6zCG/0iMbMWqTj9+lpUdVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757928661; c=relaxed/simple;
	bh=V3GJlQggZEpNSXUadaIm2PKYQ+2v/gOs3SL4LSKAoKk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YGk3QOBeTeKlb4Gj28ZudwfFMz6wWRyxk+kyOG7sfPcZPhMbcwWTgaCtalWSUGHy9KAul3gMYIyNGQ7OiXKY4LIYO4kKllCkj0qVy32jyeTkBZg/5GWBVWSznVK9ERvWek/vcun9p8qYGzVWe2Q45qdwQk6LxGbPb/AJcTRpAmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com; spf=pass smtp.mailfrom=xiaomi.com; arc=none smtp.client-ip=207.226.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xiaomi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaomi.com
X-CSE-ConnectionGUID: 4ltAe+p0SaqmY6pRauPO1Q==
X-CSE-MsgGUID: Y+SnU+gUT2Cn9SX1DN4Ipg==
X-IronPort-AV: E=Sophos;i="6.18,265,1751212800"; 
   d="scan'208";a="152441102"
From: guhuinan <guhuinan@xiaomi.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, "Ingo
 Rohloff" <ingo.rohloff@lauterbach.com>, Christian Brauner
	<brauner@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, Peter Zijlstra
	<peterz@infradead.org>, Sabyrzhan Tasbolatov <snovitoll@gmail.com>, Akash M
	<akash.m5@samsung.com>, Chenyu <chenyu45@xiaomi.com>, Yudongbin
	<yudongbin@xiaomi.com>, Mahongwei <mahongwei3@xiaomi.com>, Jiangdayu
	<jiangdayu@xiaomi.com>, Owen Gu <guhuinan@xiaomi.com>
Subject: [PATCH v2] usb: gadget: f_fs: Fix epfile null pointer access after ep enable.
Date: Mon, 15 Sep 2025 17:29:07 +0800
Message-ID: <20250915092907.17802-1-guhuinan@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: bj-mbx09.mioffice.cn (10.237.8.129) To BJ-MBX05.mioffice.cn
 (10.237.8.125)

From: Owen Gu <guhuinan@xiaomi.com>

A race condition occurs when ffs_func_eps_enable() runs concurrently
with ffs_data_reset(). The ffs_data_clear() called in ffs_data_reset()
sets ffs->epfiles to NULL before resetting ffs->eps_count to 0, leading
to a NULL pointer dereference when accessing epfile->ep in
ffs_func_eps_enable() after successful usb_ep_enable().

The ffs->epfiles pointer is set to NULL in both ffs_data_clear() and
ffs_data_close() functions, and its modification is protected by the
spinlock ffs->eps_lock. And the whole ffs_func_eps_enable() function
is also protected by ffs->eps_lock.

Thus, add NULL pointer handling for ffs->epfiles in the
ffs_func_eps_enable() function to fix issues

Signed-off-by: Owen Gu <guhuinan@xiaomi.com>
---
v2: Removed unnecessary debugging logs, modified and expanded commit
message
v1: https://lore.kernel.org/linux-usb/20250912040506.142146-1-guhuinan@xiaomi.com/
---
 drivers/usb/gadget/function/f_fs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 08a251df20c4..04058261cdd0 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2407,7 +2407,12 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 	ep = func->eps;
 	epfile = ffs->epfiles;
 	count = ffs->eps_count;
-	while(count--) {
+	if (!epfile) {
+		ret = -ENOMEM;
+		goto done;
+	}
+
+	while (count--) {
 		ep->ep->driver_data = ep;
 
 		ret = config_ep_by_speed(func->gadget, &func->function, ep->ep);
@@ -2431,6 +2436,7 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 	}
 
 	wake_up_interruptible(&ffs->wait);
+done:
 	spin_unlock_irqrestore(&func->ffs->eps_lock, flags);
 
 	return ret;
-- 
2.43.0


