Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 636E3A37DD
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2019 15:37:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbfH3Nhl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Aug 2019 09:37:41 -0400
Received: from mga12.intel.com ([192.55.52.136]:23363 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727434AbfH3Nhl (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Aug 2019 09:37:41 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Aug 2019 06:37:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,447,1559545200"; 
   d="scan'208";a="332860299"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by orsmga004.jf.intel.com with ESMTP; 30 Aug 2019 06:37:39 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 3/4] xhci: add TSP bitflag to TRB tracing
Date:   Fri, 30 Aug 2019 16:39:15 +0300
Message-Id: <1567172356-12915-4-git-send-email-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567172356-12915-1-git-send-email-mathias.nyman@linux.intel.com>
References: <1567172356-12915-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Software can set a Transfer State Preserve (TSP) flag to maintain
data toggle and sequence number when issuing a reset endpoint
command.

xhci driver is using TSP for soft retry, we want to show TSP usage
in tracing as well

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index f5c41448d067..f9f88626a57a 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -2337,12 +2337,13 @@ static inline const char *xhci_decode_trb(u32 field0, u32 field1, u32 field2,
 		break;
 	case TRB_RESET_EP:
 		sprintf(str,
-			"%s: ctx %08x%08x slot %d ep %d flags %c",
+			"%s: ctx %08x%08x slot %d ep %d flags %c:%c",
 			xhci_trb_type_string(type),
 			field1, field0,
 			TRB_TO_SLOT_ID(field3),
 			/* Macro decrements 1, maybe it shouldn't?!? */
 			TRB_TO_EP_INDEX(field3) + 1,
+			field3 & TRB_TSP ? 'T' : 't',
 			field3 & TRB_CYCLE ? 'C' : 'c');
 		break;
 	case TRB_STOP_RING:
-- 
2.7.4

