Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 482B872BB46
	for <lists+linux-usb@lfdr.de>; Mon, 12 Jun 2023 10:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234097AbjFLIxd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Jun 2023 04:53:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233668AbjFLIxB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Jun 2023 04:53:01 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8AE1FE9
        for <linux-usb@vger.kernel.org>; Mon, 12 Jun 2023 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686559943; x=1718095943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uK14nIFmHfp4OUokX9zi3VVxUWRvaclzLgvYv5QixDU=;
  b=iC2o4/Q86qBo+y3zXl72oLlJH8ktR7SSluPJ68OqoikWWXrrrNNXDjlz
   EI/xA8LFq3sEUr+NWfxaFPOLuP4Hb4+v7osSQTA6ymhFXxP4bhr89gBI+
   wltcnirUylIs7jPM/Okm9Y9o6UfQAr8T5piLifnzCkU9avFJRVDawlHnk
   2QRttwSaJv8ImwNPCbxD9XUzAnVou2Q+vXRaEsZf0Ioyh/7Rq+2K7Yi75
   vGrCDmVljUm2sVF1G4jcNisZtjUq7nk6pekSvNqkIbjTlYLsbx8KGSDb1
   eeI6Y0imoGrvG0Ty+pJUPXNvPIX6NBK8BkVC6myMmhj6gasLTjpnBwDST
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347627267"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="347627267"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 01:21:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="744247745"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="744247745"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 12 Jun 2023 01:21:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 881E5690; Mon, 12 Jun 2023 11:21:45 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Gil Fine <gil.fine@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 06/20] thunderbolt: Reset USB4 v2 host router
Date:   Mon, 12 Jun 2023 11:21:31 +0300
Message-Id: <20230612082145.62218-7-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
References: <20230612082145.62218-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 v2 added a bit that can be used to reset the host router so we use
this to trigger reset when the driver probes. This will reset the
already connected topology as well but doing this simplifies things a
lot if for instance the link is already set to asymmetric. We also add
a module parameter to prevent this in case of problems.

While there rename the REG_HOP_COUNT to REG_CAPS to match the USB4 spec
naming better.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/nhi.c      | 39 +++++++++++++++++++++++++++++++++-
 drivers/thunderbolt/nhi_regs.h | 19 +++++++++++------
 2 files changed, 50 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index a979f47109e3..116016695a6a 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -46,6 +46,10 @@
 #define QUIRK_AUTO_CLEAR_INT	BIT(0)
 #define QUIRK_E2E		BIT(1)
 
+static bool host_reset = true;
+module_param(host_reset, bool, 0444);
+MODULE_PARM_DESC(host_reset, "reset USBv2 host router (default: true)");
+
 static int ring_interrupt_index(const struct tb_ring *ring)
 {
 	int bit = ring->hop;
@@ -1217,6 +1221,37 @@ static void nhi_check_iommu(struct tb_nhi *nhi)
 		str_enabled_disabled(port_ok));
 }
 
