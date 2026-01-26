Return-Path: <linux-usb+bounces-32748-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFmJO5Tkd2k9mQEAu9opvQ
	(envelope-from <linux-usb+bounces-32748-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:03:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F508DCC6
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 28BAD302CD2A
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 22:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1EF2DF151;
	Mon, 26 Jan 2026 22:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeUWIERu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1592D3002D6
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 22:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464960; cv=none; b=fkkCIg5HREcXa6U5mtUbuq6hYSGdmQc9nhkQV7j8MfSA4AWM+Gllq2p2njE7s2kr/NxM9EyZjWrXyPN1f7pIIuNjXj4wAwQqmy3Wthr3SOuXmm4pI0KrXU3OAhSXUJXRMH9dCtrb8VQVEZj9cW7shDQK4D/hYG/MZW5dXyLkFCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464960; c=relaxed/simple;
	bh=iH3lkHgtWBYYmaF68KXP93FDCUBST90as0m4XRGr6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sbzQowA6CKxTXVk2sigZ662cLJIr2kI+jUpqNevi/uhRRNqHSlEZY+rkIWHdUBbPFG27R19RVw8b6AiGaPeuE/fOxhJM/pAuWPFujNsNsr2DxQ3knyqdDJTJlSyWCRTb6rmrJUOVJHvVsGWmEYThvML4O2rqIDuzhFKuZvhr85U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeUWIERu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464956; x=1801000956;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iH3lkHgtWBYYmaF68KXP93FDCUBST90as0m4XRGr6GQ=;
  b=SeUWIERuCNSJfXwbD3r5cy2XnshXukxDGR210CzjjbuuAZxa41SWn/Bi
   VCTWy7mS8f7y3t6/2KjwHiRa7umt+hYAJ1WoySnlxta8Bh5BG0aB4puCO
   uHMIQYGZED46e5Ap9KN0eAbBcu8O74gjkqvSUZh7bCQjZoeKg9lRy0UFc
   6j0TQQClOoxi84luFqu8Dw+1atSh5iy7CygeqxDhVWV2Nrq8sHiUJkEpC
   oXmN57v4G9g3AIMd9eaTtZNHCUbQI/j42TnjjyPPEfAc1FThAuKmtSbl8
   Q7wXmprQ+U2LM93y4BAXexAG5lgyn1OCow4xo1N2Po9QKICaHa6Ks3O7N
   A==;
X-CSE-ConnectionGUID: of1hx3IQRtqZlZCZYZmjHg==
X-CSE-MsgGUID: wTmUgK/7Rp2K7+hdnLGB1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82019780"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82019780"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:02:35 -0800
X-CSE-ConnectionGUID: rB9McJlFS66b5Ss1eSoJ1A==
X-CSE-MsgGUID: vjovlaMfTCqe9Jvyaj9qng==
X-ExtLoop1: 1
Received: from cdjpc409-it.jer.intel.com ([10.12.50.120])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 14:02:33 -0800
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>
Subject: [PATCH 5/5] thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers
Date: Tue, 27 Jan 2026 00:06:06 +0200
Message-ID: <20260126220606.3476657-6-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126220606.3476657-1-gil.fine@linux.intel.com>
References: <20260126220606.3476657-1-gil.fine@linux.intel.com>
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-32748-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gil.fine@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux.intel.com:mid]
X-Rspamd-Queue-Id: 81F508DCC6
X-Rspamd-Action: no action

Currently we set the Notification Timeout field in ROUTER_CS_4 for USB4
routers to 10 ms, which is unnecessarily short and may cause unnecessary
retransmissions of Hot Plug packets by the router in case of slow
software response.

Change Notification Timeout for USB4 routers to use 255 ms, aligning
their behavior with Thunderbolt 3 and providing adequate time for
software to process Hot Plug Events.

While there, also fix the comment describing the Notification Timeout
field to match the USB4 specification.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 drivers/thunderbolt/switch.c  | 13 +++----------
 drivers/thunderbolt/tb_regs.h |  3 +--
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 11e8c1dd3090..7962a7e9d4b3 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -1742,8 +1742,6 @@ int tb_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 /*
  * tb_plug_events_active() - enable/disable plug events on a switch
  *
- * Also configures a sane plug_events_delay of 255ms.
- *
  * Return: %0 on success, negative errno otherwise.
  */
 static int tb_plug_events_active(struct tb_switch *sw, bool active)
@@ -1754,11 +1752,6 @@ static int tb_plug_events_active(struct tb_switch *sw, bool active)
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
@@ -2620,7 +2613,8 @@ int tb_switch_configure(struct tb_switch *sw)
 	       tb_route_length(route), sw->config.upstream_port_number);
 
 	sw->config.enabled = 1;
-
+	/* Set Notification Timeout to 255 ms for all routers */
+	sw->config.plug_events_delay = 0xff;
 	if (tb_switch_is_usb4(sw)) {
 		/*
 		 * For USB4 devices, we need to program the CM version
@@ -2632,7 +2626,6 @@ int tb_switch_configure(struct tb_switch *sw)
 			sw->config.cmuv = ROUTER_CS_4_CMUV_V1;
 		else
 			sw->config.cmuv = ROUTER_CS_4_CMUV_V2;
-		sw->config.plug_events_delay = 0xa;
 
 		/* Enumerate the switch */
 		ret = tb_sw_write(sw, (u32 *)&sw->config + 1, TB_CFG_SWITCH,
@@ -2658,7 +2651,7 @@ int tb_switch_configure(struct tb_switch *sw)
 
 		/* Enumerate the switch */
 		ret = tb_sw_write(sw, (u32 *)&sw->config + 1, TB_CFG_SWITCH,
-				  ROUTER_CS_1, 3);
+				  ROUTER_CS_1, 4);
 	}
 	if (ret)
 		return ret;
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 7e65bc9bcb12..f8a84e07969f 100644
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
2.43.0


