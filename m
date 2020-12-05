Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 026102CFE64
	for <lists+linux-usb@lfdr.de>; Sat,  5 Dec 2020 20:31:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725996AbgLETbN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Dec 2020 14:31:13 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:39024 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725867AbgLETbM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 5 Dec 2020 14:31:12 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id D9562FB03;
        Sat,  5 Dec 2020 12:13:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 7-G5uKdAIoCu; Sat,  5 Dec 2020 12:13:27 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 66C184026B; Sat,  5 Dec 2020 12:13:26 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v5 2/2] usb: typec: tps6598x: Export some power supply properties
Date:   Sat,  5 Dec 2020 12:13:26 +0100
Message-Id: <2c8e81d9da9ff05b065f66edba915edd11f74065.1607166657.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1607166657.git.agx@sigxcpu.org>
References: <cover.1607166657.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This allows downstream supplies and userspace to detect
whether external power is supplied.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/usb/typec/Kconfig    |   1 +
 drivers/usb/typec/tps6598x.c | 103 +++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/drivers/usb/typec/Kconfig b/drivers/usb/typec/Kconfig
index 772b07e9f188..365f905a8e49 100644
--- a/drivers/usb/typec/Kconfig
+++ b/drivers/usb/typec/Kconfig
@@ -64,6 +64,7 @@ config TYPEC_HD3SS3220
 config TYPEC_TPS6598X
 	tristate "TI TPS6598x USB Power Delivery controller driver"
 	depends on I2C
+	select POWER_SUPPLY
 	select REGMAP_I2C
 	select USB_ROLE_SWITCH
 	help
diff --git a/drivers/usb/typec/tps6598x.c b/drivers/usb/typec/tps6598x.c
index 3db33bb622c3..6e6ef6317523 100644
--- a/drivers/usb/typec/tps6598x.c
+++ b/drivers/usb/typec/tps6598x.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/module.h>
+#include <linux/power_supply.h>
 #include <linux/regmap.h>
 #include <linux/interrupt.h>
 #include <linux/usb/typec.h>
@@ -55,6 +56,7 @@ enum {
 };
 
 /* TPS_REG_POWER_STATUS bits */
+#define TPS_POWER_STATUS_CONNECTION	BIT(0)
 #define TPS_POWER_STATUS_SOURCESINK	BIT(1)
 #define TPS_POWER_STATUS_PWROPMODE(p)	(((p) & GENMASK(3, 2)) >> 2)
 
@@ -96,8 +98,25 @@ struct tps6598x {
 	struct typec_partner *partner;
 	struct usb_pd_identity partner_identity;
 	struct usb_role_switch *role_sw;
+	struct typec_capability typec_cap;
+
+	struct power_supply *psy;
+	struct power_supply_desc psy_desc;
+	enum power_supply_usb_type usb_type;
+};
+
+static enum power_supply_property tps6598x_psy_props[] = {
+	POWER_SUPPLY_PROP_USB_TYPE,
+	POWER_SUPPLY_PROP_ONLINE,
 };
 
