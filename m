Return-Path: <linux-usb+bounces-32745-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MqkL4fkd2k9mQEAu9opvQ
	(envelope-from <linux-usb+bounces-32745-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:02:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 402EE8DCB2
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 23:02:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 754FF302F416
	for <lists+linux-usb@lfdr.de>; Mon, 26 Jan 2026 22:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C984302140;
	Mon, 26 Jan 2026 22:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5vrGTiv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED582FF154
	for <linux-usb@vger.kernel.org>; Mon, 26 Jan 2026 22:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769464953; cv=none; b=XZDq/4b9/7u9G+op4xByZDsiLNuNPR60oQRlOa7ZicQrnqSy27L9TOv9ucq1MZuB+e/EWSD9CSNeeDrWhlQrpdYEX2kc3NRYTCwJCRDyGasndAGiTC7DnPtN2xaCIK5Ivuh6y0eIrkfFhq/wngRxjOkSbRdeva4b2Pga3nesfV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769464953; c=relaxed/simple;
	bh=tGmhHZ6YtGj+bJrS0bRUEg0kF+TUlAdYtcXWJYQIatY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dupUd4IyeO5oK+prkTPece/9lHYjp7l/4onax9xoLYrBAQ8FEG+djnUhEEQpacWudYP6Z+A9408XrIab4JQkk5L64fJfaYHWbvv3ZAg5bTOKLsCNbqUYbdeQgk/0KD/8KqvvSIx+zk/ubASMwsI3Es17QbToPKPF4S9rVUFBFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5vrGTiv; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769464950; x=1801000950;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tGmhHZ6YtGj+bJrS0bRUEg0kF+TUlAdYtcXWJYQIatY=;
  b=S5vrGTivUZ4saBQgMS+Zl1Jz8gTDGZEAF2AeWy4gx3seDn95gDm2JXjD
   4OEJHiDx+wXFUdlzojJx3pkzI4raxrtN3tPN6RMnyW0c+yZptXwOgwtmU
   yeiMaa6VKbBKyOGrVICIFmHHE15xE7nHMxzqTeuPrK4qKt6bO4Qyp/5s3
   HDGdZ0S3PovHLEerSTS9CbscgYHYAezAeSAi9cDi9NQMTxzs3OEpSLmxp
   0W1s8qu+r1bedz5249tf/6QSVDPtV24z2J6BzLLxdrkuqBlBrIiHNsq2j
   7m5utf/wVmMsxYYAA82xKqEq3ULXbXEUUxSuYUutQaGZVHUteQa6LueZL
   A==;
X-CSE-ConnectionGUID: aSqm0d4nSralDd54AhMBUA==
X-CSE-MsgGUID: tBE+QKnzSjWdnfHspKAWGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="82019760"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="82019760"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 14:02:29 -0800
X-CSE-ConnectionGUID: I/5Yr2VtTEW237N/tLe46A==
X-CSE-MsgGUID: dNN9arlbT22fjB2zS4dwJg==
X-ExtLoop1: 1
Received: from cdjpc409-it.jer.intel.com ([10.12.50.120])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2026 14:02:27 -0800
From: Gil Fine <gil.fine@linux.intel.com>
To: andreas.noever@gmail.com,
	mika.westerberg@linux.intel.com,
	YehezkelShB@gmail.com
Cc: gil.fine@intel.com,
	linux-usb@vger.kernel.org,
	lukas@wunner.de,
	Gil Fine <gil.fine@linux.intel.com>
Subject: [PATCH 2/5] thunderbolt: Verify PCIe adapters in detect state before setup PCIe tunnel
Date: Tue, 27 Jan 2026 00:06:03 +0200
Message-ID: <20260126220606.3476657-3-gil.fine@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126220606.3476657-1-gil.fine@linux.intel.com>
References: <20260126220606.3476657-1-gil.fine@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-32745-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gil.fine@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 402EE8DCB2
X-Rspamd-Action: no action

USB4 Connection Manager guide suggests making sure PCIe downstream and PCIe
upstream adapter is in Detect state, before set up a PCIe tunnel.

Add this step by checking LTSSM field in ADP_PCIE_CS_0 to follow the CM
guide more closely.

Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
---
 drivers/thunderbolt/tb.h      |  2 ++
 drivers/thunderbolt/tb_regs.h | 15 +++++++++++++++
 drivers/thunderbolt/tunnel.c  | 17 +++++++++++++++++
 drivers/thunderbolt/usb4.c    | 23 +++++++++++++++++++++++
 4 files changed, 57 insertions(+)

diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index c2ff2069eb20..dbbbd2bd63f3 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -1480,6 +1480,8 @@ int usb4_dp_port_allocate_bandwidth(struct tb_port *port, int bw);
 int usb4_dp_port_requested_bandwidth(struct tb_port *port);
 
 int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable);
