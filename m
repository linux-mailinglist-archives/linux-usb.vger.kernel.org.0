Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2F731F9A19
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730546AbgFOO04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:56 -0400
Received: from mga17.intel.com ([192.55.52.151]:19767 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730501AbgFOO0y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:54 -0400
IronPort-SDR: 9RWXqAeQoB44vLCuHJqMhQNfyO1dUfBLH1wQ+kcvlCTbNJeA8oRG+s258IJEVEy/fMrPuv4tkI
 Y9tsKDD+cAiQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:54 -0700
IronPort-SDR: 12QutSiUtUDkGVxJv/rOxRQqaoGX3iCrCC2K3+prah4kc27zfk4cb17LLJNLH1AecpDlb51FR4
 3nG17aSNXj1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="316922169"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2020 07:26:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 4E25B946; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 15/17] thunderbolt: Make tb_port_get_link_speed() available to other files
Date:   Mon, 15 Jun 2020 17:26:43 +0300
Message-Id: <20200615142645.56209-16-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

We need to call this from tb.c when we improve the bandwidth management
to take USB3 into account.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 8 +++++++-
 drivers/thunderbolt/tb.h     | 2 ++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 29db484d2c74..c01176429d5f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -911,7 +911,13 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 	return next != prev ? next : NULL;
 }
 
-static int tb_port_get_link_speed(struct tb_port *port)
+/**
+ * tb_port_get_link_speed() - Get current link speed
+ * @port: Port to check (USB4 or CIO)
+ *
+ * Returns link speed in Gb/s or negative errno in case of failure.
+ */
+int tb_port_get_link_speed(struct tb_port *port)
 {
 	u32 val, speed;
 	int ret;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index cb53a94fe4f8..c6f18200fe92 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -759,6 +759,8 @@ struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 	for ((p) = tb_next_port_on_path((src), (dst), NULL); (p);	\
 	     (p) = tb_next_port_on_path((src), (dst), (p)))
 
+int tb_port_get_link_speed(struct tb_port *port);
+
 int tb_switch_find_vse_cap(struct tb_switch *sw, enum tb_switch_vse_cap vsec);
 int tb_switch_find_cap(struct tb_switch *sw, enum tb_switch_cap cap);
 int tb_port_find_cap(struct tb_port *port, enum tb_port_cap cap);
-- 
2.27.0.rc2

