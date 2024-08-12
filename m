Return-Path: <linux-usb+bounces-13320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 232A494E578
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2024 05:09:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F25DB222E1
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2024 03:09:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A57915C129;
	Mon, 12 Aug 2024 03:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5S8JGbV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1015383E;
	Mon, 12 Aug 2024 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723432066; cv=none; b=s8VZaZAJOl8AQ9GrSxlE/7uGQ+iRhKs7sIu1yEKlF3zK291jQpc/zltJsoCT1EcixfZBOozhRdmWgozMGOoa6COdtgjohpjXbNZYLZG5TWHdKhkG4FtcTtmzh0lF/xsaNIbtF2Pzjc8tr9JXM+zLshuHVUGu9az4EJZJLHwcgyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723432066; c=relaxed/simple;
	bh=079ywrn/We/3EGMrCGz5XGBaJhRsIjb5O/3rllSBwaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ITxdK5dfPtdQ1V5WvRSerrEG3lDyXKxu6Cw2TQheJxhOAXRYEv4mOv4qqQXRoFf5h56U4C9r+E1pK4BjJf4LbjjOHoMmAVZNWzqqscyK2TfV0M7cRDrJHZtgYAyk4d33a7yofC4LtZ5nZcybEnml9T0UGVJOk+Grj7hkGX7YGbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5S8JGbV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47276C4DDE7;
	Mon, 12 Aug 2024 03:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723432066;
	bh=079ywrn/We/3EGMrCGz5XGBaJhRsIjb5O/3rllSBwaU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X5S8JGbVGh8z9YFBqIBqCI8V11PqTddy9GliC2uUaGertXDTfQZyGem4AlOwY8fg1
	 P/giTRH8UaI9C8BUsaulBozaVqP982BInbl1nkXSZAIOEjQ9ndm2oAtzArr7isdGr4
	 dLluaFU+gFM44lCO9U23yRWBrfUGtrsUbBME1xQqifiHDOvR6J3S2hgJOthvSG/tWW
	 oJ/ztoVWXAnzvcEKCHPcyYfj+IYnNLslQ/K/o6IYtfnlDCW0MrwSsK/G25KpxsQ349
	 zrxSJQweJGUf4n6qEdARDRXCxH3Hh27YDBirNjrzobgsofjmcAsbgQpw2BvLMudT0b
	 KUqFz+E096Y3Q==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sun, 11 Aug 2024 20:12:03 -0700
Subject: [PATCH v2 6/7] usb: dwc3: qcom: Transition to flattened model
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dwc3-refactor-v2-6-91f370d61ad2@quicinc.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=17070;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=Os3ZutgkUqZ8qr2tdrFlb2NyD7x3AP+95QggSxjSBZo=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmuX2AC8dOVZGgGqy3UNaLE+AzCcGto4T7hYJgn
 8wPaKdWVPWJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZrl9gBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWeBw//erP65ge2adria0LmmxhDWnEjkI6cFOufjp3pTlA
 IMF0KP5aGoKqSWKfHnPBtpgltC9ymRTkd7kA2Xuzkz3rnSeZs0+WrFXLlH8t/0UEaezQPoSIAQ/
 BMRb4t8BzVZt8zsWPVeUcMgb+9qSHunRwvzq6ubL/RY0iaaLxhiD+N5enAdJMmEVWS6UuU7dfL4
 K3XITmh0uiULPtnvEgdybClyh9QFs/NI7n64vJ3avmhh+bs8FaAgDV7Y2I2bx0ZG0AM7Or/qKEI
 nxTjw2GCfIY5n0pqHmpFY/5LU5El+ByFRF/X8HDrJMr8JV4Xf7+8WrXswfwene+xSbxgA9gHtT7
 Hj7HC4k4t5EdW8SJ8Ll0fGuUp0GhyRpCTymytRuoj4Zj44c9jgWoyi0aHiYfTGiRrjdGxnhuyO6
 LXBOuz482bQCiwFYCF4H3WzMaQiKXuzNprdLxCphLtJrk983+zzd0m8jV1yjUEJ+7NKns5e9uN8
 id6xmOsNY3Fqiq5IU/vEWP+BlbStr4n/KU/hpUgxcxqICPbhgGC1dDN6eIS+wP2KytBobFqSq0i
 GzitUFRviRbdDhTGIh5N37oPCwC3nmQzPZQO+Nvk0PvP2uoAODiRk5QqKZ7VmBS9ByZk6L/1Kih
 hTgvVZNSYexMqnlelMSLWXOuSkWp26xkG+459rugVIyw=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The USB IP-block found in most Qualcomm platforms is modelled in the
