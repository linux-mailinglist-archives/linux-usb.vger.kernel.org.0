Return-Path: <linux-usb+bounces-18565-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC24B9F45F2
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E2B516299F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:22:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53B31DD88E;
	Tue, 17 Dec 2024 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EySr4Zw0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132A1DBB24
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423750; cv=none; b=DUUJ2HlDWGIMGBDV1nExgdvFpGWhdEw/1LaVhvGgU1C8uqjUxvZU5o+w5uuIZwBhd7ioyakn10T4oQ/snP1SoUTiBCKCSatael/pu18d4Lt2XLLsTkQsqDyMLZ+ccWtSopKMQ1yWMcDLe/lBFWm4rBmt532P2eAp4HWxxHlsaSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423750; c=relaxed/simple;
	bh=L71qdzPBIxHeeF9NnhXTAoGkbxyD6X5/SFu56xfZxzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h/MsvkEnIlb0/iVwT2v3U0K5PjwX2XD70R8xnQkJhJn1UKXXifdO453mYd2NMvv51zSRSJC57u8m7YHTaIkS6sLYrk+lzVHcjTDjbuSGLSjIwN2ERKC+saZP7b/pXhYJNno5JWrhEcijyAKwGF9rDub0UsuX+C9PH45C7YuLG/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EySr4Zw0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423749; x=1765959749;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=L71qdzPBIxHeeF9NnhXTAoGkbxyD6X5/SFu56xfZxzM=;
  b=EySr4Zw0mImefWk6oUOB/efv+OuDePF5V7GvfeXJbxudnkSZXt+OswM8
   kYB87U2EHFRjor/GepKpvBuxF5cNAKjm0iL1g6auOUvehkXuR7I4RX9b1
   LnXuNMOmL7OyXpxa5KIJgFNAUWIGYayNJsfIYvWDT3nQh7kKm781nU6cO
   js5UCkejbVuwUDssMd06v/70RZqWTks6FWuvcoZTOIK1VpJzqxDMGM+tV
   wNB9jlAA/4MBi5B/KcYzavSCSNdx6z5ihl3JCtgkUio7A6RgCddU9s5ei
   HWD1XHvSPMp/O7TCKat0liO7HV7m1jO9O/kH64YC1unlccT/LvdbelP5T
   Q==;
X-CSE-ConnectionGUID: ZLbGkPy4Q/mQvLqKumB0xQ==
X-CSE-MsgGUID: 8KLIjCauRrqANW8xDURscg==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38511450"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38511450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:28 -0800
X-CSE-ConnectionGUID: IY56RhhoSDmKjCAIv9dbSA==
X-CSE-MsgGUID: Q+M3hvTwQ/6Id8X7DpEwDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102063247"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 00:22:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 24D9740B; Tue, 17 Dec 2024 10:22:23 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 06/12] thunderbolt: Show path name in debug log when path is deactivated
Date: Tue, 17 Dec 2024 10:22:16 +0200
Message-ID: <20241217082222.528602-7-mika.westerberg@linux.intel.com>
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

Similarly as we do when activating the path. Helps in debugging.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index f760e54cd9bd..e1a5f6e3d0b6 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -581,10 +581,10 @@ int tb_path_activate(struct tb_path *path)
 		}
 	}
 	path->activated = true;
-	tb_dbg(path->tb, "path activation complete\n");
+	tb_dbg(path->tb, "%s path activation complete\n", path->name);
 	return 0;
 err:
-	tb_WARN(path->tb, "path activation failed\n");
+	tb_WARN(path->tb, "%s path activation failed\n", path->name);
 	return res;
 }
 
-- 
2.45.2


