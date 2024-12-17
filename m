Return-Path: <linux-usb+bounces-18561-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9ACA9F45EF
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 09:22:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B1A516253E
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 08:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D6541DC04A;
	Tue, 17 Dec 2024 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWWDfQ0l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983DA1D63C4
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734423749; cv=none; b=ZA3VGu7aFqOgE7OKs3zHuY8aVNJp8Xgry2PYViGdLOQuInc5rjjiZIyynpZg2fPY4mrvm49czcrlSss/17Z4XL3SXmXVM4nalN3qZ+VUFBfl8EB88kUhLHk9DdNYRPbixiWFW7/Tngr2pb3kFYCfwiPHVtoSSh7Xu0QKXporhv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734423749; c=relaxed/simple;
	bh=FafJbNr5gNji0JWMn3wCkxlMVr3ikCRi8cfU0fIuhVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=po1kLkmsEXaBCTyer4vn46RIyx7miVtRN10VpmlRrWVfZn+J/PWcY/Ib2Ri4Jtnt0bgpCqIl/6Goapp98n7DUvdmpED/iHg7P//aq0C1vF6rSj2vaAmm7dDVCmrG5ky3OWK1KrG77nVXyaGGa4BF1WXT5lbhDWCRqscym3wGIZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWWDfQ0l; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734423748; x=1765959748;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FafJbNr5gNji0JWMn3wCkxlMVr3ikCRi8cfU0fIuhVU=;
  b=GWWDfQ0lUGpIgG89dQxnJ/S+GWef3BM9HuPURAprdMawSy+uU4Tc38Ey
   GssDAmn3rpapEiVd6aWctsy22DKh4cVir4GHwZVvdIAxkhLMTMilTCovn
   HMhjCOAUdaktpEp2+D2LywFRg5GdCDlmlUgMOtvO/Tf57aFoWRQ3/ynZT
   nFXpSn/zhRfxstiTpJyoXCxojypLN8N49sckSN7Vz6VTzbMa+o5cSs7hP
   u03IbxM6H3six73DRSok7EkRpMnoVbAzWesmrQsDoRVHNEIyg9lr4zNPL
   9lwhX9V+iDte1zTZZ/KvqdnOulQgJgR3Nrev0e6evaFPGpu1/ywVhpQ4C
   A==;
X-CSE-ConnectionGUID: d1tlKY3DSxCSrK8wARdbWg==
X-CSE-MsgGUID: v5T9msWfSqiaZXIGCay/QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38511434"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="38511434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 00:22:26 -0800
X-CSE-ConnectionGUID: 5n4JeqK+TJykR/8I2P6jIQ==
X-CSE-MsgGUID: hV59TtAPQ06EWtq25+LqDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102063224"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 17 Dec 2024 00:22:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0384F331; Tue, 17 Dec 2024 10:22:22 +0200 (EET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 01/12] thunderbolt: Drop doubled empty line from ctl.h
Date: Tue, 17 Dec 2024 10:22:11 +0200
Message-ID: <20241217082222.528602-2-mika.westerberg@linux.intel.com>
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

No functional changes.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/ctl.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/thunderbolt/ctl.h b/drivers/thunderbolt/ctl.h
index bf930a191472..7e08ca8f0895 100644
--- a/drivers/thunderbolt/ctl.h
+++ b/drivers/thunderbolt/ctl.h
@@ -140,5 +140,4 @@ int tb_cfg_write(struct tb_ctl *ctl, const void *buffer, u64 route, u32 port,
 		 enum tb_cfg_space space, u32 offset, u32 length);
 int tb_cfg_get_upstream_port(struct tb_ctl *ctl, u64 route);
 
-
 #endif
-- 
2.45.2


