Return-Path: <linux-usb+bounces-4058-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B45D80F097
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 16:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 46C63B21557
	for <lists+linux-usb@lfdr.de>; Tue, 12 Dec 2023 15:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5E87A233;
	Tue, 12 Dec 2023 15:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="RzLFWHBF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE14E4;
	Tue, 12 Dec 2023 07:26:07 -0800 (PST)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3BCDIrYm022629;
	Tue, 12 Dec 2023 16:25:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	selector1; bh=Mokd495pPZuOck3VG0eOg0eI5aC2lsYI/q7r8vaJx3Y=; b=Rz
	LFWHBFTwQ3o3UMsoMdnEzzCgydQH4YR1KtkGkLIWX1i9r8+xzX9AgmzV9hEsTU+E
	PguQibj71ac1Kk7a2kRL1D2w7XfxbogGwIMNgkdluGgCo046evEEE6THNm8fr9bq
	wVHzzDXG95IF0B6+KGPgGZc5pk+pgO0Lpf3oiFu79B8xoMEYvTjQd3MwHPfftO4l
	Bbj/cALsWSYbxS6mi0jI50nCvYk2IBWm9fKVKYEubZ1nTez0Ip+D3x47bKZq/Uox
	pOHbKr1rlLj6WqykdZAhB2GSQWGk4AyZGy1ju5nETJT8AZFs5K5F2p1ZtEtKkJ7o
	kZNiYdj9PcnxM2/HMOvQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uvg0gut1a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 16:25:20 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C95E9100060;
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id BCEA822D195;
	Tue, 12 Dec 2023 16:25:19 +0100 (CET)
Received: from localhost (10.252.7.20) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 12 Dec
 2023 16:25:19 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
To: <Oleksii_Moisieiev@epam.com>, <gregkh@linuxfoundation.org>,
        <herbert@gondor.apana.org.au>, <davem@davemloft.net>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <alexandre.torgue@foss.st.com>,
        <vkoul@kernel.org>, <jic23@kernel.org>, <olivier.moysan@foss.st.com>,
        <arnaud.pouliquen@foss.st.com>, <mchehab@kernel.org>,
        <fabrice.gasnier@foss.st.com>, <andi.shyti@kernel.org>,
        <ulf.hansson@linaro.org>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <hugues.fruchet@foss.st.com>, <lee@kernel.org>,
        <will@kernel.org>, <catalin.marinas@arm.com>, <arnd@kernel.org>,
        <richardcochran@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
        <peng.fan@oss.nxp.com>, <lars@metafoo.de>, <rcsekar@samsung.com>,
        <wg@grandegger.com>, <mkl@pengutronix.de>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <dmaengine@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-iio@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
        <netdev@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
Subject: [PATCH v8 05/13] firewall: introduce stm32_firewall framework
Date: Tue, 12 Dec 2023 16:23:48 +0100
Message-ID: <20231212152356.345703-6-gatien.chevallier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
References: <20231212152356.345703-1-gatien.chevallier@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-12_09,2023-12-12_01,2023-05-22_02

Introduce a STM32 firewall framework that offers to firewall consumers
different firewall services such as the ability to check their access
rights against their firewall controller(s).

The STM32 firewall framework offers a generic API for STM32 firewall
controllers that is defined in their drivers to best fit the
specificity of each firewall.

There are various types of firewalls:
-Peripheral firewalls that filter accesses to peripherals
-Memory firewalls that filter accesses to memories or memory regions
-No type for undefined type of firewall

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---

Changes in V8:
	- Add missing dependency on OF for OF_DYNAMIC

Changes in V7:
	- Select OF_DYNAMIC when STM32_FIREWALL is set in order to use
	  of_detach_node() in the firewall framework. Since the
	  simple-bus pre-probe creates devices for all subnodes. This
	  function is needed to detach particular nodes so that there's
	  no match

Changes in V6:
	- Renamed access-controller to access-controllers

Changes in V5:
	- Rename feature-domain* to access-control*
	- Fix index out of range in stm32_firewall_get_firewall()
	- Add mising "select STM32_FIREWALL" in config ARCH_STM32 in
	  arch/arm/mach-stm32/Kconfig

Changes in V4:
	- Fix documentation syntax
	- Put node in case of error in stm32_firewall_populate_bus()
	- Check firewall controller presence before using it in
	  stm32_firewall_controller_register()

