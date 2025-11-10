Return-Path: <linux-usb+bounces-30279-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15887C469B5
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7B7964EAB25
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEB130EF62;
	Mon, 10 Nov 2025 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evkyHpiI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366C530F538
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777859; cv=none; b=uxVqlNhL4ie1n7pDp6nh5/govFnJ5zroGYc5e218xcoMCIodKd7dgF5OXg/TCTzRFvlNn56ElBILvaFeU7xfp65pQi/QRGXY+niMS+23pJJUBl9d8DcpJoPiUThvFjizmCeBzTlZdckRXCSGrGRyPc8WJ0BS40RIZ+uvbBQswjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777859; c=relaxed/simple;
	bh=JF7POgmbMH3poPJL8eOvAVmJ3VHaC0EvLPPqBaZdh4A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9kOwEZDu9VpBvZP/iP1bUsNbMmeglMG4zfG7PXbtMybDyajefNWQ6Vp00c5FVrCd1fhfGBM7sO3xFmv35sGeOgMs6QVd1JEbsaTCnVaXQPOHwjwBbCmadudWiUgg2l2Dyes2ClxXeB0oMI81JC/ey1T8OIInXoqrRkTdC4F7X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evkyHpiI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777858; x=1794313858;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JF7POgmbMH3poPJL8eOvAVmJ3VHaC0EvLPPqBaZdh4A=;
  b=evkyHpiIgu1FDInclIWNpy/Bf+3qCgy3jD8zlJVUoQcnFRW8A9p21tOb
   rAuYYqMC3dwS2m+agtGN8sLMbEoJw1guK4cebgrJt0R5p36PdlUOqIj0c
   upqhqWoMJrfBv8pkkdBtz8LM4hBHPze945pmDIM/GMgGQJarw3I4lA7IM
   lxKmbHTKYzKyoW1fQUmEC+1TXXbu8R+bbvaHNe09XlT97oxQDR8YGz0H2
   o9IQRSmWujIEVdexR9bup1poijy+7uZZyWld3A2ujuZlLBIJdoGXQehh8
   HdaI1Sr4q1HrViJ3SMgcsXHrhoZ0VNY4VjQ+fZjXi5nA4xp0ivfOmlkv6
   Q==;
X-CSE-ConnectionGUID: tDxalP/pQRa0drQdsxtwtA==
X-CSE-MsgGUID: PpcU6tf7TcyjnTtf7ajVpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64866252"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64866252"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:58 -0800
X-CSE-ConnectionGUID: nfNWQIS9R06vcxDgvb/ssg==
X-CSE-MsgGUID: lWMRCMswRKC7gmqTrUIfww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192922136"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 04:30:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A9BAAA4; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 15/16] thunderbolt: Fix typos in usb4.c
Date: Mon, 10 Nov 2025 13:30:49 +0100
Message-ID: <20251110123050.3959188-16-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in usb4.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 76f01713a875..9e810b2ae0b5 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -284,7 +284,7 @@ int usb4_switch_setup(struct tb_switch *sw)
 		val |= ROUTER_CS_5_PTO;
 		/*
 		 * xHCI can be enabled if PCIe tunneling is supported
-		 * and the parent does not have any USB3 dowstream
+		 * and the parent does not have any USB3 downstream
 		 * adapters (so we cannot do USB 3.x tunneling).
 		 */
 		if (xhci)
