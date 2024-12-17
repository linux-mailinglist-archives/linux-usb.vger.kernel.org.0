Return-Path: <linux-usb+bounces-18571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E019F45FC
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C934188F741
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6FD61DDC3C;
	Tue, 17 Dec 2024 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apja7WK9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBF91DB92A
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423767; cv=none; b=t3yiJriQleWp8t3dRU5yZ/PyKCNxItN2zGZOmI7rTf9+B3ezOgmR9N+32AThgtlBA4fBqzYARI3jaw8wnDO51T1Mbv6eHo77DOrfizaL6et1yXmIUntw643uwVd4kGOyobjd7RUTUKUFc2TIlLdf/OkC3sBGzDPk/C0cPUfEVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423767; c=relaxed/simple;
	bh=Wu5RyFCpoQ9OOQp49JRuL/Q0pjWi7Zqp605zVnz3x6g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ieK4nU/+R+iM5bdaaLOt4T2ztYI+DztJ3t6uZUhNmuIfYQBwhPtjXwHzwwGUTcWzZelZV6LUXHIfbIU4LlFPXjIlV+IVq3xxkkNjdAjZtJQrxcERxrkiswFFHQ6+ReKJc4NXhumaN+6wJ+LEhSEbUDqVAbLvP51o304iOkxTyQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apja7WK9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423765; x=1765959765;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wu5RyFCpoQ9OOQp49JRuL/Q0pjWi7Zqp605zVnz3x6g=;
  b=apja7WK9AVCvmzZp64VkGUvFrrlFLPQ1P4qvRK561KIo2bLsbMA5DUm1
   bJlvy6F2ZhnMFvkaoIyPoTICvf2WJ1esumWA0nSjBGgGTBSH7xhDZt0Jw
   M13rHSCx7x9e0zZQPK6mDP7WdWRfKgslD++q/nVjQOP9j+rgzCNpYTY4/
   EaiKEhPNZbUKl+EcWWx+ILp8rZxBPzczE2ltISZKDuTYgh/UTRjlAJZx/
   G5LyxysFf2yc6/5sLGoBOGpRtdjfryfAcTFG4WN6X0bvkZxBXP8VfkOBJ
   T2phkncLZFR35KmkGrWYISI2s1l3SOfjMdvxpoJgNw1wQBAiFdYWnl1VA
   w==;
X-CSE-ConnectionGUID: UekSacz8RV6jFPE1EzhSwQ==
X-CSE-MsgGUID: TdCrk2sPQxS2Yl4vJ7r74A==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34992611"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34992611"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:37 -0800
X-CSE-ConnectionGUID: 8UCIO5DdTH6CvQ2kEf3DZA==
X-CSE-MsgGUID: jdhv8WsCSB+qMlKnYGfY5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="98037690"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 00:22:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 38DE5902; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/12] thunderbolt: Drop tb_tunnel_restart()
Date: Tue, 17 Dec 2024 10:22:18 +0200
Message-ID: <20241217082222.528602-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is pretty much the same as tb_tunnel_activate() excepts does check
for already activated paths. This is not needed anymore and makes it
more streamlined so drop tb_tunnel_restart() in favour of
tb_tunnel_activate().

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c     |  4 ++--
 drivers/thunderbolt/tunnel.c | 27 +++------------------------
 drivers/thunderbolt/tunnel.h |  1 -
 3 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 7595ca00b6b8..53e4890e3198 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3037,7 +3037,7 @@ static int tb_resume_noirq(struct tb *tb)
 			/* Only need to do it once */
 			usb3_delay = 0;
 		}
-		tb_tunnel_restart(tunnel);
+		tb_tunnel_activate(tunnel);
 	}
 	if (!list_empty(&tcm->tunnel_list)) {
 		/*
@@ -3147,7 +3147,7 @@ static int tb_runtime_resume(struct tb *tb)
 	tb_free_invalid_tunnels(tb);
 	tb_restore_children(tb->root_switch);
 	list_for_each_entry_safe(tunnel, n, &tcm->tunnel_list, list)
-		tb_tunnel_restart(tunnel);
+		tb_tunnel_activate(tunnel);
 	tb_switch_enter_redrive(tb->root_switch);
 	tcm->hotplug_active = true;
 	mutex_unlock(&tb->lock);
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 83bd2043bab2..09619190c34a 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -2170,12 +2170,12 @@ bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel)
 }
 
 /**
- * tb_tunnel_restart() - activate a tunnel after a hardware reset
- * @tunnel: Tunnel to restart
+ * tb_tunnel_activate() - activate a tunnel
+ * @tunnel: Tunnel to activate
  *
  * Return: 0 on success and negative errno in case if failure
  */
-int tb_tunnel_restart(struct tb_tunnel *tunnel)
+int tb_tunnel_activate(struct tb_tunnel *tunnel)
 {
 	int res, i;
 
@@ -2218,27 +2218,6 @@ int tb_tunnel_restart(struct tb_tunnel *tunnel)
 	return res;
 }
 
-/**
- * tb_tunnel_activate() - activate a tunnel
- * @tunnel: Tunnel to activate
- *
- * Return: Returns 0 on success or an error code on failure.
- */
-int tb_tunnel_activate(struct tb_tunnel *tunnel)
-{
-	int i;
-
-	for (i = 0; i < tunnel->npaths; i++) {
-		if (tunnel->paths[i]->activated) {
-			tb_tunnel_WARN(tunnel,
-				       "trying to activate an already activated tunnel\n");
-			return -EINVAL;
-		}
-	}
-
-	return tb_tunnel_restart(tunnel);
-}
-
 /**
  * tb_tunnel_deactivate() - deactivate a tunnel
  * @tunnel: Tunnel to deactivate
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 30c079fd121e..3d3ab180cb9b 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -106,7 +106,6 @@ struct tb_tunnel *tb_tunnel_alloc_usb3(struct tb *tb, struct tb_port *up,
 
 void tb_tunnel_free(struct tb_tunnel *tunnel);
 int tb_tunnel_activate(struct tb_tunnel *tunnel);
-int tb_tunnel_restart(struct tb_tunnel *tunnel);
 void tb_tunnel_deactivate(struct tb_tunnel *tunnel);
 bool tb_tunnel_is_invalid(struct tb_tunnel *tunnel);
 bool tb_tunnel_port_on_path(const struct tb_tunnel *tunnel,
-- 
2.45.2


