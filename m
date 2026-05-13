Return-Path: <linux-usb+bounces-37371-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPSgAzc2BGoqFgIAu9opvQ
	(envelope-from <linux-usb+bounces-37371-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:28:39 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1658652FA7F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:28:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 29C38304C6B5
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 08:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A39E53DD85D;
	Wed, 13 May 2026 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAcs/7m5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5343DA5C4;
	Wed, 13 May 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660757; cv=none; b=FLzbF84Zk3WbXlVl2LeLWtN9TUgQhR8ePuqx7E86jWpo4Kjtd4QzcNi2GDVXLtLZSfeQhwVPtR78ASngdQpZL2nfd/9aTDRrm91jUF6wZPNrgL0VdgCoSs0+KmoFZRxxUcoJRUyn5WAmUBqLE6gJoYrvWl3AEn5Wn1a7FQERJdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660757; c=relaxed/simple;
	bh=Wfr7yUk3XOyJcL0gWDyQj1FMhQ5o4D2VoIcxKvVBFns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5LcS7YTV1Hjk3t25yzl7vy/kITNoTZhvoQtNrCba6/o1dOr/Vpao+14S++t4Ev6nDVaLSZqOASWKRjkXgaZAVXrZNseAql6JdZ+1pSatouzxbnuSM6nt3z2OZlBgWcy6Lyr4gOKd36xoDHkRNpFNrROfntvuijoOhCTMP/DZwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAcs/7m5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC678C2BCC6;
	Wed, 13 May 2026 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778660756;
	bh=Wfr7yUk3XOyJcL0gWDyQj1FMhQ5o4D2VoIcxKvVBFns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dAcs/7m5SkrPVF/Hv29Q9n7ROFnT1YG4iEWxc/+xbj/8tNh0t9Y5FJ4xs/gcdCBTo
	 G8S/uSpCSbt07mLuM2kLjnyPhDOp4A6/Cd6OMnauQXzbq77hAgtgvdumLc0mrDPAsZ
	 acBFTXKrIUn56B6lnO97cUk44sarVsRvCrgsx+OJ3htyxNKAHTQdq2FkK6MV+lJFyi
	 Q5dfOQO+RpCJkJwjH0PMi2BVOGIxMqvl38pCZFpOEf+wxkS8xtyMZGJI8BpSlceZYb
	 JWPEPbOKRK7BCu9fgybYNKf/co7xRRinZbc02ynRlrBGROUcJdx1Wyd4U3Rivhwmxl
	 RMHy6rUtX45Fw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E27B7CD4F24;
	Wed, 13 May 2026 08:25:55 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Date: Wed, 13 May 2026 10:41:22 +0200
Subject: [PATCH v5 2/2] usb: cdnsp: Add support for device-only
 configuration
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-b4-no_drd_config-v5-2-1c633a4b9a29@cadence.com>
References: <20260513-b4-no_drd_config-v5-0-1c633a4b9a29@cadence.com>
In-Reply-To: <20260513-b4-no_drd_config-v5-0-1c633a4b9a29@cadence.com>
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, 
 Bjorn Helgaas <bhelgaas@google.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778661701; l=12874;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=o9ZUbi0KYoiza8YggqI4FwWY+Yoq8UPmM+SE0KQXAWc=;
 b=6a0E/nLqiT7ih6S6MpKzgf0iLKgX2YWI7ejeX9SJ4RY5EMrSp5hpG01L1k23LXAfxGvOS4j20
 AAFL9KxDFStD4AbfoJSmrmo0FCiRNOQrk2K/Kt2UNfbyNcOrntVUWWd
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Rspamd-Queue-Id: 1658652FA7F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37371-lists,linux-usb=lfdr.de,pawell.cadence.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pawell@cadence.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[plat_info.data:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,plat_info.properties:url,cadence.com:email,cadence.com:mid,cadence.com:replyto]
X-Rspamd-Action: no action

From: Pawel Laszczak <pawell@cadence.com>

This patch introduces support for the Cadence USBSSP (cdnsp)
controller in hardware configurations where the Dual-Role Device (DRD)
register block is not implemented or is inaccessible.

In such cases, the driver cannot rely on the DRD logic to manage roles
and must operate exclusively in a fixed peripheral/host mode.

The change in BAR indexing (from BAR 2 to BAR 1) is a direct
consequence of the 32-bit addressing used in this specific
DRD-disabled hardware layout, compared to the 64-bit addressing
used in DRD-enabled configurations.

Tested on a PCI platform with a hardware configuration that lacks
DRD support. Platform-side changes are included to support the PCI
glue layer's property injection to handle this specific layout.

Acked-by: Peter Chen <peter.chen@kernel.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
 drivers/usb/cdns3/cdns3-plat.c | 26 +++++++++++++----------
 drivers/usb/cdns3/cdnsp-pci.c  | 47 ++++++++++++++++++++++++++++++++++--------
 drivers/usb/cdns3/core.c       |  3 ++-
 drivers/usb/cdns3/core.h       |  4 ++++
 drivers/usb/cdns3/drd.c        | 44 +++++++++++++++++++++++++++++++++++++--
 5 files changed, 101 insertions(+), 23 deletions(-)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index 3fe3109a3688..86c963a072db 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -81,6 +81,7 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 	if (cdns->pdata && cdns->pdata->override_apb_timeout)
 		cdns->override_apb_timeout = cdns->pdata->override_apb_timeout;
 
+	cdns->no_drd = device_property_read_bool(dev, "no_drd");
 	platform_set_drvdata(pdev, cdns);
 
 	ret = platform_get_irq_byname(pdev, "host");
@@ -113,21 +114,24 @@ static int cdns3_plat_probe(struct platform_device *pdev)
 
 	cdns->dev_regs	= regs;
 
-	cdns->otg_irq = platform_get_irq_byname(pdev, "otg");
-	if (cdns->otg_irq < 0)
-		return dev_err_probe(dev, cdns->otg_irq,
-				     "Failed to get otg IRQ\n");
-
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
-	if (!res) {
-		dev_err(dev, "couldn't get otg resource\n");
-		return -ENXIO;
+	if (!cdns->no_drd) {
+		cdns->otg_irq = platform_get_irq_byname(pdev, "otg");
+		if (cdns->otg_irq < 0)
+			return dev_err_probe(dev, cdns->otg_irq,
+					     "Failed to get otg IRQ\n");
+
+		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "otg");
+		if (!res) {
+			dev_err(dev, "couldn't get otg resource\n");
+			return -ENXIO;
+		}
+		cdns->otg_res = *res;
+	} else {
+		dev_dbg(dev, "No DRD support\n");
 	}
 
 	cdns->phyrst_a_enable = device_property_read_bool(dev, "cdns,phyrst-a-enable");
 
-	cdns->otg_res = *res;
-
 	cdns->wakeup_irq = platform_get_irq_byname_optional(pdev, "wakeup");
 	if (cdns->wakeup_irq == -EPROBE_DEFER)
 		return cdns->wakeup_irq;
diff --git a/drivers/usb/cdns3/cdnsp-pci.c b/drivers/usb/cdns3/cdnsp-pci.c
index 432007cfe695..feb916229870 100644
--- a/drivers/usb/cdns3/cdnsp-pci.c
+++ b/drivers/usb/cdns3/cdnsp-pci.c
@@ -19,6 +19,7 @@
 
 struct cdnsp_wrap {
 	struct platform_device *plat_dev;
+	struct property_entry prop[3];
 	struct resource dev_res[6];
 	int devfn;
 };
@@ -29,10 +30,15 @@ struct cdnsp_wrap {
 #define RES_HOST_ID		3
 #define RES_DEV_ID		4
 #define RES_DRD_ID		5
-
+/* DRD PCI configuration - 64-bit addressing */
+/* First PCI function */
 #define PCI_BAR_HOST		0
-#define PCI_BAR_OTG		0
 #define PCI_BAR_DEV		2
+/* Second PCI function */
+#define PCI_BAR_OTG		0
+/* Device only PCI configuration - 32-bit addressing */
+/* First PCI function */
+#define PCI_BAR_ONLY_DEV	1
 
 #define PCI_DEV_FN_HOST_DEVICE	0
 #define PCI_DEV_FN_OTG		1
@@ -40,6 +46,7 @@ struct cdnsp_wrap {
 #define PCI_DRIVER_NAME		"cdns-pci-usbssp"
 #define PLAT_DRIVER_NAME	"cdns-usb3"
 
+#define PCI_DEVICE_ID_CDNS_UDC_USBSSP   0x0400
 #define CHICKEN_APB_TIMEOUT_VALUE	0x1C20
 
 static struct pci_dev *cdnsp_get_second_fun(struct pci_dev *pdev)
@@ -65,6 +72,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
 	struct cdnsp_wrap *wrap;
 	struct resource *res;
 	struct pci_dev *func;
+	bool no_drd = false;
 	int ret = 0;
 
 	/*
@@ -75,11 +83,14 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
 		    pdev->devfn != PCI_DEV_FN_OTG))
 		return -EINVAL;
 
+	if (pdev->device == PCI_DEVICE_ID_CDNS_UDC_USBSSP)
+		no_drd = true;
+
 	func = cdnsp_get_second_fun(pdev);
-	if (!func)
+	if (!func && !no_drd)
 		return -EINVAL;
 
-	if (func->class == PCI_CLASS_SERIAL_USB_XHCI ||
+	if ((func && func->class == PCI_CLASS_SERIAL_USB_XHCI) ||
 	    pdev->class == PCI_CLASS_SERIAL_USB_XHCI) {
 		ret = -EINVAL;
 		goto put_pci;
@@ -93,7 +104,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
 
 	pci_set_master(pdev);
 
-	if (pci_is_enabled(func)) {
+	if (func && pci_is_enabled(func)) {
 		wrap = pci_get_drvdata(func);
 	} else {
 		wrap = kzalloc_obj(*wrap);
@@ -106,10 +117,12 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
 	res = wrap->dev_res;
 
 	if (pdev->devfn == PCI_DEV_FN_HOST_DEVICE) {
+		int bar_dev = no_drd ? PCI_BAR_ONLY_DEV : PCI_BAR_DEV;
+
 		/* Function 0: host(BAR_0) + device(BAR_2). */
 		dev_dbg(&pdev->dev, "Initialize Device resources\n");
-		res[RES_DEV_ID].start = pci_resource_start(pdev, PCI_BAR_DEV);
-		res[RES_DEV_ID].end = pci_resource_end(pdev, PCI_BAR_DEV);
+		res[RES_DEV_ID].start = pci_resource_start(pdev, bar_dev);
+		res[RES_DEV_ID].end = pci_resource_end(pdev, bar_dev);
 		res[RES_DEV_ID].name = "dev";
 		res[RES_DEV_ID].flags = IORESOURCE_MEM;
 		dev_dbg(&pdev->dev, "USBSSP-DEV physical base addr: %pa\n",
@@ -145,9 +158,20 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
 		wrap->dev_res[RES_IRQ_OTG_ID].flags = IORESOURCE_IRQ;
 	}
 
-	if (pci_is_enabled(func)) {
+	if (no_drd || pci_is_enabled(func)) {
+		u8 idx = 0;
+
 		/* set up platform device info */
 		pdata.override_apb_timeout = CHICKEN_APB_TIMEOUT_VALUE;
+
+		if (no_drd) {
+			wrap->prop[idx++] = PROPERTY_ENTRY_STRING("dr_mode", "peripheral");
+			wrap->prop[idx++] = PROPERTY_ENTRY_BOOL("no_drd");
+		} else {
+			wrap->prop[idx++] = PROPERTY_ENTRY_STRING("dr_mode", "otg");
+			wrap->prop[idx++] = PROPERTY_ENTRY_BOOL("usb-role-switch");
+		}
+
 		memset(&plat_info, 0, sizeof(plat_info));
 		plat_info.parent = &pdev->dev;
 		plat_info.fwnode = pdev->dev.fwnode;
@@ -158,6 +182,7 @@ static int cdnsp_pci_probe(struct pci_dev *pdev,
 		plat_info.dma_mask = pdev->dma_mask;
 		plat_info.data = &pdata;
 		plat_info.size_data = sizeof(pdata);
+		plat_info.properties = wrap->prop;
 		wrap->devfn = pdev->devfn;
 		/* register platform device */
 		wrap->plat_dev = platform_device_register_full(&plat_info);
@@ -185,13 +210,17 @@ static void cdnsp_pci_remove(struct pci_dev *pdev)
 	if (wrap->devfn == pdev->devfn)
 		platform_device_unregister(wrap->plat_dev);
 
-	if (!pci_is_enabled(func))
+	if (!func || !pci_is_enabled(func))
 		kfree(wrap);
 
 	pci_dev_put(func);
 }
 
 static const struct pci_device_id cdnsp_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_CDNS, PCI_DEVICE_ID_CDNS_UDC_USBSSP),
+	  .class = PCI_CLASS_SERIAL_USB_DEVICE },
+	{ PCI_DEVICE(PCI_VENDOR_ID_CDNS, PCI_DEVICE_ID_CDNS_UDC_USBSSP),
+	  .class = PCI_CLASS_SERIAL_USB_CDNS },
 	{ PCI_DEVICE(PCI_VENDOR_ID_CDNS, PCI_DEVICE_ID_CDNS_USBSSP),
 	  .class = PCI_CLASS_SERIAL_USB_DEVICE },
 	{ PCI_DEVICE(PCI_VENDOR_ID_CDNS, PCI_DEVICE_ID_CDNS_USBSSP),
diff --git a/drivers/usb/cdns3/core.c b/drivers/usb/cdns3/core.c
index 6a8d1fefbc0d..504bdf13ea80 100644
--- a/drivers/usb/cdns3/core.c
+++ b/drivers/usb/cdns3/core.c
@@ -70,7 +70,8 @@ static void cdns_role_stop(struct cdns *cdns)
 static void cdns_exit_roles(struct cdns *cdns)
 {
 	cdns_role_stop(cdns);
-	cdns_drd_exit(cdns);
+	if (!cdns->no_drd)
+		cdns_drd_exit(cdns);
 }
 
 /**
diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
index bca973b999a4..8c492fda924c 100644
--- a/drivers/usb/cdns3/core.h
+++ b/drivers/usb/cdns3/core.h
@@ -84,6 +84,9 @@ struct cdns3_platform_data {
  *                        value in CHICKEN_BITS_3 will be preserved.
  * @gadget_init: pointer to gadget initialization function
  * @host_init: pointer to host initialization function
+ * @no_drd: DRD register block is inaccessible. The controller is hardwired to
+ *          single role (host or device) or the logic for role switching is
+ *          missing.
  */
 struct cdns {
 	struct device			*dev;
@@ -124,6 +127,7 @@ struct cdns {
 	u32                             override_apb_timeout;
 	int (*gadget_init)(struct cdns *cdns);
 	int (*host_init)(struct cdns *cdns);
+	bool				no_drd;
 };
 
 int cdns_hw_role_switch(struct cdns *cdns);
diff --git a/drivers/usb/cdns3/drd.c b/drivers/usb/cdns3/drd.c
index 84fb38a5723a..f87cf85cb97a 100644
--- a/drivers/usb/cdns3/drd.c
+++ b/drivers/usb/cdns3/drd.c
@@ -87,6 +87,9 @@ int cdns_get_id(struct cdns *cdns)
 {
 	int id;
 
+	if (cdns->no_drd)
+		return 0;
+
 	id = readl(&cdns->otg_regs->sts) & OTGSTS_ID_VALUE;
 	dev_dbg(cdns->dev, "OTG ID: %d", id);
 
@@ -107,7 +110,7 @@ void cdns_clear_vbus(struct cdns *cdns)
 {
 	u32 reg;
 
-	if (cdns->version != CDNSP_CONTROLLER_V2)
+	if (cdns->version != CDNSP_CONTROLLER_V2 || cdns->no_drd)
 		return;
 
 	reg = readl(&cdns->otg_cdnsp_regs->override);
@@ -120,7 +123,7 @@ void cdns_set_vbus(struct cdns *cdns)
 {
 	u32 reg;
 
-	if (cdns->version != CDNSP_CONTROLLER_V2)
+	if (cdns->version != CDNSP_CONTROLLER_V2 || cdns->no_drd)
 		return;
 
 	reg = readl(&cdns->otg_cdnsp_regs->override);
@@ -181,6 +184,9 @@ int cdns_drd_host_on(struct cdns *cdns)
 	u32 val, ready_bit;
 	int ret;
 
+	if (cdns->no_drd)
+		goto phy_set;
+
 	/* Enable host mode. */
 	writel(OTGCMD_HOST_BUS_REQ | OTGCMD_OTG_DIS,
 	       &cdns->otg_regs->cmd);
@@ -197,6 +203,7 @@ int cdns_drd_host_on(struct cdns *cdns)
 	if (ret)
 		dev_err(cdns->dev, "timeout waiting for xhci_ready\n");
 
+phy_set:
 	phy_set_mode(cdns->usb2_phy, PHY_MODE_USB_HOST);
 	phy_set_mode(cdns->usb3_phy, PHY_MODE_USB_HOST);
 	return ret;
@@ -210,6 +217,9 @@ void cdns_drd_host_off(struct cdns *cdns)
 {
 	u32 val;
 
+	if (cdns->no_drd)
+		goto phy_set;
+
 	writel(OTGCMD_HOST_BUS_DROP | OTGCMD_DEV_BUS_DROP |
 	       OTGCMD_DEV_POWER_OFF | OTGCMD_HOST_POWER_OFF,
 	       &cdns->otg_regs->cmd);
@@ -218,6 +228,8 @@ void cdns_drd_host_off(struct cdns *cdns)
 	readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
 				  !(val & OTGSTATE_HOST_STATE_MASK),
 				  1, 2000000);
+
+phy_set:
 	phy_set_mode(cdns->usb2_phy, PHY_MODE_INVALID);
 	phy_set_mode(cdns->usb3_phy, PHY_MODE_INVALID);
 }
@@ -234,6 +246,9 @@ int cdns_drd_gadget_on(struct cdns *cdns)
 	u32 ready_bit;
 	int ret, val;
 
+	if (cdns->no_drd)
+		goto phy_set;
+
 	/* switch OTG core */
 	writel(OTGCMD_DEV_BUS_REQ | reg, &cdns->otg_regs->cmd);
 
@@ -251,6 +266,7 @@ int cdns_drd_gadget_on(struct cdns *cdns)
 		return ret;
 	}
 
+phy_set:
 	phy_set_mode(cdns->usb2_phy, PHY_MODE_USB_DEVICE);
 	phy_set_mode(cdns->usb3_phy, PHY_MODE_USB_DEVICE);
 	return 0;
@@ -265,6 +281,9 @@ void cdns_drd_gadget_off(struct cdns *cdns)
 {
 	u32 val;
 
+	if (cdns->no_drd)
+		goto phy_set;
+
 	/*
 	 * Driver should wait at least 10us after disabling Device
 	 * before turning-off Device (DEV_BUS_DROP).
@@ -277,6 +296,8 @@ void cdns_drd_gadget_off(struct cdns *cdns)
 	readl_poll_timeout_atomic(&cdns->otg_regs->state, val,
 				  !(val & OTGSTATE_DEV_STATE_MASK),
 				  1, 2000000);
+
+phy_set:
 	phy_set_mode(cdns->usb2_phy, PHY_MODE_INVALID);
 	phy_set_mode(cdns->usb3_phy, PHY_MODE_INVALID);
 }
@@ -392,6 +413,19 @@ int cdns_drd_init(struct cdns *cdns)
 	u32 state, reg;
 	int ret;
 
+	if (cdns->no_drd) {
+		cdns->dr_mode = usb_get_dr_mode(cdns->dev);
+		cdns->version = CDNSP_CONTROLLER_V2;
+
+		if (cdns->dr_mode != USB_DR_MODE_HOST &&
+		    cdns->dr_mode != USB_DR_MODE_PERIPHERAL) {
+			dev_err(cdns->dev, "Incorrect dr_mode\n");
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
 	regs = devm_ioremap_resource(cdns->dev, &cdns->otg_res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
@@ -492,6 +526,9 @@ int cdns_drd_init(struct cdns *cdns)
 
 int cdns_drd_exit(struct cdns *cdns)
 {
+	if (cdns->no_drd)
+		return 0;
+
 	cdns_otg_disable_irq(cdns);
 
 	return 0;
@@ -500,6 +537,9 @@ int cdns_drd_exit(struct cdns *cdns)
 /* Indicate the cdns3 core was power lost before */
 bool cdns_power_is_lost(struct cdns *cdns)
 {
+	if (cdns->no_drd)
+		return false;
+
 	if (cdns->version == CDNS3_CONTROLLER_V0) {
 		if (!(readl(&cdns->otg_v0_regs->simulate) & BIT(0)))
 			return true;

-- 
2.43.0



