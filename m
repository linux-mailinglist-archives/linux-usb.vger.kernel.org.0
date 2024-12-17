Return-Path: <linux-usb+bounces-18568-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D329F45F9
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:23:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491FE16267E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B071DB34C;
	Tue, 17 Dec 2024 08:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evZszTbS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C9C155393
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423763; cv=none; b=QBmAf08hZa0i4o6uizZYFJnWjOCi3gjCBKRPyvONnb+A3CyYwUbYRGS1Na1e9DGMXT8fViQnbeo6TC6BEjnhnC5+F/t4Zrjd9ggDmezZCI+Z32fwtZfmVW6HrR+JeqiSuMIogkjMVk60YQKR/BS88dX3hol+0TemCad9VoB4+sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423763; c=relaxed/simple;
	bh=OBa0TP3jMBW3M8PfDmQBOl0C9sF3eiVp7SD02DFtGC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0IAHV8PNlo6AFfxvXmOiu38pPBn2rGoojOmEb7o0phjocSnCit6IuD0gY46jBj4yQCr33isJ9mlSR1N31nOoosRJFK3Umdg503sAzgeJm5CkeGO5Ko/5vqqkmZvAjD95uGpGqerAl5czYn3YiFcD5xnP34gvpBVoHvnADtO0+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evZszTbS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423762; x=1765959762;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OBa0TP3jMBW3M8PfDmQBOl0C9sF3eiVp7SD02DFtGC8=;
  b=evZszTbSLpBD6zevoUIYslY7kqPS31LyiRq8IKpStO24C4SLtRnHjmol
   7b5K8iYr+/1d+mmm3zzh+TFD6Zxp24oSCpI5sIOg3WIcEhfMahRDvRoHF
   4CyyIZFRJUKLLysB434T5v5tQCnZjec82JxwU3TOxZt6FCluML1E9RN+g
   mf8Cd+UjePE5rkb9z3dycWVApichq/S6232mS52wnmm7GJVe+0POC7wlJ
   56Jv/bIhRGNBDobFEzI6CbL5DQ7hdn8HUbZrWr7Ngdig9QZ1In/y1fLhB
   GR1k9WL1pU8hwqZsv/I3k/hYEpOr+9zTuO14rVrtTCV68822P8SqgZiDs
   g==;
X-CSE-ConnectionGUID: kD3HfgTSQDWcujOwEAiZhw==
X-CSE-MsgGUID: Ce5U097TQOyEcxUm5/LEuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34992602"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34992602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:37 -0800
X-CSE-ConnectionGUID: 9Wz0lVYRQCaAKUzScFfniw==
X-CSE-MsgGUID: ln9Zq9nXTNS6+svU/Q//Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="98037685"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 00:22:26 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 4B79E91A; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 10/12] thunderbolt: Move forward declarations in one place
Date: Tue, 17 Dec 2024 10:22:20 +0200
Message-ID: <20241217082222.528602-11-mika.westerberg@linux.intel.com>
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

Sometimes we need to have these but move them into one place so that the
code is bit more understanable.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 60454f9b9475..79ebf70f42e5 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -76,6 +76,7 @@ struct tb_hotplug_event {
 	bool unplug;
 };
 
+static void tb_scan_port(struct tb_port *port);
 static void tb_handle_hotplug(struct work_struct *work);
 
 static void tb_queue_hotplug(struct tb *tb, u64 route, u8 port, bool unplug)
@@ -1238,8 +1239,6 @@ static void tb_configure_link(struct tb_port *down, struct tb_port *up,
 	tb_switch_configure_link(sw);
 }
 
-static void tb_scan_port(struct tb_port *port);
-
 /*
  * tb_scan_switch() - scan for and initialize downstream switches
  */
-- 
2.45.2