+static void nhi_reset(struct tb_nhi *nhi)
+{
+	ktime_t timeout;
+	u32 val;
+
+	val = ioread32(nhi->iobase + REG_CAPS);
+	/* Reset only v2 and later routers */
+	if (FIELD_GET(REG_CAPS_VERSION_MASK, val) < REG_CAPS_VERSION_2)
+		return;
+
+	if (!host_reset) {
+		dev_dbg(&nhi->pdev->dev, "skipping host router reset\n");
+		return;
+	}
+
+	iowrite32(REG_RESET_HRR, nhi->iobase + REG_RESET);
+	msleep(100);
+
+	timeout = ktime_add_ms(ktime_get(), 500);
+	do {
+		val = ioread32(nhi->iobase + REG_RESET);
+		if (!(val & REG_RESET_HRR)) {
+			dev_warn(&nhi->pdev->dev, "host router reset successful\n");
+			return;
+		}
+		usleep_range(10, 20);
+	} while (ktime_before(ktime_get(), timeout));
+
+	dev_warn(&nhi->pdev->dev, "timeout resetting host router\n");
+}
+
 static int nhi_init_msi(struct tb_nhi *nhi)
 {
 	struct pci_dev *pdev = nhi->pdev;
@@ -1317,7 +1352,7 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	nhi->ops = (const struct tb_nhi_ops *)id->driver_data;
 	/* cannot fail - table is allocated in pcim_iomap_regions */
 	nhi->iobase = pcim_iomap_table(pdev)[0];
-	nhi->hop_count = ioread32(nhi->iobase + REG_HOP_COUNT) & 0x3ff;
+	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
 
 	nhi->tx_rings = devm_kcalloc(&pdev->dev, nhi->hop_count,
@@ -1330,6 +1365,8 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	nhi_check_quirks(nhi);
 	nhi_check_iommu(nhi);
 
+	nhi_reset(nhi);
+
 	res = nhi_init_msi(nhi);
 	if (res)
 		return dev_err_probe(dev, res, "cannot enable MSI, aborting\n");
diff --git a/drivers/thunderbolt/nhi_regs.h b/drivers/thunderbolt/nhi_regs.h
index 6ba295815477..297a3e440648 100644
--- a/drivers/thunderbolt/nhi_regs.h
+++ b/drivers/thunderbolt/nhi_regs.h
@@ -37,7 +37,7 @@ struct ring_desc {
 /* NHI registers in bar 0 */
 
 /*
- * 16 bytes per entry, one entry for every hop (REG_HOP_COUNT)
+ * 16 bytes per entry, one entry for every hop (REG_CAPS)
  * 00: physical pointer to an array of struct ring_desc
  * 08: ring tail (set by NHI)
  * 10: ring head (index of first non posted descriptor)
@@ -46,7 +46,7 @@ struct ring_desc {
 #define REG_TX_RING_BASE	0x00000
 
 /*
- * 16 bytes per entry, one entry for every hop (REG_HOP_COUNT)
+ * 16 bytes per entry, one entry for every hop (REG_CAPS)
  * 00: physical pointer to an array of struct ring_desc
  * 08: ring head (index of first not posted descriptor)
  * 10: ring tail (set by NHI)
@@ -56,7 +56,7 @@ struct ring_desc {
 #define REG_RX_RING_BASE	0x08000
 
 /*
- * 32 bytes per entry, one entry for every hop (REG_HOP_COUNT)
+ * 32 bytes per entry, one entry for every hop (REG_CAPS)
  * 00: enum_ring_flags
  * 04: isoch time stamp ?? (write 0)
  * ..: unknown
@@ -64,7 +64,7 @@ struct ring_desc {
 #define REG_TX_OPTIONS_BASE	0x19800
 
 /*
- * 32 bytes per entry, one entry for every hop (REG_HOP_COUNT)
+ * 32 bytes per entry, one entry for every hop (REG_CAPS)
  * 00: enum ring_flags
  *     If RING_FLAG_E2E_FLOW_CONTROL is set then bits 13-23 must be set to
  *     the corresponding TX hop id.
@@ -77,7 +77,7 @@ struct ring_desc {
 
 /*
  * three bitfields: tx, rx, rx overflow
- * Every bitfield contains one bit for every hop (REG_HOP_COUNT).
+ * Every bitfield contains one bit for every hop (REG_CAPS).
  * New interrupts are fired only after ALL registers have been
  * read (even those containing only disabled rings).
  */
@@ -87,7 +87,7 @@ struct ring_desc {
 
 /*
  * two bitfields: rx, tx
- * Both bitfields contains one bit for every hop (REG_HOP_COUNT). To
+ * Both bitfields contains one bit for every hop (REG_CAPS). To
  * enable/disable interrupts set/clear the corresponding bits.
  */
 #define REG_RING_INTERRUPT_BASE	0x38200
@@ -104,12 +104,17 @@ struct ring_desc {
 #define REG_INT_VEC_ALLOC_REGS	(32 / REG_INT_VEC_ALLOC_BITS)
 
 /* The last 11 bits contain the number of hops supported by the NHI port. */
-#define REG_HOP_COUNT		0x39640
+#define REG_CAPS			0x39640
+#define REG_CAPS_VERSION_MASK		GENMASK(23, 16)
+#define REG_CAPS_VERSION_2		0x40
 
 #define REG_DMA_MISC			0x39864
 #define REG_DMA_MISC_INT_AUTO_CLEAR     BIT(2)
 #define REG_DMA_MISC_DISABLE_AUTO_CLEAR	BIT(17)
 
+#define REG_RESET			0x39898
+#define REG_RESET_HRR			BIT(0)
+
 #define REG_INMAIL_DATA			0x39900
 
 #define REG_INMAIL_CMD			0x39904
-- 
2.39.2

