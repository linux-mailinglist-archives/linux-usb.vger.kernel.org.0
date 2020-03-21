Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 295D318E436
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2020 21:25:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727405AbgCUUZM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 21 Mar 2020 16:25:12 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41735 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgCUUZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 21 Mar 2020 16:25:11 -0400
Received: by mail-lj1-f196.google.com with SMTP id o10so10243703ljc.8
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2020 13:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=waldekranz-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :organization;
        bh=K9Wf5GzKVON6qAY3kHv4zzrPtb8dkbTHpnzTuv5kmHo=;
        b=dV5BDG2XlYBZdaOYzTt/voLqIg3KPShiW7JENYv5CDVEQjIj88a9xeM8WyjINXhzYk
         mgNAbdBT1NROIF2X0u/Ojg7czeZfQVkZRunUU1lrxz/9vXXSVVMuT9TyV478PjFAF4JN
         Dm3aLAmNEwzua+ZoeJ4C5X9qJVyeKTfuh7gn561D0niam6AmZVcwIeZZk0zAPVA1aYmV
         zp4e3Nkdw43vNZ1j2V0fXbQUcgEPwjU34wY53ZGBVBAFB6VBooex/donIt2ngMz01j3b
         VYNvZEm/lDa9eHAESUdpsWTjKhIpfNQfm4MXTTi6vzqlceoDEd0k6ySoka6san4fVO6m
         DLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:organization;
        bh=K9Wf5GzKVON6qAY3kHv4zzrPtb8dkbTHpnzTuv5kmHo=;
        b=DHArZ7GhcB36OCKAmuy+piwOQ4HryC5XYOWSWn9riaq4gNlpq+SFlO+GGVo4BsjQZr
         3pEyNTnLvMOvLojY+//5ojv62MtDRuKCjldnxkVr9AcmxK5Nt9D6McA5lmY8yWdXESMT
         1Mi11lBRQoYDsAoNk/DmZu9LtW7apqKZ48otomYA2wWKeDEW9Ag0owWnO7rkRG81sAEP
         5b77mSKaFO6qOWnXTppckNNKdzlaoSXCl9mO6dEIB7San1Hw2XQBnAIF/4s58ANJ9v4f
         1vfd9mMIS7/OzhKnE9Uel+GMIL8xSKq7Diky8X4x5JQm8aF/kGyHTIrvvteZtBo4htH9
         +ytw==
X-Gm-Message-State: ANhLgQ0tjNNC9AM+QrRQsd8uwnskX4bXTEbtLx6ie1a6M57d7NZ6JkSG
        yVqoiR/BhAxtlR2J0XrbKXVCLQ==
X-Google-Smtp-Source: ADFU+vtWTmYZr3YVV35/n9T7zsKuODATBYSkWrnDB8YUoxVfgVsMW6wdXRiHH6BgrRu2bzBUYqLqKA==
X-Received: by 2002:a2e:3010:: with SMTP id w16mr3752817ljw.41.1584822308968;
        Sat, 21 Mar 2020 13:25:08 -0700 (PDT)
Received: from veiron.westermo.com (static-193-12-47-89.cust.tele2.se. [193.12.47.89])
        by smtp.gmail.com with ESMTPSA id p25sm5847334ljg.85.2020.03.21.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 13:25:08 -0700 (PDT)
From:   Tobias Waldekranz <tobias@waldekranz.com>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, andrew@lunn.ch, f.fainelli@gmail.com,
        hkallweit1@gmail.com, linux-usb@vger.kernel.org
Subject: [PATCH v3 2/2] net: phy: add marvell usb to mdio controller
Date:   Sat, 21 Mar 2020 21:24:43 +0100
Message-Id: <20200321202443.15352-2-tobias@waldekranz.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200321202443.15352-1-tobias@waldekranz.com>
References: <20200321202443.15352-1-tobias@waldekranz.com>
Organization: Westermo
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

An MDIO controller present on development boards for Marvell switches
from the Link Street (88E6xxx) family.

