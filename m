Return-Path: <linux-usb+bounces-34281-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCrkLrairmk9HAIAu9opvQ
	(envelope-from <linux-usb+bounces-34281-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:36:38 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CAE237340
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5DF2E3037C04
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16233921F2;
	Mon,  9 Mar 2026 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DYVyrGOk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9EF7262E;
	Mon,  9 Mar 2026 10:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052425; cv=none; b=rk5RfqQa3jozlrwVWAgohokRnOYKeiR6yDdaBlqcVDVobKebp9bU65f7Dy2hwheVrBqpAbSwGKPsZXMvgVqARkSUA+iN7KisHDzfll/RQ4pLmpc1Kkmkdvr4Q6sJlVbsD7RcwfuyPI+5mo94iTPsXtJfnZZVkBhpcETY1TEvSmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052425; c=relaxed/simple;
	bh=tMbgpoF4DiWZtL1XEtEHy9iTInu4M1bOjjdygd+IxQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IaD42qiXv2W9fXlNdUkcJKtmaSFjnt4ULMNxu4gcDG6wmsp4BViCf/pYHPYYBNsPqw8KSZoObsNoUAP5GxVdjJilDgbm9YGnl+vNjnaN6efXsTGzcmQ9khPIZMwL2KQSwklsQQXfxgR81VAyKrvTcTT0IREoAlcjhlOaAXwVtxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DYVyrGOk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE8EC4CEF7;
	Mon,  9 Mar 2026 10:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052425;
	bh=tMbgpoF4DiWZtL1XEtEHy9iTInu4M1bOjjdygd+IxQs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DYVyrGOk8ES4LyLAitqqRmp+jsHcu98Kjk1Bn/GsEBnoeICFXjOGWxCxIPNTklg5V
	 zgEvyjVEsX+YvcA1mCGKtU3XVEy+hv8mjNkmlfktb+zc8lfoM9eG9+4N4aA2WLSN6z
	 dtbgX3uHCSzgQWdR2EPhh1+unpsFMtdp/c4adTptxfSCjCL2aSJrInyteQqw/iNBti
	 BHS/bg9+lTFrSYW04NIf2zwH6D8lkDYdbGFWCWF98GNKZ1YWBR0X3SfNr849uhqqq1
	 O/GLlazJyiep+NLUsMDT60qrcSPgHbCTvtOTSNmm+w3AB7dxB7BWhjUquBP7Mc7R4l
	 n5CiVFF3p6BJw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 09 Mar 2026 11:32:59 +0100
Subject: [PATCH RFC/RFT 1/3] thunderbolt: Move pci_device out of tb_nhi
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-topic-usb4_nonpcie_prepwork-v1-1-d901d85fc794@oss.qualcomm.com>
References: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
In-Reply-To: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773052420; l=41778;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=JWs1T6qnRUd7dfPhyYhdkP+Jy82Kv4qwgryzuUjn9yw=;
 b=/JZlNoBjKrGF2dAo+gqkGMks3EWUBAh4M/QKl55tpigAqaOZ/pzlex9JD/wfaOp0EB5qDnzXZ
 cTyY9Cv7I64CKEOYEVaT4a3YdflKrLtDSfMni85q5wHUfycWhGZPNvW
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 15CAE237340
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34281-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.963];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Not all USB4/TB implementations are based on a PCIe-attached
controller. In order to make way for these, start off with moving the
pci_device reference out of the main tb_nhi structure.

Encapsulate the existing struct in a new tb_nhi_pci, that shall also
house all properties that relate to the parent bus. Similarly, any
other type of controller will be expected to contain tb_nhi as a
member.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/thunderbolt/acpi.c      |  14 +--
 drivers/thunderbolt/ctl.c       |  14 +--
 drivers/thunderbolt/domain.c    |   2 +-
 drivers/thunderbolt/eeprom.c    |   2 +-
 drivers/thunderbolt/icm.c       |  25 ++--
 drivers/thunderbolt/nhi.c       | 247 ++++++++++++++++++++++++++++++----------
 drivers/thunderbolt/nhi.h       |  11 ++
 drivers/thunderbolt/nhi_ops.c   |  29 +++--
 drivers/thunderbolt/nhi_pci.h   |  20 ++++
 drivers/thunderbolt/switch.c    |  41 ++-----
 drivers/thunderbolt/tb.c        |  69 -----------
 drivers/thunderbolt/tb.h        |  10 +-
 drivers/thunderbolt/usb4_port.c |   2 +-
 include/linux/thunderbolt.h     |   5 +-
 14 files changed, 283 insertions(+), 208 deletions(-)

diff --git a/drivers/thunderbolt/acpi.c b/drivers/thunderbolt/acpi.c
index 45d1415871b4..53546bc477a5 100644
--- a/drivers/thunderbolt/acpi.c
+++ b/drivers/thunderbolt/acpi.c
@@ -28,7 +28,7 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 		return AE_OK;
 
 	/* It needs to reference this NHI */
-	if (dev_fwnode(&nhi->pdev->dev) != fwnode)
+	if (dev_fwnode(nhi->dev) != fwnode)
 		goto out_put;
 
 	/*
@@ -57,16 +57,16 @@ static acpi_status tb_acpi_add_link(acpi_handle handle, u32 level, void *data,
 		 */
 		pm_runtime_get_sync(&pdev->dev);
 
-		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
+		link = device_link_add(&pdev->dev, nhi->dev,
 				       DL_FLAG_AUTOREMOVE_SUPPLIER |
 				       DL_FLAG_RPM_ACTIVE |
 				       DL_FLAG_PM_RUNTIME);
 		if (link) {
-			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
+			dev_dbg(nhi->dev, "created link from %s\n",
 				dev_name(&pdev->dev));
 			*(bool *)ret = true;
 		} else {
-			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
+			dev_warn(nhi->dev, "device link creation from %s failed\n",
 				 dev_name(&pdev->dev));
 		}
 
@@ -93,7 +93,7 @@ bool tb_acpi_add_links(struct tb_nhi *nhi)
 	acpi_status status;
 	bool ret = false;
 
