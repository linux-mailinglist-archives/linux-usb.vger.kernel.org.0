Return-Path: <linux-usb+bounces-15900-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1A995F70
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 08:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AC8C1F2567E
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 06:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB3C9158DB1;
	Wed,  9 Oct 2024 06:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJfJC+80"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3FE155E53
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 06:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728454026; cv=none; b=Ml96UMocv+s7rPtgtYAnLAr7tzzHU4sWHxdgs5iyOdLCwmIp3t607JS4wAPV03QJ+mgQSFcORGoWgp++CGo5PMZrC96qIPjEh86Nx9oZ4os+yHVxay5C6ca3/VFT8QCs6xAuchN4RL09QF7TH3hlWvj2kVv/lDDkprmX8oV9XQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728454026; c=relaxed/simple;
	bh=S3EQeQXk+FUsyOXT0Yozyd0+LsMe/i+q2U0bQTgYnSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mObWX7NZ1VV+Vi+uzRSOYVh7pxhqDVO0AJqeaa754t/soPYeyYm/iT1/ICiEUxNYdm7+bnywNjhKc0A2T2SO9NVaAZRgIwFjnm3DrHBzNyIXR/8iplQxD7+CsqRPyTAGPS3TiibOuis/0D3RNVsswMezJuXii7F7RkGuiBt+w1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJfJC+80; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728454025; x=1759990025;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S3EQeQXk+FUsyOXT0Yozyd0+LsMe/i+q2U0bQTgYnSE=;
  b=eJfJC+80ZNzzlzZQvGoMbQRxIWa/A4yNuA71YoTxekdPbuaFpgkjErzP
   wmc238jS0zPUAvQ5GnPfO9c/zK+KIcvvwqkQPUpLt4fC0KIeP4XO4ZWSe
   LgcsxQLWs0eLj1bxGdHHtLhn3SwIQNinsiYA+qgRDM43iLatXX35Zcm70
   1ICGBhYJORqm5az3xE6NBrN0cNDdhcrEpCGKBYF7trmmhsbhI8yhpKrRP
   YMvR3hN/etsNVMbNfKevO6d+t4aXyRst2lcepCqJ3HdkWEdPbwW8u+B+W
   OG4bwZVhjPUbmgcUTNLC8Fo0Nmt09wkhWHpzH9/eUqaXRmPGhgvRwShpu
   g==;
X-CSE-ConnectionGUID: VLcL691iSBOfC/vPeIAB5g==
X-CSE-MsgGUID: WHrSYHPUR7mtuhnImVMcBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27180515"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27180515"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 23:07:04 -0700
X-CSE-ConnectionGUID: ZSX3rAduQX2CC8/JHoLskw==
X-CSE-MsgGUID: Ex3sKHDkQOSecIds1c5Q1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80116841"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 08 Oct 2024 23:07:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 7B06D4E2; Wed, 09 Oct 2024 09:07:01 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Fix KASAN reported stack out-of-bounds read in tb_retimer_scan()
Date: Wed,  9 Oct 2024 09:07:01 +0300
Message-ID: <20241009060701.2434897-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KASAN reported following issue:

 BUG: KASAN: stack-out-of-bounds in tb_retimer_scan+0xffe/0x1550 [thunderbolt]
 Read of size 4 at addr ffff88810111fc1c by task kworker/u56:0/11
 CPU: 0 UID: 0 PID: 11 Comm: kworker/u56:0 Tainted: G     U             6.11.0+ #1387
 Tainted: [U]=USER
 Workqueue: thunderbolt0 tb_handle_hotplug [thunderbolt]
 Call Trace:
  <TASK>
  dump_stack_lvl+0x6c/0x90
  print_report+0xd1/0x630
  kasan_report+0xdb/0x110
  __asan_report_load4_noabort+0x14/0x20
  tb_retimer_scan+0xffe/0x1550 [thunderbolt]
  tb_scan_port+0xa6f/0x2060 [thunderbolt]
  tb_handle_hotplug+0x17b1/0x3080 [thunderbolt]
  process_one_work+0x626/0x1100
  worker_thread+0x6c8/0xfa0
  kthread+0x2c8/0x3a0
  ret_from_fork+0x3a/0x80
  ret_from_fork_asm+0x1a/0x30

This happens because the loop variable still gets incremented by one so
max becomes 3 instead of 2, and this makes the second loop read past the
the array declared on the stack.

Fix this by assigning to max directly in the loop body.

Fixes: ff6ab055e070 ("thunderbolt: Add receiver lane margining support for retimers")
CC: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 721319329afa..7db9869a9f3f 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -516,7 +516,7 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 	 */
 	tb_retimer_set_inbound_sbtx(port);
 
-	for (i = 1; i <= TB_MAX_RETIMER_INDEX; i++) {
+	for (max = 1, i = 1; i <= TB_MAX_RETIMER_INDEX; i++) {
 		/*
 		 * Last retimer is true only for the last on-board
 		 * retimer (the one connected directly to the Type-C
@@ -527,9 +527,10 @@ int tb_retimer_scan(struct tb_port *port, bool add)
 			last_idx = i;
 		else if (ret < 0)
 			break;
+
+		max = i;
 	}
 
-	max = i;
 	ret = 0;
 
 	/* Add retimers if they do not exist already */
-- 
2.45.2