Using this module, you can use the following setup as a development
platform for switchdev and DSA related work.

   .-------.      .-----------------.
   |      USB----USB                |
   |  SoC  |      |  88E6390X-DB  ETH1-10
   |      ETH----ETH0               |
   '-------'      '-----------------'

Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
---

Hi linux-usb,

This is my first ever USB driver, therefore I would really appreciate
it if someone could have a look at it from a USB perspective before it
is (hopefully) pulled into net-next.

Thanks

v2->v3:
- Rename driver	smi2usb	-> mvusb.
- Clean	up unused USB references.

v1->v2:
- Reverse christmas tree ordering of local variables.

---
 MAINTAINERS                  |   1 +
 drivers/net/phy/Kconfig      |   7 ++
 drivers/net/phy/Makefile     |   1 +
 drivers/net/phy/mdio-mvusb.c | 120 +++++++++++++++++++++++++++++++++++
 4 files changed, 129 insertions(+)
 create mode 100644 drivers/net/phy/mdio-mvusb.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ff35669f8712..f36023d4ee44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10105,6 +10105,7 @@ MARVELL USB MDIO CONTROLLER DRIVER
 M:	Tobias Waldekranz <tobias@waldekranz.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
+F:	drivers/net/phy/mdio-mvusb.c
 F:	Documentation/devicetree/bindings/net/marvell,mvusb.yaml
 
 MARVELL XENON MMC/SD/SDIO HOST CONTROLLER DRIVER
diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index cc7f1df855da..be9ae8620cd1 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -179,6 +179,13 @@ config MDIO_MSCC_MIIM
 	  This driver supports the MIIM (MDIO) interface found in the network
 	  switches of the Microsemi SoCs
 
+config MDIO_MVUSB
+	tristate "Marvell USB to MDIO Adapter"
+	depends on OF_MDIO && USB
+	help
+	  A USB to MDIO converter present on development boards for
+	  Marvell's Link Street family of Ethernet switches.
+
 config MDIO_OCTEON
 	tristate "Octeon and some ThunderX SOCs MDIO buses"
 	depends on (64BIT && OF_MDIO) || COMPILE_TEST
diff --git a/drivers/net/phy/Makefile b/drivers/net/phy/Makefile
index 70774ab474e6..2f5c7093a65b 100644
--- a/drivers/net/phy/Makefile
+++ b/drivers/net/phy/Makefile
@@ -40,6 +40,7 @@ obj-$(CONFIG_MDIO_I2C)		+= mdio-i2c.o
 obj-$(CONFIG_MDIO_IPQ8064)	+= mdio-ipq8064.o
 obj-$(CONFIG_MDIO_MOXART)	+= mdio-moxart.o
 obj-$(CONFIG_MDIO_MSCC_MIIM)	+= mdio-mscc-miim.o
+obj-$(CONFIG_MDIO_MVUSB)	+= mdio-mvusb.o
 obj-$(CONFIG_MDIO_OCTEON)	+= mdio-octeon.o
 obj-$(CONFIG_MDIO_SUN4I)	+= mdio-sun4i.o
 obj-$(CONFIG_MDIO_THUNDER)	+= mdio-thunder.o
