Return-Path: <linux-usb+bounces-27124-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E10B3002D
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 18:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51899A0489F
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 16:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FAB2DFA2F;
	Thu, 21 Aug 2025 16:32:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2752DE1E0
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 16:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755793921; cv=none; b=Vgkd3vHvnUiO2wZUeLEbHScgj/CYMV5Ni/HUtfazgZ6dGy+ZNIKuaLm9Lu2182p9pqN2wrRy8xo/5/AZRROKD/PeDM10B24dQfGF73MRlPewn4U6I1YgiaweaR3zSzqdhp6dG7+fjIzyse+wggE5Grkdj/+RLfknbLrqDhijVtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755793921; c=relaxed/simple;
	bh=hIJ3Cs9EYY6S0Fjb3v3srWt//vNNreb4Za1FM7tQoLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kHlZx406xeV6N6Lan5PIw/Rqqz2zD4UuKcIgUf2PdmYnojWqSc75wdMk/Wc/T1zdtFWz6dQOj2jd8JAs+2eAIuBf0nCsCLYOfNOWgBREWzVXBazP8Ut1MjCgXZSWKC5ehvvynFdRnqGag9wERyfxJRo3u04zhNr/xbr0DoixldQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1up8Cj-0004O7-Lk; Thu, 21 Aug 2025 18:31:57 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
Date: Thu, 21 Aug 2025 18:31:56 +0200
Subject: [PATCH v3 2/4] usb: hub: add infrastructure to pass onboard_dev
 port features
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-v6-16-topic-usb-onboard-dev-v3-2-6d2b38a5d818@pengutronix.de>
References: <20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de>
In-Reply-To: <20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de>
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

On board devices may require special handling for en-/disable port
features due to PCB design decisions e.g. enable/disable the VBUS power
on the port via a host controlled regulator or GPIO.

This commit adds the necessary infrastructure to prepare the common code
base for such use-cases.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/usb/core/hub.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++--
 drivers/usb/core/hub.h |  2 ++
 include/linux/usb.h    |  3 +++
 3 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 256fe8c86828d51c33442345acdb7f3fe80a98ce..50ae500e2ad3711996609fc84806803449a5bf16 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -457,9 +457,19 @@ static int clear_hub_feature(struct usb_device *hdev, int feature)
  */
 int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	int ret;
+
+	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
 		USB_REQ_CLEAR_FEATURE, USB_RT_PORT, feature, port1,
 		NULL, 0, 1000);
+	if (ret)
+		return ret;
+
+	if (hub->onboard_hub_clear_port_feature)
+		ret = hub->onboard_hub_clear_port_feature(hdev, feature, port1);
+
+	return ret;
 }
 
 /*
@@ -467,9 +477,19 @@ int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
  */
 static int set_port_feature(struct usb_device *hdev, int port1, int feature)
 {
-	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	int ret;
+
+	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
 		USB_REQ_SET_FEATURE, USB_RT_PORT, feature, port1,
 		NULL, 0, 1000);
+	if (ret)
+		return ret;
+
+	if (hub->onboard_hub_set_port_feature)
+		ret = hub->onboard_hub_set_port_feature(hdev, feature, port1);
+
+	return ret;
 }
 
 static char *to_led_name(int selector)
@@ -6544,6 +6564,37 @@ void usb_hub_adjust_deviceremovable(struct usb_device *hdev,
 	}
 }
 
+/**
+ * usb_hub_register_port_feature_hooks - Register port set/get feature hooks
+ * @hdev: USB device belonging to the usb hub
+ * @set_port_feature: set_feature hook which gets called by the hub core
+ * @clear_port_feature: clear_feature hook which gets called by the hub core
+ *
+ * Register set/get_port_feature hooks for a onboard_dev hub.
+ */
+void usb_hub_register_port_feature_hooks(struct usb_device *hdev,
+		int (*set_port_feature)(struct usb_device *, int, int),
+		int (*clear_port_feature)(struct usb_device *, int, int))
+{
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+
+	if (WARN_ON_ONCE(is_root_hub(hdev) || !hub))
+		return;
+
+	if (set_port_feature)
+		hub->onboard_hub_set_port_feature = set_port_feature;
+	if (clear_port_feature)
+		hub->onboard_hub_clear_port_feature = clear_port_feature;
+
+	/*
+	 * Keep it simple for now. Just check the power state and re-sync it
+	 * after adding the hooks since the onboard-dev may do some additional
+	 * logic e.g. controlling regulators.
+	 */
+	hub_power_on(hub, false);
+}
+EXPORT_SYMBOL_GPL(usb_hub_register_port_feature_hooks);
+
 #ifdef CONFIG_ACPI
 /**
  * usb_get_hub_port_acpi_handle - Get the usb port's acpi handle
diff --git a/drivers/usb/core/hub.h b/drivers/usb/core/hub.h
index 297adf2c6078809ca582104f228e5222c464f999..31800b5922ba896dc7cac5f9e3ed1a77e7c5a801 100644
--- a/drivers/usb/core/hub.h
+++ b/drivers/usb/core/hub.h
@@ -76,6 +76,8 @@ struct usb_hub {
 	struct timer_list	irq_urb_retry;
 	struct usb_port		**ports;
 	struct list_head        onboard_devs;
+	int (*onboard_hub_set_port_feature)(struct usb_device *udev, int feature, int port1);
+	int (*onboard_hub_clear_port_feature)(struct usb_device *udev, int feature, int port1);
 };
 
 /**
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 92c752f5446ff37ef09b9296f7711e1a622680ea..1415a826953ac5488619073e2f659188f7988d6e 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -928,6 +928,9 @@ int usb_hub_claim_port(struct usb_device *hdev, unsigned port1,
 		struct usb_dev_state *owner);
 int usb_hub_release_port(struct usb_device *hdev, unsigned port1,
 		struct usb_dev_state *owner);
+void usb_hub_register_port_feature_hooks(struct usb_device *hdev,
+		int (*set_port_feature)(struct usb_device *, int, int),
+		int (*clear_port_feature)(struct usb_device *, int, int));
 
 /**
  * usb_make_path - returns stable device path in the usb tree

-- 
2.39.5


