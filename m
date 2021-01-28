Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BAEC307635
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 13:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhA1Mco (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 07:32:44 -0500
Received: from mga11.intel.com ([192.55.52.93]:16761 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229594AbhA1Mcn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 28 Jan 2021 07:32:43 -0500
IronPort-SDR: 67UArQlAJGqLLeEUJOCMtDj54HY6NK9eL++1iAahmg0kWCymgh6NUYW7rB9nbEB2YjUxR2XxRX
 ntQR9Mo4qADA==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="176716884"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="176716884"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 04:29:37 -0800
IronPort-SDR: 0ouUU+IiIkEJeKA6jJwkryJfXLi30+1woY61m4gAWaDbE5hdvuDfdKzbxtqS4ngXdpx2o/o4yO
 ADpP9Yxa5URQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; 
   d="scan'208";a="505283592"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 28 Jan 2021 04:29:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id EDB64288; Thu, 28 Jan 2021 14:29:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/5] thunderbolt: nhi: Fix kernel-doc descriptions of non-static functions
Date:   Thu, 28 Jan 2021 15:29:33 +0300
Message-Id: <20210128122934.36897-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of the two non-static functions. This also
gets rids of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 7073c25248b3..782404eb10b0 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -592,6 +592,7 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
 
 /**
  * tb_ring_start() - enable a ring
+ * @ring: Ring to start
  *
  * Must not be invoked in parallel with tb_ring_stop().
  */
@@ -667,6 +668,7 @@ EXPORT_SYMBOL_GPL(tb_ring_start);
 
 /**
  * tb_ring_stop() - shutdown a ring
+ * @ring: Ring to stop
  *
  * Must not be invoked from a callback.
  *
-- 
2.29.2

