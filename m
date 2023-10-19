Return-Path: <linux-usb+bounces-1906-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C07E97CF53F
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:29:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7BF962820FA
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C710E1944D;
	Thu, 19 Oct 2023 10:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mz5IY2/h"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7EC118B1D
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE88129
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711301; x=1729247301;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ki46xs20p/3jqwoJE2RBzjbaNZyWD4kqSBYzE2OIlEE=;
  b=Mz5IY2/hkB0ufurKsL3KVEFcvIesYhUiBtInjgO3MOjDX9TguBOpn1aC
   PrVY7wTog+G8niZLyCJC2SvGlA8s5rYcJ3izCtOo1svSeJUIQkidCjghE
   CFGWCDbljCeiOrcotb4uayCkKkY/wVvNx2+w/2pkEhwqGatzvnHyTNVNS
   VnOEuDEEnG/5FwzewNrgnVW1Dv++VyIZLSsAeO25V9acb2OvdPmCmKMqj
   15v/XtWde+4Chyf5jyJ45oTRvuJrqpKKzDs4veWVfe+T0x7ZZ/HKcyc5L
   rmd2djV9+PdZ7kkYKzTUOFSP0qnMXLijgnBpUt9scjQSaBVj0EajElSC7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075875"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075875"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557772"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557772"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:19 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Lukas Wunner <lukas@wunner.de>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 11/19] xhci: Clean up xhci_{alloc,free}_erst() declarations
Date: Thu, 19 Oct 2023 13:29:16 +0300
Message-Id: <20231019102924.2797346-12-mathias.nyman@linux.intel.com>
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

xhci_alloc_erst() has global scope even though it's only used in
xhci-mem.c.  Declare it static.

xhci_free_erst() was removed by commit b17a57f89f69 ("xhci: Refactor
interrupter code for initial multi interrupter support."), but a
declaration in xhci.h still remains.  Drop it.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-mem.c | 2 +-
 drivers/usb/host/xhci.h     | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index b133817ad180..4d0b1c0e61a8 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1776,7 +1776,7 @@ void xhci_free_command(struct xhci_hcd *xhci,
 	kfree(command);
 }
 
-int xhci_alloc_erst(struct xhci_hcd *xhci,
+static int xhci_alloc_erst(struct xhci_hcd *xhci,
 		    struct xhci_ring *evt_ring,
 		    struct xhci_erst *erst,
 		    gfp_t flags)
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 1453fcab33d9..813d55468c00 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2048,13 +2048,8 @@ struct xhci_ring *xhci_ring_alloc(struct xhci_hcd *xhci,
 void xhci_ring_free(struct xhci_hcd *xhci, struct xhci_ring *ring);
 int xhci_ring_expansion(struct xhci_hcd *xhci, struct xhci_ring *ring,
 		unsigned int num_trbs, gfp_t flags);
-int xhci_alloc_erst(struct xhci_hcd *xhci,
-		struct xhci_ring *evt_ring,
-		struct xhci_erst *erst,
-		gfp_t flags);
 void xhci_initialize_ring_info(struct xhci_ring *ring,
 			unsigned int cycle_state);
-void xhci_free_erst(struct xhci_hcd *xhci, struct xhci_erst *erst);
 void xhci_free_endpoint_ring(struct xhci_hcd *xhci,
 		struct xhci_virt_device *virt_dev,
 		unsigned int ep_index);
-- 
2.25.1


