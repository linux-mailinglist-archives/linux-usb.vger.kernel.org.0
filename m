Return-Path: <linux-usb+bounces-1897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560F57CF52B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 12:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F211C20F27
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 10:28:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCE219445;
	Thu, 19 Oct 2023 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nL5BzWvm"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0471618B0C
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 10:28:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F5DFA
	for <linux-usb@vger.kernel.org>; Thu, 19 Oct 2023 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697711284; x=1729247284;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZdnCpTajUHoaLGURTBEAHldvl8FGybK4XaOUwd8hW6s=;
  b=nL5BzWvmj6XnxnZt2srRTqyyRWyiaVArOPvL56CkM0hbOnlHxC5xvGpc
   6pI+px9dkYTH7/d7sVMpEz15F4NkvAJDHatyGw265/NAPruBKzfn6D4WX
   Ut4P8m0fjo7rOvVUH05J7kFy+W4+fqmN3o9DJwZu8PwcPdpmtclEfqE6n
   K/krVwEVe61U08R8iRdbBDys6k0JzPk+613Lqh1gK2Jd6fn+NpbKMDIyS
   R1h/G8XiBHM1QWmjAPbuaoepNFSc4mf+alIpPSKfcOr5q6xAaiw51WTy8
   kgtNcVbaw4Jf1q7pdn5S8NtbpZGFzv1NWx7xGNUqLIT6/Vdj42CX5Th2P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="389075780"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="389075780"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 03:28:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="930557499"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="930557499"
Received: from mattu-haswell.fi.intel.com ([10.237.72.199])
  by orsmga005.jf.intel.com with ESMTP; 19 Oct 2023 03:28:02 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 02/19] xhci: Add busnumber to port tracing
Date: Thu, 19 Oct 2023 13:29:07 +0300
Message-Id: <20231019102924.2797346-3-mathias.nyman@linux.intel.com>
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

With several xhci controllers active at the same time its hard to
keep track of ports without knowing bus number

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-trace.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-trace.h b/drivers/usb/host/xhci-trace.h
index 2208eda1ff27..ac47b1c0544a 100644
--- a/drivers/usb/host/xhci-trace.h
+++ b/drivers/usb/host/xhci-trace.h
@@ -512,14 +512,17 @@ DECLARE_EVENT_CLASS(xhci_log_portsc,
 		    TP_PROTO(struct xhci_port *port, u32 portsc),
 		    TP_ARGS(port, portsc),
 		    TP_STRUCT__entry(
+				     __field(u32, busnum)
 				     __field(u32, portnum)
 				     __field(u32, portsc)
 				     ),
 		    TP_fast_assign(
+				   __entry->busnum = port->rhub->hcd->self.busnum;
 				   __entry->portnum = port->hcd_portnum;
 				   __entry->portsc = portsc;
 				   ),
-		    TP_printk("port-%d: %s",
+		    TP_printk("port %d-%d: %s",
+			      __entry->busnum,
 			      __entry->portnum,
 			      xhci_decode_portsc(__get_buf(XHCI_MSG_MAX), __entry->portsc)
 			      )
-- 
2.25.1


