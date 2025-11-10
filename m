Return-Path: <linux-usb+bounces-30274-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB18C469AD
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFE161881B30
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693AD30FC31;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndEA9Ioe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA9530E0EA
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=WoqYbZ+FH1exXg+PsH2RffPPrCRmlgd0bmTxrED0nmPpPvUJcJX1AT3jVc7N+Vap6wHPUWPO655lGtvRzNMLBoteex2NUaQHJ0mo/RpPW4yMUZKo0liuTBsW4EesBWXyAIuE1agFsp0gKu11zmDJwLZ2NSpvTkP82A/jOznkUVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=2SoFwFXFEVHNy6OW6HvsARlE1FPlSl0PxMIlt4SCfCA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lxsrocdHFk+ImuEcT/WSvVZ0UH2lAsWYaZPiZhN+0Bjb4HcI/Cq6lCsC63+uT+6uueMP45VnLSqu7/cuU7KXopqtejaP8TWOvlc7ufzagTer/qT0mFtvPFsyPay9jBv/BbbEMtACBNvtsRWdxlFRkp1sF5Xuqw1o/2D8VIruVJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndEA9Ioe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777857; x=1794313857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2SoFwFXFEVHNy6OW6HvsARlE1FPlSl0PxMIlt4SCfCA=;
  b=ndEA9IoeizVtev4KtY01zBosLqddKztWaSsKr+zNJSE9adkurLBqTXIw
   bqGHx26qfFQhLKrZxZtfSfCncmttc3LL1p2tL+pfl9rWHOGC01CpEiEZt
   Xe+2tZ3tFYP/CRkT8UVcw8P1m6HbU2NPKKekWaM7/03W22YHwHXeqTXtt
   WTSHVehKVaUimLrCCZHfe2zoj1Sudi7qFXajvPsTAG1xe+v8w56YeFk40
   vqinzw2W535myg4ZadGbbIDdZTd1bB00bVFVHB/Bu3gKF7voKi8sds7+z
   aHDSFZpfaf7lMvQC3hqMOTSfgUjceRUtFSXevm3qJAISABeOciVXzmzY0
   Q==;
X-CSE-ConnectionGUID: KoGi3HkfTa+Gfsg3Nm2CXw==
X-CSE-MsgGUID: ltE4a1XCQ0CzJIr4kqxSIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75931564"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="75931564"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:56 -0800
X-CSE-ConnectionGUID: QsEQaIh3TYy+9YjtVuS3QA==
X-CSE-MsgGUID: 0m6B2OGTR862SDqk+doQ2Q==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 04:30:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 948D79D; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 08/16] thunderbolt: Fix typos in retimer.c
Date: Mon, 10 Nov 2025 13:30:42 +0100
Message-ID: <20251110123050.3959188-9-mika.westerberg@linux.intel.com>
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

Fix typos in retimer.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/retimer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/retimer.c b/drivers/thunderbolt/retimer.c
index 3a0f486a24d5..13d64dbd2bc5 100644
--- a/drivers/thunderbolt/retimer.c
+++ b/drivers/thunderbolt/retimer.c
@@ -501,7 +501,7 @@ static struct tb_retimer *tb_port_find_retimer(struct tb_port *port, u8 index)
  * @add: If true also registers found retimers
  *
  * Brings the sideband into a state where retimers can be accessed.
- * Then Tries to enumerate on-board retimers connected to @port. Found
+ * Then tries to enumerate on-board retimers connected to @port. Found
  * retimers are registered as children of @port if @add is set.  Does
  * not scan for cable retimers for now.
  *
-- 
2.50.1


