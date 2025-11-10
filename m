Return-Path: <linux-usb+bounces-30278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F83C469B8
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40AD01885326
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEB5130DEB1;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdBTAHJV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D020930EF62
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777858; cv=none; b=U++3mnMhrpMSvx+TGGyRV6xEDa/4GROx79Z5kUdFoWRT9CgpurlE/lOhSboXskMjhhFecQ7XPS7LTRAqJ7JjVJ1q9I6BE3jFBAMx1k4YFpmh5OnG2uCOed5r5KWuTPMAI1i4sMzCtaG1efjvPihE+KGdnFOBlbQMLRgPBoClY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777858; c=relaxed/simple;
	bh=5VdJoBbtP8M6wTaLU1taU/tSWbSIyGR9Odal450Jquo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ugoBpqh8F2nI/zGYdswkCGn3oV6ACEZH8Uw55YaBoxHNwL2sly8u4+eB/PJgHx3XMLzcTujhWbcjjD8Bq6c+mlYpOxuABJ9iroYJ8pP9mD/ZKv9xjAGGrrCdFt59utArREvzTZ8eQoEteMSJ2L/wRtFfjKfIvdJTpPr3F2sH8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdBTAHJV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777857; x=1794313857;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5VdJoBbtP8M6wTaLU1taU/tSWbSIyGR9Odal450Jquo=;
  b=WdBTAHJV2HI8w9yGiAPjZy9l5qgf7FInNCnbKmIO0XRxLPrU8EtUNKRa
   0M3FwGRzClnnfVfYreKy/K3n9TFelO1IISDBuIEaPxe3sLvJ/o6eBB9uh
   ar2Atla858S+K3ButLL76G9APLj3LZFKCL3e91XiVN3R4LMTkdvN+8q+K
   B4aCorwcLI8NktMi7i7vAFCs0hVwQEskp8TxAOXM7g/HiIGmIoRsHcHBg
   e+XUo8ry7S1yQej0xj1LI9ppVE+CLnQvMKPYfYM52cNmR8ZMin5H6loUv
   xfbFbLrBRc1EoRXuaawdVmrkXerC/fosx/SDcDvtNt01Mozrclsyk7YrH
   A==;
X-CSE-ConnectionGUID: V9BRhyyQRsWf+99GL4d5DA==
X-CSE-MsgGUID: gXK65c+KRHWe1k/VIP4OdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64866250"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64866250"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:56 -0800
X-CSE-ConnectionGUID: AfVP4xoeRVqI6JZ1GfMh+w==
X-CSE-MsgGUID: B1DKLmR4RcqgEN858HAUfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192922125"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 10 Nov 2025 04:30:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8E2329B; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/16] thunderbolt: Fix typos in lc.c
Date: Mon, 10 Nov 2025 13:30:40 +0100
Message-ID: <20251110123050.3959188-7-mika.westerberg@linux.intel.com>
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

Fix typos in lc.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/lc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/lc.c b/drivers/thunderbolt/lc.c
index 0891d51ac2e9..4449c28cc5f1 100644
--- a/drivers/thunderbolt/lc.c
+++ b/drivers/thunderbolt/lc.c
@@ -558,7 +558,7 @@ static int tb_lc_dp_sink_available(struct tb_switch *sw, int sink)
 		return ret;
 
 	/*
-	 * Sink is available for CM/SW to use if the allocation valie is
+	 * Sink is available for CM/SW to use if the allocation value is
 	 * either 0 or 1.
 	 */
 	if (!sink) {
-- 
2.50.1


