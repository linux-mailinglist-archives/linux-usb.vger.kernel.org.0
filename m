Return-Path: <linux-usb+bounces-16589-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B49AC785
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 12:11:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0581282E0D
	for <lists+linux-usb@lfdr.de>; Wed, 23 Oct 2024 10:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74D0B19E99E;
	Wed, 23 Oct 2024 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0CcLpXY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596E91A0BE0
	for <linux-usb@vger.kernel.org>; Wed, 23 Oct 2024 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678278; cv=none; b=NP1lwIo50yPOQQzMLiiPAtedAt8bKilxdJm844LQDJ8pkoxLlvyfhXQD/hDzv+iJDGo8SvQZ/mTpMj5FgRgdmzFevZwwrgO4l69ptCpZuqIqJ7FDxBM/Gn1mvulW6r3B2EWreCtAiVlEzqfR3h4bHTh+3xQ8f0w0EycAn8IgE20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678278; c=relaxed/simple;
	bh=cwrZYMyff+gycsnPDS3QFfLN8eDPTvJ6uNgN4Xcbn04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Egir8smZoaHyQg7lsPVhr3APnthh4BizP2gnmz9Uyp/VunHAs01C8Qo+HPgf6LePcRRYdq9cGdo1COJeAFjssUlrfR06wTyBq5nXiP0kJTZSk8Q9Z68bwpUMakCzqtUHJ40xoLjI/O8btwc6KSshR5ekknAAfykfkHNMaQ8BrZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0CcLpXY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729678277; x=1761214277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cwrZYMyff+gycsnPDS3QFfLN8eDPTvJ6uNgN4Xcbn04=;
  b=J0CcLpXYl8e9aFGtslwPGV6p12y7uZ/533DRoRDUp8IOxonHBcLZpeau
   rFCJu78Vcow05iv6ruGTnFOGS0hVKF+g+BJ/9pYusxDW503JoYP6lhmIJ
   ZKfKseQbL0sepnHkpIgP5SeL+tyh+FMEQ58wwOa94KFJj3PSfzhpRANdH
   ZPr5U6hNcLyqqz/qrhI3RJAy69K1Hn77kYk4dLGk0p/cIuTzeyroVHbv9
   fXTd21rvsRo4BKvPBQNn3R6YjIwD7KWtlMM8tZ5XScd6m+LkEGqk1E3o2
   vxOIaOa3CkRT4bIeGGlK3r7+C+4ntTBzhFWw9rq87M3h3TxkoZVbDwRRg
   w==;
X-CSE-ConnectionGUID: 7wKQwTAiTQCcyKFYlEh8Ng==
X-CSE-MsgGUID: CwKitazWT1K2lZx2u70fyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="32116757"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="32116757"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 03:11:16 -0700
X-CSE-ConnectionGUID: MYn7MCycQ6yq9CB0lWaPkw==
X-CSE-MsgGUID: MRFzJQ9OR36IoNojBK48eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80084195"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa010.jf.intel.com with ESMTP; 23 Oct 2024 03:11:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 143E2301; Wed, 23 Oct 2024 13:11:12 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Aapo Vienamo <aapo.vienamo@iki.fi>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 1/8] thunderbolt: Don't hardcode margining capabilities size
Date: Wed, 23 Oct 2024 13:11:04 +0300
Message-ID: <20241023101111.3418311-2-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
References: <20241023101111.3418311-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aapo Vienamo <aapo.vienamo@iki.fi>

Use or pass ARRAY_SIZE() of the capabilities array instead of hardcoding
it. USB4 Gen 4 introduces an additional data word, which requires
expanding the capabilities array.

Signed-off-by: Aapo Vienamo <aapo.vienamo@iki.fi>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 13 ++++++-------
 drivers/thunderbolt/tb.h      |  2 +-
 drivers/thunderbolt/usb4.c    |  5 +++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 350310bd0fee..972f1948725f 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -7,6 +7,7 @@
  *	    Mika Westerberg <mika.westerberg@linux.intel.com>
  */
 
+#include <linux/array_size.h>
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
@@ -570,16 +571,13 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 {
 	struct tb_margining *margining = s->private;
 	struct tb *tb = margining->port->sw->tb;
-	u32 cap0, cap1;
 
 	if (mutex_lock_interruptible(&tb->lock))
 		return -ERESTARTSYS;
 
 	/* Dump the raw caps first */
-	cap0 = margining->caps[0];
-	seq_printf(s, "0x%08x\n", cap0);
-	cap1 = margining->caps[1];
-	seq_printf(s, "0x%08x\n", cap1);
+	for (int i = 0; i < ARRAY_SIZE(margining->caps); i++)
+		seq_printf(s, "0x%08x\n", margining->caps[i]);
 
 	seq_printf(s, "# software margining: %s\n",
 		   supports_software(margining) ? "yes" : "no");
@@ -623,7 +621,7 @@ static int margining_caps_show(struct seq_file *s, void *not_used)
 	if (supports_time(margining)) {
 		seq_puts(s, "# time margining: yes\n");
 		seq_printf(s, "# time margining is destructive: %s\n",
-			   cap1 & USB4_MARGIN_CAP_1_TIME_DESTR ? "yes" : "no");
+			   str_yes_no(margining->caps[1] & USB4_MARGIN_CAP_1_TIME_DESTR));
 
 		switch (independent_time_margins(margining)) {
 		case USB4_MARGIN_CAP_1_TIME_MIN:
@@ -1401,7 +1399,8 @@ static struct tb_margining *margining_alloc(struct tb_port *port,
 	margining->index = index;
 	margining->dev = dev;
 
-	ret = usb4_port_margining_caps(port, target, index, margining->caps);
+	ret = usb4_port_margining_caps(port, target, index, margining->caps,
+				       ARRAY_SIZE(margining->caps));
 	if (ret) {
 		kfree(margining);
 		return NULL;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 6737188f2581..fa7fc9bba70f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1388,7 +1388,7 @@ struct usb4_port_margining_params {
 };
 
 int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
-			     u8 index, u32 *caps);
+			     u8 index, u32 *caps, size_t ncaps);
 int usb4_port_hw_margin(struct tb_port *port, enum usb4_sb_target target,
 			u8 index, const struct usb4_port_margining_params *params,
 			u32 *results);
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 0a9b4aeb3fa1..1fb72ff1268e 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -1631,11 +1631,12 @@ int usb4_port_asym_start(struct tb_port *port)
  * @target: Sideband target
  * @index: Retimer index if taget is %USB4_SB_TARGET_RETIMER
  * @caps: Array with at least two elements to hold the results
+ * @ncaps: Number of elements in the caps array
  *
  * Reads the USB4 port lane margining capabilities into @caps.
  */
 int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
-			     u8 index, u32 *caps)
+			     u8 index, u32 *caps, size_t ncaps)
 {
 	int ret;
 
@@ -1645,7 +1646,7 @@ int usb4_port_margining_caps(struct tb_port *port, enum usb4_sb_target target,
 		return ret;
 
 	return usb4_port_sb_read(port, target, index, USB4_SB_DATA, caps,
-				 sizeof(*caps) * 2);
+				 sizeof(*caps) * ncaps);
 }
 
 /**
-- 
2.45.2


