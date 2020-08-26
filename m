Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18F8252C28
	for <lists+linux-usb@lfdr.de>; Wed, 26 Aug 2020 13:07:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728674AbgHZLHl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Aug 2020 07:07:41 -0400
Received: from mga02.intel.com ([134.134.136.20]:53924 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728657AbgHZLHk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 26 Aug 2020 07:07:40 -0400
IronPort-SDR: 7YFlyAbVOAINu8TzLa3D3rs2PGhphXmaYiQTJd9qn26OAz78z807g4q8jjPzuNAE/plj+uGHC8
 9LKUyZ9XIHAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="144040481"
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="144040481"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 04:07:39 -0700
IronPort-SDR: U6cplMGtJcOESDXb+WoKez6ddCdaPPBP2BFkVDihp8ZpWVv+AB0AAaStCz1sZIhOSVx/UqAlv7
 hWsSPeF8uYug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,355,1592895600"; 
   d="scan'208";a="281770064"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 26 Aug 2020 04:07:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id E9D04463; Wed, 26 Aug 2020 14:07:36 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Gil Fine <gil.fine@intel.com>, Lukas Wunner <lukas@wunner.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4/9] thunderbolt: Introduce tb_port_is_nhi()
Date:   Wed, 26 Aug 2020 14:07:31 +0300
Message-Id: <20200826110736.55186-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
References: <20200826110736.55186-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is useful if one needs to check if adapter (port) is the host
interface (NHI). Make tb_port_alloc_hopid() take advantage of this.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c | 2 +-
 drivers/thunderbolt/tb.h     | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index f646bad88309..d7164843cf8b 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -789,7 +789,7 @@ static int tb_port_alloc_hopid(struct tb_port *port, bool in, int min_hopid,
 	 * NHI can use HopIDs 1-max for other adapters HopIDs 0-7 are
 	 * reserved.
 	 */
-	if (port->config.type != TB_TYPE_NHI && min_hopid < TB_PATH_MIN_HOPID)
+	if (!tb_port_is_nhi(port) && min_hopid < TB_PATH_MIN_HOPID)
 		min_hopid = TB_PATH_MIN_HOPID;
 
 	if (max_hopid < 0 || max_hopid > port_max_hopid)
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index a1d5de53a349..6aee18b4f53d 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -464,6 +464,11 @@ static inline bool tb_port_is_null(const struct tb_port *port)
 	return port && port->port && port->config.type == TB_TYPE_PORT;
 }
 
+static inline bool tb_port_is_nhi(const struct tb_port *port)
+{
+	return port && port->config.type == TB_TYPE_NHI;
+}
+
 static inline bool tb_port_is_pcie_down(const struct tb_port *port)
 {
 	return port && port->config.type == TB_TYPE_PCIE_DOWN;
-- 
2.28.0

