Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFB5DCFAA
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 21:57:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440305AbfJRT5Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 15:57:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43058 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730242AbfJRT5Y (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 15:57:24 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3E51530224A8;
        Fri, 18 Oct 2019 19:57:23 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-168.ams2.redhat.com [10.36.117.168])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A9E4C60BF4;
        Fri, 18 Oct 2019 19:57:21 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 2/3] usb: typec: tcpm: Add support for configuring DP altmode through device-properties
Date:   Fri, 18 Oct 2019 21:57:18 +0200
Message-Id: <20191018195719.94634-2-hdegoede@redhat.com>
In-Reply-To: <20191018195719.94634-1-hdegoede@redhat.com>
References: <20191018195719.94634-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 18 Oct 2019 19:57:23 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add support for configuring display-port altmode through device-properties.

We could try to add a generic mechanism for describing altmodes in
device-properties, but various altmodes will likely need altmode specific
configuration. E.g. the display-port altmode needs some way to describe
which set of DP pins on the GPU is connected to the USB Type-C connector.

As such it is better to have a separate set of altmode specific properties
per altmode and this commit adds a property for basic display-port altmode
support.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../bindings/connector/usb-connector.txt      |  3 ++
 drivers/usb/typec/tcpm/tcpm.c                 | 33 +++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/connector/usb-connector.txt b/Documentation/devicetree/bindings/connector/usb-connector.txt
index d357987181ee..7bae3cc9c76a 100644
--- a/Documentation/devicetree/bindings/connector/usb-connector.txt
+++ b/Documentation/devicetree/bindings/connector/usb-connector.txt
@@ -38,6 +38,9 @@ Optional properties for usb-c-connector:
   or Try.SRC, should be "sink" for Try.SNK or "source" for Try.SRC.
 - data-role: should be one of "host", "device", "dual"(DRD) if typec
   connector supports USB data.
+- displayport-vdo: The presenence of this property indicates that the
+  usb-connector supports displayport-altmode (svid 0xff01), the value of
+  this property is an u32 with the vdo value for the displayport-altmode,
 
 Required properties for usb-c-connector with power delivery support:
 - source-pdos: An array of u32 with each entry providing supported power
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index c5fa18759f8e..2e3096657e96 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -28,6 +28,7 @@
 #include <linux/usb/role.h>
 #include <linux/usb/tcpm.h>
 #include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
 #include <linux/workqueue.h>
 
 #define FOREACH_STATE(S)			\
@@ -281,6 +282,7 @@ struct tcpm_port {
 	unsigned int nr_snk_pdo;
 	u32 snk_vdo[VDO_MAX_OBJECTS];
 	unsigned int nr_snk_vdo;
+	u32 displayport_vdo;
 
 	unsigned int operating_snk_mw;
 	bool update_sink_caps;
@@ -4433,6 +4435,9 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
 					    port->nr_snk_pdo))
 		return -EINVAL;
 
+	fwnode_property_read_u32(fwnode, "displayport-vdo",
+				 &port->displayport_vdo);
+
 	if (fwnode_property_read_u32(fwnode, "op-sink-microwatt", &mw) < 0)
 		return -EINVAL;
 	port->operating_snk_mw = mw / 1000;
@@ -4667,6 +4672,28 @@ static int devm_tcpm_psy_register(struct tcpm_port *port)
 	return PTR_ERR_OR_ZERO(port->psy);
 }
 
+static int tcpm_register_port_altmodes(struct tcpm_port *port)
+{
+	struct typec_altmode_desc desc;
+	struct typec_altmode *alt;
+	int index = 0;
+
+	if (port->displayport_vdo) {
+		desc.svid = USB_TYPEC_DP_SID;
+		desc.mode = USB_TYPEC_DP_MODE;
+		desc.vdo  = port->displayport_vdo;
+		alt = typec_port_register_altmode(port->typec_port, &desc);
+		if (IS_ERR(alt))
+			return PTR_ERR(alt);
+		typec_altmode_set_drvdata(alt, port);
+		alt->ops = &tcpm_altmode_ops;
+		port->port_altmode[index] = alt;
+		index++;
+	}
+	/* Future support for further altmodes goes here */
+	return 0;
+}
+
 struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 {
 	struct tcpm_port *port;
@@ -4736,6 +4763,10 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 		goto out_role_sw_put;
 	}
 
+	err = tcpm_register_port_altmodes(port);
+	if (err)
+		goto out_unregister_port;
+
 	mutex_lock(&port->lock);
 	tcpm_init(port);
 	mutex_unlock(&port->lock);
@@ -4743,6 +4774,8 @@ struct tcpm_port *tcpm_register_port(struct device *dev, struct tcpc_dev *tcpc)
 	tcpm_log(port, "%s: registered", dev_name(dev));
 	return port;
 
+out_unregister_port:
+	typec_unregister_port(port->typec_port);
 out_role_sw_put:
 	usb_role_switch_put(port->role_sw);
 out_destroy_wq:
-- 
2.23.0

