Return-Path: <linux-usb+bounces-33618-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFjHKOdMnWmhOQQAu9opvQ
	(envelope-from <linux-usb+bounces-33618-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:01:59 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BB7182AFF
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:01:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 066EE3033250
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 07:01:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B71F2DF6E6;
	Tue, 24 Feb 2026 07:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uai5Gvgz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A373C1FE47B
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771916514; cv=none; b=mJgiLBDMoYrPeR8ousLkLuUdBVZbcYNctWfZv/iAEZWHSECBBaGe1Oh9/WlCss8ZTH/xYv35sLT0HuEt0n/iz6fsEWzYs9kfjejkckNuvMYarBQ5LHt3rVch1gncY7++fGqw9Y8QcCEuwjuypHF93pOjCoBlql2v5sJ2cOwDzE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771916514; c=relaxed/simple;
	bh=QivVIROHPp2B/VhAIFmgRR4aHluGirAezDag7X79jNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dBn/MHE20Ss1cWLnC6wbdfsTY+yob10idpMaELuUScejOH/5qBXQgMxYEBcy36Sn2rJH5/zyNyEWdpMthgUUDDmiiFoEmxWkKhdCyPMXOHH1sTmZ4N8GkyPfeH6RlapY3S6xFW8PnPeplA+163veTzdEDHrS7X/fPIkrEeN8FC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uai5Gvgz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771916514; x=1803452514;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QivVIROHPp2B/VhAIFmgRR4aHluGirAezDag7X79jNs=;
  b=Uai5GvgzZMvhFzILACQLsu2WY+bBNLi4OoH29jA1TAkbQi9yDMIlOmvz
   VtmX6dzjImmQLeJzCJBBpx0fgMQ8T70sBNjTlRLq+Enajj4tKW3p/VhNP
   /tQCy+psntF6pVoBXegybNjjMqzCZADmRCIqU/pSBWuNIs2miyBsNgqXj
   WyZReSjx0lasCMCKXpmyVvP2IwicniYU+LZwM+3VK9RWI95LyZtvt5CgL
   0grOXF9qzH/Ag8+pCp3u4ODP3jfPtWTHckJAAtRRslekVHUZfV14AYlNJ
   YySVV4+Aa+KHs10W+B7wdMnIcDwWQ5ea0u1f+eRRFfb3r9Zct3VgHk4uk
   Q==;
X-CSE-ConnectionGUID: O+6Ly3sPSOqpexK0SDnxYQ==
X-CSE-MsgGUID: Q88RpSAuQeOVJ6MXGVyVWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="95539947"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="95539947"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 23:01:53 -0800
X-CSE-ConnectionGUID: PDkJ8rDTQ8K45fDlXTPc/w==
X-CSE-MsgGUID: jb0wwi9iQhWgZVYqlPPcQA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 23 Feb 2026 23:01:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8C96B99; Tue, 24 Feb 2026 08:01:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Disable CLx on Titan Ridge-based devices with old firmware
Date: Tue, 24 Feb 2026 08:01:50 +0100
Message-ID: <20260224070150.3320641-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260224070150.3320641-1-mika.westerberg@linux.intel.com>
References: <20260224070150.3320641-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33618-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email,intel.com:dkim]
X-Rspamd-Queue-Id: 19BB7182AFF
X-Rspamd-Action: no action

From: Rene Sapiens <rene.sapiens@linux.intel.com>

Thunderbolt 3 devices based on Titan Ridge routers with NVM firmware
version < 0x65 have been observed to become unstable when CL states are
enabled. This can lead to link disconnect events and the device failing
to enumerate.

Enable CLx on Titan Ridge only when the running NVM firmware version
is >= 0x65.

Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/quirks.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index e81de9c30eac..9f7914ac2f48 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -23,6 +23,9 @@ static void quirk_dp_credit_allocation(struct tb_switch *sw)
 
 static void quirk_clx_disable(struct tb_switch *sw)
 {
+	if (tb_switch_is_titan_ridge(sw) && sw->nvm && sw->nvm->major >= 0x65)
+		return;
+
 	sw->quirks |= QUIRK_NO_CLX;
 	tb_sw_dbg(sw, "disabling CL states\n");
 }
@@ -61,6 +64,10 @@ static const struct tb_quirk tb_quirks[] = {
 	/* Dell WD19TB supports self-authentication on unplug */
 	{ 0x0000, 0x0000, 0x00d4, 0xb070, quirk_force_power_link },
 	{ 0x0000, 0x0000, 0x00d4, 0xb071, quirk_force_power_link },
+
+	/* Intel Titan Ridge CLx is unstable on early firmware versions */
+	{ 0x8086, PCI_DEVICE_ID_INTEL_TITAN_RIDGE_DD_BRIDGE, 0x0000, 0x0000,
+		  quirk_clx_disable },
 	/*
 	 * Intel Goshen Ridge NVM 27 and before report wrong number of
 	 * DP buffers.
-- 
2.50.1


