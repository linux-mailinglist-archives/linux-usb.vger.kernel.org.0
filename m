Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 266EF4AAA46
	for <lists+linux-usb@lfdr.de>; Sat,  5 Feb 2022 17:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380508AbiBEQqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Feb 2022 11:46:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51640 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1380498AbiBEQqG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Feb 2022 11:46:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644079566;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ieU1YZZ0dilvnywoogytRnqtfVv7Rq717IUsTaDRurI=;
        b=ASI8Q9IH2I7noWRHn6o0lHxYwor6IYn7oaBYa6Pe0OTWJWKuqS0zm3Y5q414RzSKNDlIe9
        cO6Py6lx6xpQNtmFx5/YdniTxbTZf5Ie2TEveQ6F1m1NNXx2jSyiDDPKKFro8eAHinUm3x
        24nq14+DTP6lHOgvlA+djCBXXSMVKhQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-aY5AubEBNmuCstlu--MBXQ-1; Sat, 05 Feb 2022 11:46:05 -0500
X-MC-Unique: aY5AubEBNmuCstlu--MBXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD113100C660;
        Sat,  5 Feb 2022 16:46:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 356EF2B4D2;
        Sat,  5 Feb 2022 16:46:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-phy@lists.infradead.org
Subject: [PATCH 9/9] phy: ti: tusb1210: Add charger detection
Date:   Sat,  5 Feb 2022 17:45:35 +0100
Message-Id: <20220205164535.179231-10-hdegoede@redhat.com>
In-Reply-To: <20220205164535.179231-1-hdegoede@redhat.com>
References: <20220205164535.179231-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Stephan Gerhold <stephan@gerhold.net>

Some Android x86 tablets with a Bay Trail (BYT) SoC and a Crystal Cove
PMIC, which does not support charger-detection, rely on a TUSB1211
phy for charger-detection.

Add support for charger detection on TUSB1211 phy-s and export
the information about the detected charger through the standard
power_supply class interface. power_supply class charger IC drivers
like the bq24190_charger.c driver will then pick this up and set
their input_current_limit based on this.

Note the "linux,phy_charger_detect" property used to enable this is
a special kernel-internal (so not part of the dt-bindings) property
used by dwc3 platform code to indicate that the phy needs to do
charger-detection.

Changes by Hans de Goede:
- Use "linux,phy_charger_detect" property to enable charger-detect
- Switch from a linear flow to a state-machine, with retries on
  ulpi communication errors
- Use SW_CONTROL bit to disable the FSM when detection is finished
- Do a phy-reset on disconnect to work around the phy often refusing
  ulpi_read()/_write() commands after a disconnect
- Use power_supply_reg_notifier() for Vbus monitoring
- Export the detection result through a power_supply class device

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
Co-developed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/phy/ti/phy-tusb1210.c | 321 +++++++++++++++++++++++++++++++++-
 1 file changed, 314 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/ti/phy-tusb1210.c b/drivers/phy/ti/phy-tusb1210.c
index 9ef4c5f79b75..d2782a525091 100644
--- a/drivers/phy/ti/phy-tusb1210.c
+++ b/drivers/phy/ti/phy-tusb1210.c
@@ -13,20 +13,58 @@
 #include <linux/ulpi/regs.h>
 #include <linux/gpio/consumer.h>
 #include <linux/phy/ulpi_phy.h>