Linux kernel as 3 different independent device drivers, but as shown by
the already existing layering violations in the Qualcomm glue driver
they can not be operated independently.

With the current implementation, the glue driver registers the core and
has no way to know when this is done. As a result, e.g. the suspend
callbacks needs to guard against NULL pointer dereferences when trying
to peek into the struct dwc3 found in the drvdata of the child.
Even with these checks, there are no way to fully protect ourselves from
the race conditions that occur if the DWC3 is unbound.

Missing from the upstream Qualcomm USB support is handling of role
switching, in which the glue needs to be notified upon DRD mode changes.
Several attempts has been made through the years to register callbacks
etc, but they always fall short when it comes to handling of the core's
probe deferral on resources etc.

Moving to a model where the DWC3 core is instantiated in a synchronous
fashion avoids above described race conditions.

It is however not feasible to do so without also flattening the
DeviceTree binding, as assumptions are made in the DWC3 core and
frameworks used that the device's associated of_node will the that of
the core. Furthermore, the DeviceTree binding is a direct
representation of the Linux driver model, and doesn't necessarily
describe "the USB IP-block".

The Qualcomm DWC3 glue driver is therefor transitioned to initialize and
operate the DWC3 within the one device context, in synchronous fashion.

To handle backwards compatibility, and to remove the two-device model,
of_nodes of the old compatible are converted to the new one, early
during probe.