@@ -1342,7 +1342,7 @@ static int usb4_port_write_data(struct tb_port *port, const void *data,
  * usb4_port_sb_read() - Read from sideband register
  * @port: USB4 port to read
  * @target: Sideband target
- * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @index: Retimer index if target is %USB4_SB_TARGET_RETIMER
  * @reg: Sideband register index
  * @buf: Buffer where the sideband data is copied
  * @size: Size of @buf
@@ -1395,7 +1395,7 @@ int usb4_port_sb_read(struct tb_port *port, enum usb4_sb_target target, u8 index
  * usb4_port_sb_write() - Write to sideband register
  * @port: USB4 port to write
  * @target: Sideband target
- * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @index: Retimer index if target is %USB4_SB_TARGET_RETIMER
  * @reg: Sideband register index
  * @buf: Data to write
  * @size: Size of @buf
@@ -1527,7 +1527,7 @@ int usb4_port_router_offline(struct tb_port *port)
 }
 
 /**
- * usb4_port_router_online() - Put the USB4 port back to online
+ * usb4_port_router_online() - Put the USB4 port back online
  * @port: USB4 port
  *
  * Makes the USB4 port functional again.
@@ -1692,10 +1692,10 @@ int usb4_port_asym_start(struct tb_port *port)
 }
 
 /**
- * usb4_port_margining_caps() - Read USB4 port marginig capabilities
+ * usb4_port_margining_caps() - Read USB4 port margining capabilities
  * @port: USB4 port
  * @target: Sideband target
- * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @index: Retimer index if target is %USB4_SB_TARGET_RETIMER
  * @caps: Array with at least two elements to hold the results
  * @ncaps: Number of elements in the caps array
  *
@@ -1721,7 +1721,7 @@ int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
  * usb4_port_hw_margin() - Run hardware lane margining on port
  * @port: USB4 port
  * @target: Sideband target
- * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @index: Retimer index if target is %USB4_SB_TARGET_RETIMER
  * @params: Parameters for USB4 hardware margining
  * @results: Array to hold the results
  * @nresults: Number of elements in the results array
@@ -1769,7 +1769,7 @@ int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
  * usb4_port_sw_margin() - Run software lane margining on port
  * @port: USB4 port
  * @target: Sideband target
- * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @index: Retimer index if target is %USB4_SB_TARGET_RETIMER
  * @params: Parameters for USB4 software margining
  * @results: Data word for the operation completion data
  *
@@ -1819,7 +1819,7 @@ int usb4_port_sw_margin(struct tb_port *port, enum usb4_sb_target target,
  * usb4_port_sw_margin_errors() - Read the software margining error counters
  * @port: USB4 port
  * @target: Sideband target
- * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
+ * @index: Retimer index if target is %USB4_SB_TARGET_RETIMER
  * @errors: Error metadata is copied here.
  *
  * This reads back the software margining error counters from the port.
@@ -1853,7 +1853,7 @@ static inline int usb4_port_retimer_op(struct tb_port *port, u8 index,
  * @port: USB4 port
  * @index: Retimer index
  *
- * Enables sideband channel transations on SBTX. Can be used when USB4
+ * Enables sideband channel transactions on SBTX. Can be used when USB4
  * link does not go up, for example if there is no device connected.
  *
  * Return: %0 on success, negative errno otherwise.
@@ -1882,7 +1882,7 @@ int usb4_port_retimer_set_inbound_sbtx(struct tb_port *port, u8 index)
  * @port: USB4 port
  * @index: Retimer index
  *
- * Disables sideband channel transations on SBTX. The reverse of
+ * Disables sideband channel transactions on SBTX. The reverse of
  * usb4_port_retimer_set_inbound_sbtx().
  *
  * Return: %0 on success, negative errno otherwise.
@@ -1981,7 +1981,7 @@ int usb4_port_retimer_nvm_sector_size(struct tb_port *port, u8 index)
  * @index: Retimer index
  * @address: Start offset
  *
- * Exlicitly sets NVM write offset. Normally when writing to NVM this is
+ * Explicitly sets NVM write offset. Normally when writing to NVM this is
  * done automatically by usb4_port_retimer_nvm_write().
  *
  * Return: %0 on success, negative errno otherwise.
@@ -2190,7 +2190,7 @@ usb4_usb3_port_max_bandwidth(const struct tb_port *port, unsigned int bw)
 }
 
 /**
- * usb4_usb3_port_max_link_rate() - Maximum support USB3 link rate
+ * usb4_usb3_port_max_link_rate() - Maximum supported USB3 link rate
  * @port: USB3 adapter port
  *
  * Return: Maximum supported link rate of a USB3 adapter in Mb/s.
-- 
2.50.1


