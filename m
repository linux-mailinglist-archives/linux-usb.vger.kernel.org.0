Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B74052276D
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 01:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiEJXNY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 19:13:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiEJXNX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 19:13:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 313F25F8FD
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 16:13:22 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mgr@pengutronix.de>)
        id 1noZ2e-0004Ch-Ff; Wed, 11 May 2022 01:13:20 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1noZ2e-001Zzn-R4; Wed, 11 May 2022 01:13:19 +0200
Received: from mgr by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mgr@pengutronix.de>)
        id 1noZ2c-007rgU-MZ; Wed, 11 May 2022 01:13:18 +0200
From:   Michael Grzeschik <m.grzeschik@pengutronix.de>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, kernel@pengutronix.de
Subject: [PATCH] usb: hub: port: add sysfs entry to switch port power
Date:   Wed, 11 May 2022 01:13:17 +0200
Message-Id: <20220510231317.1874608-1-m.grzeschik@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mgr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch adds an sysfs switch to enable/disable a port on an power
switchable hub. It also ensures that the associated device gets
disconnected from the logical usb tree.

Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
---
 drivers/usb/core/port.c | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index d5bc36ca5b1f77..abc618d87888f3 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -17,6 +17,52 @@ static int usb_port_block_power_off;
 
 static const struct attribute_group *port_dev_group[];
 
+static ssize_t port_power_store(struct device *dev, struct device_attribute *attr,
+			    const char *buf, size_t count)
+{
+	struct usb_port *port_dev = to_usb_port(dev);
+	struct usb_device *udev = port_dev->child;
+	struct usb_device *hdev = to_usb_device(dev->parent->parent);
+	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
+	int port1 = port_dev->portnum;
+	bool value;
+	int rc = 0;
+
+	if (!hub)
+		return -EINVAL;
+
+	if (hub->in_reset)
+		return -EBUSY;
+
+	rc = strtobool(buf, &value);
+	if (rc)
+		return rc;
+
+	if (value)
+		usb_remote_wakeup(hdev);
+
+	rc = usb_hub_set_port_power(hdev, hub, port1, value);
+	if (rc)
+		return rc;
+
+	if (!value) {
+		usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_CONNECTION);
+		if (!port_dev->is_superspeed)
+			usb_clear_port_feature(hdev, port1, USB_PORT_FEAT_C_ENABLE);
+
+		if (udev) {
+			port_dev->child = NULL;
+			usb_disconnect(&udev);
+		}
+	}
+
+	if (!rc)
+		rc = count;
+
+	return rc;
+}
+static DEVICE_ATTR_WO(port_power);
+
 static ssize_t location_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -153,6 +199,7 @@ static struct attribute *port_dev_attrs[] = {
 	&dev_attr_location.attr,
 	&dev_attr_quirks.attr,
 	&dev_attr_over_current_count.attr,
+	&dev_attr_port_power.attr,
 	NULL,
 };
 
-- 
2.30.2

