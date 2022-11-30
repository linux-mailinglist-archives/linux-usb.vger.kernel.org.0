Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA5E363D197
	for <lists+linux-usb@lfdr.de>; Wed, 30 Nov 2022 10:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232661AbiK3JS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Nov 2022 04:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232484AbiK3JSU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Nov 2022 04:18:20 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BC645ADE3
        for <linux-usb@vger.kernel.org>; Wed, 30 Nov 2022 01:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669799899; x=1701335899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C5PfuVa3lauAuGnwyxK9T0SjMnzRJUcNw/0nJEWN+3w=;
  b=Y88YXAy3Up1bASo608T4IqiGN7M13xdvDQ3CAORVpP3t8PKmz/SG0Pv5
   /JJNFUKiUDFiFCnJOuYMT9P3k9oLEKFpmf9UB3ggEYjwqU6puEqWR3NE2
   vLwPZ1MuzCUizrSXb3jfusXqdOBWxjiVrVe1t88imuBI9uqqexDnUVVVm
   0QwW14YNvY1nWh0TsrCKc3ASsijM/VEXoYIRdRSkwfS2YQ0N3DFZgSwBY
   sglvnIfTpPUgeGe8SK41BTFBnG0lPTUFnTCPXpEuE5zKHDsHWeoJBiyRm
   fn9QCiqXyy9/GRToGF7pWl6dVjQZhBNgoYnVk3Mbxm4A1r5bSsOP/A1tI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="295711281"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="295711281"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2022 01:18:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10546"; a="674962706"
X-IronPort-AV: E=Sophos;i="5.96,205,1665471600"; 
   d="scan'208";a="674962706"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga008.jf.intel.com with ESMTP; 30 Nov 2022 01:18:17 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/6] xhci: export two xhci_hub functions for xhci-pci module usage
Date:   Wed, 30 Nov 2022 11:19:41 +0200
Message-Id: <20221130091944.2171610-4-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
References: <20221130091944.2171610-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

some Intel Alder Lake xHC hosts on ChromeOS platforms need special
workarounds touching port registers at xHC pci host hibernate.

Export xhci_port_state_to_neutral() and xhci_find_slot_id_by_port()
so they can be called from xhci-pci.c and thus the xhci-pci module.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 4619d5e89d5b..94c94db3faf6 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -426,24 +426,37 @@ static unsigned int xhci_port_speed(unsigned int port_status)
  */
 #define	XHCI_PORT_RZ	((1<<2) | (1<<24) | (0xf<<28))
 
-/*
+/**
+ * xhci_port_state_to_neutral() - Clean up read portsc value back into writeable
+ * @state: u32 port value read from portsc register to be cleanup up
+ *
  * Given a port state, this function returns a value that would result in the
  * port being in the same state, if the value was written to the port status
  * control register.
  * Save Read Only (RO) bits and save read/write bits where
  * writing a 0 clears the bit and writing a 1 sets the bit (RWS).
  * For all other types (RW1S, RW1CS, RW, and RZ), writing a '0' has no effect.
+ *
+ * Return: u32 value that can be written back to portsc register without
+ * changing port state.
  */
+
 u32 xhci_port_state_to_neutral(u32 state)
 {
 	/* Save read-only status and port state */
 	return (state & XHCI_PORT_RO) | (state & XHCI_PORT_RWS);
 }
+EXPORT_SYMBOL_GPL(xhci_port_state_to_neutral);
 
-/*
- * find slot id based on port number.
- * @port: The one-based port number from one of the two split roothubs.
+/**
+ * xhci_find_slot_id_by_port() - Find slot id of a usb device on a roothub port
+ * @hcd: pointer to hcd of the roothub
+ * @xhci: pointer to xhci structure
+ * @port: one-based port number of the port in this roothub.
+ *
+ * Return: Slot id of the usb device connected to the root port, 0 if not found
  */
+
 int xhci_find_slot_id_by_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 		u16 port)
 {
@@ -465,6 +478,7 @@ int xhci_find_slot_id_by_port(struct usb_hcd *hcd, struct xhci_hcd *xhci,
 
 	return slot_id;
 }
+EXPORT_SYMBOL_GPL(xhci_find_slot_id_by_port);
 
 /*
  * Stop device
-- 
2.25.1

