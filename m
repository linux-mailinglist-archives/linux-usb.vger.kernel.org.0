Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A49881F9A1F
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 16:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730212AbgFOO1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 10:27:01 -0400
Received: from mga17.intel.com ([192.55.52.151]:19757 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729825AbgFOO0v (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Jun 2020 10:26:51 -0400
IronPort-SDR: 7pWJaXAj34eG+Cxm8gVRS09+C/4dsCzTdnp+AV2uvfdS+8wOXUEwL5UGxhA1zlLbnTRpj0dJhz
 1TeET2S/HFyg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2020 07:26:51 -0700
IronPort-SDR: GV1/t2glX4aiMygaLRkPBYF0F3VghuuhhAncz5K4P6AhoyWwbXMRj3DKzj9tIoj839cWTmE6by
 GPt55nsNbqLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,514,1583222400"; 
   d="scan'208";a="316922161"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2020 07:26:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id D93CB1C8; Mon, 15 Jun 2020 17:26:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: [PATCH 05/17] thunderbolt: Handle incomplete PCIe/USB3 paths correctly in discovery
Date:   Mon, 15 Jun 2020 17:26:33 +0300
Message-Id: <20200615142645.56209-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the path is not complete when we do discovery the number of hops may
be less than with the full path. As an example when this can happen is
that user unloads the driver, disconnects the topology, and loads the
driver back. If there is PCIe or USB3 tunnel involved this may happen.

Take this into account in tb_pcie_init_path() and tb_usb3_init_path()
and prevent potential access over array limits.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tunnel.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index c144ca9b032c..5bdb8b11345e 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -124,8 +124,9 @@ static void tb_pci_init_path(struct tb_path *path)
 	path->drop_packages = 0;
 	path->nfc_credits = 0;
 	path->hops[0].initial_credits = 7;
-	path->hops[1].initial_credits =
-		tb_initial_credits(path->hops[1].in_port->sw);
+	if (path->path_length > 1)
+		path->hops[1].initial_credits =
+			tb_initial_credits(path->hops[1].in_port->sw);
 }
 
 /**
@@ -879,8 +880,9 @@ static void tb_usb3_init_path(struct tb_path *path)
 	path->drop_packages = 0;
 	path->nfc_credits = 0;
 	path->hops[0].initial_credits = 7;
-	path->hops[1].initial_credits =
-		tb_initial_credits(path->hops[1].in_port->sw);
+	if (path->path_length > 1)
+		path->hops[1].initial_credits =
+			tb_initial_credits(path->hops[1].in_port->sw);
 }
 
 /**
-- 
2.27.0.rc2