-
-#define TUSB1210_VENDOR_SPECIFIC2		0x80
-#define TUSB1210_VENDOR_SPECIFIC2_IHSTX_MASK	GENMASK(3, 0)
-#define TUSB1210_VENDOR_SPECIFIC2_ZHSDRV_MASK	GENMASK(5, 4)
-#define TUSB1210_VENDOR_SPECIFIC2_DP_MASK	BIT(6)
-
-#define TUSB1210_RESET_TIME_MS				30
+#include <linux/power_supply.h>
+#include <linux/workqueue.h>
+
+#define TUSB1211_POWER_CONTROL				0x3d
+#define TUSB1211_POWER_CONTROL_SET			0x3e
+#define TUSB1211_POWER_CONTROL_CLEAR			0x3f
+#define TUSB1211_POWER_CONTROL_SW_CONTROL		BIT(0)
+#define TUSB1211_POWER_CONTROL_DET_COMP			BIT(1)
+#define TUSB1211_POWER_CONTROL_DP_VSRC_EN		BIT(6)
+
+#define TUSB1210_VENDOR_SPECIFIC2			0x80
+#define TUSB1210_VENDOR_SPECIFIC2_IHSTX_MASK		GENMASK(3, 0)
+#define TUSB1210_VENDOR_SPECIFIC2_ZHSDRV_MASK		GENMASK(5, 4)
+#define TUSB1210_VENDOR_SPECIFIC2_DP_MASK		BIT(6)
+
+#define TUSB1211_VENDOR_SPECIFIC3			0x85
+#define TUSB1211_VENDOR_SPECIFIC3_SET			0x86
+#define TUSB1211_VENDOR_SPECIFIC3_CLEAR			0x87
+#define TUSB1211_VENDOR_SPECIFIC3_SW_USB_DET		BIT(4)
+#define TUSB1211_VENDOR_SPECIFIC3_CHGD_IDP_SRC_EN	BIT(6)
+
+#define TUSB1210_RESET_TIME_MS				50
+
+#define TUSB1210_CHG_DET_MAX_RETRIES			5
+
+/* TUSB1210 charger detection work states */
+enum tusb1210_chg_det_state {
+	TUSB1210_CHG_DET_CONNECTING,
+	TUSB1210_CHG_DET_START_DET,
+	TUSB1210_CHG_DET_READ_DET,
+	TUSB1210_CHG_DET_FINISH_DET,
+	TUSB1210_CHG_DET_CONNECTED,
+	TUSB1210_CHG_DET_DISCONNECTING,
+	TUSB1210_CHG_DET_DISCONNECTING_DONE,
+	TUSB1210_CHG_DET_DISCONNECTED,
+};
 
 struct tusb1210 {
 	struct ulpi *ulpi;
 	struct phy *phy;
 	struct gpio_desc *gpio_reset;
 	struct gpio_desc *gpio_cs;
+	u8 otg_ctrl;
 	u8 vendor_specific2;
+#ifdef CONFIG_POWER_SUPPLY
+	enum power_supply_usb_type chg_type;
+	enum tusb1210_chg_det_state chg_det_state;
+	int chg_det_retries;
+	struct delayed_work chg_det_work;
+	struct notifier_block psy_nb;
+	struct power_supply *psy;
+#endif
 };
 
 static int tusb1210_ulpi_write(struct tusb1210 *tusb, u8 reg, u8 val)
@@ -111,9 +149,276 @@ static int tusb1210_set_mode(struct phy *phy, enum phy_mode mode, int submode)
 		return 0;
 	}
 
+	tusb->otg_ctrl = reg;
 	return tusb1210_ulpi_write(tusb, ULPI_OTG_CTRL, reg);
 }
 