Changes in V2:
	- Support multiple entries for "feature-domains"
	  property. Change stm32_firewall_get_firewall()
	  to do so.
	- Better handle the device-tree parsing using
	  phandle+args APIs and phandle iterator.
	- Remove "resource firewall" type
	- Rephrase STM32_FIREWALL description in the bus
	  Kconfig and remove useless default value
	- Add missing EXPORT_SYMBOL_GPL
	- Remove useless stm32_firewall_get_id() API
	- Add a field for the name of the firewall entry
	  in the stm32_firewall_controller structure
	- Minor fixes on some traces level (err -> debug)
	- Fix licenses to GPL-2.0-only
	- Fix stm32_firewall_get_firewall() description
	- Rephrase some sentences to better emphasize this
	  is STM32-specific
	- Switch to list_for_each_entry() in
	  stm32_firewall_controller_unregister() as we only
	  expect one firewall controller instance per device.
	  The loop just breaks when found
	- Do not register the firewall controller if it is
	  already registered to the framework


 MAINTAINERS                               |   5 +
 arch/arm/mach-stm32/Kconfig               |   1 +
 arch/arm64/Kconfig.platforms              |   1 +
 drivers/bus/Kconfig                       |  10 +
 drivers/bus/Makefile                      |   1 +
 drivers/bus/stm32_firewall.c              | 294 ++++++++++++++++++++++
 drivers/bus/stm32_firewall.h              |  83 ++++++
 include/linux/bus/stm32_firewall_device.h | 141 +++++++++++
 8 files changed, 536 insertions(+)
 create mode 100644 drivers/bus/stm32_firewall.c
 create mode 100644 drivers/bus/stm32_firewall.h
 create mode 100644 include/linux/bus/stm32_firewall_device.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e2c6187a3ac8..774c7e1601d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20430,6 +20430,11 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
 F:	drivers/media/i2c/st-mipid02.c
 
+ST STM32 FIREWALL
+M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
+S:	Maintained
+F:	drivers/bus/stm32_firewall.c
+
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 M:	Alain Volmat <alain.volmat@foss.st.com>
diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 98145031586f..ae21a9f78f9c 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -12,6 +12,7 @@ menuconfig ARCH_STM32
 	select PINCTRL
 	select RESET_CONTROLLER
 	select STM32_EXTI
+	select STM32_FIREWALL
 	help
 	  Support for STMicroelectronics STM32 processors.
 
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 24335565bad5..13ed0a483617 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -305,6 +305,7 @@ config ARCH_STM32
 	select ARM_SMC_MBOX
 	select ARM_SCMI_PROTOCOL
 	select COMMON_CLK_SCMI
+	select STM32_FIREWALL
 	help
 	  This enables support for ARMv8 based STMicroelectronics
 	  STM32 family, including:
diff --git a/drivers/bus/Kconfig b/drivers/bus/Kconfig
index e6742998f372..7d47e0005cfe 100644
--- a/drivers/bus/Kconfig
+++ b/drivers/bus/Kconfig
@@ -163,6 +163,16 @@ config QCOM_SSC_BLOCK_BUS
 	  i2c/spi/uart controllers, a hexagon core, and a clock controller
 	  which provides clocks for the above.
 
+config STM32_FIREWALL
+	bool "STM32 Firewall framework"
+	depends on (ARCH_STM32 || COMPILE_TEST) && OF
+	select OF_DYNAMIC
+	help
+	  Say y to enable STM32 firewall framework and its services. Firewall
+	  controllers will be able to register to the framework. Access for
+	  hardware resources linked to a firewall controller can be requested
+	  through this STM32 framework.
+
 config SUN50I_DE2_BUS
 	bool "Allwinner A64 DE2 Bus Driver"
 	  default ARM64
diff --git a/drivers/bus/Makefile b/drivers/bus/Makefile
index d90eed189a65..fc0511450ec2 100644
--- a/drivers/bus/Makefile
+++ b/drivers/bus/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_OMAP_INTERCONNECT)	+= omap_l3_smx.o omap_l3_noc.o
 obj-$(CONFIG_OMAP_OCP2SCP)	+= omap-ocp2scp.o
 obj-$(CONFIG_QCOM_EBI2)		+= qcom-ebi2.o
 obj-$(CONFIG_QCOM_SSC_BLOCK_BUS)	+= qcom-ssc-block-bus.o
