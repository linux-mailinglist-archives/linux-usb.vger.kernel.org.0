Return-Path: <linux-usb+bounces-30268-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C86C4699D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:31:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CF671884E2E
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B78930F7E8;
	Mon, 10 Nov 2025 12:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBn26qMp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDAD309EFC
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=a6L6zCAdT2e1m8EsD4rOGbzuSzte+ekllcrQy0QW4yuIsYm26A7+jGcjgsZe8/qvslaxYHMLWt0c2iR5BYUfWEtDBTXxD8TWbDMrJhTwygKGLuqkt2DdpelnwQXK+gSjaja3Hp9VNT21JXYD6p9BKHdseE3Tw9RT5Xohhinl6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=zP3SRa42I6xlxoEn5G2bRXc2OuF/hgT+4t3nKBj1D+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EWSnHJUwJUAJG52ThP5m9jo9nFeGafhv7n8INS+o8YzHQuyC/jmdSrh3hwvFyCtMNNOOkYtcgjXgcA2qeJJc+qF10KQUNi0H20zB0oQ2lpWpLXLQQzRCWmsAR8+cpthHhGqhA/h/xsVw4RtkbBakkSl8npkgZ1jBTJouaH5tGmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZBn26qMp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777854; x=1794313854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zP3SRa42I6xlxoEn5G2bRXc2OuF/hgT+4t3nKBj1D+Y=;
  b=ZBn26qMpMN+nO5HF4BGDTr+u1vS4CeOScG18bhrfMBsY/8oLcZ1W4rYs
   Qhu+9J6F1kIKipQfpv8sVHdxuM1TJItBAGDF3OjByC9EW9kFwA1CozqVX
   hNDe0H8ZXcAImJvFbrX0jm+gknbu24LTfzYyWTDCTvHz4IwMbvShtY9JL
   ZZn+gaoXYulkjaIU6uPm4BmAQXWaSZbYNd/QLUMDGiaJGJ4X7uf2hyBzS
   B/n/7jC2NM8l4gOMGHg2cUpjHg/uW8koy4dVwvzCmMMPpnr+dCxOKrFWc
   ufgf0QATmDSYSDPTEyOfOqQzm4uSPxyh2LNmegV915LRx/3a3RAlgZmMj
   w==;
X-CSE-ConnectionGUID: dAnxBtrMQ5ewc9oxZVUfsA==
X-CSE-MsgGUID: rzA3VwpfRP6yn3eSZ2XFwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="87456952"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="87456952"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:53 -0800
X-CSE-ConnectionGUID: rTyaEipUTZ+9cuMyBChZQw==
X-CSE-MsgGUID: Sc0m1qMbQXK9fgUFi+0pNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="193044965"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2025 04:30:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 80BC497; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/16] thunderbolt: Fix typos in debugfs.c
Date: Mon, 10 Nov 2025 13:30:36 +0100
Message-ID: <20251110123050.3959188-3-mika.westerberg@linux.intel.com>
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

Fix typos in debugfs.c. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index 46a2a3550be7..45266ec72f88 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -201,7 +201,7 @@ static bool parse_line(char **line, u32 *offs, u32 *val, int short_fmt_len,
 #if IS_ENABLED(CONFIG_USB4_DEBUGFS_WRITE)
 /*
  * Path registers need to be written in double word pairs and they both must be
- * read before written. This writes one double word in patch config space
+ * read before written. This writes one double word in path config space
  * following the spec flow.
  */
 static int path_write_one(struct tb_port *port, u32 val, u32 offset)
@@ -1196,7 +1196,7 @@ static int validate_margining(struct tb_margining *margining)
 {
 	/*
 	 * For running on RX2 the link must be asymmetric with 3
-	 * receivers. Because this is can change dynamically, check it
+	 * receivers. Because this can change dynamically, check it
 	 * here before we start the margining and report back error if
 	 * expectations are not met.
 	 */
-- 
2.50.1


