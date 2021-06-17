Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D843AB6C1
	for <lists+linux-usb@lfdr.de>; Thu, 17 Jun 2021 17:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbhFQPDy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Jun 2021 11:03:54 -0400
Received: from mga04.intel.com ([192.55.52.120]:23962 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231992AbhFQPDw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 17 Jun 2021 11:03:52 -0400
IronPort-SDR: QKK6XiYqb9ld0s8PFgaeWZQwfmcSRKc58CydSxzsJa18hQQuZx9O8zfa+GqO915w3xGa2Zg3ZA
 LXNXi+0V/u7w==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="204557457"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="204557457"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 08:01:45 -0700
IronPort-SDR: LeRBiTPhp/BGkQMS3hJYo33k8SZhEgYQ9j4nkPr5dfstEao5G64u+9DraOiJRk8g6n5i+AN80P
 xr50+w6411hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="479490839"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2021 08:01:42 -0700
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 1/4] xhci: Remove unused defines for ERST_SIZE and ERST_ENTRIES
Date:   Thu, 17 Jun 2021 18:03:51 +0300
Message-Id: <20210617150354.1512157-2-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
References: <20210617150354.1512157-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We don't want those around confusing people.

ERST_NUM_SEGS is used both when allocating event ring segments, and when
allocating entries in the event ring segment table (erst).

Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index a1d5ffb7474d..85ba326806ab 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1663,10 +1663,6 @@ struct urb_priv {
  * meaning 64 ring segments.
  * Initial allocated size of the ERST, in number of entries */
 #define	ERST_NUM_SEGS	1
-/* Initial allocated size of the ERST, in number of entries */
-#define	ERST_SIZE	64
-/* Initial number of event segment rings allocated */
-#define	ERST_ENTRIES	1
 /* Poll every 60 seconds */
 #define	POLL_TIMEOUT	60
 /* Stop endpoint command timeout (secs) for URB cancellation watchdog timer */
-- 
2.25.1

