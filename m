Return-Path: <linux-usb+bounces-37327-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNuLOXAdA2pD0gEAu9opvQ
	(envelope-from <linux-usb+bounces-37327-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:30:40 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C491520258
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 14:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EFDBA30229C6
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4143938D404;
	Tue, 12 May 2026 12:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDIE15ns"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE114C043B
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778589027; cv=none; b=S1S61+brBUdyZHLYIKrYWwNl2CCD+JEfRP7K3N4IVqU9wTkUO7imkEwC0LXmKXyHrHhC0xriI0j17y1sqGeYjv3r55ZuFhKaVlmz+sQVWUW1bTcxrp8syiVd6B/DY22XqbOMdAjK4KXskk1rFDEDhxpFu+hAGFWfxNAbeoezDdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778589027; c=relaxed/simple;
	bh=6kwjQDQYRdy0HpCEPae8ahc8A5cW26SjG/3247DB+vg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6Dd/DtoQPondKvJ3aR/kaWimsMdMX0+GIkTgnTUnL3CRyiEVaeyrc6G9W6UyXxio/gzel7BVTC6ymNusvS2tWorvi5mClhdDXdekG8vcHjCh1fnISR9PR7Z8cANCOch7Rdq3k9JF8K8q5FTQMxVwSfcIqhuuT9Yg9afjF57N60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDIE15ns; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778589021; x=1810125021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6kwjQDQYRdy0HpCEPae8ahc8A5cW26SjG/3247DB+vg=;
  b=aDIE15nsZ4mhfxX/Aap5mJ3K6nMZVtzoy0k4limu5j/cHVkwJwJSyNF+
   Ph2ePE3D6OlFIvcVFrYJCmWfx25EzqYrxrqF4SW1pX1Uq6xbjzRVi6knS
   KaZagNzvJIHkk9hGfhbthyIIbtFohP5nwLdtziVPUxX+k7tleRic9Tz0i
   0N+9OLLCMYFYn0LfDGcpRORuAcUNWvz3j6SweEmXV6Jwv7gMcxDHYdGkf
   8bMqrPXJOgVN1qJw1bNVa/pGmqkhD3P6BAh0sZXf7ZE4WADnJ67uLsXFE
   FnGcfd2WgmZED4i785X135vVY0IXJgfSzs8N1Zjr5xmQWC9RJ4jhM7/WS
   g==;
X-CSE-ConnectionGUID: DgHVGPZFRVCKqVtfRR+gyw==
X-CSE-MsgGUID: 0JaFofu8SYSJIuyEbEBh+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="104950611"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="104950611"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 05:30:01 -0700
X-CSE-ConnectionGUID: TLM6KiHCSPuBu80dV6EQgQ==
X-CSE-MsgGUID: FaYryi/7RhOBTfHE7e4qhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="234692696"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2026 05:29:59 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C4B03A1; Tue, 12 May 2026 14:29:55 +0200 (CEST)
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH 5/8] thunderbolt: Verify PCIe adapter in detect state before tunnel setup
Date: Tue, 12 May 2026 14:29:52 +0200
Message-ID: <20260512122955.271688-6-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
References: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8C491520258
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37327-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.intel.com:mid,intel.com:email,intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

From: Gil Fine <gil.fine@linux.intel.com>

The USB4 Connection Manager guide suggests that a PCIe downstream and
PCIe upstream adapters of the USB4 router is in the Detect state before
setting up a PCIe tunnel.

Add this check by verifying the LTSSM field in ADP_PCIE_CS_0 before
tunnel setup.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/thunderbolt/tb.h      |  1 +
 drivers/thunderbolt/tb_regs.h | 15 +++++++++++++++
 drivers/thunderbolt/tunnel.c  | 35 +++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/usb4.c    | 24 ++++++++++++++++++++++++
 4 files changed, 75 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index 229b9e7961fb..d86919474fdb 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1481,6 +1481,7 @@ int usb4_dp_port_allocate_bandwidth(struct tb_port *port, int bw);
 int usb4_dp_port_requested_bandwidth(struct tb_port *port);
 
 int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable);
