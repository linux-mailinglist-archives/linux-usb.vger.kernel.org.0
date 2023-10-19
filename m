Return-Path: <linux-usb+bounces-1905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DF3D07CF53E
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BB8E1C20E9C
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B5A1DFE5;
	Thu, 19 Oct 2023 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H55QKMoO"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A3C1DFC3
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D53123
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711299; x=1729247299;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A9PcLjBvi3l+xmF0+HXBfDl+YIq6p3JyMUQbJQwE0uM=;
  b=H55QKMoOfi3+RlqUJ8w3nTU3J4VCZaI6A2QQ0zUM8X1ECHBf0QqdFZwO
   8IrHdCokcgvYt2F29OcLvoUbacD9ctjThpqc7yjePHI/uOcYc6UI3piVE
   3sgh9C8o/G1N+39IvomcVnFg5JBVYhfHHMJUyaonP0zAftWkESGJ/IK9g
   bcf4xSNQ0U6KbtEYT5r+qD2EmCM9kTR+yWtHIzLb6q7qoV78h1KKCvnPC
   roY5b/TpxDtm7GER6m7uD7e9RKEPhdrocdym94DuI84hRVJTP3QMFTsEl
   rpJjA+t9yiQvU7IVyu+GEQ9/lUxJUuOgiLzLWQuTYg+/l+L1+J29Vn1Ny
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075867"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075867"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557750"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557750"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:17 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 10/19] xhci: Clean up stale comment on ERST_SIZE macro
Date: Thu, 19 Oct 2023 13:29:15 +0300
Message-Id: <20231019102924.2797346-11-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
References: <20231019102924.2797346-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Wunner <lukas@wunner.de>

Commit ebd88cf50729 ("xhci: Remove unused defines for ERST_SIZE and
ERST_ENTRIES") removed the ERST_SIZE macro but retained a code comment
explaining the quantity chosen in the macro.

Remove the code comment as well.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f97896740c3f..1453fcab33d9 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1643,12 +1643,7 @@ struct urb_priv {
 	struct	xhci_td	td[];
 };
 
-/*
- * Each segment table entry is 4*32bits long.  1K seems like an ok size:
- * (1K bytes * 8bytes/bit) / (4*32 bits) = 64 segment entries in the table,
- * meaning 64 ring segments.
- * Reasonable limit for number of Event Ring segments (spec allows 32k)
- */
+/* Reasonable limit for number of Event Ring segments (spec allows 32k) */
 #define	ERST_MAX_SEGS	2
 /* Poll every 60 seconds */
 #define	POLL_TIMEOUT	60
-- 
2.25.1