-	if (!has_acpi_companion(&nhi->pdev->dev))
+	if (!has_acpi_companion(nhi->dev))
 		return false;
 
 	/*
@@ -103,7 +103,7 @@ bool tb_acpi_add_links(struct tb_nhi *nhi)
 	status = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, 32,
 				     tb_acpi_add_link, NULL, nhi, (void **)&ret);
 	if (ACPI_FAILURE(status)) {
-		dev_warn(&nhi->pdev->dev, "failed to enumerate tunneled ports\n");
+		dev_warn(nhi->dev, "failed to enumerate tunneled ports\n");
 		return false;
 	}
 
@@ -305,7 +305,7 @@ static struct acpi_device *tb_acpi_switch_find_companion(struct tb_switch *sw)
 		struct tb_nhi *nhi = sw->tb->nhi;
 		struct acpi_device *parent_adev;
 
-		parent_adev = ACPI_COMPANION(&nhi->pdev->dev);
+		parent_adev = ACPI_COMPANION(nhi->dev);
 		if (parent_adev)
 			adev = acpi_find_child_device(parent_adev, 0, false);
 	}
diff --git a/drivers/thunderbolt/ctl.c b/drivers/thunderbolt/ctl.c
index b2fd60fc7bcc..a22c8c2a301d 100644
--- a/drivers/thunderbolt/ctl.c
+++ b/drivers/thunderbolt/ctl.c
@@ -56,22 +56,22 @@ struct tb_ctl {
 
 
 #define tb_ctl_WARN(ctl, format, arg...) \
-	dev_WARN(&(ctl)->nhi->pdev->dev, format, ## arg)
+	dev_WARN((ctl)->nhi->dev, format, ## arg)
 
 #define tb_ctl_err(ctl, format, arg...) \
-	dev_err(&(ctl)->nhi->pdev->dev, format, ## arg)
+	dev_err((ctl)->nhi->dev, format, ## arg)
 
 #define tb_ctl_warn(ctl, format, arg...) \
-	dev_warn(&(ctl)->nhi->pdev->dev, format, ## arg)
+	dev_warn((ctl)->nhi->dev, format, ## arg)
 
 #define tb_ctl_info(ctl, format, arg...) \
-	dev_info(&(ctl)->nhi->pdev->dev, format, ## arg)
+	dev_info((ctl)->nhi->dev, format, ## arg)
 
 #define tb_ctl_dbg(ctl, format, arg...) \
-	dev_dbg(&(ctl)->nhi->pdev->dev, format, ## arg)
+	dev_dbg((ctl)->nhi->dev, format, ## arg)
 
 #define tb_ctl_dbg_once(ctl, format, arg...) \
-	dev_dbg_once(&(ctl)->nhi->pdev->dev, format, ## arg)
+	dev_dbg_once((ctl)->nhi->dev, format, ## arg)
 
 static DECLARE_WAIT_QUEUE_HEAD(tb_cfg_request_cancel_queue);
 /* Serializes access to request kref_get/put */
