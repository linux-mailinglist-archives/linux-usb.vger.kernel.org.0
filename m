Return-Path: <linux-usb+bounces-36518-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEk5NjAa72lw6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36518-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A6346ED8E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DB71130164B6
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0FA39A071;
	Mon, 27 Apr 2026 08:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bwvlKpy+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EBD39A7E7
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277477; cv=none; b=PKDWAGTpD6kE799FprorFnPv7yPB45lZNtSF1pxfNPlllWCdLDlTXSahE8Hh9rMcpyWMuoAwOA3pwa2TXgpOVPEACDlPPP8Osl5nbHJIiUUxklaKjsYOfvs9BlHCndymlETUA2HwpxdaFYw7V/7KD4c7n/JVfoGvEflwqvBO5mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277477; c=relaxed/simple;
	bh=eOI3KNax4HuobgQtj6+U+qYdv9x3U0X5EyyJqr+9z+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsWZar+oY+PLuUfdxCKXsv7waxVUOgBf074ExoxzRfknIDtxShj0pttgpj0yp8JDPs9LRb9iv+OlD3mh2dvY2dCp+Sgpk3GF9wtstvi/dPq0/sX70DhTsCYWvS4Mjs62oIifZSm7M4BMEK+CmrfUEjEyj7tvK/PCr25PGl57e5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bwvlKpy+; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277476; x=1808813476;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eOI3KNax4HuobgQtj6+U+qYdv9x3U0X5EyyJqr+9z+I=;
  b=bwvlKpy+xe6CF0sItF6AhjRI8SB29/CImdzfs2yaJtEu7iT4+T7uyMqN
   7c/+9nI6nOShjON+YU6j+FCAsNxHieGbWq5FFexS80EuYAfT7bmwHXVTw
   lOL7Pl1xuTPQjiVeBPLxAZ3s4KzkXX1AqwgOFJytbXsjtgo/CDIq/FS3a
   s6w3xQ0+PaKCS6cPOfo5yjc4GTN8sQYNTHFq7ag7I0YLpOxloqotCsDd8
   nDXLHh1u45GaWynswFvwJmpD/gma8/GsDx9rHre5Bh5YqoFV0ccF/VQ7H
   orYaQ46703bR820HFsRxaEJ78L6N1apSf8iDniGVhiVyV8/6CmW5blICF
   Q==;
X-CSE-ConnectionGUID: IZ0s2iPgStigfcnl/4SGBg==
X-CSE-MsgGUID: xXIsmGxgSaOe1wflSNaqtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77863259"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77863259"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:15 -0700
X-CSE-ConnectionGUID: FOSs8vaSQ7iyQCA2lBFrjQ==
X-CSE-MsgGUID: FqhXUCf2R2iYKIE9T5650A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229008936"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 01:11:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8B30FA8; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/12] thunderbolt: Don't create multiple DMA tunnels on firmware connection manager
Date: Mon, 27 Apr 2026 10:11:09 +0200
Message-ID: <20260427081109.2337731-13-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: 57A6346ED8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36518-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,linux.intel.com:mid]

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Firmware connection manager supports only one DMA tunnel per XDomain
connection. Firmware prior Intel Titan Ridge failed the operation
directly but the same does not happen anymore on Titan Ridge and
forward. For this reason add an explicit check, and fail the operation
accordingly in the driver.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c     | 10 ++++++++++
 drivers/thunderbolt/xdomain.c | 25 +++++++++++++++++++------
 include/linux/thunderbolt.h   |  2 ++
 3 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 2f93a7bccad5..c492995166f7 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -587,6 +587,11 @@ static int icm_fr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	struct icm_fr_pkg_approve_xdomain request;
 	int ret;
 
+	if (atomic_read(&xd->ntunnels) >= 1) {
+		tb_warn(tb, "only one tunnel is supported by the firmware\n");
+		return -EOPNOTSUPP;
+	}
+
 	memset(&request, 0, sizeof(request));
 	request.hdr.code = ICM_APPROVE_XDOMAIN;
 	request.link_info = xd->depth << ICM_LINK_INFO_DEPTH_SHIFT | xd->link;
@@ -1158,6 +1163,11 @@ static int icm_tr_approve_xdomain_paths(struct tb *tb, struct tb_xdomain *xd,
 	struct icm_tr_pkg_approve_xdomain request;
 	int ret;
 
+	if (atomic_read(&xd->ntunnels) >= 1) {
+		tb_warn(tb, "only one tunnel is supported by the firmware\n");
+		return -EOPNOTSUPP;
+	}
+
 	memset(&request, 0, sizeof(request));
 	request.hdr.code = ICM_APPROVE_XDOMAIN;
 	request.route_hi = upper_32_bits(xd->route);
diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 9a30fe36c4be..6e83f93eee83 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -2038,6 +2038,7 @@ struct tb_xdomain *tb_xdomain_alloc(struct tb *tb, struct device *parent,
 	INIT_DELAYED_WORK(&xd->state_work, tb_xdomain_state_work);
 	INIT_DELAYED_WORK(&xd->properties_changed_work,
 			  tb_xdomain_properties_changed);
+	atomic_set(&xd->ntunnels, 0);
 
 	xd->local_uuid = kmemdup(local_uuid, sizeof(uuid_t), GFP_KERNEL);
 	if (!xd->local_uuid)
@@ -2328,9 +2329,15 @@ int tb_xdomain_enable_paths(struct tb_xdomain *xd, int transmit_path,
 			    int transmit_ring, int receive_path,
 			    int receive_ring)
 {
-	return tb_domain_approve_xdomain_paths(xd->tb, xd, transmit_path,
-					       transmit_ring, receive_path,
-					       receive_ring);
+	int ret;
+
+	ret = tb_domain_approve_xdomain_paths(xd->tb, xd, transmit_path,
+					      transmit_ring, receive_path,
+					      receive_ring);
+	if (ret)
+		return ret;
+	atomic_inc(&xd->ntunnels);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(tb_xdomain_enable_paths);
 
@@ -2353,9 +2360,15 @@ int tb_xdomain_disable_paths(struct tb_xdomain *xd, int transmit_path,
 			     int transmit_ring, int receive_path,
 			     int receive_ring)
 {
-	return tb_domain_disconnect_xdomain_paths(xd->tb, xd, transmit_path,
-						  transmit_ring, receive_path,
-						  receive_ring);
+	int ret;
+
+	ret = tb_domain_disconnect_xdomain_paths(xd->tb, xd, transmit_path,
+						 transmit_ring, receive_path,
+						 receive_ring);
+	if (ret)
+		return ret;
+	atomic_dec(&xd->ntunnels);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(tb_xdomain_disable_paths);
 
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index a5ef7100a6d3..bbdbbc84c999 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -228,6 +228,7 @@ enum tb_link_width {
  *				changed notification
  * @bonding_possible: True if lane bonding is possible on local side
  * @target_link_width: Target link width from the remote host
+ * @ntunnels: Keeps track of how many tunnels go through this XDomain
  * @link: Root switch link the remote domain is connected (ICM only)
  * @depth: Depth in the chain the remote domain is connected (ICM only)
  *
@@ -273,6 +274,7 @@ struct tb_xdomain {
 	int properties_changed_retries;
 	bool bonding_possible;
 	u8 target_link_width;
+	atomic_t ntunnels;
 	u8 link;
 	u8 depth;
 };
-- 
2.50.1


