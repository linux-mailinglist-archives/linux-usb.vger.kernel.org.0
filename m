Return-Path: <linux-usb+bounces-18562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F01D9F45F0
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:22:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B7347A2F2C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBC91DCB3F;
	Tue, 17 Dec 2024 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b6ZS3EWI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5DF1DAC95
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423749; cv=none; b=tBMmcpiAQ3gi3DCv4SsUed6W4NmJEjrAP6vGDTkyqX0c6ABKsma/K7EiPGWYMq8OX5SXIzANbTK5lYk6HWo4UkGua5j3ZnySJ9r6dQXU2BQ2hrewSiqtAh2dQBX8cJGdMA+wXJ463p6xeD6NgC6J+at1TP1DjPrnxM022EGSrc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423749; c=relaxed/simple;
	bh=rm+XfwCDb1w4MEyXlwYaAx7AGaBaxxUlyDBzqRIYnfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WwBd9gFtHq9Cz4J9cv3CV168TRBJPfTJkZMD2WcVkjKq7+7na/GbO1lllE+WOSDtZcQTId3XNVxt3xV3YhzuB1g5ameYccmFmV+q2WpB+pgYWXxD3iB9W1wSA/nyzMWqG4sQQhuUOzayM9j7rBH/zofohyAfvd3812iIZEMA0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b6ZS3EWI; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423748; x=1765959748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rm+XfwCDb1w4MEyXlwYaAx7AGaBaxxUlyDBzqRIYnfA=;
  b=b6ZS3EWIeEpTjdmdvp00/aMth+KjZ36hfrIdSXqaMEfbtgTfIzM4T9PI
   fiy1Uvw4NMUzlLx4CRKT4duXx1PGjVQB82WfuponMyjl+AcftMY+mSWUx
   9GaKx8imurPT8dipZuTSqPRRILQKqNFFWnYlavikulfCAt0CCDO0GvEiK
   GOkRTua9RgAZQ12PbRmWgtfGRP+nm6ySlg4aqsKhyO5QUF7YHffsEKD6E
   ITl8mlPqMGXaA1jj0ZCvrwD/Csbhl7pn0avBQ2IlLH+GxDZ4u0eBijJcM
   h5+yzZA4s7xLEaOi0baVxnL+ZvKRWZnlRKNwQAmmhscCkame8l1BqOa76
   g==;
X-CSE-ConnectionGUID: ixLAekflSy6+zPrfkn0T6w==
X-CSE-MsgGUID: MIe5Q4f/QcWGt+L6eZtK5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38511438"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38511438"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:26 -0800
X-CSE-ConnectionGUID: sWRdy1z4QASGtm2zGTkyeg==
X-CSE-MsgGUID: YwiAPW0iT1qx6MYT2/Mt9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102063226"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 00:22:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0DF7C3B7; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/12] thunderbolt: Increase DPRX capabilities read timeout
Date: Tue, 17 Dec 2024 10:22:14 +0200
Message-ID: <20241217082222.528602-5-mika.westerberg@linux.intel.com>
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

Some graphics drivers such as i915 support runtime power management and
if there is nothing connected at the moment they will runtime suspend to
save power. At least i915 is polling for new connections every 10
seconds if the hardware does support sending PME. To allow i915 and
other graphics from detect the just established DisplayPort tunnel allow
the DPRX capabilities read to take up to 12 seconds.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 41cf6378ad25..f9e75c221fef 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -1186,9 +1186,12 @@ static int tb_dp_consumed_bandwidth(struct tb_tunnel *tunnel, int *consumed_up,
 		 * return that bandwidth (it may be smaller than the
 		 * reduced one). According to VESA spec, the DPRX
 		 * negotiation shall compete in 5 seconds after tunnel
-		 * established. We give it 100ms extra just in case.
+		 * established. Since at least i915 can runtime suspend
+		 * if there is nothing connected, and that it polls any
+		 * new connections every 10 seconds, we use 12 seconds
+		 * here.
 		 */
-		ret = tb_dp_wait_dprx(tunnel, 5100);
+		ret = tb_dp_wait_dprx(tunnel, 12000);
 		if (ret)
 			return ret;
 		ret = tb_dp_read_cap(tunnel, DP_COMMON_CAP, &rate, &lanes);
-- 
2.45.2


