Return-Path: <linux-usb+bounces-12875-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9800945857
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 09:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 097CB1C2333C
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2024 07:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63CEF4595B;
	Fri,  2 Aug 2024 07:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cewIXPl2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4442D11CAB
	for <linux-usb@vger.kernel.org>; Fri,  2 Aug 2024 07:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722582348; cv=none; b=DKWXqJaVrL0dKaBbpBJ8cfJ4386d/t5ctWr+dKoa5bsXFVg2plNmcvhV9jcgI/fZhRieKST4u1M5lb9hmDvOf5elrpKMA2DfYTf270iB9SHdNg0qH0IA9WhwaJrDapmkOdwC3Bu7OhVuA1w3CqqmplGz5AknZoDvo2b/1Yr5Fmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722582348; c=relaxed/simple;
	bh=O6pdgXCH4wfRH3WVbE42GmFduehp8rSjYUirCTsnPIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZNx6CUqsbIdBnINEQhGPkLzfxNpA6y+/gPqCofIGRqZDiIZ4rRVZI8Xn0e0nmLwpw+CfJp2JN8y6M4hgypOhZYq7/ZiSDSGyZQRLX/Kf1VggWnMFzRjss7bYeq2PIRansUkFdcCdqbHsjowpFWouUdydzCi6lAabKdQVeQSeT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cewIXPl2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722582347; x=1754118347;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=O6pdgXCH4wfRH3WVbE42GmFduehp8rSjYUirCTsnPIc=;
  b=cewIXPl2WajvT/7ypYmjiDuzLuhQfDoA5lLz1i2lOwmZarBbnnIDwx5p
   d7AxNQmUGKqjb2UZ2T5cyXumd5eBAvoV2tpGsFA/78Cf42nk3KctPHT8o
   HYgqhuWC3afhEiEe8vFIP/xSTHMtWkoA3IyK29g++BBuWxIv7YA84lyA3
   wGDdZIZsOls1DATPpVS8TVUC4Ll4HbC50ViJkWEAc7IVCxmQ4bVwnO4rp
   cxW2l71gu37ek7ceJNHKXr2O+dq2kgdjOUaGMoTYzixOoDOll/Mt2PFtt
   UuZSn+1he370as9ly/U+hm8kydgMJX7MeDhwd/sbp5b6yS90nWrLM/FJC
   A==;
X-CSE-ConnectionGUID: gulwgiowTISebrtC9s13pg==
X-CSE-MsgGUID: okTQ+kyvQnuizzglkZfxXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="31733956"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="31733956"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 00:05:46 -0700
X-CSE-ConnectionGUID: AHuD0D7HSv28lsaDg8i32w==
X-CSE-MsgGUID: YMDSX2HfTAGu3YXubOTzsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; 
   d="scan'208";a="78567313"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 02 Aug 2024 00:05:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id CEEED1F2; Fri, 02 Aug 2024 10:05:43 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: linux-usb@vger.kernel.org,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: Mark XDomain as unplugged when router is removed
Date: Fri,  2 Aug 2024 10:05:43 +0300
Message-ID: <20240802070543.1338656-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I noticed that when we do discrete host router NVM upgrade and it gets
hot-removed from the PCIe side as a result of NVM firmware authentication,
if there is another host connected with enabled paths we hang in tearing
them down. This is due to fact that the Thunderbolt networking driver
also tries to cleanup the paths and ends up blocking in
tb_disconnect_xdomain_paths() waiting for the domain lock.

However, at this point we already cleaned the paths in tb_stop() so
there is really no need for tb_disconnect_xdomain_paths() to do that
anymore. Furthermore it already checks if the XDomain is unplugged and
bails out early so take advantage of that and mark the XDomain as
unplugged when we remove the parent router.

Cc: stable@vger.kernel.org
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 326433df5880..6a2116cbb06f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -3392,6 +3392,7 @@ void tb_switch_remove(struct tb_switch *sw)
 			tb_switch_remove(port->remote->sw);
 			port->remote = NULL;
 		} else if (port->xdomain) {
+			port->xdomain->is_unplugged = true;
 			tb_xdomain_remove(port->xdomain);
 			port->xdomain = NULL;
 		}
-- 
2.43.0


