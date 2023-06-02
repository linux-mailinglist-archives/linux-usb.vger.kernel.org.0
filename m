Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B37C2720495
	for <lists+linux-usb@lfdr.de>; Fri,  2 Jun 2023 16:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbjFBOi7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Jun 2023 10:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235983AbjFBOi6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Jun 2023 10:38:58 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75FDEBC
        for <linux-usb@vger.kernel.org>; Fri,  2 Jun 2023 07:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685716737; x=1717252737;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Bii7tSqYs2Ip8jq/jPKCgPJkJNQv4OKyr8zn/BP2vbk=;
  b=ECQqzYjPfF9cEFdyFO6nFd7nUM/x7yCdqWQTVWmGdWJlAkFUANIhGcl0
   y7q50DBCtsjNflH4W+l6UjUtAIsUmFmnAMApApGLpA0/zWuFh/1v1KkhE
   Q0g1oA0yWPzdeDgZzqo362DsAG1czZLSoFta8G20PBe8L9H5r2jjIo+MO
   Zl987N0/5c+Ue+svEu2roRd2+LMiUg7AKMhH+isSzXTO7383rsmnJWOPG
   0ThkIYrOFxl5TFmkoTh/Xjdbfj9aFUN3dT/JMpEgoBGs2lZPVHe4Z9cqj
   jkzPTy85nLmkyaDz+i6s1l0QBqZ6Rob8Cq8qwRp39RO5skyEdLEGSJNki
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="358311229"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="358311229"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 07:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="707877441"
X-IronPort-AV: E=Sophos;i="6.00,213,1681196400"; 
   d="scan'208";a="707877441"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga002.jf.intel.com with ESMTP; 02 Jun 2023 07:38:55 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/11] xhci: Add usb cold attach (CAS) as a reason to resume root hub.
Date:   Fri,  2 Jun 2023 17:40:00 +0300
Message-Id: <20230602144009.1225632-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
References: <20230602144009.1225632-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Check for the cold attach (CAS) bit while checking for other usb3
roothub port changes during host resume.

The CAS bit is set if a USB 3 device is connected while the host is
suspended in such a way it can't perform proper link training and
progress the link to the enabled U0 state.

If the CAS bit set we want to resume the root hub, and reset and
enumerate the newly connected device.

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index b81313ffeb76..3a13e2453203 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -833,7 +833,7 @@ static bool xhci_pending_portevent(struct xhci_hcd *xhci)
 	ports = xhci->usb3_rhub.ports;
 	while (port_index--) {
 		portsc = readl(ports[port_index]->addr);
-		if (portsc & PORT_CHANGE_MASK ||
+		if (portsc & (PORT_CHANGE_MASK | PORT_CAS) ||
 		    (portsc & PORT_PLS_MASK) == XDEV_RESUME)
 			return true;
 	}
-- 
2.25.1

