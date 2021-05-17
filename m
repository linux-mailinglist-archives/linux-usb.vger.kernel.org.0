Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1AB9382CEF
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 15:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237293AbhEQNLH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 09:11:07 -0400
Received: from mga09.intel.com ([134.134.136.24]:19579 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237291AbhEQNLE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 17 May 2021 09:11:04 -0400
IronPort-SDR: FAjBxukHvQVbjMl/b0ZoTR/jR1Csd+m3UHF07SwXGiWp5JlrPJHbBc/K7ntJ05FQVMBVrx5XpP
 vhFrkpoLJ7Sg==
X-IronPort-AV: E=McAfee;i="6200,9189,9986"; a="200510557"
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="200510557"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2021 06:06:54 -0700
IronPort-SDR: CTbraQv7RJZBCcaNkGK1Cglio1kE4j+Lbr0L/XdgOMqihrI14FXm1mu0PXDAgfjgIkEk04wDrB
 O0e6q3LIJRAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,307,1613462400"; 
   d="scan'208";a="438916141"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 17 May 2021 06:06:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 3A07D752; Mon, 17 May 2021 16:07:13 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 3/3] thunderbolt: Align USB4 router wakes configuration with the CM guide
Date:   Mon, 17 May 2021 16:07:13 +0300
Message-Id: <20210517130713.30005-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
References: <20210517130713.30005-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The USB4 Configuration Manager guide suggests that the USB4 port wakes
are configured in a certain way, like that when the port is configured
the wake-on-connect should not be set and so forth, so align the driver
with this.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/usb4.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 7e8b5ca3114c..b56af7b0a093 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -399,12 +399,18 @@ int usb4_switch_set_wake(struct tb_switch *sw, unsigned int flags)
 
 		val &= ~(PORT_CS_19_WOC | PORT_CS_19_WOD | PORT_CS_19_WOU4);
 
-		if (flags & TB_WAKE_ON_CONNECT)
-			val |= PORT_CS_19_WOC;
-		if (flags & TB_WAKE_ON_DISCONNECT)
-			val |= PORT_CS_19_WOD;
-		if (flags & TB_WAKE_ON_USB4)
+		if (tb_is_upstream_port(port)) {
 			val |= PORT_CS_19_WOU4;
+		} else {
+			bool configured = val & PORT_CS_19_PC;
+
+			if ((flags & TB_WAKE_ON_CONNECT) && !configured)
+				val |= PORT_CS_19_WOC;
+			if ((flags & TB_WAKE_ON_DISCONNECT) && configured)
+				val |= PORT_CS_19_WOD;
+			if ((flags & TB_WAKE_ON_USB4) && configured)
+				val |= PORT_CS_19_WOU4;
+		}
 
 		ret = tb_port_write(port, &val, TB_CFG_PORT,
 				    port->cap_usb4 + PORT_CS_19, 1);
-- 
2.30.2

