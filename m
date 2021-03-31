Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1362934CB3E
	for <lists+linux-usb@lfdr.de>; Mon, 29 Mar 2021 10:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234841AbhC2Ipk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Mar 2021 04:45:40 -0400
Received: from mga06.intel.com ([134.134.136.31]:14122 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234874AbhC2IoY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Mar 2021 04:44:24 -0400
IronPort-SDR: B/UvlM9Spu1CUCRr3GjofPm8nPPz8FqthccTrQxWcfAYt/2POmRtiQ0MMhPz1DghZOYcDJnZeP
 t0hEuBt8Ae3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9937"; a="252854828"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="252854828"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2021 01:44:20 -0700
IronPort-SDR: OwdVY7bEpo4j2ZTORj3PppNEXnvgXRQUDgJWFC/4Nj6sEliOnUuBP+iqQv9/gP4MWdoZzQ0IF4
 fWkuEbuSKKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; 
   d="scan'208";a="515918690"
Received: from black.fi.intel.com (HELO black.fi.intel.com.) ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2021 01:44:17 -0700
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@chromium.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] usb: typec: Declare the typec_class static
Date:   Mon, 29 Mar 2021 11:44:22 +0300
Message-Id: <20210329084426.78138-3-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329084426.78138-1-heikki.krogerus@linux.intel.com>
References: <20210329084426.78138-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is only to make the handling of the class consistent
with the two other susbsystems - the alt mode bus and the
mux class.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/class.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 5fa279a96b6ef..d3e1002386357 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -17,7 +17,11 @@
 #include "class.h"
 
 static DEFINE_IDA(typec_index_ida);
-static struct class *typec_class;
+
+static struct class typec_class = {
+	.name = "typec",
+	.owner = THIS_MODULE,
+};
 
 /* ------------------------------------------------------------------------- */
 /* Common attributes */
@@ -551,7 +555,7 @@ typec_register_altmode(struct device *parent,
 
 	/* Plug alt modes need a class to generate udev events. */
 	if (is_typec_plug(parent))
-		alt->adev.dev.class = typec_class;
+		alt->adev.dev.class = &typec_class;
 
 	ret = device_register(&alt->adev.dev);
 	if (ret) {
@@ -815,7 +819,7 @@ struct typec_partner *typec_register_partner(struct typec_port *port,
 		partner->identity = desc->identity;
 	}
 
-	partner->dev.class = typec_class;
+	partner->dev.class = &typec_class;
 	partner->dev.parent = &port->dev;
 	partner->dev.type = &typec_partner_dev_type;
 	dev_set_name(&partner->dev, "%s-partner", dev_name(&port->dev));
@@ -967,7 +971,7 @@ struct typec_plug *typec_register_plug(struct typec_cable *cable,
 	ida_init(&plug->mode_ids);
 	plug->num_altmodes = -1;
 	plug->index = desc->index;
-	plug->dev.class = typec_class;
+	plug->dev.class = &typec_class;
 	plug->dev.parent = &cable->dev;
 	plug->dev.type = &typec_plug_dev_type;
 	dev_set_name(&plug->dev, "%s-%s", dev_name(cable->dev.parent), name);
@@ -1132,7 +1136,7 @@ struct typec_cable *typec_register_cable(struct typec_port *port,
 		cable->identity = desc->identity;
 	}
 
-	cable->dev.class = typec_class;
+	cable->dev.class = &typec_class;
 	cable->dev.parent = &port->dev;
 	cable->dev.type = &typec_cable_dev_type;
 	dev_set_name(&cable->dev, "%s-cable", dev_name(&port->dev));
@@ -1986,7 +1990,7 @@ struct typec_port *typec_register_port(struct device *parent,
 	port->prefer_role = cap->prefer_role;
 
 	device_initialize(&port->dev);
-	port->dev.class = typec_class;
+	port->dev.class = &typec_class;
 	port->dev.parent = parent;
 	port->dev.fwnode = cap->fwnode;
 	port->dev.type = &typec_port_dev_type;
@@ -2049,11 +2053,9 @@ static int __init typec_init(void)
 	if (ret)
 		goto err_unregister_bus;
 
-	typec_class = class_create(THIS_MODULE, "typec");
-	if (IS_ERR(typec_class)) {
-		ret = PTR_ERR(typec_class);
+	ret = class_register(&typec_class);
+	if (ret)
 		goto err_unregister_mux_class;
-	}
 
 	return 0;
 
@@ -2069,7 +2071,7 @@ subsys_initcall(typec_init);
 
 static void __exit typec_exit(void)
 {
-	class_destroy(typec_class);
+	class_unregister(&typec_class);
 	ida_destroy(&typec_index_ida);
 	bus_unregister(&typec_bus);
 	class_unregister(&typec_mux_class);
-- 
2.30.2

