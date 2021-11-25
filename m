Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E8D45D5B6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Nov 2021 08:45:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239371AbhKYHs4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Nov 2021 02:48:56 -0500
Received: from mga06.intel.com ([134.134.136.31]:8267 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235463AbhKYHq4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 25 Nov 2021 02:46:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10178"; a="296269506"
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="296269506"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2021 23:37:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,262,1631602800"; 
   d="scan'208";a="741094654"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 24 Nov 2021 23:37:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 41642329; Thu, 25 Nov 2021 09:37:34 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/6] thunderbolt: Do not allow subtracting more NFC credits than configured
Date:   Thu, 25 Nov 2021 10:37:31 +0300
Message-Id: <20211125073733.74902-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This might happen if the boot firmware uses different amount of NFC
credits than what the router suggests, or we are dealing with pre-USB4
device.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 3014146081c1..463cfdc0b42f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -623,6 +623,9 @@ int tb_port_add_nfc_credits(struct tb_port *port, int credits)
 		return 0;
 
 	nfc_credits = port->config.nfc_credits & ADP_CS_4_NFC_BUFFERS_MASK;
+	if (credits < 0)
+		credits = max_t(int, -nfc_credits, credits);
+
 	nfc_credits += credits;
 
 	tb_port_dbg(port, "adding %d NFC credits to %lu", credits,
-- 
2.33.0