+#ifdef CONFIG_POWER_SUPPLY
+const char * const tusb1210_chg_det_states[] = {
+	"CHG_DET_CONNECTING",
+	"CHG_DET_START_DET",
+	"CHG_DET_READ_DET",
+	"CHG_DET_FINISH_DET",
+	"CHG_DET_CONNECTED",
+	"CHG_DET_DISCONNECTING",
+	"CHG_DET_DISCONNECTING_DONE",
+	"CHG_DET_DISCONNECTED",
+};
+
+static void tusb1210_reset(struct tusb1210 *tusb)
+{
+	gpiod_set_value_cansleep(tusb->gpio_reset, 0);
+	usleep_range(200, 500);
+	gpiod_set_value_cansleep(tusb->gpio_reset, 1);
+}
+
+static void tusb1210_chg_det_set_type(struct tusb1210 *tusb,
+				      enum power_supply_usb_type type)
+{
+	dev_dbg(&tusb->ulpi->dev, "charger type: %d\n", type);
+	tusb->chg_type = type;
+	tusb->chg_det_retries = 0;
+	power_supply_changed(tusb->psy);
+}
+
+static void tusb1210_chg_det_set_state(struct tusb1210 *tusb,
+				       enum tusb1210_chg_det_state new_state,
+				       int delay_ms)
+{
+	if (delay_ms)
+		dev_dbg(&tusb->ulpi->dev, "chg_det new state %s in %d ms\n",
+			tusb1210_chg_det_states[new_state], delay_ms);
+
+	tusb->chg_det_state = new_state;
+	mod_delayed_work(system_long_wq, &tusb->chg_det_work,
+			 msecs_to_jiffies(delay_ms));
+}
+
+static void tusb1210_chg_det_handle_ulpi_error(struct tusb1210 *tusb)
+{
+	tusb1210_reset(tusb);
+	if (tusb->chg_det_retries < TUSB1210_CHG_DET_MAX_RETRIES) {
+		tusb->chg_det_retries++;
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_START_DET,
+					   TUSB1210_RESET_TIME_MS);
+	} else {
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_FINISH_DET,
+					   TUSB1210_RESET_TIME_MS);
+	}
+}
+
+static void tusb1210_chg_det_work(struct work_struct *work)
+{
+	struct tusb1210 *tusb = container_of(work, struct tusb1210, chg_det_work.work);
+	bool vbus_present = power_supply_is_system_supplied();
+	int ret;
+	u8 val;
+
+	dev_dbg(&tusb->ulpi->dev, "chg_det state %s vbus_present %d\n",
+		tusb1210_chg_det_states[tusb->chg_det_state], vbus_present);
+
+	switch (tusb->chg_det_state) {
+	case TUSB1210_CHG_DET_CONNECTING:
+		tusb->chg_type = POWER_SUPPLY_USB_TYPE_UNKNOWN;
+		tusb->chg_det_retries = 0;
+		/* Power on USB controller for ulpi_read()/_write() */
+		ret = pm_runtime_resume_and_get(tusb->ulpi->dev.parent);
+		if (ret < 0) {
+			dev_err(&tusb->ulpi->dev, "error %d runtime-resuming\n", ret);
+			/* Should never happen, skip charger detection */
+			tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_CONNECTED, 0);
+			return;
+		}
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_START_DET, 0);
+		break;
+	case TUSB1210_CHG_DET_START_DET:
+		/*
+		 * Use the builtin charger detection FSM to keep things simple.
+		 * This only detects DCP / SDP. This is good enough for the few
+		 * boards which actually rely on the phy for charger detection.
+		 */
+		mutex_lock(&tusb->phy->mutex);
+		ret = tusb1210_ulpi_write(tusb, TUSB1211_VENDOR_SPECIFIC3_SET,
+					  TUSB1211_VENDOR_SPECIFIC3_SW_USB_DET);
+		mutex_unlock(&tusb->phy->mutex);
+		if (ret) {
+			tusb1210_chg_det_handle_ulpi_error(tusb);
+			break;
+		}
+
+		/* Wait 400 ms for the charger detection FSM to finish */
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_READ_DET, 400);
+		break;
+	case TUSB1210_CHG_DET_READ_DET:
+		mutex_lock(&tusb->phy->mutex);
+		ret = tusb1210_ulpi_read(tusb, TUSB1211_POWER_CONTROL, &val);
+		mutex_unlock(&tusb->phy->mutex);
+		if (ret) {
+			tusb1210_chg_det_handle_ulpi_error(tusb);
+			break;
+		}
+
+		if (val & TUSB1211_POWER_CONTROL_DET_COMP)
+			tusb1210_chg_det_set_type(tusb, POWER_SUPPLY_USB_TYPE_DCP);
+		else
+			tusb1210_chg_det_set_type(tusb, POWER_SUPPLY_USB_TYPE_SDP);
+
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_FINISH_DET, 0);
+		break;
+	case TUSB1210_CHG_DET_FINISH_DET:
+		mutex_lock(&tusb->phy->mutex);
+
+		/* Set SW_CONTROL to stop the charger-det FSM */
+		ret = tusb1210_ulpi_write(tusb, TUSB1211_POWER_CONTROL_SET,
+					  TUSB1211_POWER_CONTROL_SW_CONTROL);
+
+		/* Clear DP_VSRC_EN which may have been enabled by the charger-det FSM */
+		ret |= tusb1210_ulpi_write(tusb, TUSB1211_POWER_CONTROL_CLEAR,
+					   TUSB1211_POWER_CONTROL_DP_VSRC_EN);
+
+		/* Clear CHGD_IDP_SRC_EN (may have been enabled by the charger-det FSM) */
+		ret |= tusb1210_ulpi_write(tusb, TUSB1211_VENDOR_SPECIFIC3_CLEAR,
+					   TUSB1211_VENDOR_SPECIFIC3_CHGD_IDP_SRC_EN);
+
+		/* If any of the above fails reset the phy */
+		if (ret) {
+			tusb1210_reset(tusb);
+			msleep(TUSB1210_RESET_TIME_MS);
+		}
+
+		/* Restore phy-parameters and OTG_CTRL register */
+		tusb1210_ulpi_write(tusb, ULPI_OTG_CTRL, tusb->otg_ctrl);
+		tusb1210_ulpi_write(tusb, TUSB1210_VENDOR_SPECIFIC2,
+				    tusb->vendor_specific2);
+
+		mutex_unlock(&tusb->phy->mutex);
+
+		pm_runtime_put(tusb->ulpi->dev.parent);
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_CONNECTED, 0);
+		break;
+	case TUSB1210_CHG_DET_CONNECTED:
+		if (!vbus_present)
+			tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_DISCONNECTING, 0);
+		break;
+	case TUSB1210_CHG_DET_DISCONNECTING:
+		/*
+		 * The phy seems to take approx. 600ms longer then the charger
+		 * chip (which is used to get vbus_present) to determine Vbus
+		 * session end. Wait 800ms to ensure the phy has detected and
+		 * signalled Vbus session end.
+		 */
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_DISCONNECTING_DONE, 800);
+		break;
+	case TUSB1210_CHG_DET_DISCONNECTING_DONE:
+		/*
+		 * The phy often stops reacting to ulpi_read()/_write requests
+		 * after a Vbus-session end. Reset it to work around this.
+		 */
+		tusb1210_reset(tusb);
+		tusb1210_chg_det_set_type(tusb, POWER_SUPPLY_USB_TYPE_UNKNOWN);
+		tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_DISCONNECTED, 0);
+		break;
+	case TUSB1210_CHG_DET_DISCONNECTED:
+		if (vbus_present)
+			tusb1210_chg_det_set_state(tusb, TUSB1210_CHG_DET_CONNECTING, 0);
+		break;
+	}
+}
+
+static int tusb1210_psy_notifier(struct notifier_block *nb,
+	unsigned long event, void *ptr)
+{
+	struct tusb1210 *tusb = container_of(nb, struct tusb1210, psy_nb);
+	struct power_supply *psy = ptr;
+
+	if (psy != tusb->psy && psy->desc->type == POWER_SUPPLY_TYPE_USB)
+		queue_delayed_work(system_long_wq, &tusb->chg_det_work, 0);
+
+	return NOTIFY_OK;
+}
+
+static int tusb1210_psy_get_prop(struct power_supply *psy,
+				 enum power_supply_property psp,
+				 union power_supply_propval *val)
+{
+	struct tusb1210 *tusb = power_supply_get_drvdata(psy);
+
+	switch (psp) {
+	case POWER_SUPPLY_PROP_USB_TYPE:
+		val->intval = tusb->chg_type;
+		break;
+	case POWER_SUPPLY_PROP_CURRENT_MAX:
+		if (tusb->chg_type == POWER_SUPPLY_USB_TYPE_DCP)
+			val->intval = 2000000;
+		else
+			val->intval = 500000;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const enum power_supply_usb_type tusb1210_psy_usb_types[] = {
+	POWER_SUPPLY_USB_TYPE_SDP,
+	POWER_SUPPLY_USB_TYPE_DCP,
+	POWER_SUPPLY_USB_TYPE_UNKNOWN,
+};
+
+static const enum power_supply_property tusb1210_psy_props[] = {
+	POWER_SUPPLY_PROP_USB_TYPE,
+	POWER_SUPPLY_PROP_CURRENT_MAX,
+};
+
+static const struct power_supply_desc tusb1210_psy_desc = {
+	.name = "tusb1211-charger-detect",
+	.type = POWER_SUPPLY_TYPE_USB,
+	.usb_types = tusb1210_psy_usb_types,
+	.num_usb_types = ARRAY_SIZE(tusb1210_psy_usb_types),
+	.properties = tusb1210_psy_props,
+	.num_properties = ARRAY_SIZE(tusb1210_psy_props),
+	.get_property = tusb1210_psy_get_prop,
+};
+
+/* Setup charger detection if requested, on errors continue without chg-det */
+static void tusb1210_init_charger_detect(struct tusb1210 *tusb)
+{
+	struct power_supply_config psy_cfg = { .drv_data = tusb };
+	struct device *dev = &tusb->ulpi->dev;
+	int ret;
+
+	if (!device_property_read_bool(dev->parent, "linux,phy_charger_detect"))
+		return;
+
+	if (tusb->ulpi->id.product != 0x1508) {
+		dev_err(dev, "error charger detection is only supported on the TUSB1211\n");
+		return;
+	}
+
+	ret = tusb1210_ulpi_read(tusb, ULPI_OTG_CTRL, &tusb->otg_ctrl);
+	if (ret)
+		return;
+
+	tusb->psy = devm_power_supply_register(dev, &tusb1210_psy_desc, &psy_cfg);
+	if (IS_ERR(tusb->psy))
+		return;
+
+	/*
+	 * Delay initial run by 2 seconds to allow the charger driver,
+	 * which is used to determine vbus_present, to load.
+	 */
+	tusb->chg_det_state = TUSB1210_CHG_DET_DISCONNECTED;
+	INIT_DELAYED_WORK(&tusb->chg_det_work, tusb1210_chg_det_work);
+	queue_delayed_work(system_long_wq, &tusb->chg_det_work, 2 * HZ);
+
+	tusb->psy_nb.notifier_call = tusb1210_psy_notifier;
+	power_supply_reg_notifier(&tusb->psy_nb);
+}
+#else
+static void tusb1210_init_charger_detect(struct tusb1210 *tusb) { }
+#endif
+
 static const struct phy_ops phy_ops = {
 	.power_on = tusb1210_power_on,
 	.power_off = tusb1210_power_off,
@@ -174,6 +479,8 @@ static int tusb1210_probe(struct ulpi *ulpi)
 
 	tusb->vendor_specific2 = reg;
 
+	tusb1210_init_charger_detect(tusb);
+
 	tusb->phy = ulpi_phy_create(ulpi, &phy_ops);
 	if (IS_ERR(tusb->phy))
 		return PTR_ERR(tusb->phy);
-- 
2.33.1

