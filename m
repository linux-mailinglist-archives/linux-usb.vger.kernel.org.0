Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61456387AB8
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 16:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349819AbhEROLM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 10:11:12 -0400
Received: from mga04.intel.com ([192.55.52.120]:3122 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349811AbhEROLL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 10:11:11 -0400
IronPort-SDR: SmCbS1vdrK5LeDYTie1EhxwMCVzGYd4jXNgclRZGVSW5Km/DEm6ZxSxVA4rNjwYZJd29V/mdJ7
 2ACMLED9DPmA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="198769228"
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="198769228"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2021 07:09:43 -0700
IronPort-SDR: P0QiWHTh12QzIUI1u2KxcRJ9mF+ki4eM5HePqY2gqRptbS2xwuJhhFNRs+QZ0QWWStZZH0vf3I
 7cW/doCwlSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,310,1613462400"; 
   d="scan'208";a="630452398"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 18 May 2021 07:09:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 99BDD796; Tue, 18 May 2021 17:10:02 +0300 (EEST)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Casey G Bowman <casey.g.bowman@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 4/8] thunderbolt: Read router preferred credit allocation information
Date:   Tue, 18 May 2021 17:09:58 +0300
Message-Id: <20210518141002.63616-5-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
References: <20210518141002.63616-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

USB4 routers must expose their preferred credit (buffer) allocation
information through router operation. This information tells the
connection manager how the router prefers its buffers to be allocated to
get the expected bandwidth for the supported protocols.

Read this information and store it as part of struct tb_switch for each
USB4 router.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/switch.c  |  51 +++++++++--
 drivers/thunderbolt/tb.h      |  22 +++++
 drivers/thunderbolt/tb_regs.h |   1 +
 drivers/thunderbolt/usb4.c    | 155 ++++++++++++++++++++++++++++++++++
 4 files changed, 221 insertions(+), 8 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index d5420eefe25d..ac6cb304c49f 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -488,17 +488,21 @@ static const char *tb_port_type(const struct tb_regs_port_header *port)
 	}
 }
 
-static void tb_dump_port(struct tb *tb, struct tb_regs_port_header *port)
+static void tb_dump_port(struct tb *tb, const struct tb_port *port)
 {
+	const struct tb_regs_port_header *regs = &port->config;
+
 	tb_dbg(tb,
 	       " Port %d: %x:%x (Revision: %d, TB Version: %d, Type: %s (%#x))\n",
-	       port->port_number, port->vendor_id, port->device_id,
-	       port->revision, port->thunderbolt_version, tb_port_type(port),
-	       port->type);
+	       regs->port_number, regs->vendor_id, regs->device_id,
+	       regs->revision, regs->thunderbolt_version, tb_port_type(regs),
+	       regs->type);
 	tb_dbg(tb, "  Max hop id (in/out): %d/%d\n",
-	       port->max_in_hop_id, port->max_out_hop_id);
-	tb_dbg(tb, "  Max counters: %d\n", port->max_counters);
-	tb_dbg(tb, "  NFC Credits: %#x\n", port->nfc_credits);
+	       regs->max_in_hop_id, regs->max_out_hop_id);
+	tb_dbg(tb, "  Max counters: %d\n", regs->max_counters);
+	tb_dbg(tb, "  NFC Credits: %#x\n", regs->nfc_credits);
+	tb_dbg(tb, "  Credits (total/control): %u/%u\n", port->total_credits,
+	       port->ctl_credits);
 }
 
 /**
@@ -738,13 +742,32 @@ static int tb_init_port(struct tb_port *port)
 		cap = tb_port_find_cap(port, TB_PORT_CAP_USB4);
 		if (cap > 0)
 			port->cap_usb4 = cap;
+
+		/*
+		 * USB4 ports the buffers allocated for the control path
+		 * can be read from the path config space. Legacy
+		 * devices we use hard-coded value.
+		 */
+		if (tb_switch_is_usb4(port->sw)) {
+			struct tb_regs_hop hop;
+
+			if (!tb_port_read(port, &hop, TB_CFG_HOPS, 0, 2))
+				port->ctl_credits = hop.initial_credits;
+		}
+		if (!port->ctl_credits)
+			port->ctl_credits = 2;
+
 	} else if (port->port != 0) {
 		cap = tb_port_find_cap(port, TB_PORT_CAP_ADAP);
 		if (cap > 0)
 			port->cap_adap = cap;
 	}
 
