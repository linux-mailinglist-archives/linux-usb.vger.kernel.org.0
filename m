Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCCDB30A770
	for <lists+linux-usb@lfdr.de>; Mon,  1 Feb 2021 13:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbhBAMSi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 07:18:38 -0500
Received: from mga09.intel.com ([134.134.136.24]:22929 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229525AbhBAMSg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 07:18:36 -0500
IronPort-SDR: ixnjdWZQ7SqrLPuY0qTTrTcnGKAgtkzR4pGtCIe95d8Ehvztq6bRkNAh+KdrqECsgUlCww9wIr
 qmcmGbpT3n0g==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="180820114"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="180820114"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2021 04:16:35 -0800
IronPort-SDR: 3Jx53TZ/+ySAyRrjshAkxt3dIwi6niIZfbyzVDx5CUaY33LPa1rC6MblzmRsZPjEQBDp5vpF/4
 X3Q9dhXc98DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; 
   d="scan'208";a="390886510"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 01 Feb 2021 04:16:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id B4B6E38F; Mon,  1 Feb 2021 14:16:29 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 6/6] thunderbolt: Add clarifying comments about USB4 terms router and adapter
Date:   Mon,  1 Feb 2021 15:16:29 +0300
Message-Id: <20210201121629.76969-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
References: <20210201121629.76969-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 spec talks about routers and adapters whereas Thunderbolt 1-3
talked about CIO (Converged I/O) switches and ports. These are the same
thing but might cause confusion so add clarifying comments to struct
tb_switch and struct tb_port about the USB4 terms.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 31468de658e4..37679b54808d 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -138,6 +138,8 @@ struct tb_switch_tmu {
  *
  * When the switch is being added or removed to the domain (other
  * switches) you need to have domain lock held.
+ *
+ * In USB4 terminology this structure represents a router.
  */
 struct tb_switch {
 	struct device dev;
@@ -196,6 +198,9 @@ struct tb_switch {
  * @in_hopids: Currently allocated input HopIDs
  * @out_hopids: Currently allocated output HopIDs
  * @list: Used to link ports to DP resources list
+ *
+ * In USB4 terminology this structure represents an adapter (protocol or
+ * lane adapter).
  */
 struct tb_port {
 	struct tb_regs_port_header config;
-- 
2.29.2

