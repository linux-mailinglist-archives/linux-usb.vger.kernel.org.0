Return-Path: <linux-usb+bounces-27715-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A6926B4921E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 16:55:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDDE13A812E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 14:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D0A30C621;
	Mon,  8 Sep 2025 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3itzo1a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7057C30BF70
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343306; cv=none; b=soinaPtpBz5QXWkGQwh226iUSgLeN3prEuaAHfbYt/KcVRrGC4UwpC5zyjZr6ihu3LvzpBpBV37L68gq7fo7tTzX+l6+3nMbAsZlNON/pzs6dC/S+QCA/VnJBiVecF+GXt5BUZ1kdkIhXhzJc8+zo/REv8QjrqLhBChIKFFxT5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343306; c=relaxed/simple;
	bh=aGsydcUMA/jOLT4vwzuU75S1DRg0E0EjYR8MHM1PC9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDrlim57kum+3NocyZEkuazkYXhxEmDOHuzAHyR+RzSj3+DofN8r1H9ZYxYAKv1EEFrv2ULqg/oMG4IrDf/5E6H9ccogp2W1CI6gOsYwdeWJgd0t3RtTUg3gKfP7BO35tCY7JqG5HrgOMeiqw4ALD14dcWea/pTBdzlldq3LLM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3itzo1a; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757343304; x=1788879304;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aGsydcUMA/jOLT4vwzuU75S1DRg0E0EjYR8MHM1PC9c=;
  b=l3itzo1antrlilSWYOKLy+oX521/L/zHqAjxXSWfCKhiT4JJqesvzqMA
   oMlAUEVQVfu3u+LMNq78Zb14s5X539uJNDFIW4vOy32o+Ew75stOSRDn5
   1D0ZkO94jaNPXuOQK+bAcPJERYwFnNZOS6ZhfhLgdtRgxoBVWlSKnWnAc
   bovfXVdpA9mNaFdZJMkUUGB452lpdbReUScev5E+bL1gU3fDpm+d9Q/33
   A9LFoxbPeDuER3pLwsnXWeUdjlrn+cJHFlSVZjI5plNL5X4CImT2xPKXC
   5IYT458ffvi9HpECZeIHU+yO2D/RYo0wyfzP8da4ZPxWuGxu1RFn58e9h
   w==;
X-CSE-ConnectionGUID: QBfikyiyRHuK86DMRGmQuw==
X-CSE-MsgGUID: Ree6KERuTsOQBRdDzyuhcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="77057631"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="77057631"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 07:55:04 -0700
X-CSE-ConnectionGUID: 5YrpXSNzTbWeO86FmoyThg==
X-CSE-MsgGUID: 7cOZu4XcTNSImXla1Y01fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="172381150"
Received: from unknown (HELO black.igk.intel.com) ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 08 Sep 2025 07:55:03 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 8993C94; Mon, 08 Sep 2025 16:55:01 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <jametm@gmail.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH] MAINTAINERS: Update Michael Jamet's maintainer entries
Date: Mon,  8 Sep 2025 16:55:01 +0200
Message-ID: <20250908145501.2612218-1-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Michael Jamet is about to continue his professional journey outside of
Intel and is stepping down as maintainer of Thunderbolt/USB4 subsystem,
and the networking driver. Move him from MAINTAINERS to CREDITS.

Thank you, Michael!

Cc: Michael Jamet <jametm@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 CREDITS     | 5 +++++
 MAINTAINERS | 2 --
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index a687c3c35c4c..1bd483631939 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1890,6 +1890,11 @@ S: Reading
 S: RG6 2NU
 S: United Kingdom
 
+N: Michael Jamet
+E: michael.jamet@intel.com
+D: Thunderbolt/USB4 driver maintainer
+D: Thunderbolt/USB4 networking driver maintainer
+
 N: Dave Jeffery
 E: dhjeffery@gmail.com
 D: SCSI hacks and IBM ServeRAID RAID driver maintenance
diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..ca1bb43889c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25126,7 +25126,6 @@ F:	drivers/thunderbolt/dma_test.c
 
 THUNDERBOLT DRIVER
 M:	Andreas Noever <andreas.noever@gmail.com>
-M:	Michael Jamet <michael.jamet@intel.com>
 M:	Mika Westerberg <westeri@kernel.org>
 M:	Yehezkel Bernat <YehezkelShB@gmail.com>
 L:	linux-usb@vger.kernel.org
@@ -25137,7 +25136,6 @@ F:	drivers/thunderbolt/
 F:	include/linux/thunderbolt.h
 
 THUNDERBOLT NETWORK DRIVER
-M:	Michael Jamet <michael.jamet@intel.com>
 M:	Mika Westerberg <westeri@kernel.org>
 M:	Yehezkel Bernat <YehezkelShB@gmail.com>
 L:	netdev@vger.kernel.org
-- 
2.50.1


