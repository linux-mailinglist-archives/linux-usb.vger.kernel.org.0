Return-Path: <linux-usb+bounces-30271-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E34C469A3
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 13:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 331F81881CCB
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 12:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6C630F955;
	Mon, 10 Nov 2025 12:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhF3iHhY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D263730CD89
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762777857; cv=none; b=nUqbOB84w5wOlBH5oQ8TwcCOZC4FvuyYE9xNcs3n8C5oLFlDdk885cZYHxMbMdg6BCuon2oyf276c/40sq02htTwokraChxp5Im8N8L9i7Lh0keoe0vVqtVeolUuT9VnbaB2W5jxH/9Y5y8WBNk5Xs+gEFvrvqYkVH+56wHPACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762777857; c=relaxed/simple;
	bh=Tk6snZbv5YYy7B1rifgEA88ZGnhucItAmP7gtsI+cQE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J0CIoazxyk/K8ktJxVbYDPpj8KeLk6AohqOMYVhsaIf3QgtY0WsZcBubHh20UxfggWq1jjDF9GSxvYfu36tWkQevMEFoaAsQCaOxjXnJL9YFv/XbgwDbbgUH9t8EfghRrA/wiwxhz+uQit73ifygt4i1W30QEIbEOr4FotBdrfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KhF3iHhY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762777856; x=1794313856;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Tk6snZbv5YYy7B1rifgEA88ZGnhucItAmP7gtsI+cQE=;
  b=KhF3iHhYee68HlV+iSHf6Z3PO3ESenFg/ixjq2edNKWRuPFxLYVZI80U
   WJUXncu0wuh9ldWe9dfGv8STqwEqnaKqWakd8YXwo4zCZbjG6rc5COHbZ
   oFzm3p5Ao4KzsmDB1nackBw+ekJb2JH9AulvzV5RfzOhW5vUbDgKNBjsQ
   PNcfcUmTSfI3OSnAuD+L8rmIGy00S52w8le0i7MOt9RRPHwgR82Iwf37f
   bd7HK2Mam557sOglsIJSOYwrbXfOfzhfh1ejtRzlgyfzTAzHbIc0uaCDr
   2R/L/FKf8lWHhsVQ72We01QwVtEUHSN90SlbHSLS/PUBA3qj0w6jrWARa
   g==;
X-CSE-ConnectionGUID: MzgeQ3HjSNiirNcybKw7MQ==
X-CSE-MsgGUID: KeRCEebTTmuRNQYJSAcHPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64754353"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64754353"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 04:30:55 -0800
X-CSE-ConnectionGUID: bekWQMkyRRCcBwsXEQaWRA==
X-CSE-MsgGUID: j5BuKG6PQSu2n54G0Pw53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="187969678"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa010.jf.intel.com with ESMTP; 10 Nov 2025 04:30:54 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id A1229A1; Mon, 10 Nov 2025 13:30:50 +0100 (CET)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Rene Sapiens <rene.sapiens@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 12/16] thunderbolt: Fix typos in tb_regs.h
Date: Mon, 10 Nov 2025 13:30:46 +0100
Message-ID: <20251110123050.3959188-13-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
References: <20251110123050.3959188-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>

Fix typos in tb_regs.h. No functional changes.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb_regs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 4e43b47f9f11..c0bf136236e6 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -99,7 +99,7 @@ struct tb_cap_extended_long {
 } __packed;
 
 /**
- * struct tb_cap_any - Structure capable of hold every capability
+ * struct tb_cap_any - Structure capable of holding every capability
  * @basic: Basic capability
  * @extended_short: Vendor specific capability
  * @extended_long: Vendor specific extended capability
@@ -534,8 +534,8 @@ struct tb_regs_hop {
 
 /*
  * Used for Titan Ridge only. Bits are part of the same register: TMU_ADP_CS_6
- * (see above) as in USB4 spec, but these specific bits used for Titan Ridge
- * only and reserved in USB4 spec.
+ * (see above) as in USB4 spec, but these specific bits are used for Titan Ridge
+ * only and are reserved in USB4 spec.
  */
 #define TMU_ADP_CS_6_DISABLE_TMU_OBJ_MASK	GENMASK(3, 2)
 #define TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL1	BIT(2)
-- 
2.50.1


