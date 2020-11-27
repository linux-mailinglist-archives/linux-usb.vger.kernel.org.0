Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CED5D2C6028
	for <lists+linux-usb@lfdr.de>; Fri, 27 Nov 2020 07:29:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392568AbgK0G2g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Nov 2020 01:28:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389589AbgK0G2g (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Nov 2020 01:28:36 -0500
Received: from localhost.localdomain (unknown [180.164.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CA76F221FD;
        Fri, 27 Nov 2020 06:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606458515;
        bh=xesqbq9mongWn1XNF3IbRBvUavaxfAhuBcfFCMugYr0=;
        h=From:To:Cc:Subject:Date:From;
        b=1Yuu6WEGEuy7pW8R2+EDe+TF36ykPI7H/OhHq+VHtqCHNWVHkUfLPe3/olW6PQRu1
         rAqqTcPxuVF4OwPYylGzzR81nICz4k7zFPvO+k4Iv9EPhA0+Lb9MuJnS055F9LmqUj
         ntkXnDOuHpGcmDKQpgtagrS+smgqPaJKnHA/jtOw=
From:   Peter Chen <peter.chen@kernel.org>
To:     heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-imx@nxp.com,
        Peter Chen <peter.chen@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: [PATCH 1/1] usb: roles: reference controller's parent device if existed
Date:   Fri, 27 Nov 2020 14:28:20 +0800
Message-Id: <20201127062820.588-1-peter.chen@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Peter Chen <peter.chen@nxp.com>

For some DRD IP drivers (eg, dwc3/cdns3/chipidea), the core device is
created and deleted by glue layer device. So, if role switch user
(eg, tcpci), core device, and glue layer device are all built as module,
and glue layer device is removed first, the core device's driver ->remove
function will be called, and its device's driver pointer will be NULL,
and cause below oops.

To fix it, if there is a parent for controller device (role switch
device's parent), it references to parent too.

[ 1167.249191] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
[ 1167.258055] Mem abort info:
[ 1167.260890]   ESR = 0x96000006
[ 1167.263972]   EC = 0x25: DABT (current EL), IL = 32 bits
[ 1167.269296]   SET = 0, FnV = 0
[ 1167.272378]   EA = 0, S1PTW = 0
[ 1167.275533] Data abort info:
[ 1167.278446]   ISV = 0, ISS = 0x00000006
[ 1167.282293]   CM = 0, WnR = 0
[ 1167.285260] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000084811000
[ 1167.291714] [0000000000000010] pgd=0000000080db2003, p4d=0000000080db2003, pud=0000000084d69003, pmd=0000000000000000
[ 1167.302350] Internal error: Oops: 96000006 [#1] PREEMPT SMP

Message [f r1o1m6 7s.y3s0l7o25] Modules linked in: fsl_jr_uio caam_jr caamkeyblob_desc caamhash_desc caamalg_desc crypto_engine rng_core authenc
libdes ci_hdrc ehci_hcd crct10dif_ce caam secvio tcpci(-) clk_bd718x7 error gpio_ir_recv rc_core [last unloaded: usbmisc_imx]
[ 1167.331947] CPU: 2 PID: 567 Comm: modprobe Not tainted 5.10.0-rc4-04443-g8354b2be734-dirty #2
gd@imx8qm[m e1k1 6a7t.3 4F0r4i6 9] Hardware name: FSL i.MX8MM DDR4 EVK with CYW43455 WIFI/BT board (DT)
[ 1167.349598] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
Jul 10 06:45:26 2020 ...
imx8qm[ 1167.355611] pc : usb_role_switch_put+0x2c/0x50
[ 1167.362905] lr : tcpm_unregister_port+0x48/0x68
mek kern[e l1:1 6[7 .13166774.33] sp : ffff800012acbc60
02350] Internal error: Oops[ :1 167.372390] x29: ffff800012acbc60 x28: ffff000040668e00
[ 1167.380213] x27: 0000000000000000 x26: 0000000000000000
85525] x25: 0000000000000000 x24: 0000000000000000
[ 1167.393000] x23: 0000000080000000 x22: ffff000040584800

[ 1167.398312] x21: ffff000044ab4080 x20: ffff000044ab4fd0
[ 1167.403791] x19: ffff0000444f1400 x18: 0000000000000000
[ 1167.409103] x17: 0000000000000000 x16: 0000000000000000
[ 1167.414416] x15: 0000000000000040 x14: ffff8000122d8220
[ 1167.419728] x13: 0000000000000228 x12: 0000000000000000
[ 1167.425040] x11: ffff800012acbba8 x10: 0000000000000002
[ 1167.430351] x9 : ffff800010c1c958 x8 : 3074726f703d5452
[ 1167.435662] x7 : ffff000000000000 x6 : 0000000000000001
[ 1167.440973] x5 : 0000000000000001 x4 : fffffe0000f298a0
[ 1167.446286] x3 : 000000008020001c x2 : fffffe0000f298a0
[ 1167.451598] x1 : 3ec74e543ca2de00 x0 : 0000000000000000
[ 1167.456911] Call trace:
[ 1167.459359]  usb_role_switch_put+0x2c/0x50
[ 1167.463454]  tcpm_unregister_port+0x48/0x68
[ 1167.467640]  tcpci_remove+0x5c/0x98 [tcpci]
[ 1167.471823]  i2c_device_remove+0x5c/0x100
[ 1167.475833]  device_release_driver_internal+0x114/0x1e8
[ 1167.481056]  driver_detach+0x54/0xe0
[ 1167.484631]  bus_remove_driver+0x60/0xd8
[ 1167.488551]  driver_unregister+0x34/0x60
[ 1167.492472]  i2c_del_driver+0x2c/0x68
[ 1167.496134]  tcpci_i2c_driver_exit+0x14/0xf08 [tcpci]
[ 1167.501186]  __arm64_sys_delete_module+0x180/0x258
[ 1167.505977]  el0_svc_common.constprop.0+0x70/0x168
[ 1167.510767]  do_el0_svc+0x28/0x88
[ 1167.514081]  el0_sync_handler+0x158/0x160
[ 1167.518088]  el0_sync+0x140/0x180
[ 1167.521404] Code: aa0003f3 540000e8 f9402000 f9403400 (f9400800)
[ 1167.527498] ---[ end trace f6a9099ec98b76de ]---
Segmentation fault

Cc: Jun Li <jun.li@nxp.com>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/roles/class.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
index 97f37077b7f9..e8ff0f7ff4fd 100644
--- a/drivers/usb/roles/class.c
+++ b/drivers/usb/roles/class.c
@@ -129,8 +129,14 @@ struct usb_role_switch *usb_role_switch_get(struct device *dev)
 		sw = device_connection_find_match(dev, "usb-role-switch", NULL,
 						  usb_role_switch_match);
 
-	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+	if (!IS_ERR_OR_NULL(sw)) {
+		struct device *dev;
+
+		dev = sw->dev.parent;
+		WARN_ON(!try_module_get(dev->driver->owner));
+		if (dev->parent)
+			WARN_ON(!try_module_get(dev->parent->driver->owner));
+	}
 
 	return sw;
 }
@@ -151,8 +157,14 @@ struct usb_role_switch *fwnode_usb_role_switch_get(struct fwnode_handle *fwnode)
 	if (!sw)
 		sw = fwnode_connection_find_match(fwnode, "usb-role-switch",
 						  NULL, usb_role_switch_match);
-	if (!IS_ERR_OR_NULL(sw))
-		WARN_ON(!try_module_get(sw->dev.parent->driver->owner));
+	if (!IS_ERR_OR_NULL(sw)) {
+		struct device *dev;
+
+		dev = sw->dev.parent;
+		WARN_ON(!try_module_get(dev->driver->owner));
+		if (dev->parent)
+			WARN_ON(!try_module_get(dev->parent->driver->owner));
+	}
 
 	return sw;
 }
@@ -167,7 +179,13 @@ EXPORT_SYMBOL_GPL(fwnode_usb_role_switch_get);
 void usb_role_switch_put(struct usb_role_switch *sw)
 {
 	if (!IS_ERR_OR_NULL(sw)) {
-		module_put(sw->dev.parent->driver->owner);
+		struct device *dev;
+
+		dev = sw->dev.parent;
+		module_put(dev->driver->owner);
+		if (dev->parent)
+			module_put(dev->parent->driver->owner);
+
 		put_device(&sw->dev);
 	}
 }
-- 
2.17.1