+int usb4_pci_port_check_ltssm_state(struct tb_port *port,
+				    enum tb_pcie_ltssm_state ltssm);
 
 static inline bool tb_is_usb4_port_device(const struct device *dev)
 {
diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
index c0bf136236e6..71bed02a6974 100644
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
+	TB_PCIE_LTSSM_DETECT		= 0x0,
+	TB_PCIE_LTSSM_POLLING		= 0x1,
+	TB_PCIE_LTSSM_CONFIG		= 0x2,
+	TB_PCIE_LTSSM_CONFIG_IDLE	= 0x3,
+	TB_PCIE_LTSSM_RECOVERY		= 0x4,
+	TB_PCIE_LTSSM_RECOVERY_IDLE	= 0x5,
+	TB_PCIE_LTSSM_L0		= 0x6,
+	TB_PCIE_LTSSM_L1		= 0x7,
+	TB_PCIE_LTSSM_L2		= 0x8,
+	TB_PCIE_LTSSM_DISABLED		= 0x9,
+	TB_PCIE_LTSSM_HOT_RESET		= 0xa,
+};
+
 /* USB adapter registers */
 #define ADP_USB3_CS_0				0x00
 #define ADP_USB3_CS_0_V				BIT(30)
diff --git a/drivers/thunderbolt/tunnel.c b/drivers/thunderbolt/tunnel.c
index 28c1e5c062f3..72beaf99765f 100644
--- a/drivers/thunderbolt/tunnel.c
+++ b/drivers/thunderbolt/tunnel.c
@@ -296,6 +296,22 @@ static inline void tb_tunnel_changed(struct tb_tunnel *tunnel)
 			tunnel->src_port, tunnel->dst_port);
 }
 
+static int tb_pci_pre_activate(struct tb_tunnel *tunnel)
+{
+	struct tb_port *down = tunnel->src_port;
+	struct tb_port *up = tunnel->dst_port;
+	int ret;
+
+	if (!tb_switch_is_usb4(down->sw) || !tb_switch_is_usb4(up->sw))
+		return 0;
+
+	ret = usb4_pci_port_check_ltssm_state(down, TB_PCIE_LTSSM_DETECT);
+	if (ret)
+		return ret;
+
+	return usb4_pci_port_check_ltssm_state(up, TB_PCIE_LTSSM_DETECT);
+}
+
 static int tb_pci_set_ext_encapsulation(struct tb_tunnel *tunnel, bool enable)
 {
 	struct tb_port *port = tb_upstream_port(tunnel->dst_port->sw);
@@ -511,6 +527,7 @@ struct tb_tunnel *tb_tunnel_alloc_pci(struct tb *tb, struct tb_port *up,
 	if (!tunnel)
 		return NULL;
 
+	tunnel->pre_activate = tb_pci_pre_activate;
 	tunnel->activate = tb_pci_activate;
 	tunnel->src_port = down;
 	tunnel->dst_port = up;
diff --git a/drivers/thunderbolt/usb4.c b/drivers/thunderbolt/usb4.c
index 403a46aa35e5..706c9bc796e2 100644
--- a/drivers/thunderbolt/usb4.c
+++ b/drivers/thunderbolt/usb4.c
@@ -3145,3 +3145,26 @@ int usb4_pci_port_set_ext_encapsulation(struct tb_port *port, bool enable)
 	return tb_port_write(port, &val, TB_CFG_PORT,
 			     port->cap_adap + ADP_PCIE_CS_1, 1);
 }
+
+/**
+ * usb4_pci_port_check_ltssm_state() - Checks the LTSSM state of PCIe adapter
+ * @port: PCIe adapter
+ * @ltssm: PCIe adapter LTSSM state as encoded in &enum tb_pcie_ltssm_state
+ *
+ * Return:
+ * * %0 - If LTSSM state of @port is as expected @state.
+ * * %-ETIMEDOUT - The @ltssm state was not reached within the given timeout.
+ * * Negative errno - Other failure occurred.
+ */
+int usb4_pci_port_check_ltssm_state(struct tb_port *port,
+				    enum tb_pcie_ltssm_state ltssm)
+{
+	u32 val = FIELD_PREP(ADP_PCIE_CS_0_LTSSM_MASK, ltssm);
+
+	if (!tb_port_is_pcie_down(port) && !tb_port_is_pcie_up(port))
+		return -EINVAL;
+
+	return usb4_port_wait_for_bit(port, port->cap_adap + ADP_PCIE_CS_0,
+				      ADP_PCIE_CS_0_LTSSM_MASK, val, 500,
+				      USB4_PORT_DELAY);
+}
-- 
2.43.0


