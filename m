Return-Path: <linux-usb+bounces-21413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8EA5452A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 09:42:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE8773AB604
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 08:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C8D207A2E;
	Thu,  6 Mar 2025 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gQ5RHz9h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B0A207A04
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 08:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741250518; cv=none; b=iqxjjttYxdj0c04nLpjMlyzqJ45QLsjuuxjgt84MMYrNedsRbNnLUWt4eTAnUZrgB3njNMIPDo3hLg0pacvP9vDe1VCZhXnl+bbpBXyjrkDDUH5w5IHqmiBwTuwtNDzwrqNPJnnW5lrOZdkT3dkff5APbKoIZAaSekAD5Y78eKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741250518; c=relaxed/simple;
	bh=6YY82g2Rg3FLDbzRkJlMZ6EZ60mewsmjGXnyYWQH38I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eABUc4XGAvvycPC3HKjzp/FwaRApJco6cq1PgZPetZaGG34Mki7Frf3bN3Ujx5BPYtVkdlpU0kDeBZTaBojnALyOJcGqhHDojZU1Xp+ieeFaJEI0TYALa098OTvdIOC+oVv9IeDiEPv+OjaPtWBcOH1qskSMLBJEvGKvuxFDVYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gQ5RHz9h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741250517; x=1772786517;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6YY82g2Rg3FLDbzRkJlMZ6EZ60mewsmjGXnyYWQH38I=;
  b=gQ5RHz9hqBflWownk+LMHF3kHaLTkuuIHi4jUl6tQdJW204br1fRu5UT
   N48YBJp1Xe5/aBs4HvseBjdCzjWqRGrUdydWCDKW+jZYgcM19MZpDJf+4
   1gpdWSCMbXp8Mu/2Gr55B3/2/Ns60thzqVLaN59r4qoK4SezXr86Z+PJ/
   8yWN7zVGTeQqeJuG/uffbm6nvvfJerr+IwpFG9IbfmWX4p0/cMykrQLDg
   rzVe6pEtK1H3SUp/VGTxGqwtOMonTwpYr9BWmftXeRr2AHqX3Y3jWSzzl
   vKRdZTNjTOx6waGwsRoM3/woMIIIeSNscb7aA7sxPBM7JopjK9gN3kk/T
   A==;
X-CSE-ConnectionGUID: g/Ld3kG2SNqg8M9LJIAdag==
X-CSE-MsgGUID: kA53PzJmSLyBVb85hg+pNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="53647088"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="53647088"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 00:41:56 -0800
X-CSE-ConnectionGUID: Y1eljSSfT5i4BOfRZulReA==
X-CSE-MsgGUID: ZuXiMGC2SW2FJeK0+UqPbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="142181576"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 06 Mar 2025 00:41:47 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 8D21520B; Thu, 06 Mar 2025 10:41:45 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Kenneth Crudup <kenny@panix.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Prevent use-after-free in resume from hibernate
Date: Thu,  6 Mar 2025 10:41:45 +0200
Message-ID: <20250306084145.373237-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kenneth noticed that his laptop crashes randomly when resuming from
hibernate if there is device connected and display tunneled. I was able
to reproduce this as well with the following steps:

  1. Boot the system up, nothing connected.
  2. Connect Thunderbolt 4 dock to the host.
  3. Connect monitor to the Thunderbolt 4 dock.
  4. Verify that there is picture on the screen.
  5. Enter hibernate.
  6. Exit hibernate.
  7. Wait for the system to resume.

  Expectation: System resumes just fine, the connected monitor still
               shows screen.
  Actual result: There is crash during resume, screen is blank.

What happens is that during resume from hibernate we tear down any
existing tunnels created by the boot kernel and this ends up calling
tb_dp_dprx_stop() which calls tb_tunnel_put() dropping the reference
count to zero even though we never called tb_dp_dprx_start() for it (we
never do that for discovery). This makes the discovered DP tunnel memory
to be released and any access after that causes use-after-free and
possible crash.

Fix this so that we only stop DPRX flow if it has been started in the
first place.

Reported-by: Kenneth Crudup <kenny@panix.com>
Closes: https://lore.kernel.org/linux-usb/8e175721-806f-45d6-892a-bd3356af80c9@panix.com/
Cc: stable@vger.kernel.org
Fixes: d6d458d42e1e ("thunderbolt: Handle DisplayPort tunnel activation asynchronously")
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 11 ++++++++---
 drivers/thunderbolt/tunnel.h |  2 ++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 8229a6fbda5a..717b31d78728 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1009,6 +1009,8 @@ static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
 	 */
 	tb_tunnel_get(tunnel);
 
+	tunnel->dprx_started = true;
+
 	if (tunnel->callback) {
 		tunnel->dprx_timeout = dprx_timeout_to_ktime(dprx_timeout);
 		queue_delayed_work(tunnel->tb->wq, &tunnel->dprx_work, 0);
@@ -1021,9 +1023,12 @@ static int tb_dp_dprx_start(struct tb_tunnel *tunnel)
 
 static void tb_dp_dprx_stop(struct tb_tunnel *tunnel)
 {
-	tunnel->dprx_canceled = true;
-	cancel_delayed_work(&tunnel->dprx_work);
-	tb_tunnel_put(tunnel);
+	if (tunnel->dprx_started) {
+		tunnel->dprx_started = false;
+		tunnel->dprx_canceled = true;
+		cancel_delayed_work(&tunnel->dprx_work);
+		tb_tunnel_put(tunnel);
+	}
 }
 
 static int tb_dp_activate(struct tb_tunnel *tunnel, bool active)
diff --git a/drivers/thunderbolt/tunnel.h b/drivers/thunderbolt/tunnel.h
index 7f6d3a18a41e..8a0a0cb21a89 100644
--- a/drivers/thunderbolt/tunnel.h
+++ b/drivers/thunderbolt/tunnel.h
@@ -63,6 +63,7 @@ enum tb_tunnel_state {
  * @allocated_down: Allocated downstream bandwidth (only for USB3)
  * @bw_mode: DP bandwidth allocation mode registers can be used to
  *	     determine consumed and allocated bandwidth
+ * @dprx_started: DPRX negotiation was started (tb_dp_dprx_start() was called for it)
  * @dprx_canceled: Was DPRX capabilities read poll canceled
  * @dprx_timeout: If set DPRX capabilities read poll work will timeout after this passes
  * @dprx_work: Worker that is scheduled to poll completion of DPRX capabilities read
@@ -100,6 +101,7 @@ struct tb_tunnel {
 	int allocated_up;
 	int allocated_down;
 	bool bw_mode;
+	bool dprx_started;
 	bool dprx_canceled;
 	ktime_t dprx_timeout;
 	struct delayed_work dprx_work;
-- 
2.47.2