-	tb_dump_port(port->sw->tb, &port->config);
+	port->total_credits =
+		(port->config.nfc_credits & ADP_CS_4_TOTAL_BUFFERS_MASK) >>
+		ADP_CS_4_TOTAL_BUFFERS_SHIFT;
+
+	tb_dump_port(port->sw->tb, port);
 
 	INIT_LIST_HEAD(&port->list);
 	return 0;
@@ -2575,6 +2598,16 @@ void tb_switch_unconfigure_link(struct tb_switch *sw)
 		tb_lc_unconfigure_port(down);
 }
 
+static void tb_switch_credits_init(struct tb_switch *sw)
+{
+	if (tb_switch_is_icm(sw))
+		return;
+	if (!tb_switch_is_usb4(sw))
+		return;
+	if (usb4_switch_credits_init(sw))
+		tb_sw_info(sw, "failed to determine preferred buffer allocation, using defaults\n");
+}
+
 /**
  * tb_switch_add() - Add a switch to the domain
  * @sw: Switch to add
@@ -2605,6 +2638,8 @@ int tb_switch_add(struct tb_switch *sw)
 	}
 
 	if (!sw->safe_mode) {
+		tb_switch_credits_init(sw);
+
 		/* read drom */
 		ret = tb_drom_read(sw);
 		if (ret) {
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e6c5e8fc7de7..a8190009815c 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -136,6 +136,12 @@ struct tb_switch_tmu {
  * @rpm_complete: Completion used to wait for runtime resume to
  *		  complete (ICM only)
  * @quirks: Quirks used for this Thunderbolt switch
+ * @credit_allocation: Are the below buffer allocation parameters valid
+ * @max_usb3_credits: Router preferred number of buffers for USB 3.x
+ * @min_dp_aux_credits: Router preferred minimum number of buffers for DP AUX
+ * @min_dp_main_credits: Router preferred minimum number of buffers for DP MAIN
+ * @max_pcie_credits: Router preferred number of buffers for PCIe
+ * @max_dma_credits: Router preferred number of buffers for DMA/P2P
  *
  * When the switch is being added or removed to the domain (other
  * switches) you need to have domain lock held.
@@ -178,6 +184,12 @@ struct tb_switch {
 	u8 depth;
 	struct completion rpm_complete;
 	unsigned long quirks;
+	bool credit_allocation;
+	unsigned int max_usb3_credits;
+	unsigned int min_dp_aux_credits;
+	unsigned int min_dp_main_credits;
+	unsigned int max_pcie_credits;
+	unsigned int max_dma_credits;
 };
 
 /**
@@ -199,6 +211,8 @@ struct tb_switch {
  * @in_hopids: Currently allocated input HopIDs
  * @out_hopids: Currently allocated output HopIDs
  * @list: Used to link ports to DP resources list
+ * @total_credits: Total number of buffers available for this port
+ * @ctl_credits: Buffers reserved for control path
  *
  * In USB4 terminology this structure represents an adapter (protocol or
  * lane adapter).
@@ -220,6 +234,8 @@ struct tb_port {
 	struct ida in_hopids;
 	struct ida out_hopids;
 	struct list_head list;
+	unsigned int total_credits;
+	unsigned int ctl_credits;
 };
 
 /**
@@ -866,6 +882,11 @@ void tb_port_release_out_hopid(struct tb_port *port, int hopid);
 struct tb_port *tb_next_port_on_path(struct tb_port *start, struct tb_port *end,
 				     struct tb_port *prev);
 
+static inline bool tb_port_use_credit_allocation(const struct tb_port *port)
+{
+	return tb_port_is_null(port) && port->sw->credit_allocation;
+}
+
 /**
  * tb_for_each_port_on_path() - Iterate over each port on path
  * @src: Source port
@@ -994,6 +1015,7 @@ int usb4_switch_nvm_write(struct tb_switch *sw, unsigned int address,
 			  const void *buf, size_t size);
 int usb4_switch_nvm_authenticate(struct tb_switch *sw);
 int usb4_switch_nvm_authenticate_status(struct tb_switch *sw, u32 *status);
+int usb4_switch_credits_init(struct tb_switch *sw);
 bool usb4_switch_query_dp_resource(struct tb_switch *sw, struct tb_port *in);
 int usb4_switch_alloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
 int usb4_switch_dealloc_dp_resource(struct tb_switch *sw, struct tb_port *in);
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index 113d7903b183..484f25be2849 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -229,6 +229,7 @@ enum usb4_switch_op {
 	USB4_SWITCH_OP_NVM_SET_OFFSET = 0x23,
 	USB4_SWITCH_OP_DROM_READ = 0x24,
 	USB4_SWITCH_OP_NVM_SECTOR_SIZE = 0x25,
+	USB4_SWITCH_OP_BUFFER_ALLOC = 0x33,
 };
 
 /* Router TMU configuration */
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index b56af7b0a093..edab8ea63c0b 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -36,6 +36,20 @@ enum usb4_sb_target {
 
 #define USB4_NVM_SECTOR_SIZE_MASK	GENMASK(23, 0)
 
+#define USB4_BA_LENGTH_MASK		GENMASK(7, 0)
+#define USB4_BA_INDEX_MASK		GENMASK(15, 0)
+
+enum usb4_ba_index {
+	USB4_BA_MAX_USB3 = 0x1,
+	USB4_BA_MIN_DP_AUX = 0x2,
+	USB4_BA_MIN_DP_MAIN = 0x3,
+	USB4_BA_MAX_PCIE = 0x4,
+	USB4_BA_MAX_HI = 0x5,
+};
+
+#define USB4_BA_VALUE_MASK		GENMASK(31, 16)
+#define USB4_BA_VALUE_SHIFT		16
+
 static int usb4_switch_wait_for_bit(struct tb_switch *sw, u32 offset, u32 bit,
 				    u32 value, int timeout_msec)
 {
@@ -669,6 +683,147 @@ int usb4_switch_nvm_authenticate_status(struct tb_switch *sw, u32 *status)
 	return 0;
 }
 
+/**
+ * usb4_switch_credits_init() - Read buffer allocation parameters
+ * @sw: USB4 router
+ *
+ * Reads @sw buffer allocation parameters and initializes @sw buffer
+ * allocation fields accordingly. Specifically @sw->credits_allocation
+ * is set to %true if these parameters can be used in tunneling.
+ *
+ * Returns %0 on success and negative errno otherwise.
+ */
+int usb4_switch_credits_init(struct tb_switch *sw)
+{
+	int max_usb3, min_dp_aux, min_dp_main, max_pcie, max_dma;
+	int ret, length, i, nports;
+	const struct tb_port *port;
+	u32 data[NVM_DATA_DWORDS];
+	u32 metadata = 0;
+	u8 status = 0;
+
+	memset(data, 0, sizeof(data));
+	ret = usb4_switch_op_data(sw, USB4_SWITCH_OP_BUFFER_ALLOC, &metadata,
+				  &status, NULL, 0, data, ARRAY_SIZE(data));
+	if (ret)
+		return ret;
+	if (status)
+		return -EIO;
+
+	length = metadata & USB4_BA_LENGTH_MASK;
+	if (WARN_ON(length > ARRAY_SIZE(data)))
+		return -EMSGSIZE;
+
+	max_usb3 = -1;
+	min_dp_aux = -1;
+	min_dp_main = -1;
+	max_pcie = -1;
+	max_dma = -1;
+
+	tb_sw_dbg(sw, "credit allocation parameters:\n");
+
+	for (i = 0; i < length; i++) {
+		u16 index, value;
+
+		index = data[i] & USB4_BA_INDEX_MASK;
+		value = (data[i] & USB4_BA_VALUE_MASK) >> USB4_BA_VALUE_SHIFT;
+
+		switch (index) {
+		case USB4_BA_MAX_USB3:
+			tb_sw_dbg(sw, " USB3: %u\n", value);
+			max_usb3 = value;
+			break;
+		case USB4_BA_MIN_DP_AUX:
+			tb_sw_dbg(sw, " DP AUX: %u\n", value);
+			min_dp_aux = value;
+			break;
+		case USB4_BA_MIN_DP_MAIN:
+			tb_sw_dbg(sw, " DP main: %u\n", value);
+			min_dp_main = value;
+			break;
+		case USB4_BA_MAX_PCIE:
+			tb_sw_dbg(sw, " PCIe: %u\n", value);
+			max_pcie = value;
+			break;
+		case USB4_BA_MAX_HI:
+			tb_sw_dbg(sw, " DMA: %u\n", value);
+			max_dma = value;
+			break;
+		default:
+			tb_sw_dbg(sw, " unknown credit allocation index %#x, skipping\n",
+				  index);
+			break;
+		}
+	}
+
+	/*
+	 * Validate the buffer allocation preferences. If we find
+	 * issues, log a warning and fall back using the hard-coded
+	 * values.
+	 */
+
+	/* Host router must report baMaxHI */
+	if (!tb_route(sw) && max_dma < 0) {
+		tb_sw_warn(sw, "host router is missing baMaxHI\n");
+		goto err_invalid;
+	}
+
+	nports = 0;
+	tb_switch_for_each_port(sw, port) {
+		if (tb_port_is_null(port))
+			nports++;
+	}
+
+	/* Must have DP buffer allocation (multiple USB4 ports) */
+	if (nports > 2 && (min_dp_aux < 0 || min_dp_main < 0)) {
+		tb_sw_warn(sw, "multiple USB4 ports require baMinDPaux/baMinDPmain\n");
+		goto err_invalid;
+	}
+
+	tb_switch_for_each_port(sw, port) {
+		if (tb_port_is_dpout(port) && min_dp_main < 0) {
+			tb_sw_warn(sw, "missing baMinDPmain");
+			goto err_invalid;
+		}
+		if ((tb_port_is_dpin(port) || tb_port_is_dpout(port)) &&
+		    min_dp_aux < 0) {
+			tb_sw_warn(sw, "missing baMinDPaux");
+			goto err_invalid;
+		}
+		if ((tb_port_is_usb3_down(port) || tb_port_is_usb3_up(port)) &&
+		    max_usb3 < 0) {
+			tb_sw_warn(sw, "missing baMaxUSB3");
+			goto err_invalid;
+		}
+		if ((tb_port_is_pcie_down(port) || tb_port_is_pcie_up(port)) &&
+		    max_pcie < 0) {
+			tb_sw_warn(sw, "missing baMaxPCIe");
+			goto err_invalid;
+		}
+	}
+
+	/*
+	 * Buffer allocation passed the validation so we can use it in
+	 * path creation.
+	 */
+	sw->credit_allocation = true;
+	if (max_usb3 > 0)
+		sw->max_usb3_credits = max_usb3;
+	if (min_dp_aux > 0)
+		sw->min_dp_aux_credits = min_dp_aux;
+	if (min_dp_main > 0)
+		sw->min_dp_main_credits = min_dp_main;
+	if (max_pcie > 0)
+		sw->max_pcie_credits = max_pcie;
+	if (max_dma > 0)
+		sw->max_dma_credits = max_dma;
+
+	return 0;
+
+err_invalid:
+	return -EINVAL;
+}
+
 /**
  * usb4_switch_query_dp_resource() - Query availability of DP IN resource
  * @sw: USB4 router
-- 
2.30.2

