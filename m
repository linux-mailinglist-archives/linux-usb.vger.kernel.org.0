Return-Path: <linux-usb+bounces-31949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8584CF6CAE
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 06:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3453F304C6DF
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 05:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49225303A02;
	Tue,  6 Jan 2026 05:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSKrm7Hh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC54A30171E;
	Tue,  6 Jan 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767677878; cv=none; b=T3lKLLyD8hOlLINQ8DNtLqspbjBLdFhdh4SmRIsrR8gIjeXNajVJvCnMuvhfbbhwAojsKRULqh2ZW8jSb6pUhvQ6NSjU1o30asyd0zLBzxchmviAuKdvb4jnHBXLpnV0Etpsb9oWLutZcwT7sBMbknXPG2XvxvqdP0qChuk7smM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767677878; c=relaxed/simple;
	bh=+wy6Sv2wyM+6PURC00aQvr9PEte1JGiwAatE02zUgNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZxiHrCPAbL1wknaqWemYgvY5Oo2zc2kU2MQE8rJLo2OEfIKZmq2lymjUbKyNCDO2GFOnIxalCHDnnIE7QNsbRMlTthJQxLV2BuUkJZl5roJ02Ok/s/SnjqadU3yhk1v2R1KERdMOzBHMRqRfJuPego4hJ+pyG8rBt5FPWVwFI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSKrm7Hh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BA8C19425;
	Tue,  6 Jan 2026 05:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767677878;
	bh=+wy6Sv2wyM+6PURC00aQvr9PEte1JGiwAatE02zUgNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSKrm7HhjjNG7f/qmu1imPyQDqz0BNA3kQWv1iBVAhFqJvScy6LfTga3OtJBEYUD8
	 T586sonwQJKGdkn9REKT7eCzipE1OHDcaB3VCmSxHrtHBCCnUyrWeleTLdOklCzGCi
	 +Xpjwz7aaiIa5Pqhs6J8Vx05MChzz0DgglGaLqeBoZ7mwf4IhiDpyYpOQCgsrkUPMW
	 3MMM0j2WSScuAmaNB5lm7Wx4D8JtAuYZOCTZScuLTldc8Kaiga2W4xDhc8MNH1k1ab
	 HNRAnZ3I8ToWw5o/WENIVxdFub2ihwtjSNr3ITxPeOc0W5T5j76wkhqKCccYJiba1R
	 C4kat8yIr7D5Q==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linux-usb@vger.kernel.org (open list:THUNDERBOLT DRIVER),
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH v2 2/2] thunderbolt: Reset NHI during S4 restore_noirq() callback
Date: Mon,  5 Jan 2026 23:37:49 -0600
Message-ID: <20260106053749.61440-3-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106053749.61440-1-superm1@kernel.org>
References: <20260106053749.61440-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a machine is restored from S4 if the firmware CM has created
tunnels there can be an incongruity of expectation from the kernel
when compared to booting from S5.

For example this incongruity can lead to problems like the display
not working properly if the firmware CM didn't turn it on pre-OS
but the OS had it on before entering S4.

Add an extra restore_noirq() callback to explicitly reset the NHI
before running the rest of the resume sequence.  This will allow
the standard discovery and probing routines to run and create the
tunnels as expected.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/thunderbolt/nhi.c | 15 +++++++++++++--
 drivers/thunderbolt/tb.c  | 29 ++++++++++++++++-------------
 drivers/thunderbolt/tb.h  |  1 +
 3 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index ea2a5a06ee710..17cc4ddd9cc79 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -47,7 +47,7 @@
 #define QUIRK_AUTO_CLEAR_INT	BIT(0)
 #define QUIRK_E2E		BIT(1)
 
-static bool host_reset = true;
+bool host_reset = true;
 module_param(host_reset, bool, 0444);
 MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
 
@@ -1108,6 +1108,17 @@ static int nhi_resume_noirq(struct device *dev)
 	return tb_domain_resume_noirq(tb);
 }
 
+static int nhi_restore_noirq(struct device *dev)
+{
+	struct pci_dev *pdev = to_pci_dev(dev);
+	struct tb *tb = pci_get_drvdata(pdev);
+	struct tb_nhi *nhi = tb->nhi;
+
+	nhi_reset(nhi);
+
+	return nhi_resume_noirq(dev);
+}
+
 static int nhi_suspend(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
@@ -1449,7 +1460,7 @@ static const struct dev_pm_ops nhi_pm_ops = {
 					    * pci-tunnels stay alive.
 					    */
 	.thaw_noirq = nhi_thaw_noirq,
-	.restore_noirq = nhi_resume_noirq,
+	.restore_noirq = nhi_restore_noirq,
 	.suspend = nhi_suspend,
 	.poweroff_noirq = nhi_poweroff_noirq,
 	.poweroff = nhi_suspend,
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 4f5f1dfc0fbf1..bc6ca313dd9f3 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -3115,7 +3115,6 @@ static int tb_resume_noirq(struct tb *tb)
 	struct tb_cm *tcm = tb_priv(tb);
 	struct tb_tunnel *tunnel, *n;
 	unsigned int usb3_delay = 0;
-	LIST_HEAD(tunnels);
 
 	tb_dbg(tb, "resuming...\n");
 
@@ -3131,18 +3130,22 @@ static int tb_resume_noirq(struct tb *tb)
 	tb_free_unplugged_children(tb->root_switch);
 	tb_restore_children(tb->root_switch);
 
-	/*
-	 * If we get here from suspend to disk the boot firmware or the
-	 * restore kernel might have created tunnels of its own. Since
-	 * we cannot be sure they are usable for us we find and tear
-	 * them down.
-	 */
-	tb_switch_discover_tunnels(tb->root_switch, &tunnels, false);
-	list_for_each_entry_safe_reverse(tunnel, n, &tunnels, list) {
-		if (tb_tunnel_is_usb3(tunnel))
-			usb3_delay = 500;
-		tb_tunnel_deactivate(tunnel);
-		tb_tunnel_put(tunnel);
+	if (!host_reset) {
+		/*
+		 * If we get here from suspend to disk the boot firmware or the
+		 * restore kernel might have created tunnels of its own. Since
+		 * we cannot be sure they are usable for us we find and tear
+		 * them down.
+		 */
+		LIST_HEAD(tunnels);
+
+		tb_switch_discover_tunnels(tb->root_switch, &tunnels, false);
+		list_for_each_entry_safe_reverse(tunnel, n, &tunnels, list) {
+			if (tb_tunnel_is_usb3(tunnel))
+				usb3_delay = 500;
+			tb_tunnel_deactivate(tunnel);
+			tb_tunnel_put(tunnel);
+		}
 	}
 
 	/* Re-create our tunnels now */
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e96474f17067a..050d92f82b12f 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -763,6 +763,7 @@ extern const struct device_type tb_domain_type;
 extern const struct device_type tb_retimer_type;
 extern const struct device_type tb_switch_type;
 extern const struct device_type usb4_port_device_type;
+extern bool host_reset;
 
 int tb_domain_init(void);
 void tb_domain_exit(void);
-- 
2.43.0


