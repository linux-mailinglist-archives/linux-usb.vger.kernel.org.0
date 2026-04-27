Return-Path: <linux-usb+bounces-36516-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Jr5Ekka72lx6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36516-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C3846EDBA
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B21C63026F2B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F7539A075;
	Mon, 27 Apr 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ70HvI2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3C039A071
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277477; cv=none; b=Un/uJU90+TtX4ObTEO+dIObuSyDHj0gOqhpJawwArSmQyVorDIUiCftrFBi6F7CG0ZIERnJa7iRQepuCAUrb+ZIEZZlyL2xolWwBeOLYXjaHrhUyjH9tEYxtAd/XrWtTU2GpFPoJVDqUxwTFYtC41jcdPaObDMsF7TB3mYcnjyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277477; c=relaxed/simple;
	bh=LQui6c/hG8WbzYYwylRHM13CxzSyWosI8kJd/O0UYr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KKMJ7uBpamscptx/Zf6+aPc21ssj5Rj3yxEjX9B12ykmlW6bCZ80m6kwW/KY8hx8JWvQ97tPJFgEM/IZGmBIf0IUrerQnfvxZXlDpHWrOiXrIASewBfBq8VOTLpc4JfhG86r6MVPRXjbf3yYb1Wj3x/YnsfyRMXkfRp6hf6jCYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJ70HvI2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277476; x=1808813476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LQui6c/hG8WbzYYwylRHM13CxzSyWosI8kJd/O0UYr4=;
  b=eJ70HvI2TlB/Ix9T+IvmH0J9ALtIGGbLrBi5U1GipjEa1GZ5bcrJ3S5v
   Yk8/6+zxXbDhF6zxFA2bPLLHS+JWYwEOrOlLGjGEoQ7ReYLXgnJJvLNlM
   4sSCJv62zBe2VjeNRkEv1LrgoIomZIkztkBQ/63BOlSpQNcNRrEi6znjg
   ryc0Hbm4va0rEIOiXvblNuBdyE7RjRmepPxOPi8DyPiqZMfWy1oRhhGDO
   ajNPFgKKm+99QcscIWNXs7WF2oywZZDsE4ZSP4MhPeu1yLhPHk0ps/Jdd
   X1TvTjzXZ+zwFTAxcN59YI0nHt+DNnP5TArTQC4dZksFxePiAlOcBpHPk
   w==;
X-CSE-ConnectionGUID: r8RRo/eaTiGTnUKVHDJezQ==
X-CSE-MsgGUID: iCg8SwgRTweHCQIFbFqmtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77863252"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77863252"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:14 -0700
X-CSE-ConnectionGUID: J4YXf6PHSzCp0/7srsdymg==
X-CSE-MsgGUID: LoyT2YQWSQ6tJjw37U0rRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229008933"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 01:11:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7A477A1; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/12] thunderbolt: Set tb->root_switch to NULL when domain is stopped
Date: Mon, 27 Apr 2026 10:11:03 +0200
Message-ID: <20260427081109.2337731-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
References: <20260427081109.2337731-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 92C3846EDBA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36516-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux.intel.com:mid]

Similarly what we do with the firmware connection manager. This makes
tb_xdp_handle_request() return error to the remote host. However, we
need to make sure we keep the uuid alive so that we can reply until the
whole domain is released.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c      | 1 +
 drivers/thunderbolt/xdomain.c | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 34b7d18cce56..677877baae63 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2952,6 +2952,7 @@ static void tb_stop(struct tb *tb)
 		tb_tunnel_put(tunnel);
 	}
 	tb_switch_remove(tb->root_switch);
+	tb->root_switch = NULL;
 	tcm->hotplug_active = false; /* signal tb_handle_hotplug to quit */
 }
 
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 4fe19cf6387d..a1887a15a284 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -740,7 +740,7 @@ static void tb_xdp_handle_request(struct work_struct *work)
 
 	mutex_lock(&tb->lock);
 	if (tb->root_switch)
-		uuid = tb->root_switch->uuid;
+		uuid = kmemdup(tb->root_switch->uuid, sizeof(*uuid), GFP_KERNEL);
 	else
 		uuid = NULL;
 	mutex_unlock(&tb->lock);
@@ -880,6 +880,7 @@ static void tb_xdp_handle_request(struct work_struct *work)
 	}
 
 out:
+	kfree(uuid);
 	kfree(xw->pkg);
 	kfree(xw);
 
@@ -2348,6 +2349,9 @@ static struct tb_xdomain *switch_find_xdomain(struct tb_switch *sw,
 {
 	struct tb_port *port;
 
+	if (!sw)
+		return NULL;
+
 	tb_switch_for_each_port(sw, port) {
 		struct tb_xdomain *xd;
 
-- 
2.50.1


