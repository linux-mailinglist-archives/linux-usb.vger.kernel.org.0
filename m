Return-Path: <linux-usb+bounces-30267-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D48AC469C0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:32:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE8A93B9871
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C7C30F537;
	Mon, 10 Nov 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nezUgiFG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A9730CD99
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777856; cv=none; b=jBRWjdRoa7y97nlHNu7vG6pOkLfG5rSBlk/SKb+cUuruZpekqBVJp91bdNNS2zNuoeHYTJ+ihxGkiWoHHeQ4smCbNWsd75tcyUEa/Nf5WQrg9fB7qZqJSNjWUGZjnyd4vSFKnd0KE7SEIXntyUs/RK5JPcDH9fNFNf40F6YDwOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777856; c=relaxed/simple;
	bh=vgV+bTiFu7ysgqi1bny/g91o7R8KKgVnkvVxnLzbBSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W5rZ9RmV5z1jOQIQx3wktPKkn5mFSCgBM2PcHSG2ZEzMobfulvHK1HKH9L3CaNhv1NGiSBy6+nAfrnhhjtHyy1RD8WdDq5mvOEz2rI6yTmcVb0UvTNOOHtjObTpxYCP8iz3hlg+v9Ek2j2RlCqfy+bJQd1YiI+nA6zugEdjqiBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nezUgiFG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vgV+bTiFu7ysgqi1bny/g91o7R8KKgVnkvVxnLzbBSA=;
  b=nezUgiFGgihBk8KBwbfV01XEZ9P2eEENtLoMLbSNpYx0JZltTyDD4i8J
   RrfKOciUIXapViCs64k84cUkp4CB9AVfCNpm7eZ4WHwRe84Pk6TxLJaOh
   lRmMxC21RQTqb8ATMR4kpffAfxOkcm1bgwdaXab6sO1eu97fwZ8baDNGz
   nTJbpI+12EbAywMElNBiDAmNXQjvAwrt/Mu5C6KGe1AwAqjnuBkb1Yt+y
   cTpb3wbyIFWwjjtu3+E/GiNMdFs2R1HsJlTzt2hKlV75CIrAiRgs4tBii
   i+/ORalS4sd9NbxJIiHSy6ER+es8xQdESCX6AMd/pcvF5Rzk1eGNcfF1f
   Q==;
X-CSE-ConnectionGUID: Q3Mxu5qITMm0623bJ5y8CA==
X-CSE-MsgGUID: Wvoc4y1WS1eKSwcLtPLQ3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64866249"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="64866249"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:54 -0800
X-CSE-ConnectionGUID: 2q9i+L+bR0uSZ4chG4c5SQ==
X-CSE-MsgGUID: 5zBjdXefT+uOkYprgGjMBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="219317011"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 04:30:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8405398; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 03/16] thunderbolt: Fix typos in domain.c
Date: Mon, 10 Nov 2025 13:30:37 +0100
Message-ID: <20251110123050.3959188-4-mika.westerberg@linux.intel.com>
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

Fix typos in domain.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 83defc915d33..3ced37b4a869 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -376,7 +376,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
 	struct tb *tb;
 
 	/*
-	 * Make sure the structure sizes map with that the hardware
+	 * Make sure the structure sizes map with what the hardware
 	 * expects because bit-fields are being used.
 	 */
 	BUILD_BUG_ON(sizeof(struct tb_regs_switch_header) != 5 * 4);
-- 
2.50.1


