Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4B0157C9A
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 14:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgBJNnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 08:43:45 -0500
Received: from mga05.intel.com ([192.55.52.43]:14982 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728097AbgBJNnp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 10 Feb 2020 08:43:45 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Feb 2020 05:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; 
   d="scan'208";a="265858452"
Received: from mattu-haswell.fi.intel.com ([10.237.72.170])
  by fmsmga002.fm.intel.com with ESMTP; 10 Feb 2020 05:43:43 -0800
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
To:     <gregkh@linuxfoundation.org>
Cc:     <linux-usb@vger.kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        stable <stable@vger.kernel.org>
Subject: [PATCH 2/4] xhci: Fix memory leak when caching protocol extended capability PSI tables
Date:   Mon, 10 Feb 2020 15:45:51 +0200
Message-Id: <20200210134553.9144-3-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210134553.9144-1-mathias.nyman@linux.intel.com>
References: <20200210134553.9144-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

xhci driver assumed that xHC controllers have at most one custom
supported speed table (PSI) for all usb 3.x ports.
Memory was allocated for one PSI table under the xhci hub structure.

Turns out this is not the case, some controllers have a separate
"supported protocol capability" entry with a PSI table for each port.
This means each usb3 roothub port can in theory support different custom
speeds.

To solve this, cache all supported protocol capabilities with their PSI
tables in an array, and add pointers to the xhci port structure so that
every port points to its capability entry in the array.

When creating the SuperSpeedPlus USB Device Capability BOS descriptor
for the xhci USB 3.1 roothub we for now will use only data from the
first USB 3.1 capable protocol capability entry in the array.
This could be improved later, this patch focuses resolving
the memory leak.

Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
Reported-by: Sajja Venkateswara Rao <VenkateswaraRao.Sajja@amd.com>
Fixes: 47189098f8be ("xhci: parse xhci protocol speed ID list for usb 3.1 usage")
Cc: stable <stable@vger.kernel.org> # v4.4+
Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
---
 drivers/usb/host/xhci-hub.c | 25 +++++++++++-----
 drivers/usb/host/xhci-mem.c | 58 +++++++++++++++++++++++--------------
 drivers/usb/host/xhci.h     | 14 +++++++--
 3 files changed, 64 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index 7a3a29e5e9d2..af92b2576fe9 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -55,6 +55,7 @@ static u8 usb_bos_descriptor [] = {
 static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
 				     u16 wLength)
 {
+	struct xhci_port_cap *port_cap = NULL;
 	int i, ssa_count;
 	u32 temp;
 	u16 desc_size, ssp_cap_size, ssa_size = 0;
@@ -64,16 +65,24 @@ static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
 	ssp_cap_size = sizeof(usb_bos_descriptor) - desc_size;
 
 	/* does xhci support USB 3.1 Enhanced SuperSpeed */
-	if (xhci->usb3_rhub.min_rev >= 0x01) {
+	for (i = 0; i < xhci->num_port_caps; i++) {
+		if (xhci->port_caps[i].maj_rev == 0x03 &&
+		    xhci->port_caps[i].min_rev >= 0x01) {
+			usb3_1 = true;
+			port_cap = &xhci->port_caps[i];
+			break;
+		}
+	}
+
+	if (usb3_1) {
 		/* does xhci provide a PSI table for SSA speed attributes? */
-		if (xhci->usb3_rhub.psi_count) {
+		if (port_cap->psi_count) {
 			/* two SSA entries for each unique PSI ID, RX and TX */
-			ssa_count = xhci->usb3_rhub.psi_uid_count * 2;
+			ssa_count = port_cap->psi_uid_count * 2;
 			ssa_size = ssa_count * sizeof(u32);
 			ssp_cap_size -= 16; /* skip copying the default SSA */
 		}
 		desc_size += ssp_cap_size;
-		usb3_1 = true;
 	}
 	memcpy(buf, &usb_bos_descriptor, min(desc_size, wLength));
 
@@ -99,7 +108,7 @@ static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
 	}
 
 	/* If PSI table exists, add the custom speed attributes from it */
-	if (usb3_1 && xhci->usb3_rhub.psi_count) {
+	if (usb3_1 && port_cap->psi_count) {
 		u32 ssp_cap_base, bm_attrib, psi, psi_mant, psi_exp;
 		int offset;
 
@@ -111,7 +120,7 @@ static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
 
 		/* attribute count SSAC bits 4:0 and ID count SSIC bits 8:5 */
 		bm_attrib = (ssa_count - 1) & 0x1f;
-		bm_attrib |= (xhci->usb3_rhub.psi_uid_count - 1) << 5;
+		bm_attrib |= (port_cap->psi_uid_count - 1) << 5;
 		put_unaligned_le32(bm_attrib, &buf[ssp_cap_base + 4]);
 
 		if (wLength < desc_size + ssa_size)
@@ -124,8 +133,8 @@ static int xhci_create_usb3_bos_desc(struct xhci_hcd *xhci, char *buf,
 		 * USB 3.1 requires two SSA entries (RX and TX) for every link
 		 */
 		offset = desc_size;
-		for (i = 0; i < xhci->usb3_rhub.psi_count; i++) {
-			psi = xhci->usb3_rhub.psi[i];
+		for (i = 0; i < port_cap->psi_count; i++) {
+			psi = port_cap->psi[i];
 			psi &= ~USB_SSP_SUBLINK_SPEED_RSVD;
 			psi_exp = XHCI_EXT_PORT_PSIE(psi);
 			psi_mant = XHCI_EXT_PORT_PSIM(psi);
diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index 0e2701649369..bd5b152df6c0 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1915,17 +1915,16 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
 	xhci->usb3_rhub.num_ports = 0;
 	xhci->num_active_eps = 0;
 	kfree(xhci->usb2_rhub.ports);
-	kfree(xhci->usb2_rhub.psi);
 	kfree(xhci->usb3_rhub.ports);
-	kfree(xhci->usb3_rhub.psi);
 	kfree(xhci->hw_ports);
 	kfree(xhci->rh_bw);
 	kfree(xhci->ext_caps);
+	for (i = 0; i < xhci->num_port_caps; i++)
+		kfree(xhci->port_caps[i].psi);
+	kfree(xhci->port_caps);
 
 	xhci->usb2_rhub.ports = NULL;
-	xhci->usb2_rhub.psi = NULL;
 	xhci->usb3_rhub.ports = NULL;
-	xhci->usb3_rhub.psi = NULL;
 	xhci->hw_ports = NULL;
 	xhci->rh_bw = NULL;
 	xhci->ext_caps = NULL;
@@ -2126,6 +2125,7 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 	u8 major_revision, minor_revision;
 	struct xhci_hub *rhub;
 	struct device *dev = xhci_to_hcd(xhci)->self.sysdev;
+	struct xhci_port_cap *port_cap;
 
 	temp = readl(addr);
 	major_revision = XHCI_EXT_PORT_MAJOR(temp);
@@ -2160,31 +2160,39 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 		/* WTF? "Valid values are ‘1’ to MaxPorts" */
 		return;
 
-	rhub->psi_count = XHCI_EXT_PORT_PSIC(temp);
-	if (rhub->psi_count) {
-		rhub->psi = kcalloc_node(rhub->psi_count, sizeof(*rhub->psi),
-				    GFP_KERNEL, dev_to_node(dev));
-		if (!rhub->psi)
-			rhub->psi_count = 0;
+	port_cap = &xhci->port_caps[xhci->num_port_caps++];
+	if (xhci->num_port_caps > max_caps)
+		return;
+
+	port_cap->maj_rev = major_revision;
+	port_cap->min_rev = minor_revision;
+	port_cap->psi_count = XHCI_EXT_PORT_PSIC(temp);
+
+	if (port_cap->psi_count) {
+		port_cap->psi = kcalloc_node(port_cap->psi_count,
+					     sizeof(*port_cap->psi),
+					     GFP_KERNEL, dev_to_node(dev));
+		if (!port_cap->psi)
+			port_cap->psi_count = 0;
 
-		rhub->psi_uid_count++;
-		for (i = 0; i < rhub->psi_count; i++) {
-			rhub->psi[i] = readl(addr + 4 + i);
+		port_cap->psi_uid_count++;
+		for (i = 0; i < port_cap->psi_count; i++) {
+			port_cap->psi[i] = readl(addr + 4 + i);
 
 			/* count unique ID values, two consecutive entries can
 			 * have the same ID if link is assymetric
 			 */
-			if (i && (XHCI_EXT_PORT_PSIV(rhub->psi[i]) !=
-				  XHCI_EXT_PORT_PSIV(rhub->psi[i - 1])))
-				rhub->psi_uid_count++;
+			if (i && (XHCI_EXT_PORT_PSIV(port_cap->psi[i]) !=
+				  XHCI_EXT_PORT_PSIV(port_cap->psi[i - 1])))
+				port_cap->psi_uid_count++;
 
 			xhci_dbg(xhci, "PSIV:%d PSIE:%d PLT:%d PFD:%d LP:%d PSIM:%d\n",
-				  XHCI_EXT_PORT_PSIV(rhub->psi[i]),
-				  XHCI_EXT_PORT_PSIE(rhub->psi[i]),
-				  XHCI_EXT_PORT_PLT(rhub->psi[i]),
-				  XHCI_EXT_PORT_PFD(rhub->psi[i]),
-				  XHCI_EXT_PORT_LP(rhub->psi[i]),
-				  XHCI_EXT_PORT_PSIM(rhub->psi[i]));
+				  XHCI_EXT_PORT_PSIV(port_cap->psi[i]),
+				  XHCI_EXT_PORT_PSIE(port_cap->psi[i]),
+				  XHCI_EXT_PORT_PLT(port_cap->psi[i]),
+				  XHCI_EXT_PORT_PFD(port_cap->psi[i]),
+				  XHCI_EXT_PORT_LP(port_cap->psi[i]),
+				  XHCI_EXT_PORT_PSIM(port_cap->psi[i]));
 		}
 	}
 	/* cache usb2 port capabilities */
@@ -2219,6 +2227,7 @@ static void xhci_add_in_port(struct xhci_hcd *xhci, unsigned int num_ports,
 			continue;
 		}
 		hw_port->rhub = rhub;
+		hw_port->port_cap = port_cap;
 		rhub->num_ports++;
 	}
 	/* FIXME: Should we disable ports not in the Extended Capabilities? */
@@ -2309,6 +2318,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
 	if (!xhci->ext_caps)
 		return -ENOMEM;
 
+	xhci->port_caps = kcalloc_node(cap_count, sizeof(*xhci->port_caps),
+				flags, dev_to_node(dev));
+	if (!xhci->port_caps)
+		return -ENOMEM;
+
 	offset = cap_start;
 
 	while (offset) {
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 13d8838cd552..3ecee10fdcdc 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1702,12 +1702,20 @@ struct xhci_bus_state {
  * Intel Lynx Point LP xHCI host.
  */
 #define	XHCI_MAX_REXIT_TIMEOUT_MS	20
+struct xhci_port_cap {
+	u32			*psi;	/* array of protocol speed ID entries */
+	u8			psi_count;
+	u8			psi_uid_count;
+	u8			maj_rev;
+	u8			min_rev;
+};
 
 struct xhci_port {
 	__le32 __iomem		*addr;
 	int			hw_portnum;
 	int			hcd_portnum;
 	struct xhci_hub		*rhub;
+	struct xhci_port_cap	*port_cap;
 };
 
 struct xhci_hub {
@@ -1719,9 +1727,6 @@ struct xhci_hub {
 	/* supported prococol extended capabiliy values */
 	u8			maj_rev;
 	u8			min_rev;
-	u32			*psi;	/* array of protocol speed ID entries */
-	u8			psi_count;
-	u8			psi_uid_count;
 };
 
 /* There is one xhci_hcd structure per controller */
@@ -1880,6 +1885,9 @@ struct xhci_hcd {
 	/* cached usb2 extened protocol capabilites */
 	u32                     *ext_caps;
 	unsigned int            num_ext_caps;
+	/* cached extended protocol port capabilities */
+	struct xhci_port_cap	*port_caps;
+	unsigned int		num_port_caps;
 	/* Compliance Mode Recovery Data */
 	struct timer_list	comp_mode_recovery_timer;
 	u32			port_status_u0;
-- 
2.17.1

