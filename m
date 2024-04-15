Return-Path: <linux-usb+bounces-9339-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 714A08A4898
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 09:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3CC2B20E8B
	for <lists+linux-usb@lfdr.de>; Mon, 15 Apr 2024 07:01:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3C4200D5;
	Mon, 15 Apr 2024 07:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCbGns58"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C851EB3F
	for <linux-usb@vger.kernel.org>; Mon, 15 Apr 2024 07:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713164474; cv=none; b=jiBhnNt/g5Ptx6vRc6OXmNYmMSplIXDDxZ0wMokIoVvol11gxDjdWDVMNfol4O/94l0FYDEuewRgvE65/JK1EiCY7ggAuSkUnxLMzqij27424N+5jTmIQsCwk1Nq+WobEk0a0BQFgRSK1VNG5u251L1zufquDp2uOv1R7chHZGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713164474; c=relaxed/simple;
	bh=1U0YO8zmP7PLQV6nQPknNbcoWWjJ8Zy45Zrw/qeSiMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AezPZMCr5NfC4AWViI9XHWHyrR4r44FUJ6UrXuZs2Z03h7TmV6pB8WbwjwEScZVMfTqqKJ0bwyTQVh2YOOk/C9Pyk65CNFOu0V21G/29OM326NMhNH12/9FwXY3ugt6tHnOYcobkMt0iAOrEH2csJopt1gdHj9/qY9M8Gq0kItw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SCbGns58; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713164469; x=1744700469;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1U0YO8zmP7PLQV6nQPknNbcoWWjJ8Zy45Zrw/qeSiMA=;
  b=SCbGns581uApYEM7Kk9Tvstx6xT/dgOB9RGmOxA6HA1PqkctsPQ0xnhR
   inYZyfDpnjkJz4JKnEKZeFMl6Sl7T46hnPpOeh2T4vXRBYCwlhxlbU2SP
   66zhhsFlm79DOyAjfXvbM3TqrxUJBEEC390LoNKGvm+gqY/9YAd7tk50y
   ejiTpltjicnZlN6VFWoEGX3cusCTn6WzPZxMXGuyH8IEig3mgDpkB5lWU
   w0hGlRj5sbyYJAzYgFDH1SXT2O/zAgS9nVzzxXqjboNn2jHn5tR7lVFlr
   xcV5hqxqsnQnCTD5mPyAl3rpNZ6yZUzwoZ0u4zznCwi0x9uv1oRS1Micq
   Q==;
X-CSE-ConnectionGUID: CUMmKWbsSo+PpePJeSpHjA==
X-CSE-MsgGUID: jwRWevLMSASSb1L/YR+Kbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="12315437"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="12315437"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2024 00:01:09 -0700
X-CSE-ConnectionGUID: ILkFj9QwQ0eH6lK0Wh6nfg==
X-CSE-MsgGUID: 3MNudDNSTWyvPRvkjkrFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="21911523"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 15 Apr 2024 00:01:07 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 77ADD21A; Mon, 15 Apr 2024 10:01:06 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Get rid of TB_CFG_PKG_PREPARE_TO_SLEEP
Date: Mon, 15 Apr 2024 10:01:06 +0300
Message-ID: <20240415070106.577176-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is not used anywhere in the driver so remove it. No functional
changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb_msgs.h | 6 ------
 include/linux/thunderbolt.h   | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/thunderbolt/tb_msgs.h b/drivers/thunderbolt/tb_msgs.h
index cd750e4b3440..a1670a96cbdc 100644
--- a/drivers/thunderbolt/tb_msgs.h
+++ b/drivers/thunderbolt/tb_msgs.h
@@ -98,12 +98,6 @@ struct cfg_reset_pkg {
 	struct tb_cfg_header header;
 } __packed;
 
-/* TB_CFG_PKG_PREPARE_TO_SLEEP */
-struct cfg_pts_pkg {
-	struct tb_cfg_header header;
-	u32 data;
-} __packed;
-
 /* ICM messages */
 
 enum icm_pkg_code {
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 4338ea9ac4fd..7d902d8c054b 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -33,7 +33,6 @@ enum tb_cfg_pkg_type {
 	TB_CFG_PKG_ICM_EVENT = 10,
 	TB_CFG_PKG_ICM_CMD = 11,
 	TB_CFG_PKG_ICM_RESP = 12,
-	TB_CFG_PKG_PREPARE_TO_SLEEP = 13,
 };
 
 /**
-- 
2.43.0


