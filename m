Return-Path: <linux-usb+bounces-30270-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A639AC469CD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C15A3BB039
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12F130F931;
	Mon, 10 Nov 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeXx6H3G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7610D30DD2C
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=AB/bvVKVSdsHwe3+7MfCVPiFTvvc9Gs/hzjwHit+w/eF2Su0fwS4HBZK6Atu3xuMWwxxYLwSLs6QYH8mDfXBaXe5oIwP9fW/AnDIVjwM0Obp1Xo7x/msJ+6j9Jm6F8XpTugLrYk6ZwC98XT2gSxwNgb+fvjBsHjL+iEJoRcymoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=zDfqVo2lIAk/Nq3GVxIPh43JlzC6q++m3XFQ+sIIWLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtZPYKvw87QgqDhUZ3ym7jVCv0x5xBpFdKnLl98hBtw/h1eExv6Gli/HllQOPilWjEGxXGtcnLD6nkXN32JvUyWHVGAjUcPkaopJy51pCFSStAxWaz30TeN9TZ9l+bVCWb3tGnaFPFCxMNYP1UI9lKjjofO6isz3iBe/kMlsT7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeXx6H3G; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zDfqVo2lIAk/Nq3GVxIPh43JlzC6q++m3XFQ+sIIWLc=;
  b=ZeXx6H3GNgpE1qInhVVeehF9KwJGt4Jj+HiZFsntGQUxb5HoURa5fKt4
   c6wXMhhtoFvQ1jWu4VK6IODCzosIrLj7fb8Yp6l1dgdmXg7CtUaAdfr8g
   y4LyNFQPbtkAZdYqPg8w4GjSB5rTmRNwyARwYfrSViyBhBz1HSAY5SxIg
   QrqiQMObmJCH2A+5KjEgYSbGnO5N32uWX1Mr458tey1GnlgYqcXdPNFyJ
   leiV2KqkSkTMN9vGQUea7yY5GAuscCPWQ1MPvkwHT2cZSL4Df2A7KmRpt
   LNI7vHM/x0lLbYJjtKJMMWxWAWGaIyVUkjAbIdqUJ++j2ko9D/0vEh8OD
   A==;
X-CSE-ConnectionGUID: 41HU0d76QbGYZlgo4AAojA==
X-CSE-MsgGUID: TuXeHILvRBeR3drjKOxpeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75931563"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75931563"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:56 -0800
X-CSE-ConnectionGUID: bCI4EmijSA+8alUhLCirxw==
X-CSE-MsgGUID: gsSE6OcrRuWaqWv2PtCHaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="188826829"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 10 Nov 2025 04:30:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8A9D79A; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 05/16] thunderbolt: Fix typos in icm.c
Date: Mon, 10 Nov 2025 13:30:39 +0100
Message-ID: <20251110123050.3959188-6-mika.westerberg@linux.intel.com>
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

Fix typos in icm.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 66092febb40d..d339ba835376 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -787,7 +787,7 @@ icm_fr_device_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 		 * information might have changed for example by the
 		 * fact that a switch on a dual-link connection might
 		 * have been enumerated using the other link now. Make
-		 * sure our book keeping matches that.
+		 * sure our bookkeeping matches that.
 		 */
 		if (sw->depth == depth && sw_phy_port == phy_port &&
 		    !!sw->authorized == authorized) {
@@ -969,7 +969,7 @@ icm_fr_xdomain_connected(struct tb *tb, const struct icm_pkg_header *hdr)
 
 	/*
 	 * Look if there already exists an XDomain in the same place
-	 * than the new one and in that case remove it because it is
+	 * as the new one and in that case remove it because it is
 	 * most likely another host that got disconnected.
 	 */
 	xd = tb_xdomain_find_by_link_depth(tb, link, depth);
@@ -2171,7 +2171,7 @@ static int icm_runtime_resume_switch(struct tb_switch *sw)
 static int icm_runtime_resume(struct tb *tb)
 {
 	/*
-	 * We can reuse the same resume functionality than with system
+	 * We can reuse the same resume functionality as with system
 	 * suspend.
 	 */
 	icm_complete(tb);
-- 
2.50.1


