Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3042358E72
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 22:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231906AbhDHUby (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 16:31:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50354 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231676AbhDHUby (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Apr 2021 16:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617913902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jGOitQjkoMTJ+bX1WGm4tbkjjJT/BDFiFAV+vF35KT4=;
        b=V6+Al3iTRAFbQxVSKhAaVSKA4+Kv5M/pL+Dh4MPRQwY516v2bgb2RtgDgIm5gHRxHZpBJS
        CVynrEcjmGy6H+QQowVmht5voQ98YjoTlSUP5yRxd3Ct5KGUcB3ne6pResRwkqHgB7KTQJ
        C0qVZaYdV+Jk8LcCfIJVYXxqcLue7HE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-XhqmW_DMMvyAqrCge0SwJA-1; Thu, 08 Apr 2021 16:31:40 -0400
X-MC-Unique: XhqmW_DMMvyAqrCge0SwJA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A93B9DF8B3;
        Thu,  8 Apr 2021 20:31:39 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-60.ams2.redhat.com [10.36.112.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4EE0A6A045;
        Thu,  8 Apr 2021 20:31:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 1/3] usb: typec: Add typec_port_register_altmodes_from_fwnode()
Date:   Thu,  8 Apr 2021 22:31:27 +0200
Message-Id: <20210408203129.526604-2-hdegoede@redhat.com>
In-Reply-To: <20210408203129.526604-1-hdegoede@redhat.com>
References: <20210408203129.526604-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This can be used by Type-C controller drivers which use a standard
usb-connector fwnode, with altmodes sub-node, to describe the available
altmodes.

Note there are is no devicetree bindings documentation for the altmodes
node, this is deliberate. ATM the fwnodes used to register the altmodes
are only used internally to pass platform info from a drivers/platform/x86
driver to the type-c subsystem.

When a devicetree user of this functionally comes up and the dt-bindings
have been hashed out the internal use can be adjusted to match the
dt-bindings.

Currently the typec_port_register_altmodes_from_fwnode() function expects
an "altmodes" child fwnode on port->dev with this "altmodes" fwnode having
child fwnodes itself with each child containing 2 integer properties:

1. A "svid" property, which sets the id of the altmode, e.g. displayport
altmode has a svid of 0xff01.

2. A "vdo" property, typically used as a bitmask describing the
capabilities of the altmode, the bits in the vdo are specified in the
specification of the altmode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Drop the unnecessary fwnode parameter from
  typec_port_register_altmodes_from_fwnode()
- Document the expected "altmodes" fwnode in the commit message for now
  as v2 of the patch-set drops the dt-bindings since there are not DT
  users for this yet
---
 drivers/usb/typec/class.c | 55 +++++++++++++++++++++++++++++++++++++++
 include/linux/usb/typec.h |  6 +++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 45f0bf65e9ab..a82344fe1650 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1978,6 +1978,61 @@ typec_port_register_altmode(struct typec_port *port,
 }
 EXPORT_SYMBOL_GPL(typec_port_register_altmode);
 
+void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
+	const struct typec_altmode_ops *ops, void *drvdata,
+	struct typec_altmode **altmodes, size_t n)
+{
+	struct fwnode_handle *altmodes_node, *child;
+	struct typec_altmode_desc desc;
+	struct typec_altmode *alt;
+	size_t index = 0;
+	u32 svid, vdo;
+	int ret;
+
+	altmodes_node = device_get_named_child_node(&port->dev, "altmodes");
+	if (!altmodes_node)
+		return; /* No altmodes specified */
+
+	child = NULL;
+	while ((child = fwnode_get_next_child_node(altmodes_node, child))) {
+		ret = fwnode_property_read_u32(child, "svid", &svid);
+		if (ret) {
+			dev_err(&port->dev, "Error reading svid for altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		ret = fwnode_property_read_u32(child, "vdo", &vdo);
+		if (ret) {
+			dev_err(&port->dev, "Error reading vdo for altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		if (index >= n) {
+			dev_err(&port->dev, "Error not enough space for altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		desc.svid = svid;
+		desc.vdo = vdo;
+		desc.mode = index + 1;
+		alt = typec_port_register_altmode(port, &desc);
+		if (IS_ERR(alt)) {
+			dev_err(&port->dev, "Error registering altmode %s\n",
+				fwnode_get_name(child));
+			continue;
+		}
+
+		alt->ops = ops;
+		typec_altmode_set_drvdata(alt, drvdata);
+		altmodes[index] = alt;
+		index++;
+	}
+}
+EXPORT_SYMBOL_GPL(typec_port_register_altmodes_from_fwnode);
+
 /**
  * typec_register_port - Register a USB Type-C Port
  * @parent: Parent device
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 91b4303ca305..75d54558f962 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -17,6 +17,7 @@ struct typec_partner;
 struct typec_cable;
 struct typec_plug;
 struct typec_port;
+struct typec_altmode_ops;
 
 struct fwnode_handle;
 struct device;
@@ -138,6 +139,11 @@ struct typec_altmode
 struct typec_altmode
 *typec_port_register_altmode(struct typec_port *port,
 			     const struct typec_altmode_desc *desc);
+
+void typec_port_register_altmodes_from_fwnode(struct typec_port *port,
+	const struct typec_altmode_ops *ops, void *drvdata,
+	struct typec_altmode **altmodes, size_t n);
+
 void typec_unregister_altmode(struct typec_altmode *altmode);
 
 struct typec_port *typec_altmode2port(struct typec_altmode *alt);
-- 
2.30.2

