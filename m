Return-Path: <linux-usb+bounces-36512-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCS5Jzka72lx6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36512-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:37 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3301846ED9D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2706301FA4B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8139B39934B;
	Mon, 27 Apr 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMScIIc6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D530839A04D
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277476; cv=none; b=uoVWc3zbAbfE9rmDnVmE8MjNX36wOhk1SAQzY55dUarvqTssdeKBOZlg7Y0T5RIMPVzFsihR4afmGp23Sfk/u2sMedWjw/XhUJ9DmgjXo7qFrowHDk2XE9Snntu3qEIWZ3WxJU7o0aB96K5fhKLb7GoFgYpd0ewwkKPLXONlcr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277476; c=relaxed/simple;
	bh=b4LIO33AQhfKa7nPyoRToDnsFTOdyM4TbvkKVY4jSMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Obh3Vj4B31tv1IEl+2xJMG4VHlWzx9XiBbfNozdEIrVS5h3Hn3F1JENr3fwoPBXkOh0WKc9rx2+gvt6ozAbxEV4ffRjcbqJwf0Ue4cAWCoNr0xM84DfR5EHsuIXeUJP18c1JLUGvPuQY5jruPnErOLtACWAXzPUybQb5LP0XKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMScIIc6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277475; x=1808813475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b4LIO33AQhfKa7nPyoRToDnsFTOdyM4TbvkKVY4jSMM=;
  b=UMScIIc6i0vKZ5G5OC+E3TWGp6TUY/jnx3/GhcZ/cIFFvAPfFKgS9roE
   I24QsbdeOEt9hyg1FxVGUr9d2VX1g9RUvTooTFvi59VKYtA/SuMGTSbJ0
   0PhytOL+oPF9PsO3g4g5yXXTvqw0Y1FQmrUug2u6ZimVghjGKyc+Ff5bK
   5/NlgeG6hQjg6jLrNndi0tB9hf6H1BMTNO2UfInwhbdgrXje3xZ3R9Cwc
   xOvwkQ10zPYdNk8KXIpP3USr2RrVeOp94tEkIPgR9IVW3yFNozXvWL80K
   9Rtua3V6ucWPerd2R2uLzM/Ajt6VTWEet1kISpQSZgrqiI2P3E3mApSPg
   A==;
X-CSE-ConnectionGUID: FKyxo08QSDKQxLdMaYIvdg==
X-CSE-MsgGUID: ah8LnmF2QYuEi1Zme79h9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77863248"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77863248"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:14 -0700
X-CSE-ConnectionGUID: A+Gsp0yRRf+MyqN5DR4QQw==
X-CSE-MsgGUID: Xy1XpC0uS26tPwtA7EmhVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229008932"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 01:11:12 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 772CF9E; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/12] thunderbolt: Release request if tb_cfg_request() fails in __tb_xdomain_response()
Date: Mon, 27 Apr 2026 10:11:02 +0200
Message-ID: <20260427081109.2337731-6-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: 3301846ED9D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36512-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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

If tb_cfg_request() fails setting up the request (for example the
control channel is shut down already) it returns an error without
calling the callback. To avoid leaking that memory, call
tb_cfg_request_put() if tb_cfg_request() fails.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 680b2204875a..4fe19cf6387d 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -136,6 +136,7 @@ static int __tb_xdomain_response(struct tb_ctl *ctl, const void *response,
 				 size_t size, enum tb_cfg_pkg_type type)
 {
 	struct tb_cfg_request *req;
+	int ret;
 
 	req = tb_cfg_request_alloc();
 	if (!req)
@@ -147,7 +148,11 @@ static int __tb_xdomain_response(struct tb_ctl *ctl, const void *response,
 	req->request_size = size;
 	req->request_type = type;
 
-	return tb_cfg_request(ctl, req, response_ready, req);
+	ret = tb_cfg_request(ctl, req, response_ready, req);
+	if (ret)
+		tb_cfg_request_put(req);
+
+	return ret;
 }
 
 /**
-- 
2.50.1


