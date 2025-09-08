Return-Path: <linux-usb+bounces-27736-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCAB4959C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 18:39:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94FDD44827C
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5512B3191CE;
	Mon,  8 Sep 2025 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZIJP7Ij7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAC331771B
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757349161; cv=none; b=JiRNSv1TswkPhC6DVHMZwjPS87Vwn2YA1nt5vAGbOlr7+tCptBHLQqWUGmPRA3wKf7zTeSn5wCn1gCqG6zsVVyyi9n3lNMBkbwEngj2IxFRfiBHb6RutzV/Mvif3Yo05V/ZkaOuOreXfsgjFMNuorCDubrRSwtFeltQb19jd2j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757349161; c=relaxed/simple;
	bh=Bm8wDiwSw76kCX0PVkND9rxgQv3dKqhPfdclKNQrpU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S85vx/1Fc6EO57x/bFed+joYlj+/uQFhiW9rJLpg8HY9H69yNCpmgamZFta4TGFUW9Rir+xDoRpBBJW2pUzD3c5esTJGTy3y7d4eDV5OAm2+2k5O3cWy/HwWw1o2AXqofQFuQxofASvuCdlw3b5X1YTt9vTtmofGEYvMsXtHpWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZIJP7Ij7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757349159; x=1788885159;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bm8wDiwSw76kCX0PVkND9rxgQv3dKqhPfdclKNQrpU0=;
  b=ZIJP7Ij7EU3VGxNRsORmVDTDp81+Jr66jE7vLAZTR1ERSsgoIEWhnQAQ
   dP8xW+YjYg4U7kDAka9ClAFLHUr2PNdHcbQ8W+NCs39gIka7fd1WUDitg
   B1WheeBxsdvAZzc1X3IBgFq6UCu7H4Lbt3vPvjOPGsMT015pdWVkTWhfI
   fMw5POr8dzo+uZ/cg0hvQv1SO5d9F3SGx8waZoCJq5/3ScdNrUNM0jqlC
   SLMJBz9nfAT1hH+U81kW2YlpdbYwS+hhrv1wCPS4BnOhczHSOVaGAfwoA
   yxaUPh8Ox1zXhRQITOCyVjE/qm4xLxEv/GI1i6otRBhVW600aF+aagfgA
   Q==;
X-CSE-ConnectionGUID: rFX1fFTySQKqsP0B6xZ/jg==
X-CSE-MsgGUID: KbHJpuBcQd+MaF2JRZrkTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63443067"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63443067"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 09:32:37 -0700
X-CSE-ConnectionGUID: QfTTStSGRXiREEqn043wkg==
X-CSE-MsgGUID: xcoGAefUQvObr6sabh/m4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173291154"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 08 Sep 2025 09:32:36 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F380CA3; Mon, 08 Sep 2025 18:32:30 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 15/26] thunderbolt: Update retimer.c function documentation
Date: Mon,  8 Sep 2025 18:32:19 +0200
Message-ID: <20250908163230.2614397-16-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
References: <20250908163230.2614397-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Make retimer.c function documentation compliant with current kernel-doc
standards. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 361fece3d818..3a0f486a24d5 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -27,8 +27,9 @@
  * @buf: Data read from NVM is stored here
  * @size: Number of bytes to read
  *
- * Reads retimer NVM and copies the contents to @buf. Returns %0 if the
- * read was successful and negative errno in case of failure.
+ * Reads retimer NVM and copies the contents to @buf.
+ *
+ * Return: %0 if the read was successful, negative errno in case of failure.
  */
 int tb_retimer_nvm_read(struct tb_retimer *rt, unsigned int address, void *buf,
 			size_t size)
@@ -503,6 +504,8 @@ static struct tb_retimer *tb_port_find_retimer(struct tb_port *port, u8 index)
  * Then Tries to enumerate on-board retimers connected to @port. Found
  * retimers are registered as children of @port if @add is set.  Does
  * not scan for cable retimers for now.
+ *
+ * Return: %0 on success, negative errno otherwise.
  */
 int tb_retimer_scan(struct tb_port *port, bool add)
 {
-- 
2.50.1


