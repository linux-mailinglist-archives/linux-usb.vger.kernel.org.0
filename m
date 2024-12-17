Return-Path: <linux-usb+bounces-18560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FE9F45EE
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 238A4188F69E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533281DB37F;
	Tue, 17 Dec 2024 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bf3hXQiQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4F01CF2A2
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423747; cv=none; b=WpT1ky8DUsJ2vJjykS/2pd3pnYoSKAL/Y0NOvtR6AmCCwLJtlQRNhKYNJklUxMYfo2c3pmVLVwEZkrTXd6dFD1mWG3JwEet3DzoRMbkRTsI23HE+zBfDOMQ9Zbts0U1PTgRqPVxGaYuIKAwYgVDfC9/pt+xgq15urtKJu0icrH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423747; c=relaxed/simple;
	bh=tSeYYk8Dl6uqq7IrWAQI2z3d1xDJrdfjAAuT2X1jt3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtNTIiB7bVl+kx3U3IObEus+ifHSmQMSJiQ8sqGnckPAab9tI/tQrhV+fCa70PuRdJMZj0H6BdsH0za5DScZkixgEr2e7R98ECk4EyvvEv2MGX4WLnunt+aLFWgVY6tzQYcC8GT0o2N9bqkXwkqtysCMzU76+5cDagTFGhteUFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bf3hXQiQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423746; x=1765959746;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tSeYYk8Dl6uqq7IrWAQI2z3d1xDJrdfjAAuT2X1jt3E=;
  b=bf3hXQiQH9SsW29YeQX93EEawAFymnLJ2senQE8rPDXvUQgCzFKAXJbQ
   bcPy5Hyyq7CPIau9bBeDNYUCfnjjJc71PGK7b6FT6ZeJbyZggcPPomMMa
   D9LGTCVQAahY6omG3mkYbxadtKY9jP+uFB7wgocy9bwan56hUoX/2aLcb
   /DFNenoh7ODQfvmaWeEVhCRCAiGWCNsVghiIaCKI2CsXptKbpbdrLfLho
   YDoMShgWqnmJlEjY6ThVidwhDotTZXnvSs0fJfOEg+8KPNFARNJ2JY/ww
   skXKzdQz5c4N8v6Qx9GO1zlYJVFmjqexYYmzqom0s3sHwQBR1eVXVqesy
   Q==;
X-CSE-ConnectionGUID: 3zEQA3P0TBKbineMoUJgog==
X-CSE-MsgGUID: dBkCn8C/QOan7QxID/i0ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34992565"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34992565"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:25 -0800
X-CSE-ConnectionGUID: b9auWSt+RQ68mzSuYOitAw==
X-CSE-MsgGUID: XtBon4oAQZqWDAT0F42o1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="98037623"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 00:22:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E9CA2A1; Tue, 17 Dec 2024 10:22:22 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 02/12] thunderbolt: Log config space when invalid config space reply is received
Date: Tue, 17 Dec 2024 10:22:12 +0200
Message-ID: <20241217082222.528602-3-mika.westerberg@linux.intel.com>
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

For debugging purposes helps to see the config space that was being
accessed.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index 4bdb2d45e0bf..fd40cda1e53f 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -265,7 +265,7 @@ static struct tb_cfg_result parse_header(const struct ctl_pkg *pkg, u32 len,
 	return res;
 }
 
-static void tb_cfg_print_error(struct tb_ctl *ctl,
+static void tb_cfg_print_error(struct tb_ctl *ctl, enum tb_cfg_space space,
 			       const struct tb_cfg_result *res)
 {
 	WARN_ON(res->err != 1);
@@ -279,8 +279,8 @@ static void tb_cfg_print_error(struct tb_ctl *ctl,
 		 * Invalid cfg_space/offset/length combination in
 		 * cfg_read/cfg_write.
 		 */
-		tb_ctl_dbg(ctl, "%llx:%x: invalid config space or offset\n",
-			   res->response_route, res->response_port);
+		tb_ctl_dbg(ctl, "%llx:%x: invalid config space (%u) or offset\n",
+			   res->response_route, res->response_port, space);
 		return;
 	case TB_CFG_ERROR_NO_SUCH_PORT:
 		/*
@@ -1072,7 +1072,7 @@ static int tb_cfg_get_error(struct tb_ctl *ctl, enum tb_cfg_space space,
 	    res->tb_error == TB_CFG_ERROR_INVALID_CONFIG_SPACE)
 		return -ENODEV;
 
-	tb_cfg_print_error(ctl, res);
+	tb_cfg_print_error(ctl, space, res);
 
 	if (res->tb_error == TB_CFG_ERROR_LOCK)
 		return -EACCES;
-- 
2.45.2


