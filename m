Return-Path: <linux-usb+bounces-18563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E079F45F1
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52EAB188F30F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40601DD87D;
	Tue, 17 Dec 2024 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FGp5U9FK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FD41DAC93
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423750; cv=none; b=eUPhLAlTuuq1wrOnCV0WOg/kOA2gToEhg+yrfCWIkZByZbJWYeZhDXxALfpca1D62M8ha+0RmpeaeHOBAgQn/GIz/S7P24aGKC1H+bWRnJv0MK0DN+IJOnx8oizAFJX+F7BIflrh0azieJbuPF/Zs/I/rOaEV31WpeFEtvZoxLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423750; c=relaxed/simple;
	bh=aDI2PARWshFzqSbNn2kZVW9I7Gseb9t5J7c7x3bcOR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ISFemqMENVBtBrzYwP50tQzN4GfofcuDyuYOU2qVFMi06iy1n7yd4orqg1CBrmZGof+8nHW03IQegwRFajVnxRG+ynPP9WLt5/LbXu7hvlIyOVaedh7UdQ4+dm0Wy1WnTRkmW6YpEGTsgZ8aCRGM9aejKuwjYcgUCVMpWVoN+pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FGp5U9FK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423748; x=1765959748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aDI2PARWshFzqSbNn2kZVW9I7Gseb9t5J7c7x3bcOR4=;
  b=FGp5U9FKzce48dLPeyC5WzO1x9+jjQ1nbaacDfA/okHvK+hv0wy0Hvue
   icLrNnuMQzBqN7CrPjIy9UYsTb2nx+BpWNWpZ74mSiAuWJlWhJ7W2CfBn
   txgdHAzIyvt4xZsF2+CvjAyZeidSFxXIIGgr8yM6ZUmojaAOcxKd0kmGt
   zG/cFHnmB2/OlFdvmona7xp7z6ia/WL+jKCk9WhKQ6SWASwyz9KRvQAEC
   hVzZCN5P+P7s8kZ1bpvgYU2ZUbaDD7JXUu5m5DZC7fjLH0TQszKoqNeYC
   rBjW0CPrEGe4tYPay6nr47jrjPI/QA/VvH0OwMrcskl890Uq3ej0B+TfT
   w==;
X-CSE-ConnectionGUID: NcL+1t99TXqwQoXuAAnESg==
X-CSE-MsgGUID: EV1pU3JhTcukzamfrH0cLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34992568"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34992568"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:25 -0800
X-CSE-ConnectionGUID: CWsXBAKPTR6+er/5AcHkeQ==
X-CSE-MsgGUID: cujgWNh1QBKpjLBqNhxnpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="98037625"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 00:22:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 08772329; Tue, 17 Dec 2024 10:22:22 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/12] thunderbolt: Debug log an invalid config space reply just once
Date: Tue, 17 Dec 2024 10:22:13 +0200
Message-ID: <20241217082222.528602-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
References: <20241217082222.528602-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These can mess up the debug log if a router does not implement the
config space register blocks fully and we are reading registers through
debugfs. To avoid this, just log it once.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index fd40cda1e53f..dc1f456736dc 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -70,6 +70,9 @@ struct tb_ctl {
 #define tb_ctl_dbg(ctl, format, arg...) \
 	dev_dbg(&(ctl)->nhi->pdev->dev, format, ## arg)
 
+#define tb_ctl_dbg_once(ctl, format, arg...) \
+	dev_dbg_once(&(ctl)->nhi->pdev->dev, format, ## arg)
+
 static DECLARE_WAIT_QUEUE_HEAD(tb_cfg_request_cancel_queue);
 /* Serializes access to request kref_get/put */
 static DEFINE_MUTEX(tb_cfg_request_lock);
@@ -279,8 +282,8 @@ static void tb_cfg_print_error(struct tb_ctl *ctl, enum tb_cfg_space space,
 		 * Invalid cfg_space/offset/length combination in
 		 * cfg_read/cfg_write.
 		 */
-		tb_ctl_dbg(ctl, "%llx:%x: invalid config space (%u) or offset\n",
-			   res->response_route, res->response_port, space);
+		tb_ctl_dbg_once(ctl, "%llx:%x: invalid config space (%u) or offset\n",
+				res->response_route, res->response_port, space);
 		return;
 	case TB_CFG_ERROR_NO_SUCH_PORT:
 		/*
-- 
2.45.2


