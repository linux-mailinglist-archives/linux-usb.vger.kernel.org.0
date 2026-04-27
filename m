Return-Path: <linux-usb+bounces-36513-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BvsCyka72lw6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36513-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 183F346ED72
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1DBF2300613D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 574AC39A7F9;
	Mon, 27 Apr 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQVJF9H3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5B39936D
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277476; cv=none; b=FwRX+zF0Q660ZR/kitG/nbOLAPFFg6nuTxRbFH0sy3Ep1VMVNu77yDB+eX814fbjKF/+e7j0MpyPN0SYTZ7JRDlVhGfozba256g2ym78jV2mtiOTIgyVaJQONFSopomSkyH6IzO1/Y47S6gpxqxdeq8q861+yGL+HFn80KxIUAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277476; c=relaxed/simple;
	bh=ND5mdqYxNtFFlmQC2nrtW5d2qFiOgldz5v+m1stHxQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6QrEMOTFNWPR082LU9SRixqgVGfItrX4jl1qHr443kmEypJxHJN0AkK7KSUF0pO3HbCleCExkEm6Mq6l2pO8PcrCbRuhBytwi2qDCXBipxg/20/RLC0ZXwnB29PuGe0wEdbutkZnplP9DFNhWTvjIPioI+qgqf0XLvQS1SKBEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQVJF9H3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277475; x=1808813475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ND5mdqYxNtFFlmQC2nrtW5d2qFiOgldz5v+m1stHxQo=;
  b=iQVJF9H36FzNR37Zmu9wvrTfSyPaDGX/sog7SSyRZtakPoiocTv/0J0f
   sviBVyu6CAvwJhRtK1pu3CB+qUGHwNUgatiRvR0RSru/0z6ObnEdpVGfn
   AyT30I8qDDtjSYcniwcpiYBxfDCyUx2y1Bemqu+mNaO2yqCOeDLOX8xuh
   +KbMYsTotvHnMg+R4BmvoCZb+KfJtqa47N4sXhai5M6QqH0n++2dXEPgW
   v/mAaXKiYMBR8r6F9F9BEU4q5fQlQV5utjJ5DLNttWafxTmzJSBpH+10m
   QaiEDGthuK1ykTTUtunDnPNlFf8jgVcyw3NdlBGQbbtzF3gbHcheFxfRx
   Q==;
X-CSE-ConnectionGUID: XDHaxz46TXqJpjkFerZ8Vw==
X-CSE-MsgGUID: OrMu+f1sTGy4Rmig8KMNvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78034424"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78034424"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:13 -0700
X-CSE-ConnectionGUID: RBCqv/BISzaaoRR4C8DzkA==
X-CSE-MsgGUID: rS1l1JxMQnK1FNrrUpVIzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="237531364"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 27 Apr 2026 01:11:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6A4AA98; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/12] thunderbolt: Avoid reserved fields in path config space for USB4 routers
Date: Mon, 27 Apr 2026 10:10:58 +0200
Message-ID: <20260427081109.2337731-2-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: 183F346ED72
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
	TAGGED_FROM(0.00)[bounces-36513-lists,linux-usb=lfdr.de];
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

From: Gil Fine <gil.fine@linux.intel.com>

According to USB4 spec, USB4 Connection Manager shall not change value
of any fields that are defined as "RsvdZ" or "VD".  Specifically fields:
Path Credits Allocated, IFC, ISE fields in path config space shall not
be written by CM. To handle this, CM shall first read current path
config space from the hardware, change only the fields that can be
changed, and then write back the path config space.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index 8713ea0f47c1..0092b2ec7873 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -412,7 +412,8 @@ static int __tb_path_deactivate_hop(struct tb_port *port, int hop_index,
 				 * in the USB4 spec so we clear them
 				 * only for pre-USB4 adapters.
 				 */
-				if (!tb_switch_is_usb4(port->sw)) {
+				if (tb_port_is_null(port) ||
+				    !tb_switch_is_usb4(port->sw)) {
 					hop.ingress_fc = 0;
 					hop.ingress_shared_buffer = 0;
 				}
@@ -532,15 +533,18 @@ int tb_path_activate(struct tb_path *path)
 		__tb_path_deactivate_hop(path->hops[i].in_port,
 				path->hops[i].in_hop_index, path->clear_fc);
 
-		/* dword 0 */
+		/* Needed for USB4 routers, read path config space before write */
+		res = tb_port_read(path->hops[i].in_port, &hop, TB_CFG_HOPS,
+				   2 * path->hops[i].in_hop_index, 2);
+		if (res)
+			goto err;
+
 		hop.next_hop = path->hops[i].next_hop_index;
 		hop.out_port = path->hops[i].out_port->port;
-		hop.initial_credits = path->hops[i].initial_credits;
 		hop.pmps = path->hops[i].pm_support;
 		hop.unknown1 = 0;
 		hop.enable = 1;
 
-		/* dword 1 */
 		out_mask = (i == path->path_length - 1) ?
 				TB_PATH_DESTINATION : TB_PATH_INTERNAL;
 		in_mask = (i == 0) ? TB_PATH_SOURCE : TB_PATH_INTERNAL;
@@ -550,12 +554,21 @@ int tb_path_activate(struct tb_path *path)
 		hop.drop_packages = path->drop_packages;
 		hop.counter = path->hops[i].in_counter_index;
 		hop.counter_enable = path->hops[i].in_counter_index != -1;
-		hop.ingress_fc = path->ingress_fc_enable & in_mask;
 		hop.egress_fc = path->egress_fc_enable & out_mask;
-		hop.ingress_shared_buffer = path->ingress_shared_buffer
-					    & in_mask;
-		hop.egress_shared_buffer = path->egress_shared_buffer
-					    & out_mask;
+		hop.egress_shared_buffer = path->egress_shared_buffer & out_mask;
+		/*
+		 * Protocol adapters IFC and ISE bits, and Path Credits
+		 * Allocated are vendor defined in the USB4 spec so we
+		 * program them only for pre-USB4 and lane adapters.
+		 */
+		if (tb_port_is_null(path->hops[i].in_port) ||
+		    !tb_switch_is_usb4(path->hops[i].in_port->sw)) {
+			hop.initial_credits = path->hops[i].initial_credits;
+			hop.ingress_fc = path->ingress_fc_enable & in_mask;
+			hop.ingress_shared_buffer =
+				path->ingress_shared_buffer & in_mask;
+		}
+
 		hop.unknown3 = 0;
 
 		tb_port_dbg(path->hops[i].in_port, "Writing hop %d\n", i);
-- 
2.50.1


