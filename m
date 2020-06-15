Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB23E1F9A1B
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730544AbgFOO04 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:26:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:15839 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730471AbgFOO0w (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:52 -0400
IronPort-SDR: RnOMij7FqibXyIk/evuLT2IYMLtN8A6FFLPZ16S/0qlgHESKPg6OFM/3i5nwsKGTgQqC+2EClR
 7xqWHPtEeYQw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:52 -0700
IronPort-SDR: j3iZpzeXcNtyH5/Ts6Iay2jr7MNPJBHXIJxi0VVMydk9SJLUeEq7LSolW9XoSsYLFEfhXzSQKk
 X9Rtb/RTQL+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="420389608"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 15 Jun 2020 07:26:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 22C33888; Mon, 15 Jun 2020 17:26:46 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 11/17] thunderbolt: Make usb4_switch_map_pcie_down() also return enabled ports
Date:   Mon, 15 Jun 2020 17:26:39 +0300
Message-Id: <20200615142645.56209-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Just for symmetry with the usb4_switch_map_usb3_down() make this one
also return ports that are enabled.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.c   | 2 +-
 drivers/thunderbolt/usb4.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 82f62a023a4b..9dbdb11685fa 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -520,7 +520,7 @@ static struct tb_port *tb_find_pcie_down(struct tb_switch *sw,
 	if (down) {
 		if (WARN_ON(!tb_port_is_pcie_down(down)))
 			goto out;
-		if (WARN_ON(tb_pci_port_is_enabled(down)))
+		if (tb_pci_port_is_enabled(down))
 			goto out;
 
 		return down;
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 375a8c459201..dd1c0498a8ee 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -728,7 +728,7 @@ struct tb_port *usb4_switch_map_pcie_down(struct tb_switch *sw,
 		if (!tb_port_is_pcie_down(p))
 			continue;
 
-		if (pcie_idx == usb4_idx && !tb_pci_port_is_enabled(p))
+		if (pcie_idx == usb4_idx)
 			return p;
 
 		pcie_idx++;
-- 
2.27.0.rc2