diff --git a/drivers/net/phy/mdio-mvusb.c b/drivers/net/phy/mdio-mvusb.c
new file mode 100644
index 000000000000..d5eabddfdf51
--- /dev/null
+++ b/drivers/net/phy/mdio-mvusb.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_mdio.h>
+#include <linux/phy.h>
+#include <linux/usb.h>
+
+#define USB_MARVELL_VID	0x1286
+
+static const struct usb_device_id mvusb_mdio_table[] = {
+	{ USB_DEVICE(USB_MARVELL_VID, 0x1fa4) },
+
+	{}
+};
+MODULE_DEVICE_TABLE(usb, mvusb_mdio_table);
+
+enum {
+	MVUSB_CMD_PREAMBLE0,
+	MVUSB_CMD_PREAMBLE1,
+	MVUSB_CMD_ADDR,
+	MVUSB_CMD_VAL,
+};
+
+struct mvusb_mdio {
+	struct usb_device *udev;
+	struct mii_bus *mdio;
+
+	__le16 buf[4];
+};
+
+static int mvusb_mdio_read(struct mii_bus *mdio, int dev, int reg)
+{
+	struct mvusb_mdio *mvusb = mdio->priv;
+	int err, alen;
+
+	if (dev & MII_ADDR_C45)
+		return -EOPNOTSUPP;
+
+	mvusb->buf[MVUSB_CMD_ADDR] = cpu_to_le16(0xa400 | (dev << 5) | reg);
+
+	err = usb_bulk_msg(mvusb->udev, usb_sndbulkpipe(mvusb->udev, 2),
+			   mvusb->buf, 6, &alen, 100);
+	if (err)
+		return err;
+
+	err = usb_bulk_msg(mvusb->udev, usb_rcvbulkpipe(mvusb->udev, 6),
+			   &mvusb->buf[MVUSB_CMD_VAL], 2, &alen, 100);
+	if (err)
+		return err;
+
+	return le16_to_cpu(mvusb->buf[MVUSB_CMD_VAL]);
+}
+
+static int mvusb_mdio_write(struct mii_bus *mdio, int dev, int reg, u16 val)
+{
+	struct mvusb_mdio *mvusb = mdio->priv;
+	int alen;
+
+	if (dev & MII_ADDR_C45)
+		return -EOPNOTSUPP;
+
+	mvusb->buf[MVUSB_CMD_ADDR] = cpu_to_le16(0x8000 | (dev << 5) | reg);
+	mvusb->buf[MVUSB_CMD_VAL]  = cpu_to_le16(val);
+
+	return usb_bulk_msg(mvusb->udev, usb_sndbulkpipe(mvusb->udev, 2),
+			    mvusb->buf, 8, &alen, 100);
+}
+
+static int mvusb_mdio_probe(struct usb_interface *interface,
+			    const struct usb_device_id *id)
+{
+	struct device *dev = &interface->dev;
+	struct mvusb_mdio *mvusb;
+	struct mii_bus *mdio;
+
+	mdio = devm_mdiobus_alloc_size(dev, sizeof(*mvusb));
+	if (!mdio)
+		return -ENOMEM;
+
+	mvusb = mdio->priv;
+	mvusb->mdio = mdio;
+	mvusb->udev = usb_get_dev(interface_to_usbdev(interface));
+
+	/* Reversed from USB PCAPs, no idea what these mean. */
+	mvusb->buf[MVUSB_CMD_PREAMBLE0] = cpu_to_le16(0xe800);
+	mvusb->buf[MVUSB_CMD_PREAMBLE1] = cpu_to_le16(0x0001);
+
+	snprintf(mdio->id, MII_BUS_ID_SIZE, "mvusb-%s", dev_name(dev));
+	mdio->name = mdio->id;
+	mdio->parent = dev;
+	mdio->read = mvusb_mdio_read;
+	mdio->write = mvusb_mdio_write;
+
+	usb_set_intfdata(interface, mvusb);
+	return of_mdiobus_register(mdio, dev->of_node);
+}
+
+static void mvusb_mdio_disconnect(struct usb_interface *interface)
+{
+	struct mvusb_mdio *mvusb = usb_get_intfdata(interface);
+	struct usb_device *udev = mvusb->udev;
+
+	mdiobus_unregister(mvusb->mdio);
+	usb_set_intfdata(interface, NULL);
+	usb_put_dev(udev);
+}
+
+static struct usb_driver mvusb_mdio_driver = {
+	.name       = "mvusb_mdio",
+	.id_table   = mvusb_mdio_table,
+	.probe      = mvusb_mdio_probe,
+	.disconnect = mvusb_mdio_disconnect,
+};
+
+module_usb_driver(mvusb_mdio_driver);
+
+MODULE_AUTHOR("Tobias Waldekranz <tobias@waldekranz.com>");
+MODULE_DESCRIPTION("Marvell USB MDIO Adapter");
+MODULE_LICENSE("GPL");
-- 
2.17.1