This happens in the event that a DWC3 core child node is present, the
content of the reg and interrupt properties of this node are merged into
the shared properties, all remaining properties are copied and the core
node is dropped. Effectively transitioning the node from qcom,dwc3 to
qcom,snps-dwc3.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 310 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 251 insertions(+), 59 deletions(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 33de03f2d782..27b5013cd411 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -6,6 +6,7 @@
 
 #include <linux/io.h>
 #include <linux/of.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/irq.h>
 #include <linux/of_clk.h>
@@ -13,6 +14,8 @@
 #include <linux/kernel.h>
 #include <linux/extcon.h>
 #include <linux/interconnect.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
@@ -22,6 +25,7 @@
 #include <linux/usb/hcd.h>
 #include <linux/usb.h>
 #include "core.h"
+#include "glue.h"
 
 /* USB QSCRATCH Hardware registers */
 #define QSCRATCH_HS_PHY_CTRL			0x10
@@ -72,7 +76,7 @@ struct dwc3_qcom_port {
 struct dwc3_qcom {
 	struct device		*dev;
 	void __iomem		*qscratch_base;
-	struct platform_device	*dwc3;
+	struct dwc3		*dwc;
 	struct clk		**clks;
 	int			num_clocks;
 	struct reset_control	*resets;
@@ -259,7 +263,7 @@ static int dwc3_qcom_interconnect_init(struct dwc3_qcom *qcom)
 		goto put_path_ddr;
 	}
 
-	max_speed = usb_get_maximum_speed(&qcom->dwc3->dev);
+	max_speed = usb_get_maximum_speed(qcom->dwc->dev);
 	if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN) {
 		ret = icc_set_bw(qcom->icc_path_ddr,
 				USB_MEMORY_AVG_SS_BW, USB_MEMORY_PEAK_SS_BW);
@@ -302,25 +306,16 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
 /* Only usable in contexts where the role can not change. */
 static bool dwc3_qcom_is_host(struct dwc3_qcom *qcom)
 {
-	struct dwc3 *dwc;
-
-	/*
-	 * FIXME: Fix this layering violation.
-	 */
-	dwc = platform_get_drvdata(qcom->dwc3);
-
-	/* Core driver may not have probed yet. */
-	if (!dwc)
-		return false;
+	struct dwc3 *dwc = qcom->dwc;
 
 	return dwc->xhci;
 }
 
 static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom, int port_index)
 {
-	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
 	struct usb_device *udev;
 	struct usb_hcd __maybe_unused *hcd;
+	struct dwc3 *dwc = qcom->dwc;
 
 	/*
 	 * FIXME: Fix this layering violation.
@@ -497,7 +492,7 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
 static irqreturn_t qcom_dwc3_resume_irq(int irq, void *data)
 {
 	struct dwc3_qcom *qcom = data;
-	struct dwc3	*dwc = platform_get_drvdata(qcom->dwc3);
+	struct dwc3 *dwc = qcom->dwc;
 
 	/* If pm_suspended then let pm_resume take care of resuming h/w */
 	if (qcom->pm_suspended)
@@ -699,34 +694,198 @@ static int dwc3_qcom_clk_init(struct dwc3_qcom *qcom, int count)
 	return 0;
 }
 
-static int dwc3_qcom_of_register_core(struct dwc3_qcom *qcom, struct platform_device *pdev)
+static struct property *dwc3_qcom_legacy_prop_concat(const char *name,
+						     const void *a, size_t a_len,
+						     const void *b, size_t b_len)
 {
-	struct device_node	*np = pdev->dev.of_node, *dwc3_np;
-	struct device		*dev = &pdev->dev;
-	int			ret;
+	size_t len = a_len + b_len;
 
-	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
-	if (!dwc3_np) {
-		dev_err(dev, "failed to find dwc3 core child\n");
-		return -ENODEV;
-	}
+	struct property *prop __free(kfree) = kzalloc(sizeof(*prop), GFP_KERNEL);
+	char *prop_name __free(kfree) = kstrdup(name, GFP_KERNEL);
+	void *value __free(kfree) = kzalloc(len, GFP_KERNEL);
+	if (!prop || !prop_name || !value)
+		return NULL;
 
-	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret) {
-		dev_err(dev, "failed to register dwc3 core - %d\n", ret);
-		goto node_put;
+	prop->name = no_free_ptr(prop_name);
+	prop->value = no_free_ptr(value);
+	prop->length = len;
+
+	memcpy(prop->value, a, a_len);
+	memcpy(prop->value + a_len, b, b_len);
+
+	return_ptr(prop);
+}
+
+/* Replace reg property with base address from dwc3 node and fixed length */
+static int dwc3_qcom_legacy_update_reg(struct device_node *qcom,
+				       struct device_node *dwc3)
+{
+	int addr_cells;
+	int size_cells;
+	u64 dwc3_addr;
+	int ret;
+
+	ret = of_property_read_reg(dwc3, 0, &dwc3_addr, NULL);
+	if (ret < 0)
+		return ret;
+
+	addr_cells = of_n_addr_cells(qcom);
+	size_cells = of_n_addr_cells(qcom);
+
+	__be32 *reg __free(kfree) = kcalloc(addr_cells + size_cells, sizeof(__be32), GFP_KERNEL);
+	if (!reg)
+		return -ENOMEM;
+
+	reg[addr_cells - 1] = cpu_to_be32(dwc3_addr);
+	reg[addr_cells + size_cells - 1] = cpu_to_be32(SDM845_QSCRATCH_BASE_OFFSET + SDM845_QSCRATCH_SIZE);
+
+	struct property *prop __free(kfree)  = kzalloc(sizeof(*prop), GFP_KERNEL);
+	char *name __free(kfree) = kstrdup("reg", GFP_KERNEL);
+	if (!prop || !name)
+		return -ENOMEM;
+
+	prop->name = no_free_ptr(name);
+	prop->value = no_free_ptr(reg);
+	prop->length = (addr_cells + size_cells) * sizeof(__be32);
+
+	return of_update_property(qcom, no_free_ptr(prop));
+}
+
+/* Prepend dwc_usb3 interrupt to relevant interrupt properties */
+static int dwc3_qcom_legacy_convert_interrupts(struct device_node *qcom,
+					       struct property *dwc3_irq)
+{
+	const __be32 *interrupts;
+	struct property *new;
+	const void *names;
+	int interrupts_len;
+	int names_len;
+	int ret;
+
+	if ((interrupts = of_get_property(qcom, "interrupts-extended", &interrupts_len)) != NULL) {
+		struct device_node *parent __free(device_node) = of_irq_find_parent(qcom);
+		if (!parent)
+			return -EINVAL;
+
+		__be32 *value __free(kfree) = kzalloc(sizeof(__be32) + dwc3_irq->length, GFP_KERNEL);
+		if (!value)
+			return -ENOMEM;
+		value[0] = cpu_to_be32(parent->phandle);
+		memcpy(&value[1], dwc3_irq->value, dwc3_irq->length);
+
+		new = dwc3_qcom_legacy_prop_concat("interrupts-extended",
+						   value, sizeof(__be32) + dwc3_irq->length,
+						   interrupts, interrupts_len);
+	} else if ((interrupts = of_get_property(qcom, "interrupts", &interrupts_len)) != NULL) {
+		new = dwc3_qcom_legacy_prop_concat("interrupts",
+						   dwc3_irq->value, dwc3_irq->length,
+						   interrupts, interrupts_len);
+	} else {
+		return -EINVAL;
 	}
 
-	qcom->dwc3 = of_find_device_by_node(dwc3_np);
-	if (!qcom->dwc3) {
-		ret = -ENODEV;
-		dev_err(dev, "failed to get dwc3 platform device\n");
-		of_platform_depopulate(dev);
+	if (!new)
+		return -ENOMEM;
+
+	ret = of_update_property(qcom, new);
+	if (ret < 0)
+		return ret;
+
+	names = of_get_property(qcom, "interrupt-names", &names_len);
+	if (!names)
+		return -EINVAL;
+
+	new = dwc3_qcom_legacy_prop_concat("interrupt-names",
+					   "dwc_usb3", strlen("dwc_usb3") + 1,
+					   names, names_len);
+	if (!new)
+		return -ENOMEM;
+
+	return of_update_property(qcom, new);
+}
+
+/* Copy property to qcom node */
+static int dwc3_qcom_legacy_migrate_prop(struct device_node *qcom,
+					 struct property *prop)
+{
+	struct property *new __free(kfree) = kzalloc(sizeof(*new), GFP_KERNEL);
+	char *name __free(kfree) = kstrdup(prop->name, GFP_KERNEL);
+	void *value __free(kfree) = kmemdup(prop->value, prop->length, GFP_KERNEL);
+
+	if (!new || !name || !value)
+		return -ENOMEM;
+
+	new->name = no_free_ptr(name);
+	new->value = no_free_ptr(value);
+	new->length = prop->length;
+
+	return of_update_property(qcom, no_free_ptr(new));
+}
+
+/* Move a child node, with it's properties and children, from dwc3 to qcom node */
+static int dwc3_qcom_legacy_migrate_child(struct device_node *qcom,
+					  struct device_node *dwc3,
+					  const char *name)
+{
+	struct device_node *child;
+
+	child = of_get_child_by_name(dwc3, name);
+	if (!child)
+		return 0;
+
+	of_detach_node(child);
+	child->parent = qcom;
+	of_attach_node(child);
+	of_node_put(child);
+
+	return 0;
+}
+
+/* Convert dev's DeviceTree representation from qcom,dwc3 to qcom,snps-dwc3 binding */
+static int dwc3_qcom_convert_legacy_dt(struct device *dev)
+{
+	struct device_node *qcom = dev->of_node;
+	struct device_node *dwc3;
+	struct property *prop;
+	int ret = 0;
+
+	dwc3 = of_get_compatible_child(qcom, "snps,dwc3");
+	if (!dwc3)
+		return 0;
+
+	/* We have a child node, but no support for dynamic OF */
+	if (!IS_ENABLED(CONFIG_OF_DYNAMIC))
+		return -EINVAL;
+
+	for_each_property_of_node(dwc3, prop) {
+		if (!strcmp(prop->name, "compatible"))
+			;
+		else if (!strcmp(prop->name, "reg"))
+			ret = dwc3_qcom_legacy_update_reg(qcom, dwc3);
+		else if (!strcmp(prop->name, "interrupts"))
+			ret = dwc3_qcom_legacy_convert_interrupts(qcom, prop);
+		else
+			ret = dwc3_qcom_legacy_migrate_prop(qcom, prop);
 	}
 
-node_put:
-	of_node_put(dwc3_np);
+	if (ret < 0)
+		goto err_node_put;
+
+	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "port");
+	if (ret)
+		goto err_node_put;
+
+	ret = dwc3_qcom_legacy_migrate_child(qcom, dwc3, "ports");
+	if (ret)
+		goto err_node_put;
+
+	of_detach_node(dwc3);
+	of_node_put(dwc3);
 
+	return 0;
+
+err_node_put:
+	of_node_put(dwc3);
 	return ret;
 }
 
@@ -735,16 +894,21 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	struct device_node	*np = pdev->dev.of_node;
 	struct device		*dev = &pdev->dev;
 	struct dwc3_qcom	*qcom;
-	struct resource		*res;
+	struct resource		res;
 	int			ret, i;
 	bool			ignore_pipe_clk;
 	bool			wakeup_source;
 
+	ret = dwc3_qcom_convert_legacy_dt(dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to convert legacy OF node\n");
+		return ret;
+	}
+
 	qcom = devm_kzalloc(&pdev->dev, sizeof(*qcom), GFP_KERNEL);
 	if (!qcom)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, qcom);
 	qcom->dev = &pdev->dev;
 
 	qcom->resets = devm_reset_control_array_get_optional_exclusive(dev);