+obj-$(CONFIG_STM32_FIREWALL)	+= stm32_firewall.o
 obj-$(CONFIG_SUN50I_DE2_BUS)	+= sun50i-de2.o
 obj-$(CONFIG_SUNXI_RSB)		+= sunxi-rsb.o
 obj-$(CONFIG_OF)		+= simple-pm-bus.o
diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
new file mode 100644
index 000000000000..decb79449047
--- /dev/null
+++ b/drivers/bus/stm32_firewall.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/bus/stm32_firewall_device.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+#include <linux/slab.h>
+
+#include "stm32_firewall.h"
+
+/* Corresponds to STM32_FIREWALL_MAX_EXTRA_ARGS + firewall ID */
+#define STM32_FIREWALL_MAX_ARGS		(STM32_FIREWALL_MAX_EXTRA_ARGS + 1)
+
+static LIST_HEAD(firewall_controller_list);
+static DEFINE_MUTEX(firewall_controller_list_lock);
+
+/* Firewall device API */
+
+int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
+				unsigned int nb_firewall)
+{
+	struct stm32_firewall_controller *ctrl;
+	struct of_phandle_iterator it;
+	unsigned int i, j = 0;
+	int err;
+
+	if (!firewall || !nb_firewall)
+		return -EINVAL;
+
+	/* Parse property with phandle parsed out */
+	of_for_each_phandle(&it, err, np, "access-controllers", "#access-controller-cells", 0) {
+		struct of_phandle_args provider_args;
+		struct device_node *provider = it.node;
+		const char *fw_entry;
+		bool match = false;
+
+		if (err) {
+			pr_err("Unable to get access-controllers property for node %s\n, err: %d",
+			       np->full_name, err);
+			of_node_put(provider);
+			return err;
+		}
+
+		if (j > nb_firewall) {
+			pr_err("Too many firewall controllers");
+			of_node_put(provider);
+			return -EINVAL;
+		}
+
+		provider_args.args_count = of_phandle_iterator_args(&it, provider_args.args,
+								    STM32_FIREWALL_MAX_ARGS);
+
+		/* Check if the parsed phandle corresponds to a registered firewall controller */
+		mutex_lock(&firewall_controller_list_lock);
+		list_for_each_entry(ctrl, &firewall_controller_list, entry) {
+			if (ctrl->dev->of_node->phandle == it.phandle) {
+				match = true;
+				firewall[j].firewall_ctrl = ctrl;
+				break;
+			}
+		}
+		mutex_unlock(&firewall_controller_list_lock);
+
+		if (!match) {
+			firewall[j].firewall_ctrl = NULL;
+			pr_err("No firewall controller registered for %s\n", np->full_name);
+			of_node_put(provider);
+			return -ENODEV;
+		}
+
+		err = of_property_read_string_index(np, "access-controller-names", j, &fw_entry);
+		if (err == 0)
+			firewall[j].entry = fw_entry;
+
+		/* Handle the case when there are no arguments given along with the phandle */
+		if (provider_args.args_count < 0 ||
+		    provider_args.args_count > STM32_FIREWALL_MAX_ARGS) {
+			of_node_put(provider);
+			return -EINVAL;
+		} else if (provider_args.args_count == 0) {
+			firewall[j].extra_args_size = 0;
+			firewall[j].firewall_id = U32_MAX;
+			j++;
+			continue;
+		}
+
+		/* The firewall ID is always the first argument */
+		firewall[j].firewall_id = provider_args.args[0];
+
+		/* Extra args start at the second argument */
+		for (i = 0; i < provider_args.args_count - 1; i++)
+			firewall[j].extra_args[i] = provider_args.args[i + 1];
+
+		/* Remove the firewall ID arg that is not an extra argument */
+		firewall[j].extra_args_size = provider_args.args_count - 1;
+
+		j++;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_get_firewall);
+
+int stm32_firewall_grant_access(struct stm32_firewall *firewall)
+{
+	struct stm32_firewall_controller *firewall_controller;
+
+	if (!firewall || firewall->firewall_id == U32_MAX)
+		return -EINVAL;
+
+	firewall_controller = firewall->firewall_ctrl;
+
+	if (!firewall_controller)
+		return -ENODEV;
+
+	return firewall_controller->grant_access(firewall_controller, firewall->firewall_id);
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_grant_access);
+
+int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+{
+	struct stm32_firewall_controller *firewall_controller;
+
+	if (!firewall || subsystem_id == U32_MAX || firewall->firewall_id == U32_MAX)
+		return -EINVAL;
+
+	firewall_controller = firewall->firewall_ctrl;
+
+	if (!firewall_controller)
+		return -ENODEV;
+
+	return firewall_controller->grant_access(firewall_controller, subsystem_id);
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_grant_access_by_id);
+
+void stm32_firewall_release_access(struct stm32_firewall *firewall)
+{
+	struct stm32_firewall_controller *firewall_controller;
+
+	if (!firewall || firewall->firewall_id == U32_MAX) {
+		pr_debug("Incorrect arguments when releasing a firewall access\n");
+		return;
+	}
+
+	firewall_controller = firewall->firewall_ctrl;
+
+	if (!firewall_controller) {
+		pr_debug("No firewall controller to release\n");
+		return;
+	}
+
+	firewall_controller->release_access(firewall_controller, firewall->firewall_id);
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_release_access);
+
+void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+{
+	struct stm32_firewall_controller *firewall_controller;
+
+	if (!firewall || subsystem_id == U32_MAX || firewall->firewall_id == U32_MAX) {
+		pr_debug("Incorrect arguments when releasing a firewall access");
+		return;
+	}
+
+	firewall_controller = firewall->firewall_ctrl;
+
+	if (!firewall_controller) {
+		pr_debug("No firewall controller to release");
+		return;
+	}
+
+	firewall_controller->release_access(firewall_controller, subsystem_id);
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_release_access_by_id);
+
+/* Firewall controller API */
+
+int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller)
+{
+	struct stm32_firewall_controller *ctrl;
+
+	if (!firewall_controller)
+		return -ENODEV;
+
+	pr_info("Registering %s firewall controller\n", firewall_controller->name);
+
+	mutex_lock(&firewall_controller_list_lock);
+	list_for_each_entry(ctrl, &firewall_controller_list, entry) {
+		if (ctrl == firewall_controller) {
+			pr_debug("%s firewall controller already registered\n",
+				 firewall_controller->name);
+			mutex_unlock(&firewall_controller_list_lock);
+			return 0;
+		}
+	}
+	list_add_tail(&firewall_controller->entry, &firewall_controller_list);
+	mutex_unlock(&firewall_controller_list_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_controller_register);
+
+void stm32_firewall_controller_unregister(struct stm32_firewall_controller *firewall_controller)
+{
+	struct stm32_firewall_controller *ctrl;
+	bool controller_removed = false;
+
+	if (!firewall_controller) {
+		pr_debug("Null reference while unregistering firewall controller\n");
+		return;
+	}
+
+	mutex_lock(&firewall_controller_list_lock);
+	list_for_each_entry(ctrl, &firewall_controller_list, entry) {
+		if (ctrl == firewall_controller) {
+			controller_removed = true;
+			list_del_init(&ctrl->entry);
+			break;
+		}
+	}
+	mutex_unlock(&firewall_controller_list_lock);
+
+	if (!controller_removed)
+		pr_debug("There was no firewall controller named %s to unregister\n",
+			 firewall_controller->name);
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
+
+int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
+{
+	struct stm32_firewall *firewalls;
+	struct device_node *child;
+	struct device *parent;
+	unsigned int i;
+	int len;
+	int err;
+
+	parent = firewall_controller->dev;
+
+	dev_dbg(parent, "Populating %s system bus\n", dev_name(firewall_controller->dev));
+
+	for_each_available_child_of_node(dev_of_node(parent), child) {
+		/* The access-controllers property is mandatory for firewall bus devices */
+		len = of_count_phandle_with_args(child, "access-controllers",
+						 "#access-controller-cells");
+		if (len <= 0) {
+			of_node_put(child);
+			return -EINVAL;
+		}
+
+		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
+		if (!firewalls) {
+			of_node_put(child);
+			return -ENOMEM;
+		}
+
+		err = stm32_firewall_get_firewall(child, firewalls, (unsigned int)len);
+		if (err) {
+			kfree(firewalls);
+			of_node_put(child);
+			return err;
+		}
+
+		for (i = 0; i < len; i++) {
+			if (firewall_controller->grant_access(firewall_controller,
+							      firewalls[i].firewall_id)) {
+				/*
+				 * Peripheral access not allowed or not defined.
+				 * Mark the node as populated so platform bus won't probe it
+				 */
+				of_detach_node(child);
+				dev_err(parent, "%s: Device driver will not be probed\n",
+					child->full_name);
+			}
+		}
+
+		kfree(firewalls);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(stm32_firewall_populate_bus);
diff --git a/drivers/bus/stm32_firewall.h b/drivers/bus/stm32_firewall.h
new file mode 100644
index 000000000000..e5fac85fe346
--- /dev/null
+++ b/drivers/bus/stm32_firewall.h
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef _STM32_FIREWALL_H
+#define _STM32_FIREWALL_H
+
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+/**
+ * STM32_PERIPHERAL_FIREWALL:		This type of firewall protects peripherals
+ * STM32_MEMORY_FIREWALL:		This type of firewall protects memories/subsets of memory
+ *					zones
+ * STM32_NOTYPE_FIREWALL:		Undefined firewall type
+ */
+
+#define STM32_PERIPHERAL_FIREWALL	BIT(1)
+#define STM32_MEMORY_FIREWALL		BIT(2)
+#define STM32_NOTYPE_FIREWALL		BIT(3)
+
+/**
+ * struct stm32_firewall_controller - Information on firewall controller supplying services
+ *
+ * @name:			Name of the firewall controller
+ * @dev:			Device reference of the firewall controller
+ * @mmio:			Base address of the firewall controller
+ * @entry:			List entry of the firewall controller list
+ * @type:			Type of firewall
+ * @max_entries:		Number of entries covered by the firewall
+ * @grant_access:		Callback used to grant access for a device access against a
+ *				firewall controller
+ * @release_access:		Callback used to release resources taken by a device when access was
+ *				granted
+ * @grant_memory_range_access:	Callback used to grant access for a device to a given memory region
+ */
+struct stm32_firewall_controller {
+	const char *name;
+	struct device *dev;
+	void __iomem *mmio;
+	struct list_head entry;
+	unsigned int type;
+	unsigned int max_entries;
+
+	int (*grant_access)(struct stm32_firewall_controller *ctrl, u32 id);
+	void (*release_access)(struct stm32_firewall_controller *ctrl, u32 id);
+	int (*grant_memory_range_access)(struct stm32_firewall_controller *ctrl, phys_addr_t paddr,
+					 size_t size);
+};
+
+/**
+ * stm32_firewall_controller_register - Register a firewall controller to the STM32 firewall
+ *					framework
+ * @firewall_controller:	Firewall controller to register
+ *
+ * Returns 0 in case of success or -ENODEV if no controller was given.
+ */
+int stm32_firewall_controller_register(struct stm32_firewall_controller *firewall_controller);
+
+/**
+ * stm32_firewall_controller_unregister - Unregister a firewall controller from the STM32
+ *					  firewall framework
+ * @firewall_controller:	Firewall controller to unregister
+ */
+void stm32_firewall_controller_unregister(struct stm32_firewall_controller *firewall_controller);
+
+/**
+ * stm32_firewall_populate_bus - Populate device tree nodes that have a correct firewall
+ *				 configuration. This is used at boot-time only, as a sanity check
+ *				 between device tree and firewalls hardware configurations to
+ *				 prevent a kernel crash when a device driver is not granted access
+ *
+ * @firewall_controller:	Firewall controller which nodes will be populated or not
+ *
+ * Returns 0 in case of success or appropriate errno code if error occurred.
+ */
+int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller);
+
+#endif /* _STM32_FIREWALL_H */
diff --git a/include/linux/bus/stm32_firewall_device.h b/include/linux/bus/stm32_firewall_device.h
new file mode 100644
index 000000000000..bbbee0b24ea8
--- /dev/null
+++ b/include/linux/bus/stm32_firewall_device.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023, STMicroelectronics - All Rights Reserved
+ */
+
+#ifndef STM32_FIREWALL_DEVICE_H
+#define STM32_FIREWALL_DEVICE_H
+
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/types.h>
+
+#define STM32_FIREWALL_MAX_EXTRA_ARGS		5
+
+/* Opaque reference to stm32_firewall_controller */
+struct stm32_firewall_controller;
+
+/**
+ * struct stm32_firewall - Information on a device's firewall. Each device can have more than one
+ *			   firewall.
+ *
+ * @firewall_ctrl:		Pointer referencing a firewall controller of the device. It is
+ *				opaque so a device cannot manipulate the controller's ops or access
+ *				the controller's data
+ * @extra_args:			Extra arguments that are implementation dependent
+ * @entry:			Name of the firewall entry
+ * @extra_args_size:		Number of extra arguments
+ * @firewall_id:		Firewall ID associated the device for this firewall controller
+ */
+struct stm32_firewall {
+	struct stm32_firewall_controller *firewall_ctrl;
+	u32 extra_args[STM32_FIREWALL_MAX_EXTRA_ARGS];
+	const char *entry;
+	size_t extra_args_size;
+	u32 firewall_id;
+};
+
+#if IS_ENABLED(CONFIG_STM32_FIREWALL)
+/**
+ * stm32_firewall_get_firewall - Get the firewall(s) associated to given device.
+ *				 The firewall controller reference is always the first argument
+ *				 of each of the access-controller property entries.
+ *				 The firewall ID is always the second argument of each of the
+ *				 access-controller  property entries.
+ *				 If there's no argument linked to the phandle, then the firewall ID
+ *				 field is set to U32_MAX, which is an invalid ID.
+ *
+ * @np:				Device node to parse
+ * @firewall:			Array of firewall references
+ * @nb_firewall:		Number of firewall references to get. Must be at least 1.
+ *
+ * Returns 0 on success, -ENODEV if there's no match with a firewall controller or appropriate errno
+ * code if error occurred.
+ */
+int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall,
+				unsigned int nb_firewall);
+
+/**
+ * stm32_firewall_grant_access - Request firewall access rights and grant access.
+ *
+ * @firewall:			Firewall reference containing the ID to check against its firewall
+ *				controller
+ *
+ * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV if firewall is null or
+ * appropriate errno code if error occurred
+ */
+int stm32_firewall_grant_access(struct stm32_firewall *firewall);
+
+/**
+ * stm32_firewall_release_access - Release access granted from a call to
+ *				   stm32_firewall_grant_access().
+ *
+ * @firewall:			Firewall reference containing the ID to check against its firewall
+ *				controller
+ */
+void stm32_firewall_release_access(struct stm32_firewall *firewall);
+
+/**
+ * stm32_firewall_grant_access_by_id - Request firewall access rights of a given device
+ *				       based on a specific firewall ID
+ *
+ * Warnings:
+ * There is no way to ensure that the given ID will correspond to the firewall referenced in the
+ * device node if the ID did not come from stm32_firewall_get_firewall(). In that case, this
+ * function must be used with caution.
+ * This function should be used for subsystem resources that do not have the same firewall ID
+ * as their parent.
+ * U32_MAX is an invalid ID.
+ *
+ * @firewall:			Firewall reference containing the firewall controller
+ * @subsystem_id:		Firewall ID of the subsystem resource
+ *
+ * Returns 0 if access is granted, -EACCES if access is denied, -ENODEV if firewall is null or
+ * appropriate errno code if error occurred
+ */
+int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
+
+/**
+ * stm32_firewall_release_access_by_id - Release access granted from a call to
+ *					 stm32_firewall_grant_access_by_id().
+ *
+ * Warnings:
+ * There is no way to ensure that the given ID will correspond to the firewall referenced in the
+ * device node if the ID did not come from stm32_firewall_get_firewall(). In that case, this
+ * function must be used with caution.
+ * This function should be used for subsystem resources that do not have the same firewall ID
+ * as their parent.
+ * U32_MAX is an invalid ID.
+ *
+ * @firewall:			Firewall reference containing the firewall controller
+ * @subsystem_id:		Firewall ID of the subsystem resource
+ */
+void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id);
+
+#else /* CONFIG_STM32_FIREWALL */
+
+int stm32_firewall_get_firewall(struct device_node *np, struct stm32_firewall *firewall)
+{
+	return -ENODEV;
+}
+
+int stm32_firewall_grant_access(struct stm32_firewall *firewall)
+{
+	return -ENODEV;
+}
+
+void stm32_firewall_release_access(struct stm32_firewall *firewall)
+{
+}
+
+int stm32_firewall_grant_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+{
+	return -ENODEV;
+}
+
+void stm32_firewall_release_access_by_id(struct stm32_firewall *firewall, u32 subsystem_id)
+{
+}
+
+#endif /* CONFIG_STM32_FIREWALL */
+#endif /* STM32_FIREWALL_DEVICE_H */
-- 
2.25.1


