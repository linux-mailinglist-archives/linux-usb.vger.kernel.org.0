Return-Path: <linux-usb+bounces-12692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5037C942A07
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 11:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA9CEB2345B
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 09:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A584D18CC19;
	Wed, 31 Jul 2024 09:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7nC2yXa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554F9208A4
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417352; cv=none; b=BnQwJxNrh3TdqtYCeiRpXOtonfmXwp2Ri1thf0L0WlHv69OLVQ2ljwqGaQ+lAPuxgYwoh7yiN1ZCjPk9tgGswXcEkTFzudLIEt07B7oavSfZcbteKvqOzcwH2n1yDYh+Kxo3HebQ0QWWAkfPhaIc96cm++c1tMHZdHjFOY1VM/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417352; c=relaxed/simple;
	bh=8Nwhjy/HU+3iVVEsmqKPOxRNrkK9I/IiWYJY1eLLLK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UHQZul307BUbmkMD1HKDq8vDUOLK6j8XEM+DdiEoWHAVA/uo2/cjr4eJKKbF2CaGulDOMgQduT0aestBpbqq7tyJxEoFofas/u9Jg6E512bVX+aKGkMdaeOBc5xK8kS75bYCMJi0zJh8bTOt9csoTgD2NeHwhzxhyCtjDr8AsYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7nC2yXa; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722417350; x=1753953350;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8Nwhjy/HU+3iVVEsmqKPOxRNrkK9I/IiWYJY1eLLLK4=;
  b=R7nC2yXa7O2oezMGDGHNVRMy9wwmfrfFUO2Zbu/KvpUFswHPvX9iZf0c
   pJfDJkHAR/aV2Pxy8zLUxNRZpRvLV04IgRD7v7bqVah0zw6RMNGJ7cjm7
   8jk5NgyZsvoxj5IJqr1p5mDnNhN7vMRVO45XTnJZbJ/XisstKMbwjqTUL
   7AqLMz167P8RrQiAzv4YKZBs9/C42VZonux5dJRkbg1DtVKXsJhv8Bllh
   cLlBFJZchVgOYs+H0rSKNwtaZmty1jodAbt/CdPeXHw2q3Q1LQR7dKivz
   l2GFL26Y6ee598o6IAxxb2F2ARfO2Fr2/CAGJjqhPorsxW2WZeWghNzp3
   Q==;
X-CSE-ConnectionGUID: c6ZPCNAuSXaZKUXejoj3TQ==
X-CSE-MsgGUID: vxQA5vz5SK+vQaU3WjoE0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30864672"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="30864672"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 02:15:43 -0700
X-CSE-ConnectionGUID: CYayDvHWTbekhlaVKAze6g==
X-CSE-MsgGUID: e9To/ogcTyeHOtrAua8nQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="77894884"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2024 02:15:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id B276332E; Wed, 31 Jul 2024 12:15:36 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Aapo Vienamo <aapo.vienamo@linux.intel.com>,
	linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix memory leaks in {port|retimer}_sb_regs_write()
Date: Wed, 31 Jul 2024 12:15:36 +0300
Message-ID: <20240731091536.964112-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aapo Vienamo <aapo.vienamo@linux.intel.com>

Add missing free_page() call for the memory allocated by
validate_and_copy_from_user().

Fixes: 6d241fa00159 ("thunderbolt: Add sideband register access to debugfs")
Signed-off-by: Aapo Vienamo <aapo.vienamo@linux.intel.com>
Reviewed-by: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 11185cc1db92..9ed4bb2e8d05 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -323,16 +323,17 @@ static ssize_t port_sb_regs_write(struct file *file, const char __user *user_buf
 
 	if (mutex_lock_interruptible(&tb->lock)) {
 		ret = -ERESTARTSYS;
-		goto out_rpm_put;
+		goto out;
 	}
 
 	ret = sb_regs_write(port, port_sb_regs, ARRAY_SIZE(port_sb_regs),
 			    USB4_SB_TARGET_ROUTER, 0, buf, count, ppos);
 
 	mutex_unlock(&tb->lock);
-out_rpm_put:
+out:
 	pm_runtime_mark_last_busy(&sw->dev);
 	pm_runtime_put_autosuspend(&sw->dev);
+	free_page((unsigned long)buf);
 
 	return ret < 0 ? ret : count;
 }
@@ -355,16 +356,17 @@ static ssize_t retimer_sb_regs_write(struct file *file,
 
 	if (mutex_lock_interruptible(&tb->lock)) {
 		ret = -ERESTARTSYS;
-		goto out_rpm_put;
+		goto out;
 	}
 
 	ret = sb_regs_write(rt->port, retimer_sb_regs, ARRAY_SIZE(retimer_sb_regs),
 			    USB4_SB_TARGET_RETIMER, rt->index, buf, count, ppos);
 
 	mutex_unlock(&tb->lock);
-out_rpm_put:
+out:
 	pm_runtime_mark_last_busy(&rt->dev);
 	pm_runtime_put_autosuspend(&rt->dev);
+	free_page((unsigned long)buf);
 
 	return ret < 0 ? ret : count;
 }
-- 
2.43.0


