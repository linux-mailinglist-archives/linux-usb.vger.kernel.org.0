Return-Path: <linux-usb+bounces-37325-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wN0YMGYdA2pD0gEAu9opvQ
	(envelope-from <linux-usb+bounces-37325-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:30:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 41927520241
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9152330237DB
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5DD23B8BCB;
	Tue, 12 May 2026 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZSUEVw9T"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3A03A6F0E
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589020; cv=none; b=cDlwRMWIRu9xO941vWiMWVUiSI+yhTMmAB83YFKM2B58I7q/T7/YFFPzubm8sUF0ytc3PoKY7RyuXcBysXL5jbOsjeYyR/dATSA0zlX50L7V75ytcKQFrgK0edsRNVNyUQGDGl6OOMWMZYX2l9KqCvrt/XQk+2gP/Np06aoPfVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589020; c=relaxed/simple;
	bh=IQu0oafLJ8QcGX0PmX4WIScGtiOL5MtWUlnj/rq6BA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rYgej+cE8y+YOnoK3ZK3H63p/EAx0yx08TnI6/d5Y+PDK3OH0yhBrpdqWJ2OGv5VXH2HRszK4lVDUFEunUTX5+OtcRoPxN3VicnFTRgjZ8sSztmVzBYFTHe7cgFWyD8C00MUAK9A+nzvMjFJqmtS6Phr6dXao83km6g6NvUklkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZSUEVw9T; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589013; x=1810125013;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IQu0oafLJ8QcGX0PmX4WIScGtiOL5MtWUlnj/rq6BA8=;
  b=ZSUEVw9TJhUyP8mFQLOycV9AJ1pZzPNESUMLIGNtQ4Rcs/e6rQHjvruD
   XdOKT/UfMm+5AvdQCCD49nxKce6CiHG2xCGLSw+Fh57rMDbxDUbjP0Ulk
   0P4OiyPJXm/BODdRngX0goYhADmg1Cxv4VLq05HBnwX55rkmA+QgNED5Q
   OK/Ozyenf3eVNO5tfHLAlughML2TOo+bpWzYXpZNGeZ3+kg6J1iB7j5wj
   LQzlJYU7tSa60EOQahYjmcc20LWfG9Agc092ymdYywqOZOQEkPqaeCxHq
   m1EEs7iccu6ynA3b7RpEuNQPcskbTjBhFK99JUCnOS8afNoShH5T8omgm
   A==;
X-CSE-ConnectionGUID: 4kHYRY6TTcWw3SlMxCbD9g==
X-CSE-MsgGUID: fH91vWx0QE2YQufYgEXAxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950597"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950597"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:29:59 -0700
X-CSE-ConnectionGUID: w76JriZeTnOQfLugoIKYMA==
X-CSE-MsgGUID: R2Wa1l1tQf+GFTOAP0rfnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692671"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:56 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BAB389B; Tue, 12 May 2026 14:29:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/8] thunderbolt: Don't access path config space on Lane 1 adapters in tb_switch_reset_host()
Date: Tue, 12 May 2026 14:29:49 +0200
Message-ID: <20260512122955.271688-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
References: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 41927520241
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37325-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Action: no action

From: Pooja Katiyar <pooja.katiyar@intel.com>

USB4 Lane 1 adapters do not have accessible path config space. Skip the
path config space cleanup in tb_switch_reset_host() for these ports. The
check is for USB4 switches only. Thunderbolt 1-3 Lane 1 adapters stay as
is because we do need to program their path config space.

Co-developed-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Rene Sapiens <rene.sapiens@linux.intel.com>
Signed-off-by: Pooja Katiyar <pooja.katiyar@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index bfcab98faf4b..ad0ec8f8ee28 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1620,6 +1620,12 @@ static int tb_switch_reset_host(struct tb_switch *sw)
 				ret = tb_port_reset(port);
 				if (ret)
 					return ret;
+				/*
+				 * USB4 Lane 1 adapters do not have accessible
+				 * path config space.
+				 */
+				if (tb_switch_is_usb4(sw) && !port->usb4)
+					continue;
 			} else if (tb_port_is_usb3_down(port) ||
 				   tb_port_is_usb3_up(port)) {
 				tb_usb3_port_enable(port, false);
-- 
2.50.1


