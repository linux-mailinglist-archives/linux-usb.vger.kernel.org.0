Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03711333A8E
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 11:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232585AbhCJKqm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 05:46:42 -0500
Received: from mga05.intel.com ([192.55.52.43]:7688 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232471AbhCJKqY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 05:46:24 -0500
IronPort-SDR: QmUlBH2fK7e8KEd8Iy3fJkqVOSoIBKgfFoiFvTyqYw88Q6MJrYLxoYbjIfbmUuycXXOfTG0Pxp
 HRpUneebUaBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="273475504"
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="273475504"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2021 02:46:20 -0800
IronPort-SDR: ApU4qK6LtOIro+Kf5cwj0tzPJAzYmtNqJjM7njPUT90k7eEBWcWjst0TLAQhQouOsvnxvrLgCk
 jonrzWjrgvvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,237,1610438400"; 
   d="scan'208";a="509624562"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2021 02:46:19 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [PATCH 1/3] usb: typec: tps6598x: Fix tracepoint header file
Date:   Wed, 10 Mar 2021 13:46:28 +0300
Message-Id: <20210310104630.77945-2-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210310104630.77945-1-heikki.krogerus@linux.intel.com>
References: <20210310104630.77945-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There were two typos in the precompiler conditions.

Fixes: 65a2f67d9945 ("usb: typec: tps6598x: Add trace event for IRQ events")
Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/tps6598x_trace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tps6598x_trace.h b/drivers/usb/typec/tps6598x_trace.h
index 38bfb2f04e46d..21917751d61ee 100644
--- a/drivers/usb/typec/tps6598x_trace.h
+++ b/drivers/usb/typec/tps6598x_trace.h
@@ -9,7 +9,7 @@
 #undef TRACE_SYSTEM
 #define TRACE_SYSTEM tps6598x
 
-#if !defined(_TPS6598x_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
+#if !defined(_TPS6598X_TRACE_H_) || defined(TRACE_HEADER_MULTI_READ)
 #define _TPS6598X_TRACE_H_
 
 #include "tps6598x.h"
@@ -276,7 +276,7 @@ TRACE_EVENT(tps6598x_data_status,
 #endif /* _TPS6598X_TRACE_H_ */
 
 /* This part must be outside protection */
-#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
 #define TRACE_INCLUDE_FILE tps6598x_trace
 #undef TRACE_INCLUDE_PATH
 #define TRACE_INCLUDE_PATH .
-- 
2.30.1

