Return-Path: <linux-usb+bounces-4028-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2BA80E94D
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 11:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336C31F21832
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 10:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F6F5C094;
	Tue, 12 Dec 2023 10:39:36 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F4579F
	for <linux-usb@vger.kernel.org>; Tue, 12 Dec 2023 02:39:31 -0800 (PST)
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: linux-usb@vger.kernel.org
Cc: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH] platform/x86: serial-multi-instantiate: allow single GpioInt IRQ for INT3515
Date: Tue, 12 Dec 2023 11:38:11 +0100
Message-ID: <20231212103823.546118-2-michal.kopec@3mdeb.com>
In-Reply-To: <CH3J5S.PJBGAHBM3MBE2@nozomi.space>
References: <CH3J5S.PJBGAHBM3MBE2@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Michał Kopeć <michal@nozomi.space>

On some devices, such as the Lenovo ThinkPad T14 Gen1 (AMD), there is
only one GpioInt resource defined for all i2c device instances. Handle
this case appropriately by autodetecting the irq type and allowing
fallback to the first IRQ index for the second, third and fourth
tps6598x instances.

Additionally, to use the `platform_get_irq_optional` function to silence
errors that may not be relevant if the IRQ is optional. In cases where
the IRQ is not optional, `dev_err_probe` is still triggered, so other
devices will not be affected by this change.

v2: fix linewrap in summary
v3: fix more patch formatting issues

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 .../platform/x86/serial-multi-instantiate.c   | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 8158e3cf5d6d..1c4cc44d5a88 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -23,6 +23,8 @@
 #define IRQ_RESOURCE_APIC	2
 #define IRQ_RESOURCE_AUTO   3
 
+#define IRQ_OPTIONAL		BIT(2)
+
 enum smi_bus_type {
 	SMI_I2C,
 	SMI_SPI,
@@ -59,7 +61,7 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
 			dev_dbg(&pdev->dev, "Using gpio irq\n");
 			break;
 		}
-		ret = platform_get_irq(pdev, inst->irq_idx);
+		ret = platform_get_irq_optional(pdev, inst->irq_idx);
 		if (ret > 0) {
 			dev_dbg(&pdev->dev, "Using platform irq\n");
 			break;
@@ -69,12 +71,12 @@ static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
 		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
 		break;
 	case IRQ_RESOURCE_APIC:
-		ret = platform_get_irq(pdev, inst->irq_idx);
+		ret = platform_get_irq_optional(pdev, inst->irq_idx);
 		break;
 	default:
 		return 0;
 	}
-	if (ret < 0)
+	if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
 		return dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d\n",
 				     inst->irq_idx);
 
@@ -210,6 +212,8 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
 		board_info.dev_name = name;
 
 		ret = smi_get_irq(pdev, adev, &inst_array[i]);
+		if (ret < 0 && inst_array[i].flags & IRQ_OPTIONAL)
+			ret = smi_get_irq(pdev, adev, &inst_array[0]);
 		if (ret < 0)
 			goto error;
 		board_info.irq = ret;
@@ -309,10 +313,11 @@ static const struct smi_node bsg2150_data = {
 
 static const struct smi_node int3515_data = {
 	.instances = {
-		{ "tps6598x", IRQ_RESOURCE_APIC, 0 },
-		{ "tps6598x", IRQ_RESOURCE_APIC, 1 },
-		{ "tps6598x", IRQ_RESOURCE_APIC, 2 },
-		{ "tps6598x", IRQ_RESOURCE_APIC, 3 },
+		{ "tps6598x", IRQ_RESOURCE_AUTO, 0 },
+		/* On some platforms only one shared GpioInt is defined */
+		{ "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 1 },
+		{ "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 2 },
+		{ "tps6598x", IRQ_RESOURCE_AUTO | IRQ_OPTIONAL, 3 },
 		{}
 	},
 	.bus_type = SMI_I2C,
-- 
2.43.0


