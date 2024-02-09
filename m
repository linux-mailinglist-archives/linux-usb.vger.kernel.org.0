Return-Path: <linux-usb+bounces-6158-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB36F84F6F1
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 15:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2091AB223AC
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 14:16:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07DB6A34B;
	Fri,  9 Feb 2024 14:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XKMtOzAd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40876A028
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 14:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707488024; cv=none; b=PykJx11LAHYWOAvQvdz7KaR6VBym1WEgAtFx/fOOQXhYJ54Rr71mHESDSNdOXH+OlWJzQlI3B2C05oG1A7PaNbD5uwibel//MEUHKET0PiR63iu1yAwaLnamW2q9zkbLa0PdnxijtygCZ37IBAW0y/wjFuKcwUdfqAHxKBs46pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707488024; c=relaxed/simple;
	bh=PnSnht9xoe4T3QB+wyWMImh36XwALruKaprJfIWXFYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhvTxwboPCc00Y45Z6cz2u3/5t/mZmceubbJaF7ONTQNyHnnbhECAZakYY0VKqVGBtc2bW4xlmNoYJHKwrBnjoHzoL4Sx17o6qLESqKdWPed7VjR/7GW6+ZPsoWZlEnB3g4bSOMlftVz39+1b8Y5g+ebhu1yku1X0JdOLvLwVLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XKMtOzAd; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707488022; x=1739024022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PnSnht9xoe4T3QB+wyWMImh36XwALruKaprJfIWXFYY=;
  b=XKMtOzAdpduU9kMQuha5Xf312CFBwg1Q6qoFYtX9YS49B+YloZ45hPeP
   SsgwRiZDES5PYA0IK93OmfYoYcOQLEBR5QzTlMIT9iafTNl+gbtIID/gP
   8nHwhQsvcB1MneA/tjz0C1h3mVOUyPJbteE+CXBgPIjHxT7LrA5swdcsB
   4qPqcQuIRVyeNsHlLYPcSGTEu9Olqnp5adMvns4VyoleGIYWXqDZwBqJY
   qezgDUm37aD76KQy6VfeY/d9+7mtpWG16WCf3Xv3lwGffba1cmMOdl+Hn
   Ab6ZWKvdf+gkBUeF5zV33DBIE/yfss489rLnhcHklXhBmaAcTZzEed7CK
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12082118"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="12082118"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 06:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="934434415"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934434415"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 09 Feb 2024 06:13:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id CB59F333; Fri,  9 Feb 2024 16:13:35 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 04/10] thunderbolt: Log an error if DPTX request is not cleared
Date: Fri,  9 Feb 2024 16:13:29 +0200
Message-ID: <20240209141335.2286786-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
References: <20240209141335.2286786-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This helps debugging issues around DisplayPort bandwidth allocation
mode.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 4b35898aa216..f4fba144105d 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -2858,8 +2858,10 @@ static int usb4_dp_port_wait_and_clear_cm_ack(struct tb_port *port,
 		usleep_range(50, 100);
 	} while (ktime_before(ktime_get(), end));
 
-	if (val & ADP_DP_CS_8_DR)
+	if (val & ADP_DP_CS_8_DR) {
+		tb_port_warn(port, "timeout waiting for DPTX request to clear\n");
 		return -ETIMEDOUT;
+	}
 
 	ret = tb_port_read(port, &val, TB_CFG_PORT,
 			   port->cap_adap + ADP_DP_CS_2, 1);
-- 
2.43.0


