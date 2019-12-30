Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24D4412D172
	for <lists+linux-usb@lfdr.de>; Mon, 30 Dec 2019 16:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727564AbfL3P3E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Dec 2019 10:29:04 -0500
Received: from mga01.intel.com ([192.55.52.88]:49571 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727397AbfL3P3E (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Dec 2019 10:29:04 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Dec 2019 07:29:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; 
   d="scan'208";a="224240081"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2019 07:29:02 -0800
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [RFC PATCH 3/3] usb: typec: Add driver for Thunderbolt 3 Alternate Mode
Date:   Mon, 30 Dec 2019 18:28:57 +0300
Message-Id: <20191230152857.43917-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191230152857.43917-1-heikki.krogerus@linux.intel.com>
References: <20191230152857.43917-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thunderbolt 3 Alternate Mode entry flow is described in
USB Type-C Specification Release 2.0.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/altmodes/Kconfig       |   9 +
 drivers/usb/typec/altmodes/Makefile      |   2 +
 drivers/usb/typec/altmodes/thunderbolt.c | 309 +++++++++++++++++++++++
 3 files changed, 320 insertions(+)
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c

diff --git a/drivers/usb/typec/altmodes/Kconfig b/drivers/usb/typec/altmodes/Kconfig
index 187690fd1a5b..e5c116067809 100644
--- a/drivers/usb/typec/altmodes/Kconfig
+++ b/drivers/usb/typec/altmodes/Kconfig
@@ -22,4 +22,13 @@ config TYPEC_NVIDIA_ALTMODE
 	  To compile this driver as a module, choose M here: the
 	  module will be called typec_displayport.
 
+config TYPEC_TBT_ALTMODE
+	tristate "Thunderbolt3 Alternate Mode driver"
+	help
+	  Select this option if you have Thunderbolt3 hardware on your
+	  system.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called typec_thunderbolt.
+
 endmenu
diff --git a/drivers/usb/typec/altmodes/Makefile b/drivers/usb/typec/altmodes/Makefile
index 45717548b396..508a68351bd2 100644
--- a/drivers/usb/typec/altmodes/Makefile
+++ b/drivers/usb/typec/altmodes/Makefile
@@ -4,3 +4,5 @@ obj-$(CONFIG_TYPEC_DP_ALTMODE)		+= typec_displayport.o
 typec_displayport-y			:= displayport.o
 obj-$(CONFIG_TYPEC_NVIDIA_ALTMODE)	+= typec_nvidia.o
 typec_nvidia-y				:= nvidia.o
+obj-$(CONFIG_TYPEC_TBT_ALTMODE)		+= typec_thunderbolt.o
+typec_thunderbolt-y			:= thunderbolt.o
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
new file mode 100644
index 000000000000..abb6d2d0ffc9
--- /dev/null
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -0,0 +1,309 @@
+// SPDX-License-Identifier: GPL-2.0
+/**
+ * USB Typec-C Thuderbolt3 Alternate Mode driver
+ *
+ * Copyright (C) 2019 Intel Corporation
+ * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/mutex.h>
+#include <linux/module.h>
+#include <linux/usb/pd_vdo.h>
+#include <linux/usb/typec_altmode.h>
+
+#define USB_TYPEC_VENDOR_INTEL		0x8087
+
+/* TBT3 Device Discover Mode VDO bits */
+#define TBT_MODE			BIT(0)
+#define TBT_ADAPTER(_vdo_)		(((_vdo_) & BIT(16)) >> 16)
+#define   TBT_ADAPTER_LEGACY		0
+#define   TBT_ADAPTER_TBT3		1
+#define TBT_INTEL_SPECIFIC_B0		BIT(26)
+#define TBT_VENDOR_SPECIFIC_B0		BIT(30)
+#define TBT_VENDOR_SPECIFIC_B1		BIT(31)
+
+/* TBT3 Cable Discover Mode VDO bits */
+#define TBT_CABLE_SPEED(_vdo_)		(((_vdo_) & GENMASK(18, 16)) >> 16)
+#define   TBT_CABLE_USB3_GEN1		1
+#define   TBT_CABLE_USB3_PASSIVE	2
+#define   TBT_CABLE_10_AND_20GBPS	3
+#define TBT_CABLE_ROUNDED		BIT(19)
+#define TBT_CABLE_OPTICAL		BIT(21)
+#define TBT_CABLE_RETIMER		BIT(22)
+#define TBT_CABLE_LINK_TRAINING		BIT(23)
+
+/* TBT3 Device Enter Mode VDO bits */
+#define TBT_ENTER_MODE_CABLE_SPEED(_s_)	(((_s_) & GENMASK(2, 0)) << 16)
+#define TBT_ENTER_MODE_ACTIVE_CABLE	BIT(24)
+
+enum tbt_state {
+	TBT_STATE_IDLE,
+	TBT_STATE_SOP_P_ENTER,
+	TBT_STATE_SOP_PP_ENTER,
+	TBT_STATE_ENTER,
+	TBT_STATE_EXIT,
+	TBT_STATE_SOP_PP_EXIT,
+	TBT_STATE_SOP_P_EXIT
+};
+
+struct tbt_altmode {
+	enum tbt_state state;
+	struct typec_cable *cable;
+	struct typec_altmode *alt;
+	struct typec_altmode *plug[2];
+
+	struct work_struct work;
+	struct mutex lock; /* device lock */
+};
+
+static int tbt_enter_mode(struct tbt_altmode *tbt)
+{
+	struct typec_altmode *plug = tbt->plug[TYPEC_PLUG_SOP_P];
+	u32 vdo;
+
+	vdo = tbt->alt->vdo & (TBT_VENDOR_SPECIFIC_B0 | TBT_VENDOR_SPECIFIC_B1);
+	vdo |= tbt->alt->vdo & TBT_INTEL_SPECIFIC_B0;
+	vdo |= TBT_MODE;
+
+	if (plug) {
+		if (typec_cable_is_active(tbt->cable))
+			vdo |= TBT_ENTER_MODE_ACTIVE_CABLE;
+
+		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_SPEED(plug->vdo));
+		vdo |= plug->vdo & TBT_CABLE_ROUNDED;
+		vdo |= plug->vdo & TBT_CABLE_OPTICAL;
+		vdo |= plug->vdo & TBT_CABLE_RETIMER;
+		vdo |= plug->vdo & TBT_CABLE_LINK_TRAINING;
+	} else {
+		vdo |= TBT_ENTER_MODE_CABLE_SPEED(TBT_CABLE_USB3_PASSIVE);
+	}
+
+	return typec_altmode_enter(tbt->alt, &vdo);
+}
+
+static void tbt_altmode_work(struct work_struct *work)
+{
+	struct tbt_altmode *tbt = container_of(work, struct tbt_altmode, work);
+	int ret;
+
+	mutex_lock(&tbt->lock);
+
+	switch (tbt->state) {
+	case TBT_STATE_SOP_P_ENTER:
+		ret = typec_altmode_enter(tbt->plug[TYPEC_PLUG_SOP_P], NULL);
+		if (ret)
+			dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_P]->dev,
+				"failed to enter mode (%d)\n", ret);
+		break;
+	case TBT_STATE_SOP_PP_ENTER:
+		ret = typec_altmode_enter(tbt->plug[TYPEC_PLUG_SOP_PP], NULL);
+		if (ret)
+			dev_dbg(&tbt->plug[TYPEC_PLUG_SOP_PP]->dev,
+				"failed to enter mode (%d)\n", ret);
+		break;
+	case TBT_STATE_ENTER:
+		ret = tbt_enter_mode(tbt);
+		if (ret)
+			dev_dbg(&tbt->alt->dev, "failed to enter mode (%d)\n",
+				ret);
+		break;
+	case TBT_STATE_EXIT:
+		typec_altmode_exit(tbt->alt);
+		break;
+	case TBT_STATE_SOP_PP_EXIT:
+		typec_altmode_exit(tbt->plug[TYPEC_PLUG_SOP_PP]);
+		break;
+	case TBT_STATE_SOP_P_EXIT:
+		typec_altmode_exit(tbt->plug[TYPEC_PLUG_SOP_P]);
+		break;
+	default:
+		break;
+	}
+
+	tbt->state = TBT_STATE_IDLE;
+
+	mutex_unlock(&tbt->lock);
+}
+
+static int tbt_altmode_vdm(struct typec_altmode *alt,
+			   const u32 hdr, const u32 *vdo, int count)
+{
+	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
+	int cmd_type = PD_VDO_CMDT(hdr);
+	int cmd = PD_VDO_CMD(hdr);
+
+	mutex_lock(&tbt->lock);
+
+	if (tbt->state != TBT_STATE_IDLE) {
+		mutex_unlock(&tbt->lock);
+		return -EBUSY;
+	}
+
+	switch (cmd_type) {
+	case CMDT_RSP_ACK:
+		switch (cmd) {
+		case CMD_ENTER_MODE:
+			/*
+			 * Following the order describeded in USB Type-C Spec
+			 * R2.0 Section 6.7.3.
+			 */
+			if (alt == tbt->plug[TYPEC_PLUG_SOP_P]) {
+				if (tbt->plug[TYPEC_PLUG_SOP_PP])
+					tbt->state = TBT_STATE_SOP_PP_ENTER;
+				else
+					tbt->state = TBT_STATE_ENTER;
+			} else if (alt == tbt->plug[TYPEC_PLUG_SOP_PP]) {
+				tbt->state = TBT_STATE_ENTER;
+			} else {
+				typec_altmode_notify(alt, TYPEC_STATE_MODAL,
+						     NULL);
+			}
+			break;
+		case CMD_EXIT_MODE:
+			if (alt == tbt->alt) {
+				if (tbt->plug[TYPEC_PLUG_SOP_PP])
+					tbt->state = TBT_STATE_SOP_PP_EXIT;
+				else if (tbt->plug[TYPEC_PLUG_SOP_P])
+					tbt->state = TBT_STATE_SOP_P_EXIT;
+			} else if (alt == tbt->plug[TYPEC_PLUG_SOP_PP]) {
+				tbt->state = TBT_STATE_SOP_P_EXIT;
+			}
+			break;
+		}
+		break;
+	case CMDT_RSP_NAK:
+		switch (cmd) {
+		case CMD_ENTER_MODE:
+			dev_warn(&alt->dev, "Enter Mode refused\n");
+			break;
+		default:
+			break;
+		}
+		break;
+	default:
+		break;
+	}
+
+	if (tbt->state != TBT_STATE_IDLE)
+		schedule_work(&tbt->work);
+
+	mutex_unlock(&tbt->lock);
+
+	return 0;
+}
+
+static int tbt_altmode_activate(struct typec_altmode *alt, int activate)
+{
+	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
+	int ret;
+
+	mutex_lock(&tbt->lock);
+
+	/* Preventing the user space from entering/exiting the cable alt mode */
+	if (alt != tbt->alt)
+		ret = -EPERM;
+	else if (activate)
+		ret = tbt_enter_mode(tbt);
+	else
+		ret = typec_altmode_exit(alt);
+
+	mutex_unlock(&tbt->lock);
+
+	return ret;
+}
+
+static const struct typec_altmode_ops tbt_altmode_ops = {
+	.vdm		= tbt_altmode_vdm,
+	.activate	= tbt_altmode_activate
+};
+
+static int tbt_altmode_probe(struct typec_altmode *alt)
+{
+	struct typec_altmode *plug;
+	struct tbt_altmode *tbt;
+	int err;
+	int i;
+
+	tbt = devm_kzalloc(&alt->dev, sizeof(*tbt), GFP_KERNEL);
+	if (!tbt)
+		return -ENOMEM;
+
+	/* Thundebolt 3 requires a cable with eMarker */
+	tbt->cable = typec_cable_get(typec_altmode2port(alt));
+	if (!tbt->cable)
+		return -ENODEV;
+
+	for (i = 0; i < TYPEC_PLUG_SOP_PP + 1; i++) {
+		plug = typec_altmode_get_plug(alt, i);
+		if (IS_ERR(plug)) {
+			err = PTR_ERR(plug);
+			goto err_put_plugs;
+		}
+
+		if (!plug || plug->svid != USB_TYPEC_VENDOR_INTEL)
+			break;
+
+		plug->desc = "Thunderbolt3";
+		plug->ops = &tbt_altmode_ops;
+		typec_altmode_set_drvdata(plug, tbt);
+
+		tbt->plug[i] = plug;
+	}
+
+	INIT_WORK(&tbt->work, tbt_altmode_work);
+	mutex_init(&tbt->lock);
+	tbt->alt = alt;
+
+	alt->desc = "Thunderbolt3";
+	alt->ops = &tbt_altmode_ops;
+
+	typec_altmode_set_drvdata(alt, tbt);
+
+	if (tbt->plug[TYPEC_PLUG_SOP_PP])
+		tbt->state = TBT_STATE_SOP_PP_ENTER;
+	else if (tbt->plug[TYPEC_PLUG_SOP_P])
+		tbt->state = TBT_STATE_SOP_P_ENTER;
+	else
+		tbt->state = TBT_STATE_ENTER;
+	schedule_work(&tbt->work);
+
+	return 0;
+
+err_put_plugs:
+	typec_altmode_put_plug(tbt->plug[TYPEC_PLUG_SOP_PP]);
+	typec_altmode_put_plug(tbt->plug[TYPEC_PLUG_SOP_P]);
+	typec_cable_put(tbt->cable);
+
+	return err;
+}
+
+static void tbt_altmode_remove(struct typec_altmode *alt)
+{
+	struct tbt_altmode *tbt = typec_altmode_get_drvdata(alt);
+
+	typec_altmode_put_plug(tbt->plug[TYPEC_PLUG_SOP_PP]);
+	typec_altmode_put_plug(tbt->plug[TYPEC_PLUG_SOP_P]);
+	typec_cable_put(tbt->cable);
+}
+
+static const struct typec_device_id tbt_typec_id[] = {
+	{ USB_TYPEC_VENDOR_INTEL, TYPEC_ANY_MODE },
+	{ }
+};
+MODULE_DEVICE_TABLE(typec, tbt_typec_id);
+
+static struct typec_altmode_driver tbt_altmode_driver = {
+	.id_table = tbt_typec_id,
+	.probe = tbt_altmode_probe,
+	.remove = tbt_altmode_remove,
+	.driver = {
+		.name = "typec-thunderbolt",
+		.owner = THIS_MODULE,
+	}
+};
+module_typec_altmode_driver(tbt_altmode_driver);
+
+MODULE_AUTHOR("Heikki Krogerus <heikki.krogerus@linux.intel.com>");
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Thunderbolt3 USB Type-C Alternate Mode");
-- 
2.24.1