@@ -773,10 +937,14 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 		goto reset_assert;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	ret = of_address_to_resource(np, 0, &res);
+	if (ret < 0)
+		goto clk_disable;
+	res.end = res.start + SDM845_QSCRATCH_BASE_OFFSET;
 
-	qcom->qscratch_base = devm_ioremap_resource(dev, res);
+	qcom->qscratch_base = devm_ioremap(dev, res.end, SDM845_QSCRATCH_SIZE);
 	if (IS_ERR(qcom->qscratch_base)) {
+		dev_err(dev, "failed to map qscratch region: %pe\n", qcom->qscratch_base);
 		ret = PTR_ERR(qcom->qscratch_base);
 		goto clk_disable;
 	}
@@ -796,17 +964,17 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 	if (ignore_pipe_clk)
 		dwc3_qcom_select_utmi_clk(qcom);
 
-	ret = dwc3_qcom_of_register_core(qcom, pdev);
-	if (ret) {
-		dev_err(dev, "failed to register DWC3 Core, err=%d\n", ret);
+	qcom->dwc = dwc3_probe(pdev, &res, true, qcom);
+	if (IS_ERR(qcom->dwc))  {
+		ret = dev_err_probe(dev, PTR_ERR(qcom->dwc), "failed to register DWC3 Core\n");
 		goto clk_disable;
 	}
 
 	ret = dwc3_qcom_interconnect_init(qcom);
 	if (ret)
-		goto depopulate;
+		goto remove_core;
 
-	qcom->mode = usb_get_dr_mode(&qcom->dwc3->dev);
+	qcom->mode = usb_get_dr_mode(dev);
 
 	/* enable vbus override for device mode */
 	if (qcom->mode != USB_DR_MODE_HOST)
@@ -819,20 +987,15 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
 	device_init_wakeup(&pdev->dev, wakeup_source);
-	device_init_wakeup(&qcom->dwc3->dev, wakeup_source);
 
 	qcom->is_suspended = false;
-	pm_runtime_set_active(dev);
-	pm_runtime_enable(dev);
-	pm_runtime_forbid(dev);
 
 	return 0;
 
 interconnect_exit:
 	dwc3_qcom_interconnect_exit(qcom);
-depopulate:
-	of_platform_depopulate(&pdev->dev);
-	platform_device_put(qcom->dwc3);
+remove_core:
+	dwc3_remove(qcom->dwc);
 clk_disable:
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
@@ -846,13 +1009,11 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 static void dwc3_qcom_remove(struct platform_device *pdev)
 {
-	struct dwc3_qcom *qcom = platform_get_drvdata(pdev);
+	struct dwc3 *dwc = platform_get_drvdata(pdev);
+	struct dwc3_qcom *qcom = dwc->glue;
 	struct device *dev = &pdev->dev;
 	int i;
 
-	of_platform_depopulate(&pdev->dev);
-	platform_device_put(qcom->dwc3);
-
 	for (i = qcom->num_clocks - 1; i >= 0; i--) {
 		clk_disable_unprepare(qcom->clks[i]);
 		clk_put(qcom->clks[i]);
@@ -868,10 +1029,15 @@ static void dwc3_qcom_remove(struct platform_device *pdev)
 
 static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = dwc->glue;
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
+	ret = dwc3_suspend(qcom->dwc);
+	if (ret)
+		return ret;
+
 	ret = dwc3_qcom_suspend(qcom, wakeup);
 	if (ret)
 		return ret;
@@ -883,7 +1049,8 @@ static int __maybe_unused dwc3_qcom_pm_suspend(struct device *dev)
 
 static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = dwc->glue;
 	bool wakeup = device_may_wakeup(dev);
 	int ret;
 
@@ -893,31 +1060,56 @@ static int __maybe_unused dwc3_qcom_pm_resume(struct device *dev)
 
 	qcom->pm_suspended = false;
 
+	ret = dwc3_suspend(qcom->dwc);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
 static int __maybe_unused dwc3_qcom_runtime_suspend(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = dwc->glue;
+	int ret;
+
+	ret = dwc3_runtime_suspend(qcom->dwc);
+	if (ret)
+		return ret;
 
 	return dwc3_qcom_suspend(qcom, true);
 }
 
+static void __maybe_unused dwc3_qcom_complete(struct device *dev)
+{
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+
+	dwc3_complete(dwc);
+}
+
 static int __maybe_unused dwc3_qcom_runtime_resume(struct device *dev)
 {
-	struct dwc3_qcom *qcom = dev_get_drvdata(dev);
+	struct dwc3 *dwc = dev_get_drvdata(dev);
+	struct dwc3_qcom *qcom = dwc->glue;
+	int ret;
+
+	ret = dwc3_qcom_resume(qcom, true);
+	if (ret)
+		return ret;
 
-	return dwc3_qcom_resume(qcom, true);
+	return dwc3_runtime_resume(qcom->dwc);
 }
 
 static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(dwc3_qcom_pm_suspend, dwc3_qcom_pm_resume)
 	SET_RUNTIME_PM_OPS(dwc3_qcom_runtime_suspend, dwc3_qcom_runtime_resume,
 			   NULL)
+	.complete = dwc3_qcom_complete,
 };
 
 static const struct of_device_id dwc3_qcom_of_match[] = {
 	{ .compatible = "qcom,dwc3" },
+	{ .compatible = "qcom,snps-dwc3" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);

-- 
2.45.2


