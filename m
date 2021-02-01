Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AF8D30A76B
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbhBAMST (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:18:19 -0500
Received: from mga17.intel.com ([192.55.52.151]:14229 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229519AbhBAMSS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:18:18 -0500
IronPort-SDR: qFmTb+Oi4AmvXoHUep3QR/3/IS4JgTuAQTfFKJX9Z1nMP6Jpniqhzdkxu+V2iCC+rgcPrSBGBA
 Cx93YbvS2jUQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="160440865"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="160440865"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:16:32 -0800
IronPort-SDR: AfYddwictoMFMFO9+S5moFS2hk4cmghgkSFu8KAbUKKQbBLymrPjlIcY1EqPMSg3Ig5W/fvcGF
 iAJGvikpRmPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="369835249"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 01 Feb 2021 04:16:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id A081F1CE; Mon,  1 Feb 2021 14:16:29 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 4/6] thunderbolt: nhi: Fix kernel-doc descriptions of non-static functions
Date:   Mon,  1 Feb 2021 15:16:27 +0300
Message-Id: <20210201121629.76969-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
References: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix kernel-doc descriptions of the two non-static functions. This also
gets rids of the warnings on W=1 build.

Reported-by: Lee Jones <lee.jones@linaro.org>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Lee Jones <lee.jones@linaro.org>
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

