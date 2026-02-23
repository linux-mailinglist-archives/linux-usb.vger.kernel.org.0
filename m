Return-Path: <linux-usb+bounces-33551-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLePGeU5nGlCBgQAu9opvQ
	(envelope-from <linux-usb+bounces-33551-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:37 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B94817580D
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC921304E7FF
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:28:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642673612DD;
	Mon, 23 Feb 2026 11:27:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A5E361DC5
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846071; cv=none; b=LjfAiS8pRq8/L1OEtjh5vS0EGYvOvSJUy6BG/7U8p603vcDErS6ZM4v75jLxl80PcrgBZR+vNnN816fkTUtmTDXWuZvKpZv+iV2e+eRpFxxcNDPSetKldggvU77gw1x8S/Rfa1YSNfyF/67fzXAXZBkcJQR9m+f6MjCtus7xg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846071; c=relaxed/simple;
	bh=/rPohQ6TXJYWjnUd8ydj76Hnm4lZ3mw82jkARppAjUw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EEZ7LvYwDVuspmGAs+wJs953i1fUOC7lQyUTXibJlKtalPul4m/nrOLpVdCtYqLSHZlEx4eoesqLqviRsMUIIMWNMpeju2FfxIPOIj+qAC1Kn5EULa10LncyJzzZXD64o/lTEIE2HWHaQBq7vgB4TfinMFpci5UVF5LX6xKvTeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1vuU6C-0007VH-Be; Mon, 23 Feb 2026 12:27:36 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Mon, 23 Feb 2026 12:27:37 +0100
Subject: [PATCH v5 4/4] usb: misc: onboard_dev: add hub downstream port
 host vbus-supply handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-v6-16-topic-usb-onboard-dev-v5-4-28d3018a8026@pengutronix.de>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
In-Reply-To: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 Matthias Kaehlcke <mka@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@pengutronix.de, 
 Marco Felsch <m.felsch@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,chromium.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33551-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.848];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: 1B94817580D
X-Rspamd-Action: no action

Some PCB designs don't use the dedicated USB hub port power GPIOs.
Instead they route the signals to the host. So the host is in charge to
power the VBUS supplies.

As first step the USB hub OF information is parsed and possible optional
vbus-supply regulators are added. This is done during the platform
driver probe() function.

Afterwards, during the usb driver probe() function and in case this is
an USB hub, the set/clear features hooks are registered via the new
usb_hub_register_port_feature_hooks().

After this registration all generic usb hub set/clear features calls are
passed to the onboard_dev driver too. This allows the driver to
en-/disable the regulators.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/misc/onboard_usb_dev.c | 117 +++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
index ba37eb99efbaf5237d4998a0fdb1c65b56628f2b..41274e0fdfa3e4da53ebef58e585d0aeb9cbab08 100644
--- a/drivers/usb/misc/onboard_usb_dev.c
+++ b/drivers/usb/misc/onboard_usb_dev.c
@@ -54,6 +54,12 @@ struct usbdev_node {
 	struct list_head list;
 };
 
