Return-Path: <linux-usb+bounces-36510-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIS5DiYa72lw6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36510-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:18 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CE05E46ED69
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 29EB4300130F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E744339A074;
	Mon, 27 Apr 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eS1opkvq"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D84139903A
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277475; cv=none; b=HJ/OCz4Y9TXaURG2YOBv8lym95HhfyhxCzMRNcVg5mqXgCl3dUJAtEkAjG8rOXDOM12SQPDIyI16JkTBZeqihbrEspDLM35b7YgU40qFEiTRBC3TpDkmDXIE81Rb3CjAOO4SJAbqQp3o3ZFbXOd6+AVL5zGWEPND48yopFqAUWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277475; c=relaxed/simple;
	bh=f5MbmcxR7dYDCG4cNMmSBE3HjwTANkPtJd93bdWgqxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKLq0xXnYCSqSHOd9PwO8mOYywWSot+xx9uiLWEIn+Qo5BN0upp95PdrQUZ3Clj5zb2WMnXkVr8V/HQAuvSwJhFsW94xZkHaGYAwpx/SCJOAssaV6QdJR8y09f2SugQ+cE0VXdrEA1zqpztDBQoymYsttwgAIoO6CT+btPcIYec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eS1opkvq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277474; x=1808813474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f5MbmcxR7dYDCG4cNMmSBE3HjwTANkPtJd93bdWgqxw=;
  b=eS1opkvqbgwXXa5SSUcxfHVlpTs43tCioqnJzFiCw6kF778KGUOaaeKw
   B+B+Aun1v6BPbInCYm/vaFeuXiwmVhwdBCBylfJbszjljWN7/YiP/P/vj
   /WzmqGxzUra+ongfan2uxWDRXY0Cn9HZns3AsGJ79u47AiFk57FWct9Yv
   pKokvWwbRdC4q2sNWEU28JstFDjBh8vqV8DzHZlO0+mg0xCB0EwxFpJ+J
   f9BqiYhlPg84q4XQVgEU0KFZadDxSHP3FEfFLqLGAUzyOz8g90s7PTKus
   EttqNvHHslKMRy5oOcJ3Ysb/CZgnRZUOTgLvrL4dEZULRhFNw1gqAD+UW
   A==;
X-CSE-ConnectionGUID: suBhXqJtRf+B2+OcFP20Mw==
X-CSE-MsgGUID: RV80tci8T2Og8gaontlwyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78034421"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78034421"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:12 -0700
X-CSE-ConnectionGUID: cWwI75ejRPOJl3ifThvTQQ==
X-CSE-MsgGUID: SBh/uFwQQOKW17qWYFDXXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237531363"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2026 01:11:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6D9E299; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/12] thunderbolt: Don't disable lane adapter if XDomain lane bonding isn't possible
Date: Mon, 27 Apr 2026 10:10:59 +0200
Message-ID: <20260427081109.2337731-3-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: CE05E46ED69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36510-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:dkim,intel.com:email]

This happens when firmware connection manager is being used. It will
deal with disabling the lane 1 adapter after the tunnel has been
established and re-enabling it afterwards. For this reason only do this
when we know that lane bonding is possible (e.g running software
connection manager).

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 754808c43f00..57367e18733a 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -1931,7 +1931,13 @@ static void tb_xdomain_link_exit(struct tb_xdomain *xd)
 	if (tb_port_get_link_generation(down) >= 4) {
 		down->bonded = false;
 		down->dual_link_port->bonded = false;
-	} else if (xd->link_width > TB_LINK_WIDTH_SINGLE) {
+		return;
+	}
+
+	if (!xd->bonding_possible)
+		return;
+
+	if (xd->link_width > TB_LINK_WIDTH_SINGLE) {
 		/*
 		 * Just return port structures back to way they were and
 		 * update credits. No need to update userspace because
-- 
2.50.1


