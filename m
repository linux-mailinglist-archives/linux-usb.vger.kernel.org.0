Return-Path: <linux-usb+bounces-29759-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF69C13176
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 07:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AB5F61AA6AA0
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 06:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF6CD2BCF6C;
	Tue, 28 Oct 2025 06:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dby71CWn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7492D29E0ED
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 06:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632042; cv=none; b=Zh0n6Ba6jsCIfGmeRgl7AlKcilHw+m6NHIAnutSTTwijvhmlhQYMuXWqAyM0RSGA8czQFVhkoApuouqwlkK4d/Srfl+5iY3RYnteR/dAQK23tV/0R0EnlnjVo3FRuFlyZn/xrW+FOXc+lRmb3GkaEJEqmdWzaSNY+37reGR0kZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632042; c=relaxed/simple;
	bh=4+kN2GUDB98DWhvYZTSkQb7/wd8j3z4BmeQz8zd1JPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKfxItsnFakY522mxX8rmwJ020vTHSoDFFrEhXA1HZzzTYV0eIUY3bJTVUj1exrKe/uWfeS5vfP9HrjSN9ER5G6Px94pghhKRR0TMR6QJfySVrSmXHUnoXvuvLmvKWUl/e067MlAu3Va3ZlTz/f57HqbVDKHm4YU/ZFcAQrtA9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dby71CWn; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761632040; x=1793168040;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4+kN2GUDB98DWhvYZTSkQb7/wd8j3z4BmeQz8zd1JPQ=;
  b=Dby71CWnwdxJYBc9YWIEdNyAc1t64gLVzZkQSchGUzVunCFxJhxpp0Bp
   tIPN1Q6Mld+KJead0NCFFjBsDpojhd3PAu7a75u0r3FAgC/6Ya1Zad/3x
   nG0lZhVl3mGVDdpBNbijwEIJV460sIkrPqlVEBRmX5PCFOxntbLZVkvGx
   OHcBL1+f9YPiVDU/1UG13Qpt/bnrdS/Kc4WiMSP9Cw5L+3rtOsCk9khjX
   mb0cLdZRtOmAM5yhsQ4y2nYsaKK4Flkp7VM/YOIybb33MMzAZ+ohCDfTQ
   dZJqJWvnwMXpmY4n70A9Jg+CcGojQgYO3ETp3BfIU7xg/GesKfnmWZpW7
   g==;
X-CSE-ConnectionGUID: IZU1JyBjRg+B0Cxh4EWU/w==
X-CSE-MsgGUID: vV0TDrQAS3qF2uEAKsSGCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62754646"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="62754646"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 23:13:59 -0700
X-CSE-ConnectionGUID: ofo1Vn9/SSOZquzyrAr8jg==
X-CSE-MsgGUID: 229oufVXQNGKZpCPZQOxjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="222463431"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa001.jf.intel.com with ESMTP; 27 Oct 2025 23:13:58 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 1C4B197; Tue, 28 Oct 2025 07:13:57 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/2] thunderbolt: Update deprecated firmware update site in icm.c
Date: Tue, 28 Oct 2025 07:13:57 +0100
Message-ID: <20251028061357.2164810-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251028061357.2164810-1-mika.westerberg@linux.intel.com>
References: <20251028061357.2164810-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Update leftover reference to Thunderbolt firmware upgrade site
(thunderbolttechnology.net) with the preferred method described in
Documentation/admin-guide/thunderbolt.rst.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/icm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index f213d9174dc5..66092febb40d 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -2000,7 +2000,7 @@ static int icm_driver_ready(struct tb *tb)
 	if (icm->safe_mode) {
 		tb_info(tb, "Thunderbolt host controller is in safe mode.\n");
 		tb_info(tb, "You need to update NVM firmware of the controller before it can be used.\n");
-		tb_info(tb, "For latest updates check https://thunderbolttechnology.net/updates.\n");
+		tb_info(tb, "Use fwupd tool to apply update. Check Documentation/admin-guide/thunderbolt.rst for details.\n");
 		return 0;
 	}
 
-- 
2.50.1


