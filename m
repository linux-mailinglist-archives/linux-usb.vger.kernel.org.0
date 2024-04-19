Return-Path: <linux-usb+bounces-9479-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 541928AAD17
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 12:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 102292828D6
	for <lists+linux-usb@lfdr.de>; Fri, 19 Apr 2024 10:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5B780020;
	Fri, 19 Apr 2024 10:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AO7j/KNH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197087C08E
	for <linux-usb@vger.kernel.org>; Fri, 19 Apr 2024 10:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713523908; cv=none; b=N7liZ/5HTk9AmbywiHTnpvbkg4bMETxab4hQbxthaNKDicXvugdjjDq1j75vnwOTeVySeTC8vd8KTcrQcZUEqwoLsP3SYcm9QfZC93QFQzzZgeS+x+7GlFBewPj7m+m21euEmic1RHb2jAV3OZYlQPaRtUTIb60FLczLiZKKYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713523908; c=relaxed/simple;
	bh=dFyHypi3fCWbOOiffrcxHv6Z9PTGTzZ5d913NFU0WKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJLvYmedxE6kMoRrjGNCDvtxKZtqFQ8ZngAkSI6GiOiR6JFNVdXiTs3PDpPBpBO2GVBjxQf7I7D7f+KXVmokyOWEwaqRV2ERYHwMLKLtHIj9c55iPpshiky4q24KwOvCx8mFL3K3T1DFbPQ0VB2t/njBRAaQVvW79FizXjph82s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AO7j/KNH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713523908; x=1745059908;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dFyHypi3fCWbOOiffrcxHv6Z9PTGTzZ5d913NFU0WKc=;
  b=AO7j/KNHUP1fxBiyHVK5obsM0gwZwxYxVJgNC1mW6Gq2OAw6Oq0f/qa1
   2GRNvCOlR2IDwMYJuZGW+H0Hv2rCPAi4nLH4x3+dzVojdxR367+aVub2r
   4gXrlkxmSQ/8jnTIA7qBN5H1A9GL2rtEs8opY5Lnrc0eG04dhCUIm6ekX
   9aNvaQXdLg4l0YmcWTZkjDcWiwEG6kIgYFYzkYnnGmcho9foMzt2iJSHI
   EwUDvxnqBPSY9UoBgrqy2VkOhD7agvfcc+q3CHHF6WOu+es7DUPtrQlBq
   mx/v08P6pU51d8VZyUhp4EyvMtM8IYEfxkTK2hTb+KL+0tEi+HpV1yZ0F
   Q==;
X-CSE-ConnectionGUID: dMGHN+sSSDqC+i7gGeMY1A==
X-CSE-MsgGUID: 9T6vq84yRuyXuPnPLuGpBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="20260384"
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="20260384"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 03:51:47 -0700
X-CSE-ConnectionGUID: uDc2fWqXSzGB5iO9j0mOGA==
X-CSE-MsgGUID: INH6Zfa2QleMQ+MfVlgmUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,213,1708416000"; 
   d="scan'208";a="23324875"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa009.fm.intel.com with ESMTP; 19 Apr 2024 03:51:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 57AEC18F; Fri, 19 Apr 2024 13:51:43 +0300 (EEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Rajaram Regupathy <rajaram.regupathy@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] thunderbolt: There are only 5 basic router registers in pre-USB4 routers
Date: Fri, 19 Apr 2024 13:51:43 +0300
Message-ID: <20240419105143.3777873-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel pre-USB4 routers only have ROUTER_CS_0 up to ROUTER_CS_4 and it
immediately follows the TMU router registers. Correct this accordingly.

Reported-by: Rajaram Regupathy <rajaram.regupathy@intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/debugfs.c b/drivers/thunderbolt/debugfs.c
index e324cd899719..193e9dfc983b 100644
--- a/drivers/thunderbolt/debugfs.c
+++ b/drivers/thunderbolt/debugfs.c
@@ -1346,7 +1346,7 @@ static int switch_basic_regs_show(struct tb_switch *sw, struct seq_file *s)
 	if (tb_switch_is_usb4(sw))
 		dwords = ARRAY_SIZE(data);
 	else
-		dwords = 7;
+		dwords = 5;
 
 	ret = tb_sw_read(sw, data, TB_CFG_SWITCH, 0, dwords);
 	if (ret)
-- 
2.43.0