+struct onboard_dev_port_regulator {
+	struct regulator *vbus_supply;
+	unsigned int port;
+	struct list_head list;
+};
+
 struct onboard_dev {
 	struct regulator_bulk_data supplies[MAX_SUPPLIES];
 	struct device *dev;
@@ -65,6 +71,7 @@ struct onboard_dev {
 	struct list_head udev_list;
 	struct mutex lock;
 	struct clk *clk;
+	struct list_head ext_vbus_supplies;
 };
 
 static int onboard_dev_get_regulators(struct onboard_dev *onboard_dev)
@@ -226,6 +233,71 @@ static int onboard_dev_add_usbdev(struct onboard_dev *onboard_dev,
 	return err;
 }
 
+static int onboard_dev_port_power(struct onboard_dev *onboard_dev, int port1,
+				  bool enable)
+{
+	struct onboard_dev_port_regulator *regulator;
+	struct regulator *vbus_supply = NULL;
+
+	list_for_each_entry(regulator, &onboard_dev->ext_vbus_supplies, list) {
+		if (regulator->port == port1) {
+			vbus_supply = regulator->vbus_supply;
+			break;
+		}
+	}
+
+	/* External supplies are optional, return no error */
+	if (!vbus_supply)
+		return 0;
+
+	if (enable)
+		return regulator_enable(vbus_supply);
+
+	return regulator_disable(vbus_supply);
+}
+
+static int onboard_dev_add_ext_vbus_supplies(struct onboard_dev *onboard_dev)
+{
+	struct device *dev = onboard_dev->dev;
+
+	if (!onboard_dev->pdata->is_hub)
+		return 0;
+
+	INIT_LIST_HEAD(&onboard_dev->ext_vbus_supplies);
+
+	for_each_child_of_node_scoped(dev->of_node, child) {
+		struct onboard_dev_port_regulator *regulator;
+		struct regulator *port_supply;
+		u32 port;
+
+		port_supply = devm_of_regulator_get_optional(dev, child, "vbus");
+		if (IS_ERR(port_supply)) {
+			if (PTR_ERR(port_supply) == -ENODEV)
+				continue;
+			return PTR_ERR(port_supply);
+		}
+
+		/*
+		 * The VBUS of this downstream port is controlled by a host
+		 * managed regulator
+		 */
+		if (of_property_read_u32(child, "reg", &port)) {
+			dev_err(dev, "Failed to parse USB device reg property\n");
+			return -EINVAL;
+		}
+
+		regulator = devm_kzalloc(dev, sizeof(*regulator), GFP_KERNEL);
+		if (!regulator)
+			return -ENOMEM;
+
+		regulator->vbus_supply = port_supply;
+		regulator->port = port;
+		list_add(&regulator->list, &onboard_dev->ext_vbus_supplies);
+	}
+
+	return 0;
+}
+
 static void onboard_dev_remove_usbdev(struct onboard_dev *onboard_dev,
 				      const struct usb_device *udev)
 {
@@ -460,6 +532,10 @@ static int onboard_dev_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(onboard_dev->reset_gpio),
 				     "failed to get reset GPIO\n");
 
+	err = onboard_dev_add_ext_vbus_supplies(onboard_dev);
+	if (err)
+		return dev_err_probe(dev, err, "failed to parse port vbus supplies\n");
+
 	mutex_init(&onboard_dev->lock);
 	INIT_LIST_HEAD(&onboard_dev->udev_list);
 
@@ -574,6 +650,44 @@ static struct platform_driver onboard_dev_driver = {
 #define VENDOR_ID_VIA		0x2109
 #define VENDOR_ID_XMOS		0x20B1
 
+static int onboard_dev_port_feature(struct usb_device *udev, bool set,
+				    int feature, int port1)
+{
+	struct device *dev = &udev->dev;
+	struct onboard_dev *onboard_dev = dev_get_drvdata(dev);
+
+	/*
+	 * Check usb_hub_register_port_feature_hooks() if you want to extent
+	 * the list of handled features. At the moment only power is synced
+	 * after adding the hook.
+	 */
+	switch (feature) {
+	case USB_PORT_FEAT_POWER:
+		return onboard_dev_port_power(onboard_dev, port1, set);
+	default:
+		return 0;
+	}
+}
+
+static int
+onboard_dev_set_port_feature(struct usb_device *udev, int feature, int port1)
+{
+	return onboard_dev_port_feature(udev, true, feature, port1);
+}
+
+static int
+onboard_dev_clear_port_feature(struct usb_device *udev, int feature, int port1)
+{
+	return onboard_dev_port_feature(udev, false, feature, port1);
+}
+
+static void
+onboard_dev_register_hub_hooks(struct usb_device *udev)
+{
+	usb_hub_register_port_feature_hooks(udev, onboard_dev_set_port_feature,
+					    onboard_dev_clear_port_feature);
+}
+
 /*
  * Returns the onboard_dev platform device that is associated with the USB
  * device passed as parameter.
@@ -633,6 +747,9 @@ static int onboard_dev_usbdev_probe(struct usb_device *udev)
 
 	dev_set_drvdata(dev, onboard_dev);
 
+	if (onboard_dev->pdata->is_hub)
+		onboard_dev_register_hub_hooks(udev);
+
 	err = onboard_dev_add_usbdev(onboard_dev, udev);
 	if (err)
 		return err;

-- 
2.47.3