+int usb4_pci_port_ltssm_state(struct tb_port *port);
 
 static inline bool tb_is_usb4_port_device(const struct device *dev)
 {
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index c0bf136236e6..75131fcfe044 100644
--- a/drivers/thunderbolt/tb_regs.h
+++ b/drivers/thunderbolt/tb_regs.h
@@ -473,10 +473,25 @@ struct tb_regs_port_header {
 
 /* PCIe adapter registers */
 #define ADP_PCIE_CS_0				0x00
+#define ADP_PCIE_CS_0_LTSSM_MASK		GENMASK(28, 25)
 #define ADP_PCIE_CS_0_PE			BIT(31)
 #define ADP_PCIE_CS_1				0x01
 #define ADP_PCIE_CS_1_EE			BIT(0)
 
+enum tb_pcie_ltssm_state {
+	USB4_PCIE_LTSSM_DETECT,
+	USB4_PCIE_LTSSM_POLLING,
+	USB4_PCIE_LTSSM_CONFIG,
+	USB4_PCIE_LTSSM_CONFIG_IDLE,
+	USB4_PCIE_LTSSM_RECOVERY,
+	USB4_PCIE_LTSSM_RECOVERY_IDLE,
+	USB4_PCIE_LTSSM_L0,
+	USB4_PCIE_LTSSM_L1,
+	USB4_PCIE_LTSSM_L2,
+	USB4_PCIE_LTSSM_DISABLED,
+	USB4_PCIE_LTSSM_HOT_RESET,
+};
+
 /* USB adapter registers */
 #define ADP_USB3_CS_0				0x00
 #define ADP_USB3_CS_0_V				BIT(30)
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index f38f7753b6e4..b7f32305f14a 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -290,6 +290,40 @@ static inline void tb_tunnel_changed(struct tb_tunnel *tunnel)
 			tunnel->src_port, tunnel->dst_port);
 }
 
+static int tb_pci_port_ltssm_state_detect(struct tb_port *port)
+{
+	ktime_t timeout = ktime_add_ms(ktime_get(), 500);
+
+	do {
+		int ret;
+
+		ret = usb4_pci_port_ltssm_state(port);
+		if (ret < 0)
+			return ret;
+		if (ret == USB4_PCIE_LTSSM_DETECT)
+			return 0;
+
+		fsleep(50);
+	} while (ktime_before(ktime_get(), timeout));
+
+	return -ETIMEDOUT;
+}
+
+static int tb_pci_pre_activate(struct tb_tunnel *tunnel)
+{
+	struct tb_port *down = tunnel->src_port;
+	struct tb_port *up = tunnel->dst_port;
+	int ret;
+
+	ret = tb_switch_is_usb4(down->sw) ?
+		tb_pci_port_ltssm_state_detect(down) : 0;
+	if (ret)
+		return ret;
+
+	return tb_switch_is_usb4(up->sw) ?
+		tb_pci_port_ltssm_state_detect(up) : 0;
+}
+
 static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
 {
 	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
@@ -505,6 +539,7 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 	if (!tunnel)
 		return NULL;
 
+	tunnel->pre_activate = tb_pci_pre_activate;
 	tunnel->activate = tb_pci_activate;
 	tunnel->src_port = down;
 	tunnel->dst_port = up;
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 9e810b2ae0b5..6f76bcaefa49 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -3145,3 +3145,27 @@ int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable)
 	return tb_port_write(port, &val, TB_CFG_PORT,
 			     port->cap_adap + ADP_PCIE_CS_1, 1);
 }
+
+/**
+ * usb4_pci_port_ltssm_state() - Read PCIe adapter LTSSM state
+ * @port: PCIe adapter
+ *
+ * Return:
+ * * LTSSM state of @port.
+ * * Negative errno - On failure.
+ */
+int usb4_pci_port_ltssm_state(struct tb_port *port)
+{
+	u32 val;
+	int ret;
+
+	if (!tb_port_is_pcie_down(port) && !tb_port_is_pcie_up(port))
+		return -EINVAL;
+
+	ret = tb_port_read(port, &val, TB_CFG_PORT,
+			   port->cap_adap + ADP_PCIE_CS_0, 1);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(ADP_PCIE_CS_0_LTSSM_MASK, val);
+}
-- 
2.50.1