+static enum power_supply_usb_type tps6598x_psy_usb_types[] = {
+	POWER_SUPPLY_USB_TYPE_C,
+	POWER_SUPPLY_USB_TYPE_PD,
+};
+
+static const char *tps6598x_psy_name_prefix = "tps6598x-source-psy-";
+
 /*
  * Max data bytes for Data1, Data2, and other registers. See ch 1.3.2:
  * https://www.ti.com/lit/ug/slvuan1a/slvuan1a.pdf
@@ -248,6 +267,8 @@ static int tps6598x_connect(struct tps6598x *tps, u32 status)
 	if (desc.identity)
 		typec_partner_set_identity(tps->partner);
 
+	power_supply_changed(tps->psy);
+
 	return 0;
 }
 
@@ -260,6 +281,7 @@ static void tps6598x_disconnect(struct tps6598x *tps, u32 status)
 	typec_set_pwr_role(tps->port, TPS_STATUS_PORTROLE(status));
 	typec_set_vconn_role(tps->port, TPS_STATUS_VCONN(status));
 	tps6598x_set_data_role(tps, TPS_STATUS_DATAROLE(status), false);
+	power_supply_changed(tps->psy);
 }
 
 static int tps6598x_exec_cmd(struct tps6598x *tps, const char *cmd,
@@ -467,6 +489,83 @@ static const struct regmap_config tps6598x_regmap_config = {
 	.max_register = 0x7F,
 };
 
+static int tps6598x_psy_get_online(struct tps6598x *tps,
+				   union power_supply_propval *val)
+{
+	int ret;
+	u16 pwr_status;
+
+	ret = tps6598x_read16(tps, TPS_REG_POWER_STATUS, &pwr_status);
+	if (ret < 0)
+		return ret;
+
+	if ((pwr_status & TPS_POWER_STATUS_CONNECTION) &&
+	    (pwr_status & TPS_POWER_STATUS_SOURCESINK)) {
+		val->intval = 1;
+	} else {
+		val->intval = 0;
+	}
+	return 0;
+}
+
+static int tps6598x_psy_get_prop(struct power_supply *psy,
+				 enum power_supply_property psp,
+				 union power_supply_propval *val)
+{
+	struct tps6598x *tps = power_supply_get_drvdata(psy);
+	u16 pwr_status;
+	int ret = 0;
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		ret = tps6598x_read16(tps, TPS_REG_POWER_STATUS, &pwr_status);
+		if (ret < 0)
+			return ret;
+		if (TPS_POWER_STATUS_PWROPMODE(pwr_status) == TYPEC_PWR_MODE_PD)
+			val->intval = POWER_SUPPLY_USB_TYPE_PD;
+		else
+			val->intval = POWER_SUPPLY_USB_TYPE_C;
+		break;
+	case POWER_SUPPLY_PROP_ONLINE:
+		ret = tps6598x_psy_get_online(tps, val);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
+	return ret;
+}
+
+static int devm_tps6598_psy_register(struct tps6598x *tps)
+{
+	struct power_supply_config psy_cfg = {};
+	const char *port_dev_name = dev_name(tps->dev);
+	char *psy_name;
+
+	psy_cfg.drv_data = tps;
+	psy_cfg.fwnode = dev_fwnode(tps->dev);
+
+	psy_name = devm_kasprintf(tps->dev, GFP_KERNEL, "%s%s", tps6598x_psy_name_prefix,
+				  port_dev_name);
+	if (!psy_name)
+		return -ENOMEM;
+
+	tps->psy_desc.name = psy_name;
+	tps->psy_desc.type = POWER_SUPPLY_TYPE_USB;
+	tps->psy_desc.usb_types = tps6598x_psy_usb_types;
+	tps->psy_desc.num_usb_types = ARRAY_SIZE(tps6598x_psy_usb_types);
+	tps->psy_desc.properties = tps6598x_psy_props;
+	tps->psy_desc.num_properties = ARRAY_SIZE(tps6598x_psy_props);
+	tps->psy_desc.get_property = tps6598x_psy_get_prop;
+
+	tps->usb_type = POWER_SUPPLY_USB_TYPE_C;
+
+	tps->psy = devm_power_supply_register(tps->dev, &tps->psy_desc,
+					       &psy_cfg);
+	return PTR_ERR_OR_ZERO(tps->psy);
+}
+
 static int tps6598x_probe(struct i2c_client *client)
 {
 	struct typec_capability typec_cap = { };
@@ -560,6 +659,10 @@ static int tps6598x_probe(struct i2c_client *client)
 		goto err_role_put;
 	}
 
+	ret = devm_tps6598_psy_register(tps);
+	if (ret)
+		return ret;
+
 	tps->port = typec_register_port(&client->dev, &typec_cap);
 	if (IS_ERR(tps->port)) {
 		ret = PTR_ERR(tps->port);
-- 
2.29.2