@@ -666,7 +666,7 @@ struct tb_ctl *tb_ctl_alloc(struct tb_nhi *nhi, int index, int timeout_msec,
 
 	mutex_init(&ctl->request_queue_lock);
 	INIT_LIST_HEAD(&ctl->request_queue);
-	ctl->frame_pool = dma_pool_create("thunderbolt_ctl", &nhi->pdev->dev,
+	ctl->frame_pool = dma_pool_create("thunderbolt_ctl", nhi->dev,
 					 TB_FRAME_SIZE, 4, 0);
 	if (!ctl->frame_pool)
 		goto err;
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 317780b99992..8e332a9ad625 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -402,7 +402,7 @@ struct tb *tb_domain_alloc(struct tb_nhi *nhi, int timeout_msec, size_t privsize
 	if (!tb->ctl)
 		goto err_destroy_wq;
 
-	tb->dev.parent = &nhi->pdev->dev;
+	tb->dev.parent = nhi->dev;
 	tb->dev.bus = &tb_bus_type;
 	tb->dev.type = &tb_domain_type;
 	tb->dev.groups = domain_attr_groups;
diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
index 5477b9437048..5681c17f82ec 100644
--- a/drivers/thunderbolt/eeprom.c
+++ b/drivers/thunderbolt/eeprom.c
@@ -465,7 +465,7 @@ static void tb_switch_drom_free(struct tb_switch *sw)
  */
 static int tb_drom_copy_efi(struct tb_switch *sw, u16 *size)
 {
-	struct device *dev = &sw->tb->nhi->pdev->dev;
+	struct device *dev = sw->tb->nhi->dev;
 	int len, res;
 
 	len = device_property_count_u8(dev, "ThunderboltDROM");
diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
index 9d95bf3ab44c..ba79907247c3 100644
--- a/drivers/thunderbolt/icm.c
+++ b/drivers/thunderbolt/icm.c
@@ -20,6 +20,7 @@
 #include <linux/workqueue.h>
 
 #include "ctl.h"
+#include "nhi_pci.h"
 #include "nhi_regs.h"
 #include "tb.h"
 #include "tunnel.h"
@@ -1455,6 +1456,7 @@ static struct pci_dev *get_upstream_port(struct pci_dev *pdev)
 
 static bool icm_ar_is_supported(struct tb *tb)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(tb->nhi);
 	struct pci_dev *upstream_port;
 	struct icm *icm = tb_priv(tb);
 
@@ -1472,7 +1474,7 @@ static bool icm_ar_is_supported(struct tb *tb)
 	 * Find the upstream PCIe port in case we need to do reset
 	 * through its vendor specific registers.
 	 */
-	upstream_port = get_upstream_port(tb->nhi->pdev);
+	upstream_port = get_upstream_port(nhi_pci->pdev);
 	if (upstream_port) {
 		int cap;
 
@@ -1508,7 +1510,7 @@ static int icm_ar_get_mode(struct tb *tb)
 	} while (--retries);
 
 	if (!retries) {
-		dev_err(&nhi->pdev->dev, "ICM firmware not authenticated\n");
+		dev_err(nhi->dev, "ICM firmware not authenticated\n");
 		return -ENODEV;
 	}
 
@@ -1674,11 +1676,11 @@ icm_icl_driver_ready(struct tb *tb, enum tb_security_level *security_level,
 
 static void icm_icl_set_uuid(struct tb *tb)
 {
-	struct tb_nhi *nhi = tb->nhi;
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(tb->nhi);
 	u32 uuid[4];
 
-	pci_read_config_dword(nhi->pdev, VS_CAP_10, &uuid[0]);
-	pci_read_config_dword(nhi->pdev, VS_CAP_11, &uuid[1]);
+	pci_read_config_dword(nhi_pci->pdev, VS_CAP_10, &uuid[0]);
+	pci_read_config_dword(nhi_pci->pdev, VS_CAP_11, &uuid[1]);
 	uuid[2] = 0xffffffff;
 	uuid[3] = 0xffffffff;
 
@@ -1853,7 +1855,7 @@ static int icm_firmware_start(struct tb *tb, struct tb_nhi *nhi)
 	if (icm_firmware_running(nhi))
 		return 0;
 
-	dev_dbg(&nhi->pdev->dev, "starting ICM firmware\n");
+	dev_dbg(nhi->dev, "starting ICM firmware\n");
 
 	ret = icm_firmware_reset(tb, nhi);
 	if (ret)
@@ -1948,7 +1950,7 @@ static int icm_firmware_init(struct tb *tb)
 
 	ret = icm_firmware_start(tb, nhi);
 	if (ret) {
-		dev_err(&nhi->pdev->dev, "could not start ICM firmware\n");
+		dev_err(nhi->dev, "could not start ICM firmware\n");
 		return ret;
 	}
 
@@ -1980,10 +1982,10 @@ static int icm_firmware_init(struct tb *tb)
 	 */
 	ret = icm_reset_phy_port(tb, 0);
 	if (ret)
-		dev_warn(&nhi->pdev->dev, "failed to reset links on port0\n");
+		dev_warn(nhi->dev, "failed to reset links on port0\n");
 	ret = icm_reset_phy_port(tb, 1);
 	if (ret)
-		dev_warn(&nhi->pdev->dev, "failed to reset links on port1\n");
+		dev_warn(nhi->dev, "failed to reset links on port1\n");
 
 	return 0;
 }
@@ -2462,6 +2464,7 @@ static const struct tb_cm_ops icm_icl_ops = {
 
 struct tb *icm_probe(struct tb_nhi *nhi)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	struct icm *icm;
 	struct tb *tb;
 
@@ -2473,7 +2476,7 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 	INIT_DELAYED_WORK(&icm->rescan_work, icm_rescan_work);
 	mutex_init(&icm->request_lock);
 
-	switch (nhi->pdev->device) {
+	switch (nhi_pci->pdev->device) {
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
 		icm->can_upgrade_nvm = true;
@@ -2579,7 +2582,7 @@ struct tb *icm_probe(struct tb_nhi *nhi)
 	}
 
 	if (!icm->is_supported || !icm->is_supported(tb)) {
-		dev_dbg(&nhi->pdev->dev, "ICM not supported on this controller\n");
+		dev_dbg(nhi->dev, "ICM not supported on this controller\n");
 		tb_domain_put(tb);
 		return NULL;
 	}
diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index ccce020a2432..18710bafef20 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -18,11 +18,13 @@
 #include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/delay.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/property.h>
 #include <linux/string_choices.h>
 #include <linux/string_helpers.h>
 
 #include "nhi.h"
+#include "nhi_pci.h"
 #include "nhi_regs.h"
 #include "tb.h"
 
@@ -139,12 +141,12 @@ static void ring_interrupt_active(struct tb_ring *ring, bool active)
 	else
 		new = old & ~mask;
 
-	dev_dbg(&ring->nhi->pdev->dev,
+	dev_dbg(ring->nhi->dev,
 		"%s interrupt at register %#x bit %d (%#x -> %#x)\n",
 		active ? "enabling" : "disabling", reg, interrupt_bit, old, new);
 
 	if (new == old)
-		dev_WARN(&ring->nhi->pdev->dev,
+		dev_WARN(ring->nhi->dev,
 					 "interrupt for %s %d is already %s\n",
 					 RING_TYPE(ring), ring->hop,
 					 str_enabled_disabled(active));
@@ -462,19 +464,20 @@ static irqreturn_t ring_msix(int irq, void *data)
 static int ring_request_msix(struct tb_ring *ring, bool no_suspend)
 {
 	struct tb_nhi *nhi = ring->nhi;
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	unsigned long irqflags;
 	int ret;
 
-	if (!nhi->pdev->msix_enabled)
+	if (!nhi_pci->pdev->msix_enabled)
 		return 0;
 
-	ret = ida_alloc_max(&nhi->msix_ida, MSIX_MAX_VECS - 1, GFP_KERNEL);
+	ret = ida_alloc_max(&nhi_pci->msix_ida, MSIX_MAX_VECS - 1, GFP_KERNEL);
 	if (ret < 0)
 		return ret;
 
 	ring->vector = ret;
 
-	ret = pci_irq_vector(ring->nhi->pdev, ring->vector);
+	ret = pci_irq_vector(nhi_pci->pdev, ring->vector);
 	if (ret < 0)
 		goto err_ida_remove;
 
@@ -488,18 +491,20 @@ static int ring_request_msix(struct tb_ring *ring, bool no_suspend)
 	return 0;
 
 err_ida_remove:
-	ida_free(&nhi->msix_ida, ring->vector);
+	ida_free(&nhi_pci->msix_ida, ring->vector);
 
 	return ret;
 }
 
 static void ring_release_msix(struct tb_ring *ring)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(ring->nhi);
+
 	if (ring->irq <= 0)
 		return;
 
 	free_irq(ring->irq, ring);
-	ida_free(&ring->nhi->msix_ida, ring->vector);
+	ida_free(&nhi_pci->msix_ida, ring->vector);
 	ring->vector = 0;
 	ring->irq = 0;
 }
@@ -512,7 +517,7 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 	if (nhi->quirks & QUIRK_E2E) {
 		start_hop = RING_FIRST_USABLE_HOPID + 1;
 		if (ring->flags & RING_FLAG_E2E && !ring->is_tx) {
-			dev_dbg(&nhi->pdev->dev, "quirking E2E TX HopID %u -> %u\n",
+			dev_dbg(nhi->dev, "quirking E2E TX HopID %u -> %u\n",
 				ring->e2e_tx_hop, RING_E2E_RESERVED_HOPID);
 			ring->e2e_tx_hop = RING_E2E_RESERVED_HOPID;
 		}
@@ -543,23 +548,23 @@ static int nhi_alloc_hop(struct tb_nhi *nhi, struct tb_ring *ring)
 	}
 
 	if (ring->hop > 0 && ring->hop < start_hop) {
-		dev_warn(&nhi->pdev->dev, "invalid hop: %d\n", ring->hop);
+		dev_warn(nhi->dev, "invalid hop: %d\n", ring->hop);
 		ret = -EINVAL;
 		goto err_unlock;
 	}
 	if (ring->hop < 0 || ring->hop >= nhi->hop_count) {
-		dev_warn(&nhi->pdev->dev, "invalid hop: %d\n", ring->hop);
+		dev_warn(nhi->dev, "invalid hop: %d\n", ring->hop);
 		ret = -EINVAL;
 		goto err_unlock;
 	}
 	if (ring->is_tx && nhi->tx_rings[ring->hop]) {
-		dev_warn(&nhi->pdev->dev, "TX hop %d already allocated\n",
+		dev_warn(nhi->dev, "TX hop %d already allocated\n",
 			 ring->hop);
 		ret = -EBUSY;
 		goto err_unlock;
 	}
 	if (!ring->is_tx && nhi->rx_rings[ring->hop]) {
-		dev_warn(&nhi->pdev->dev, "RX hop %d already allocated\n",
+		dev_warn(nhi->dev, "RX hop %d already allocated\n",
 			 ring->hop);
 		ret = -EBUSY;
 		goto err_unlock;
@@ -584,7 +589,7 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 {
 	struct tb_ring *ring = NULL;
 
-	dev_dbg(&nhi->pdev->dev, "allocating %s ring %d of size %d\n",
+	dev_dbg(nhi->dev, "allocating %s ring %d of size %d\n",
 		transmit ? "TX" : "RX", hop, size);
 
 	ring = kzalloc_obj(*ring);
@@ -610,14 +615,16 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	ring->start_poll = start_poll;
 	ring->poll_data = poll_data;
 
-	ring->descriptors = dma_alloc_coherent(&ring->nhi->pdev->dev,
+	ring->descriptors = dma_alloc_coherent(ring->nhi->dev,
 			size * sizeof(*ring->descriptors),
 			&ring->descriptors_dma, GFP_KERNEL | __GFP_ZERO);
 	if (!ring->descriptors)
 		goto err_free_ring;
 
-	if (ring_request_msix(ring, flags & RING_FLAG_NO_SUSPEND))
-		goto err_free_descs;
+	if (nhi->ops && nhi->ops->request_ring_irq) {
+		if (nhi->ops->request_ring_irq(ring, flags & RING_FLAG_NO_SUSPEND))
+			goto err_free_descs;
+	}
 
 	if (nhi_alloc_hop(nhi, ring))
 		goto err_release_msix;
@@ -625,9 +632,10 @@ static struct tb_ring *tb_ring_alloc(struct tb_nhi *nhi, u32 hop, int size,
 	return ring;
 
 err_release_msix:
-	ring_release_msix(ring);
+	if (nhi->ops && nhi->ops->release_ring_irq)
+		nhi->ops->release_ring_irq(ring);
 err_free_descs:
-	dma_free_coherent(&ring->nhi->pdev->dev,
+	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),
 			  ring->descriptors, ring->descriptors_dma);
 err_free_ring:
@@ -694,10 +702,10 @@ void tb_ring_start(struct tb_ring *ring)
 	if (ring->nhi->going_away)
 		goto err;
 	if (ring->running) {
-		dev_WARN(&ring->nhi->pdev->dev, "ring already started\n");
+		dev_WARN(ring->nhi->dev, "ring already started\n");
 		goto err;
 	}
-	dev_dbg(&ring->nhi->pdev->dev, "starting %s %d\n",
+	dev_dbg(ring->nhi->dev, "starting %s %d\n",
 		RING_TYPE(ring), ring->hop);
 
 	if (ring->flags & RING_FLAG_FRAME) {
@@ -734,11 +742,11 @@ void tb_ring_start(struct tb_ring *ring)
 			hop &= REG_RX_OPTIONS_E2E_HOP_MASK;
 			flags |= hop;
 
-			dev_dbg(&ring->nhi->pdev->dev,
+			dev_dbg(ring->nhi->dev,
 				"enabling E2E for %s %d with TX HopID %d\n",
 				RING_TYPE(ring), ring->hop, ring->e2e_tx_hop);
 		} else {
-			dev_dbg(&ring->nhi->pdev->dev, "enabling E2E for %s %d\n",
+			dev_dbg(ring->nhi->dev, "enabling E2E for %s %d\n",
 				RING_TYPE(ring), ring->hop);
 		}
 
@@ -772,12 +780,12 @@ void tb_ring_stop(struct tb_ring *ring)
 {
 	spin_lock_irq(&ring->nhi->lock);
 	spin_lock(&ring->lock);
-	dev_dbg(&ring->nhi->pdev->dev, "stopping %s %d\n",
+	dev_dbg(ring->nhi->dev, "stopping %s %d\n",
 		RING_TYPE(ring), ring->hop);
 	if (ring->nhi->going_away)
 		goto err;
 	if (!ring->running) {
-		dev_WARN(&ring->nhi->pdev->dev, "%s %d already stopped\n",
+		dev_WARN(ring->nhi->dev, "%s %d already stopped\n",
 			 RING_TYPE(ring), ring->hop);
 		goto err;
 	}
@@ -815,6 +823,8 @@ EXPORT_SYMBOL_GPL(tb_ring_stop);
  */
 void tb_ring_free(struct tb_ring *ring)
 {
+	struct tb_nhi *nhi = ring->nhi;
+
 	spin_lock_irq(&ring->nhi->lock);
 	/*
 	 * Dissociate the ring from the NHI. This also ensures that
@@ -826,14 +836,15 @@ void tb_ring_free(struct tb_ring *ring)
 		ring->nhi->rx_rings[ring->hop] = NULL;
 
 	if (ring->running) {
-		dev_WARN(&ring->nhi->pdev->dev, "%s %d still running\n",
+		dev_WARN(ring->nhi->dev, "%s %d still running\n",
 			 RING_TYPE(ring), ring->hop);
 	}
 	spin_unlock_irq(&ring->nhi->lock);
 
-	ring_release_msix(ring);
+	if (nhi->ops && nhi->ops->release_ring_irq)
+		nhi->ops->release_ring_irq(ring);
 
-	dma_free_coherent(&ring->nhi->pdev->dev,
+	dma_free_coherent(ring->nhi->dev,
 			  ring->size * sizeof(*ring->descriptors),
 			  ring->descriptors, ring->descriptors_dma);
 
@@ -841,7 +852,7 @@ void tb_ring_free(struct tb_ring *ring)
 	ring->descriptors_dma = 0;
 
 
-	dev_dbg(&ring->nhi->pdev->dev, "freeing %s %d\n", RING_TYPE(ring),
+	dev_dbg(ring->nhi->dev, "freeing %s %d\n", RING_TYPE(ring),
 		ring->hop);
 
 	/*
@@ -940,7 +951,7 @@ static void nhi_interrupt_work(struct work_struct *work)
 		if ((value & (1 << (bit % 32))) == 0)
 			continue;
 		if (type == 2) {
-			dev_warn(&nhi->pdev->dev,
+			dev_warn(nhi->dev,
 				 "RX overflow for ring %d\n",
 				 hop);
 			continue;
@@ -950,7 +961,7 @@ static void nhi_interrupt_work(struct work_struct *work)
 		else
 			ring = nhi->rx_rings[hop];
 		if (ring == NULL) {
-			dev_warn(&nhi->pdev->dev,
+			dev_warn(nhi->dev,
 				 "got interrupt for inactive %s ring %d\n",
 				 type ? "RX" : "TX",
 				 hop);
@@ -1139,16 +1150,17 @@ static int nhi_runtime_resume(struct device *dev)
 
 static void nhi_shutdown(struct tb_nhi *nhi)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	int i;
 
-	dev_dbg(&nhi->pdev->dev, "shutdown\n");
+	dev_dbg(nhi->dev, "shutdown\n");
 
 	for (i = 0; i < nhi->hop_count; i++) {
 		if (nhi->tx_rings[i])
-			dev_WARN(&nhi->pdev->dev,
+			dev_WARN(nhi->dev,
 				 "TX ring %d is still active\n", i);
 		if (nhi->rx_rings[i])
-			dev_WARN(&nhi->pdev->dev,
+			dev_WARN(nhi->dev,
 				 "RX ring %d is still active\n", i);
 	}
 	nhi_disable_interrupts(nhi);
@@ -1156,19 +1168,21 @@ static void nhi_shutdown(struct tb_nhi *nhi)
 	 * We have to release the irq before calling flush_work. Otherwise an
 	 * already executing IRQ handler could call schedule_work again.
 	 */
-	if (!nhi->pdev->msix_enabled) {
-		devm_free_irq(&nhi->pdev->dev, nhi->pdev->irq, nhi);
+	if (!nhi_pci->pdev->msix_enabled) {
+		devm_free_irq(nhi->dev, nhi_pci->pdev->irq, nhi);
 		flush_work(&nhi->interrupt_work);
 	}
-	ida_destroy(&nhi->msix_ida);
+	ida_destroy(&nhi_pci->msix_ida);
 
 	if (nhi->ops && nhi->ops->shutdown)
 		nhi->ops->shutdown(nhi);
 }
 
-static void nhi_check_quirks(struct tb_nhi *nhi)
+static void nhi_check_quirks(struct tb_nhi_pci *nhi_pci)
 {
-	if (nhi->pdev->vendor == PCI_VENDOR_ID_INTEL) {
+	struct tb_nhi *nhi = &nhi_pci->nhi;
+
+	if (nhi_pci->pdev->vendor == PCI_VENDOR_ID_INTEL) {
 		/*
 		 * Intel hardware supports auto clear of the interrupt
 		 * status register right after interrupt is being
@@ -1176,7 +1190,7 @@ static void nhi_check_quirks(struct tb_nhi *nhi)
 		 */
 		nhi->quirks |= QUIRK_AUTO_CLEAR_INT;
 
-		switch (nhi->pdev->device) {
+		switch (nhi_pci->pdev->device) {
 		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
 		case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
 			/*
@@ -1190,7 +1204,7 @@ static void nhi_check_quirks(struct tb_nhi *nhi)
 	}
 }
 
-static int nhi_check_iommu_pdev(struct pci_dev *pdev, void *data)
+static int nhi_check_iommu_pci_dev(struct pci_dev *pdev, void *data)
 {
 	if (!pdev->external_facing ||
 	    !device_iommu_capable(&pdev->dev, IOMMU_CAP_PRE_BOOT_PROTECTION))
@@ -1199,9 +1213,10 @@ static int nhi_check_iommu_pdev(struct pci_dev *pdev, void *data)
 	return 1; /* Stop walking */
 }
 
-static void nhi_check_iommu(struct tb_nhi *nhi)
+static void nhi_check_iommu(struct tb_nhi_pci *nhi_pci)
 {
-	struct pci_bus *bus = nhi->pdev->bus;
+	struct pci_bus *bus = nhi_pci->pdev->bus;
+	struct tb_nhi *nhi = &nhi_pci->nhi;
 	bool port_ok = false;
 
 	/*
@@ -1224,10 +1239,10 @@ static void nhi_check_iommu(struct tb_nhi *nhi)
 	while (bus->parent)
 		bus = bus->parent;
 
-	pci_walk_bus(bus, nhi_check_iommu_pdev, &port_ok);
+	pci_walk_bus(bus, nhi_check_iommu_pci_dev, &port_ok);
 
 	nhi->iommu_dma_protection = port_ok;
-	dev_dbg(&nhi->pdev->dev, "IOMMU DMA protection is %s\n",
+	dev_dbg(nhi->dev, "IOMMU DMA protection is %s\n",
 		str_enabled_disabled(port_ok));
 }
 
@@ -1242,7 +1257,7 @@ static void nhi_reset(struct tb_nhi *nhi)
 		return;
 
 	if (!host_reset) {
-		dev_dbg(&nhi->pdev->dev, "skipping host router reset\n");
+		dev_dbg(nhi->dev, "skipping host router reset\n");
 		return;
 	}
 
@@ -1253,27 +1268,23 @@ static void nhi_reset(struct tb_nhi *nhi)
 	do {
 		val = ioread32(nhi->iobase + REG_RESET);
 		if (!(val & REG_RESET_HRR)) {
-			dev_warn(&nhi->pdev->dev, "host router reset successful\n");
+			dev_warn(nhi->dev, "host router reset successful\n");
 			return;
 		}
 		usleep_range(10, 20);
 	} while (ktime_before(ktime_get(), timeout));
 
-	dev_warn(&nhi->pdev->dev, "timeout resetting host router\n");
+	dev_warn(nhi->dev, "timeout resetting host router\n");
 }
 
-static int nhi_init_msi(struct tb_nhi *nhi)
+static int nhi_init_msi(struct tb_nhi_pci *nhi_pci)
 {
-	struct pci_dev *pdev = nhi->pdev;
+	struct pci_dev *pdev = nhi_pci->pdev;
+	struct tb_nhi *nhi = &nhi_pci->nhi;
 	struct device *dev = &pdev->dev;
 	int res, irq, nvec;
 
-	/* In case someone left them on. */
-	nhi_disable_interrupts(nhi);
-
-	nhi_enable_int_throttling(nhi);
-
-	ida_init(&nhi->msix_ida);
+	ida_init(&nhi_pci->msix_ida);
 
 	/*
 	 * The NHI has 16 MSI-X vectors or a single MSI. We first try to
@@ -1290,7 +1301,7 @@ static int nhi_init_msi(struct tb_nhi *nhi)
 
 		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
 
-		irq = pci_irq_vector(nhi->pdev, 0);
+		irq = pci_irq_vector(nhi_pci->pdev, 0);
 		if (irq < 0)
 			return irq;
 
@@ -1313,6 +1324,39 @@ static bool nhi_imr_valid(struct pci_dev *pdev)
 	return true;
 }
 
+void nhi_pci_start_dma_port(struct tb_nhi *nhi)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *root_port;
+
+	/*
+	 * During host router NVM upgrade we should not allow root port to
+	 * go into D3cold because some root ports cannot trigger PME
+	 * itself. To be on the safe side keep the root port in D0 during
+	 * the whole upgrade process.
+	 */
+	root_port = pcie_find_root_port(nhi_pci->pdev);
+	if (root_port)
+		pm_runtime_get_noresume(&root_port->dev);
+}
+
+void nhi_pci_complete_dma_port(struct tb_nhi *nhi)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *root_port;
+
+	root_port = pcie_find_root_port(nhi_pci->pdev);
+	if (root_port)
+		pm_runtime_put(&root_port->dev);
+}
+
+static const struct tb_nhi_ops pci_nhi_default_ops = {
+	.pre_nvm_auth = nhi_pci_start_dma_port,
+	.post_nvm_auth = nhi_pci_complete_dma_port,
+	.request_ring_irq = ring_request_msix,
+	.release_ring_irq = ring_release_msix,
+};
+
 static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 {
 	struct tb *tb;
@@ -1339,6 +1383,7 @@ static struct tb *nhi_select_cm(struct tb_nhi *nhi)
 static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
 	struct device *dev = &pdev->dev;
+	struct tb_nhi_pci *nhi_pci;
 	struct tb_nhi *nhi;
 	struct tb *tb;
 	int res;
@@ -1350,12 +1395,15 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (res)
 		return dev_err_probe(dev, res, "cannot enable PCI device, aborting\n");
 
-	nhi = devm_kzalloc(&pdev->dev, sizeof(*nhi), GFP_KERNEL);
-	if (!nhi)
+	nhi_pci = devm_kzalloc(dev, sizeof(*nhi_pci), GFP_KERNEL);
+	if (!nhi_pci)
 		return -ENOMEM;
 
-	nhi->pdev = pdev;
-	nhi->ops = (const struct tb_nhi_ops *)id->driver_data;
+	nhi_pci->pdev = pdev;
+
+	nhi = &nhi_pci->nhi;
+	nhi->dev = dev;
+	nhi->ops = (const struct tb_nhi_ops *)id->driver_data ?: &pci_nhi_default_ops;
 
 	nhi->iobase = pcim_iomap_region(pdev, 0, "thunderbolt");
 	res = PTR_ERR_OR_ZERO(nhi->iobase);
@@ -1372,11 +1420,15 @@ static int nhi_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (!nhi->tx_rings || !nhi->rx_rings)
 		return -ENOMEM;
 
-	nhi_check_quirks(nhi);
-	nhi_check_iommu(nhi);
+	nhi_check_quirks(nhi_pci);
+	nhi_check_iommu(nhi_pci);
 	nhi_reset(nhi);
 
-	res = nhi_init_msi(nhi);
+	/* In case someone left them on. */
+	nhi_disable_interrupts(nhi);
+	nhi_enable_int_throttling(nhi);
+
+	res = nhi_init_msi(nhi_pci);
 	if (res)
 		return dev_err_probe(dev, res, "cannot enable MSI, aborting\n");
 
@@ -1458,6 +1510,75 @@ static const struct dev_pm_ops nhi_pm_ops = {
 	.runtime_resume = nhi_runtime_resume,
 };
 
+/*
+ * During suspend the Thunderbolt controller is reset and all PCIe
+ * tunnels are lost. The NHI driver will try to reestablish all tunnels
+ * during resume. This adds device links between the tunneled PCIe
+ * downstream ports and the NHI so that the device core will make sure
+ * NHI is resumed first before the rest.
+ */
+bool tb_apple_add_links(struct tb_nhi *nhi)
+{
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
+	struct pci_dev *upstream, *pdev;
+	bool ret;
+
+	if (!x86_apple_machine)
+		return false;
+
+	switch (nhi_pci->pdev->device) {
+	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
+	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
+	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
+		break;
+	default:
+		return false;
+	}
+
+	upstream = pci_upstream_bridge(nhi_pci->pdev);
+	while (upstream) {
+		if (!pci_is_pcie(upstream))
+			return false;
+		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
+			break;
+		upstream = pci_upstream_bridge(upstream);
+	}
+
+	if (!upstream)
+		return false;
+
+	/*
+	 * For each hotplug downstream port, create add device link
+	 * back to NHI so that PCIe tunnels can be re-established after
+	 * sleep.
+	 */
+	ret = false;
+	for_each_pci_bridge(pdev, upstream->subordinate) {
+		const struct device_link *link;
+
+		if (!pci_is_pcie(pdev))
+			continue;
+		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
+		    !pdev->is_pciehp)
+			continue;
+
+		link = device_link_add(&pdev->dev, nhi->dev,
+				       DL_FLAG_AUTOREMOVE_SUPPLIER |
+				       DL_FLAG_PM_RUNTIME);
+		if (link) {
+			dev_dbg(nhi->dev, "created link from %s\n",
+				dev_name(&pdev->dev));
+			ret = true;
+		} else {
+			dev_warn(nhi->dev, "device link creation from %s failed\n",
+				 dev_name(&pdev->dev));
+		}
+	}
+
+	return ret;
+}
+
 static struct pci_device_id nhi_ids[] = {
 	/*
 	 * We have to specify class, the TB bridges use the same device and
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 24ac4246d0ca..5534a3f0800a 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -29,6 +29,9 @@ enum nhi_mailbox_cmd {
 
 int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
 enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
+bool tb_apple_add_links(struct tb_nhi *nhi);
+void nhi_pci_start_dma_port(struct tb_nhi *nhi);
+void nhi_pci_complete_dma_port(struct tb_nhi *nhi);
 
 /**
  * struct tb_nhi_ops - NHI specific optional operations
@@ -38,6 +41,10 @@ enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
  * @runtime_suspend: NHI specific runtime_suspend hook
  * @runtime_resume: NHI specific runtime_resume hook
  * @shutdown: NHI specific shutdown
+ * @pre_nvm_auth: hook to run before TBT3 NVM authentication
+ * @post_nvm_auth: hook to run after TBT3 NVM authentication
+ * @request_ring_irq: NHI specific interrupt retrieval function pointer
+ * @release_ring_irq: NHI specific interrupt release function pointer
  */
 struct tb_nhi_ops {
 	int (*init)(struct tb_nhi *nhi);
@@ -46,6 +53,10 @@ struct tb_nhi_ops {
 	int (*runtime_suspend)(struct tb_nhi *nhi);
 	int (*runtime_resume)(struct tb_nhi *nhi);
 	void (*shutdown)(struct tb_nhi *nhi);
+	void (*pre_nvm_auth)(struct tb_nhi *nhi);
+	void (*post_nvm_auth)(struct tb_nhi *nhi);
+	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
+	void (*release_ring_irq)(struct tb_ring *ring);
 };
 
 extern const struct tb_nhi_ops icl_nhi_ops;
diff --git a/drivers/thunderbolt/nhi_ops.c b/drivers/thunderbolt/nhi_ops.c
index 96da07e88c52..da6083f45fad 100644
--- a/drivers/thunderbolt/nhi_ops.c
+++ b/drivers/thunderbolt/nhi_ops.c
@@ -10,6 +10,7 @@
 #include <linux/suspend.h>
 
 #include "nhi.h"
+#include "nhi_pci.h"
 #include "nhi_regs.h"
 #include "tb.h"
 
@@ -24,7 +25,7 @@ static int check_for_device(struct device *dev, void *data)
 
 static bool icl_nhi_is_device_connected(struct tb_nhi *nhi)
 {
-	struct tb *tb = pci_get_drvdata(nhi->pdev);
+	struct tb *tb = dev_get_drvdata(nhi->dev);
 	int ret;
 
 	ret = device_for_each_child(&tb->root_switch->dev, NULL,
@@ -34,6 +35,7 @@ static bool icl_nhi_is_device_connected(struct tb_nhi *nhi)
 
 static int icl_nhi_force_power(struct tb_nhi *nhi, bool power)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	u32 vs_cap;
 
 	/*
@@ -48,7 +50,7 @@ static int icl_nhi_force_power(struct tb_nhi *nhi, bool power)
 	 * The actual power management happens inside shared ACPI power
 	 * resources using standard ACPI methods.
 	 */
-	pci_read_config_dword(nhi->pdev, VS_CAP_22, &vs_cap);
+	pci_read_config_dword(nhi_pci->pdev, VS_CAP_22, &vs_cap);
 	if (power) {
 		vs_cap &= ~VS_CAP_22_DMA_DELAY_MASK;
 		vs_cap |= 0x22 << VS_CAP_22_DMA_DELAY_SHIFT;
@@ -56,7 +58,7 @@ static int icl_nhi_force_power(struct tb_nhi *nhi, bool power)
 	} else {
 		vs_cap &= ~VS_CAP_22_FORCE_POWER;
 	}
-	pci_write_config_dword(nhi->pdev, VS_CAP_22, vs_cap);
+	pci_write_config_dword(nhi_pci->pdev, VS_CAP_22, vs_cap);
 
 	if (power) {
 		unsigned int retries = 350;
@@ -64,7 +66,7 @@ static int icl_nhi_force_power(struct tb_nhi *nhi, bool power)
 
 		/* Wait until the firmware tells it is up and running */
 		do {
-			pci_read_config_dword(nhi->pdev, VS_CAP_9, &val);
+			pci_read_config_dword(nhi_pci->pdev, VS_CAP_9, &val);
 			if (val & VS_CAP_9_FW_READY)
 				return 0;
 			usleep_range(3000, 3100);
@@ -78,14 +80,16 @@ static int icl_nhi_force_power(struct tb_nhi *nhi, bool power)
 
 static void icl_nhi_lc_mailbox_cmd(struct tb_nhi *nhi, enum icl_lc_mailbox_cmd cmd)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	u32 data;
 
 	data = (cmd << VS_CAP_19_CMD_SHIFT) & VS_CAP_19_CMD_MASK;
-	pci_write_config_dword(nhi->pdev, VS_CAP_19, data | VS_CAP_19_VALID);
+	pci_write_config_dword(nhi_pci->pdev, VS_CAP_19, data | VS_CAP_19_VALID);
 }
 
 static int icl_nhi_lc_mailbox_cmd_complete(struct tb_nhi *nhi, int timeout)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	unsigned long end;
 	u32 data;
 
@@ -94,7 +98,7 @@ static int icl_nhi_lc_mailbox_cmd_complete(struct tb_nhi *nhi, int timeout)
 
 	end = jiffies + msecs_to_jiffies(timeout);
 	do {
-		pci_read_config_dword(nhi->pdev, VS_CAP_18, &data);
+		pci_read_config_dword(nhi_pci->pdev, VS_CAP_18, &data);
 		if (data & VS_CAP_18_DONE)
 			goto clear;
 		usleep_range(1000, 1100);
@@ -104,24 +108,25 @@ static int icl_nhi_lc_mailbox_cmd_complete(struct tb_nhi *nhi, int timeout)
 
 clear:
 	/* Clear the valid bit */
-	pci_write_config_dword(nhi->pdev, VS_CAP_19, 0);
+	pci_write_config_dword(nhi_pci->pdev, VS_CAP_19, 0);
 	return 0;
 }
 
 static void icl_nhi_set_ltr(struct tb_nhi *nhi)
 {
+	struct tb_nhi_pci *nhi_pci = nhi_to_pci(nhi);
 	u32 max_ltr, ltr;
 
-	pci_read_config_dword(nhi->pdev, VS_CAP_16, &max_ltr);
+	pci_read_config_dword(nhi_pci->pdev, VS_CAP_16, &max_ltr);
 	max_ltr &= 0xffff;
 	/* Program the same value for both snoop and no-snoop */
 	ltr = max_ltr << 16 | max_ltr;
-	pci_write_config_dword(nhi->pdev, VS_CAP_15, ltr);
+	pci_write_config_dword(nhi_pci->pdev, VS_CAP_15, ltr);
 }
 
 static int icl_nhi_suspend(struct tb_nhi *nhi)
 {
-	struct tb *tb = pci_get_drvdata(nhi->pdev);
+	struct tb *tb = dev_get_drvdata(nhi->dev);
 	int ret;
 
 	if (icl_nhi_is_device_connected(nhi))
@@ -144,7 +149,7 @@ static int icl_nhi_suspend(struct tb_nhi *nhi)
 
 static int icl_nhi_suspend_noirq(struct tb_nhi *nhi, bool wakeup)
 {
-	struct tb *tb = pci_get_drvdata(nhi->pdev);
+	struct tb *tb = dev_get_drvdata(nhi->dev);
 	enum icl_lc_mailbox_cmd cmd;
 
 	if (!pm_suspend_via_firmware())
@@ -182,4 +187,6 @@ const struct tb_nhi_ops icl_nhi_ops = {
 	.runtime_suspend = icl_nhi_suspend,
 	.runtime_resume = icl_nhi_resume,
 	.shutdown = icl_nhi_shutdown,
+	.pre_nvm_auth = nhi_pci_start_dma_port,
+	.post_nvm_auth = nhi_pci_complete_dma_port,
 };
diff --git a/drivers/thunderbolt/nhi_pci.h b/drivers/thunderbolt/nhi_pci.h
new file mode 100644
index 000000000000..9f686e0512e9
--- /dev/null
+++ b/drivers/thunderbolt/nhi_pci.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __TBT_NHI_PCI_H
+#define __TBT_NHI_PCI_H
+
+struct tb_nhi_pci {
+	struct pci_dev *pdev;
+	struct ida msix_ida;
+	struct tb_nhi nhi;
+};
+
+static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
+{
+	return container_of(nhi, struct tb_nhi_pci, nhi);
+}
+
+#endif
diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index c2ad58b19e7b..9647650ee02d 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -209,30 +209,6 @@ static int nvm_authenticate_device_dma_port(struct tb_switch *sw)
 	return -ETIMEDOUT;
 }
 
-static void nvm_authenticate_start_dma_port(struct tb_switch *sw)
-{
-	struct pci_dev *root_port;
-
-	/*
-	 * During host router NVM upgrade we should not allow root port to
-	 * go into D3cold because some root ports cannot trigger PME
-	 * itself. To be on the safe side keep the root port in D0 during
-	 * the whole upgrade process.
-	 */
-	root_port = pcie_find_root_port(sw->tb->nhi->pdev);
-	if (root_port)
-		pm_runtime_get_noresume(&root_port->dev);
-}
-
-static void nvm_authenticate_complete_dma_port(struct tb_switch *sw)
-{
-	struct pci_dev *root_port;
-
-	root_port = pcie_find_root_port(sw->tb->nhi->pdev);
-	if (root_port)
-		pm_runtime_put(&root_port->dev);
-}
-
 static inline bool nvm_readable(struct tb_switch *sw)
 {
 	if (tb_switch_is_usb4(sw)) {
@@ -258,6 +234,7 @@ static inline bool nvm_upgradeable(struct tb_switch *sw)
 
 static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 {
+	struct tb_nhi *nhi = sw->tb->nhi;
 	int ret;
 
 	if (tb_switch_is_usb4(sw)) {
@@ -274,7 +251,8 @@ static int nvm_authenticate(struct tb_switch *sw, bool auth_only)
 
 	sw->nvm->authenticating = true;
 	if (!tb_route(sw)) {
-		nvm_authenticate_start_dma_port(sw);
+		if (nhi->ops && nhi->ops->pre_nvm_auth)
+			nhi->ops->pre_nvm_auth(nhi);
 		ret = nvm_authenticate_host_dma_port(sw);
 	} else {
 		ret = nvm_authenticate_device_dma_port(sw);
@@ -2743,6 +2721,7 @@ static int tb_switch_set_uuid(struct tb_switch *sw)
 
 static int tb_switch_add_dma_port(struct tb_switch *sw)
 {
+	struct tb_nhi *nhi = sw->tb->nhi;
 	u32 status;
 	int ret;
 
@@ -2802,8 +2781,10 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 	 */
 	nvm_get_auth_status(sw, &status);
 	if (status) {
-		if (!tb_route(sw))
-			nvm_authenticate_complete_dma_port(sw);
+		if (!tb_route(sw)) {
+			if (nhi->ops && nhi->ops->post_nvm_auth)
+				nhi->ops->post_nvm_auth(nhi);
+		}
 		return 0;
 	}
 
@@ -2817,8 +2798,10 @@ static int tb_switch_add_dma_port(struct tb_switch *sw)
 		return ret;
 
 	/* Now we can allow root port to suspend again */
-	if (!tb_route(sw))
-		nvm_authenticate_complete_dma_port(sw);
+	if (!tb_route(sw)) {
+		if (nhi->ops && nhi->ops->post_nvm_auth)
+			nhi->ops->post_nvm_auth(nhi);
+	}
 
 	if (status) {
 		tb_sw_info(sw, "switch flash authentication failed\n");
diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index c69c323e6952..0126e38d9396 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -10,7 +10,6 @@
 #include <linux/errno.h>
 #include <linux/delay.h>
 #include <linux/pm_runtime.h>
-#include <linux/platform_data/x86/apple.h>
 
 #include "tb.h"
 #include "tb_regs.h"
@@ -3295,74 +3294,6 @@ static const struct tb_cm_ops tb_cm_ops = {
 	.disconnect_xdomain_paths = tb_disconnect_xdomain_paths,
 };
 
-/*
- * During suspend the Thunderbolt controller is reset and all PCIe
- * tunnels are lost. The NHI driver will try to reestablish all tunnels
- * during resume. This adds device links between the tunneled PCIe
- * downstream ports and the NHI so that the device core will make sure
- * NHI is resumed first before the rest.
- */
-static bool tb_apple_add_links(struct tb_nhi *nhi)
-{
-	struct pci_dev *upstream, *pdev;
-	bool ret;
-
-	if (!x86_apple_machine)
-		return false;
-
-	switch (nhi->pdev->device) {
-	case PCI_DEVICE_ID_INTEL_LIGHT_RIDGE:
-	case PCI_DEVICE_ID_INTEL_CACTUS_RIDGE_4C:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_2C_NHI:
-	case PCI_DEVICE_ID_INTEL_FALCON_RIDGE_4C_NHI:
-		break;
-	default:
-		return false;
-	}
-
-	upstream = pci_upstream_bridge(nhi->pdev);
-	while (upstream) {
-		if (!pci_is_pcie(upstream))
-			return false;
-		if (pci_pcie_type(upstream) == PCI_EXP_TYPE_UPSTREAM)
-			break;
-		upstream = pci_upstream_bridge(upstream);
-	}
-
-	if (!upstream)
-		return false;
-
-	/*
-	 * For each hotplug downstream port, create add device link
-	 * back to NHI so that PCIe tunnels can be re-established after
-	 * sleep.
-	 */
-	ret = false;
-	for_each_pci_bridge(pdev, upstream->subordinate) {
-		const struct device_link *link;
-
-		if (!pci_is_pcie(pdev))
-			continue;
-		if (pci_pcie_type(pdev) != PCI_EXP_TYPE_DOWNSTREAM ||
-		    !pdev->is_pciehp)
-			continue;
-
-		link = device_link_add(&pdev->dev, &nhi->pdev->dev,
-				       DL_FLAG_AUTOREMOVE_SUPPLIER |
-				       DL_FLAG_PM_RUNTIME);
-		if (link) {
-			dev_dbg(&nhi->pdev->dev, "created link from %s\n",
-				dev_name(&pdev->dev));
-			ret = true;
-		} else {
-			dev_warn(&nhi->pdev->dev, "device link creation from %s failed\n",
-				 dev_name(&pdev->dev));
-		}
-	}
-
-	return ret;
-}
-
 struct tb *tb_probe(struct tb_nhi *nhi)
 {
 	struct tb_cm *tcm;
diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
index e96474f17067..ee689df8f1d8 100644
--- a/drivers/thunderbolt/tb.h
+++ b/drivers/thunderbolt/tb.h
@@ -724,11 +724,11 @@ static inline int tb_port_write(struct tb_port *port, const void *buffer,
 			    length);
 }
 
-#define tb_err(tb, fmt, arg...) dev_err(&(tb)->nhi->pdev->dev, fmt, ## arg)
-#define tb_WARN(tb, fmt, arg...) dev_WARN(&(tb)->nhi->pdev->dev, fmt, ## arg)
-#define tb_warn(tb, fmt, arg...) dev_warn(&(tb)->nhi->pdev->dev, fmt, ## arg)
-#define tb_info(tb, fmt, arg...) dev_info(&(tb)->nhi->pdev->dev, fmt, ## arg)
-#define tb_dbg(tb, fmt, arg...) dev_dbg(&(tb)->nhi->pdev->dev, fmt, ## arg)
+#define tb_err(tb, fmt, arg...) dev_err((tb)->nhi->dev, fmt, ## arg)
+#define tb_WARN(tb, fmt, arg...) dev_WARN((tb)->nhi->dev, fmt, ## arg)
+#define tb_warn(tb, fmt, arg...) dev_warn((tb)->nhi->dev, fmt, ## arg)
+#define tb_info(tb, fmt, arg...) dev_info((tb)->nhi->dev, fmt, ## arg)
+#define tb_dbg(tb, fmt, arg...) dev_dbg((tb)->nhi->dev, fmt, ## arg)
 
 #define __TB_SW_PRINT(level, sw, fmt, arg...)           \
 	do {                                            \
diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
index c32d3516e780..890de530debc 100644
--- a/drivers/thunderbolt/usb4_port.c
+++ b/drivers/thunderbolt/usb4_port.c
@@ -138,7 +138,7 @@ bool usb4_usb3_port_match(struct device *usb4_port_dev,
 		return false;
 
 	/* Check if USB3 fwnode references same NHI where USB4 port resides */
-	if (!device_match_fwnode(&nhi->pdev->dev, nhi_fwnode))
+	if (!device_match_fwnode(nhi->dev, nhi_fwnode))
 		return false;
 
 	if (fwnode_property_read_u8(usb3_port_fwnode, "usb4-port-number", &usb4_port_num))
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index 0ba112175bb3..789cd7f364e1 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -496,12 +496,11 @@ static inline struct tb_xdomain *tb_service_parent(struct tb_service *svc)
  */
 struct tb_nhi {
 	spinlock_t lock;
-	struct pci_dev *pdev;
+	struct device *dev;
 	const struct tb_nhi_ops *ops;
 	void __iomem *iobase;
 	struct tb_ring **tx_rings;
 	struct tb_ring **rx_rings;
-	struct ida msix_ida;
 	bool going_away;
 	bool iommu_dma_protection;
 	struct work_struct interrupt_work;
@@ -681,7 +680,7 @@ void tb_ring_poll_complete(struct tb_ring *ring);
  */
 static inline struct device *tb_ring_dma_device(struct tb_ring *ring)
 {
-	return &ring->nhi->pdev->dev;
+	return ring->nhi->dev;
 }
 
 bool usb4_usb3_port_match(struct device *usb4_port_dev,

-- 
2.53.0


