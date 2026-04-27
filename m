Return-Path: <linux-usb+bounces-36511-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCGKFTQa72lr6gAAu9opvQ
	(envelope-from <linux-usb+bounces-36511-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:32 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFE46ED96
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67877301CA71
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CE7E39A7F2;
	Mon, 27 Apr 2026 08:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iQLR5i7x"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BA3399360
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277475; cv=none; b=dqxinYsvCEd3n/N3BQG6H5ygON3ByWBkDx3C7oxLv7xTgXeeaZlHWY7LtAhZkbSoKc89jxwXWX/0IGUHWBriaXjfSUlbXpREp8BzP+d+dwDnkdyW7G7Jkxk9hP50Sz1GMo+2qQE7bw+UxkTs9V+8i2aFhVuuUwSrW2cF0h67AZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277475; c=relaxed/simple;
	bh=nqLUGkRJOpPfyzxP+f2fejApsQOJRGzruWYJX2aB40I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mfc2mTTG5+l8Wqaw2aKHiDkQs9tpKVWyViecC8TK1JfUa1R9zskQ6T9UabqRCriuxdQFj6jjF7IIadU5jUU37jYuCKOsr3EOBgPah6Qudxg7I/g1puAJV3ORqW1nj2z7Sf94RF+kBy98G7fnVEh8jgThgZ9Prkrf9Xsl/dlJqJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iQLR5i7x; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777277474; x=1808813474;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nqLUGkRJOpPfyzxP+f2fejApsQOJRGzruWYJX2aB40I=;
  b=iQLR5i7xRkKN/IngzxplCcP1DqWO51C59wKUZ2wS+sRjDDsy/DrnsUhS
   vbPRWkLVoQaeUFvBmTEgm/u6+ViklD07DalpZw1K9T6YjqH/juakPh6nB
   LhTQKVc2j2bAr9EZhT9SwgywxlycQSckwwkBXxuuGwPXPdRB5oEO4/cU6
   Hc7iZ/lQgpgwF7gVvwI/+ogPHG47sXiey6O5HlW54vknfxiQ5VxPM6Usd
   TPqPYj0acgWI1cyKdzPSliPjZuzm8epw8EBV19GB2pujeH4Y0JUQ8gXeF
   q5mX1cWcK+w+by0jC9/ICv2ThL6/dmYghXirp5+Og8/ELqp3E4EdOqY4V
   g==;
X-CSE-ConnectionGUID: I2hSRBuXSsu9/TmIDXvXAA==
X-CSE-MsgGUID: sfprzaUnQX6jqA4mbT2eQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77863246"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77863246"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:11:12 -0700
X-CSE-ConnectionGUID: Gt6t56mBSEav0ru0vngOqg==
X-CSE-MsgGUID: IvVcW2ZHQJCG7XPLP16QhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229008927"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa006.fm.intel.com with ESMTP; 27 Apr 2026 01:11:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 70CA09B; Mon, 27 Apr 2026 10:11:09 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/12] thunderbolt: Make XDomain lane bonding comply with the USB4 v2 spec
Date: Mon, 27 Apr 2026 10:11:00 +0200
Message-ID: <20260427081109.2337731-4-mika.westerberg@linux.intel.com>
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
X-Rspamd-Queue-Id: A7AFE46ED96
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
	TAGGED_FROM(0.00)[bounces-36511-lists,linux-usb=lfdr.de];
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

The USB4 v2 Inter-Domain spec "unified" the lane bonding flow so that
when the other end (with higher UUID) is not yet set the target link
width accordingly it is expected to reply with ERROR_NOT_READY.
Implement this for Linux.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/xdomain.c | 65 +++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 18 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index 57367e18733a..680b2204875a 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -535,29 +535,19 @@ static int tb_xdp_link_state_status_request(struct tb_ctl *ctl, u64 route,
 }
 
 static int tb_xdp_link_state_status_response(struct tb *tb, struct tb_ctl *ctl,
-					     struct tb_xdomain *xd, u8 sequence)
+					     struct tb_xdomain *xd, u8 sequence,
+					     u8 slw, u8 sls, u8 tls, u8 tlw)
 {
 	struct tb_xdp_link_state_status_response res;
-	struct tb_port *port = tb_xdomain_downstream_port(xd);
-	u32 val[2];
-	int ret;
 
 	memset(&res, 0, sizeof(res));
 	tb_xdp_fill_header(&res.hdr, xd->route, sequence,
 			   LINK_STATE_STATUS_RESPONSE, sizeof(res));
 
-	ret = tb_port_read(port, val, TB_CFG_PORT,
-			   port->cap_phy + LANE_ADP_CS_0, ARRAY_SIZE(val));
-	if (ret)
-		return ret;
-
-	res.slw = (val[0] & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
-			LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
-	res.sls = (val[0] & LANE_ADP_CS_0_SUPPORTED_SPEED_MASK) >>
-			LANE_ADP_CS_0_SUPPORTED_SPEED_SHIFT;
-	res.tls = val[1] & LANE_ADP_CS_1_TARGET_SPEED_MASK;
-	res.tlw = (val[1] & LANE_ADP_CS_1_TARGET_WIDTH_MASK) >>
-			LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
+	res.slw = slw;
+	res.sls = sls;
+	res.tls = tls;
+	res.tlw = tlw;
 
 	return __tb_xdomain_response(ctl, &res, sizeof(res),
 				     TB_CFG_PKG_XDOMAIN_RESP);
@@ -804,8 +794,47 @@ static void tb_xdp_handle_request(struct work_struct *work)
 		       route);
 
 		if (xd) {
-			ret = tb_xdp_link_state_status_response(tb, ctl, xd,
-								sequence);
+			struct tb_port *port = tb_xdomain_downstream_port(xd);
+			u8 slw, sls, tls, tlw;
+			u32 val[2];
+
+			/*
+			 * Read the adapter supported and target widths
+			 * and speeds.
+			 */
+			ret = tb_port_read(port, val, TB_CFG_PORT,
+					   port->cap_phy + LANE_ADP_CS_0,
+					   ARRAY_SIZE(val));
+			if (ret)
+				break;
+
+			slw = (val[0] & LANE_ADP_CS_0_SUPPORTED_WIDTH_MASK) >>
+				LANE_ADP_CS_0_SUPPORTED_WIDTH_SHIFT;
+			sls = (val[0] & LANE_ADP_CS_0_SUPPORTED_SPEED_MASK) >>
+				LANE_ADP_CS_0_SUPPORTED_SPEED_SHIFT;
+			tls = val[1] & LANE_ADP_CS_1_TARGET_SPEED_MASK;
+			tlw = (val[1] & LANE_ADP_CS_1_TARGET_WIDTH_MASK) >>
+				LANE_ADP_CS_1_TARGET_WIDTH_SHIFT;
+
+			/*
+			 * When we have higher UUID, we are supposed to
+			 * return ERROR_NOT_READY if the tlw is not yet
+			 * set according to the Inter-Domain spec for
+			 * USB4 v2.
+			 */
+			if (xd->state == XDOMAIN_STATE_BONDING_UUID_HIGH &&
+			    xd->target_link_width &&
+			    xd->target_link_width != tlw) {
+				tb_dbg(tb, "%llx: target link width not yet set %#x != %#x\n",
+				       route, tlw, xd->target_link_width);
+				tb_xdp_error_response(ctl, route, sequence,
+						      ERROR_NOT_READY);
+			} else {
+				tb_dbg(tb, "%llx: replying with target link width set to %#x\n",
+				       route, tlw);
+				ret = tb_xdp_link_state_status_response(tb, ctl,
+					xd, sequence, slw, sls, tls, tlw);
+			}
 		} else {
 			tb_xdp_error_response(ctl, route, sequence,
 					      ERROR_NOT_READY);
-- 
2.50.1


