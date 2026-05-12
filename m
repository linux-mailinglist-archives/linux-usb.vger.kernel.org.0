Return-Path: <linux-usb+bounces-37329-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uB20IPkdA2r10gEAu9opvQ
	(envelope-from <linux-usb+bounces-37329-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:32:57 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4A520320
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:32:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C31C3024540
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC6644A3412;
	Tue, 12 May 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgx1D6ee"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811338E8C7
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589029; cv=none; b=lKKeXp2qORTNdRMDjwnoKrb1KGNa48Jrp6SZcCwgJuqY8/wtpE/Xb7ehW8gNjHSHh29FwSzkMgOFD3l7MtQhc6RrAI31VdvFhzEj13JftZKA3E1UXdVSOIUOH3NGso9J+mlCOHmjCFamFDiMvaztke9y/YH0ZgBqN85tT31LCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589029; c=relaxed/simple;
	bh=YhLBCvjEKeez+3jG2KJJ5uyBHgTYoFaAoaqRhnLkQUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eyyasq3ohtKvYH6naIa613dSVa9qHH80qDcmuScVwj9k/nJOzr10aePMtXT2TYhmlx+3TxjdsuH+ZGm2fRUagqhNx4K4NUCDhtbH4k4RKg7kyLyvMCVM9hq51qqyFmZJRKQlc50C3fSBYn8q54kZZ0azQcLyzbI/Jc21rpehAWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgx1D6ee; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589023; x=1810125023;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YhLBCvjEKeez+3jG2KJJ5uyBHgTYoFaAoaqRhnLkQUQ=;
  b=fgx1D6eeGk1Sgu9nAu4dumklN/HruIPLltpUseYqLp1F+4rI22Xx1ITi
   YWv7RSOqD4ftK6EGJYCuPinJro2huujTG+FUH1dhBADmE2pUlWtqtKnGw
   YSvB4eKmZGvAD/jjtWg9jSsAHN/9FmmGs6Vbvbxx5riIc/4fKD+crCJbR
   0l5i83X3GtINBkaQQSI/uqTDCQzllYtyegcyMQwt9A0P8GCKO9TA9ifV3
   NkgBC7KzoIzZuIPSJ+1Z3KBaXk7AngtsfzmpJ9tnRH+h9RlPxfQOtd7hB
   Ee4XqvNG+wmtLBYmaJYBew7DPPs//htLADKgUc+upXrcvClrJMXehelSQ
   g==;
X-CSE-ConnectionGUID: 7SmIvbrxRaK50RgOB1A5LA==
X-CSE-MsgGUID: lj4BX7kYSIuE/F7WvRc/Vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950608"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950608"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:30:01 -0700
X-CSE-ConnectionGUID: Cdv8wAoUSI+hLloREIecjg==
X-CSE-MsgGUID: b8mMKQ3aRP6qWb80xMd17g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692697"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id CD515A5; Tue, 12 May 2026 14:29:55 +0200 (CEST)
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
Subject: [PATCH 8/8] thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers
Date: Tue, 12 May 2026 14:29:55 +0200
Message-ID: <20260512122955.271688-9-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: 86E4A520320
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37329-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,linux.intel.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Gil Fine <gil.fine@linux.intel.com>

Currently we set the Notification Timeout field in ROUTER_CS_4 for USB4
routers to 10 ms, which is unnecessarily short and may cause unnecessary
retransmissions of Hot Plug packets by the router in case of slow
software response.
Increase the timeout to 255 ms, aligning with Thunderbolt 3 routers
and providing adequate time for software to process Hot Plug Events.

While there, fix the comment describing the Notification Timeout
field to match the USB4 specification.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 12 +++---------
 drivers/thunderbolt/tb_regs.h |  3 +--
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index f421997c298d..d7c53eb3221b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1767,8 +1767,6 @@ int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 /*
  * tb_plug_events_active() - enable/disable plug events on a switch
  *
- * Also configures a sane plug_events_delay of 255ms.
- *
  * Return: %0 on success, negative errno otherwise.
  */
 static int tb_plug_events_active(struct tb_switch *sw, bool active)
@@ -1779,11 +1777,6 @@ static int tb_plug_events_active(struct tb_switch *sw, bool active)
 	if (tb_switch_is_icm(sw) || tb_switch_is_usb4(sw))
 		return 0;
 
-	sw->config.plug_events_delay = 0xff;
-	res = tb_sw_write(sw, ((u32 *) &sw->config) + 4, TB_CFG_SWITCH, 4, 1);
-	if (res)
-		return res;
-
 	res = tb_sw_read(sw, &data, TB_CFG_SWITCH, sw->cap_plug_events + 1, 1);
 	if (res)
 		return res;
@@ -2645,6 +2638,8 @@ int tb_switch_configure(struct tb_switch *sw)
 
 	sw->config.enabled = 1;
 
+	/* Set Notification Timeout to 255 ms for all routers */
+	sw->config.plug_events_delay = 0xff;
 	if (tb_switch_is_usb4(sw)) {
 		/*
 		 * For USB4 devices, we need to program the CM version
@@ -2656,7 +2651,6 @@ int tb_switch_configure(struct tb_switch *sw)
 			sw->config.cmuv = ROUTER_CS_4_CMUV_V1;
 		else
 			sw->config.cmuv = ROUTER_CS_4_CMUV_V2;
-		sw->config.plug_events_delay = 0xa;
 
 		/* Enumerate the switch */
 		ret = tb_sw_write(sw, (u32 *)&sw->config + 1, TB_CFG_SWITCH,
@@ -2677,7 +2671,7 @@ int tb_switch_configure(struct tb_switch *sw)
 
 		/* Enumerate the switch */
 		ret = tb_sw_write(sw, (u32 *)&sw->config + 1, TB_CFG_SWITCH,
-				  ROUTER_CS_1, 3);
+				  ROUTER_CS_1, 4);
 	}
 	if (ret)
 		return ret;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 69ca4c379cc9..92d893634d2b 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -182,8 +182,7 @@ struct tb_regs_switch_header {
 	/* DWORD 4 */
 	u32 plug_events_delay:8; /*
 				  * RW, pause between plug events in
-				  * milliseconds. Writing 0x00 is interpreted
-				  * as 255ms.
+				  * milliseconds.
 				  */
 	u32 cmuv:8;
 	u32 __unknown4:8;
-- 
2.50.1


