Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA53387AB9
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349811AbhEROLN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:13 -0400
Received: from mga04.intel.com ([192.55.52.120]:3122 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349775AbhEROLL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:11 -0400
IronPort-SDR: Nw+zqFl5sIR+9lD5nt5RtgDCp2VgGTnBeuTARVtEF7Kev1htu4c0hnUQxtOittz6RsNVdwZb9Z
 k9Mzsr6tH/sQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198769231"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="198769231"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:43 -0700
IronPort-SDR: rWyxuBmKfgAnx2gtvyiv79c1b78bU7Hk13CWYNu48LInaae5+qGouazFoAZySLEY29LQ9AwjAZ
 jnGfpYccnKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="404835738"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 18 May 2021 07:09:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 7FB0D50E; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 2/8] thunderbolt: Move nfc_credits field to struct tb_path_hop
Date:   Tue, 18 May 2021 17:09:56 +0300
Message-Id: <20210518141002.63616-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

With the USB4 buffer allocation the number of credits (and non-flow
credits) may be different depending on the router buffer allocation
preferences. To allow this move the nfc_credits field to struct
tb_path_hop.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/path.c   |  4 ++--
 drivers/thunderbolt/tb.h     |  5 +++--
 drivers/thunderbolt/tunnel.c | 25 ++++++++++++++-----------
 3 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/path.c b/drivers/thunderbolt/path.c
index f63e205a35d9..564e2f42cebd 100644
--- a/drivers/thunderbolt/path.c
+++ b/drivers/thunderbolt/path.c
@@ -367,7 +367,7 @@ static void __tb_path_deallocate_nfc(struct tb_path *path, int first_hop)
 	int i, res;
 	for (i = first_hop; i < path->path_length; i++) {
 		res = tb_port_add_nfc_credits(path->hops[i].in_port,
-					      -path->nfc_credits);
+					      -path->hops[i].nfc_credits);
 		if (res)
 			tb_port_warn(path->hops[i].in_port,
 				     "nfc credits deallocation failed for hop %d\n",
@@ -502,7 +502,7 @@ int tb_path_activate(struct tb_path *path)
 	/* Add non flow controlled credits. */
 	for (i = path->path_length - 1; i >= 0; i--) {
 		res = tb_port_add_nfc_credits(path->hops[i].in_port,
-					      path->nfc_credits);
+					      path->hops[i].nfc_credits);
 		if (res) {
 			__tb_path_deallocate_nfc(path, i);
 			goto err;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 60a987c748ca..b4bc25b82fdb 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -256,6 +256,8 @@ struct tb_retimer {
  * @next_hop_index: HopID of the packet when it is routed out from @out_port
  * @initial_credits: Number of initial flow control credits allocated for
  *		     the path
+ * @nfc_credits: Number of non-flow controlled buffers allocated for the
+ *		 @in_port.
  *
  * Hop configuration is always done on the IN port of a switch.
  * in_port and out_port have to be on the same switch. Packets arriving on
@@ -275,6 +277,7 @@ struct tb_path_hop {
 	int in_counter_index;
 	int next_hop_index;
 	unsigned int initial_credits;
+	unsigned int nfc_credits;
 };
 
 /**
@@ -297,7 +300,6 @@ enum tb_path_port {
  * struct tb_path - a unidirectional path between two ports
  * @tb: Pointer to the domain structure
  * @name: Name of the path (used for debugging)
- * @nfc_credits: Number of non flow controlled credits allocated for the path
  * @ingress_shared_buffer: Shared buffering used for ingress ports on the path
  * @egress_shared_buffer: Shared buffering used for egress ports on the path
  * @ingress_fc_enable: Flow control for ingress ports on the path
@@ -318,7 +320,6 @@ enum tb_path_port {
 struct tb_path {
 	struct tb *tb;
 	const char *name;
-	int nfc_credits;
 	enum tb_path_port ingress_shared_buffer;
 	enum tb_path_port egress_shared_buffer;
 	enum tb_path_port ingress_fc_enable;
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index e1979bed7146..5be0f31949f1 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -119,7 +119,6 @@ static void tb_pci_init_path(struct tb_path *path)
 	path->priority = 3;
 	path->weight = 1;
 	path->drop_packages = 0;
-	path->nfc_credits = 0;
 	path->hops[0].initial_credits = 7;
 	if (path->path_length > 1)
 		path->hops[1].initial_credits =
@@ -616,7 +615,7 @@ static void tb_dp_init_aux_path(struct tb_path *path)
 
 static void tb_dp_init_video_path(struct tb_path *path, bool discover)
 {
-	u32 nfc_credits = path->hops[0].in_port->config.nfc_credits;
+	int i;
 
 	path->egress_fc_enable = TB_PATH_NONE;
 	path->egress_shared_buffer = TB_PATH_NONE;
@@ -625,15 +624,20 @@ static void tb_dp_init_video_path(struct tb_path *path, bool discover)
 	path->priority = 1;
 	path->weight = 1;
 
-	if (discover) {
-		path->nfc_credits = nfc_credits & ADP_CS_4_NFC_BUFFERS_MASK;
-	} else {
-		u32 max_credits;
+	for (i = 0; i < path->path_length; i++) {
+		u32 nfc_credits = path->hops[i].in_port->config.nfc_credits;
 
-		max_credits = (nfc_credits & ADP_CS_4_TOTAL_BUFFERS_MASK) >>
-			ADP_CS_4_TOTAL_BUFFERS_SHIFT;
-		/* Leave some credits for AUX path */
-		path->nfc_credits = min(max_credits - 2, 12U);
+		if (discover) {
+			path->hops[i].nfc_credits =
+				nfc_credits & ADP_CS_4_NFC_BUFFERS_MASK;
+		} else {
+			u32 max_credits;
+
+			max_credits = (nfc_credits & ADP_CS_4_TOTAL_BUFFERS_MASK) >>
+				ADP_CS_4_TOTAL_BUFFERS_SHIFT;
+			/* Leave some credits for AUX path */
+			path->hops[i].nfc_credits = min(max_credits - 2, 12U);
+		}
 	}
 }
 
@@ -1076,7 +1080,6 @@ static void tb_usb3_init_path(struct tb_path *path)
 	path->priority = 3;
 	path->weight = 3;
 	path->drop_packages = 0;
-	path->nfc_credits = 0;
 	path->hops[0].initial_credits = 7;
 	if (path->path_length > 1)
 		path->hops[1].initial_credits =
-- 
2.30.2

