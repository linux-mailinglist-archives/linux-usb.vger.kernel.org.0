Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5BE255DE9
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 17:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726052AbgH1PdG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 11:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgH1PdB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Aug 2020 11:33:01 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD663C061264
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 08:33:00 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id e11so1770760ljn.6
        for <linux-usb@vger.kernel.org>; Fri, 28 Aug 2020 08:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMSoD8YXNYGNNhgJHALSUPvs1DWcSPWPuarYEpAxNtc=;
        b=eG6xtUmGYrTBsaPlL72BstadieZf2883ukOsGQRnYlMxB/4AKcZPmVzoxN9yzrgO/D
         CgyOiDMKqQtuy8Z3xktsCJEXyfg5Mq6pzkDnEsfciOqYNkWCfR3H0Xfh9EzRdHW93TWy
         rZV9ZQSYLYlLsfzrs3zo5JldG99anORwZ8Yv17I9c/xZfZoTUkwZSW8reS2AQJ6D4Chy
         BsrDavAExIzwPbfslF+7LiV2Rm+thzUKNxK0uFMbezcuLcwo1X8qdvfsJDq2fqPfwTRL
         wNFoMy7sjtOfn0pMqQfM/YzmnbGUaoAZF1sAI2EfcmsLHhfM35suc/LSS4q3y2UYD0BQ
         i36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lMSoD8YXNYGNNhgJHALSUPvs1DWcSPWPuarYEpAxNtc=;
        b=qrRTpxP6ejEDpktwGmFK+gn8Vc74vvEoUHqHaQQEr9Yt7mcIPTj8abVGXnlMROUppx
         xOJ5U3AB0c+yjKJxWpvp/IsYgMdjboyQnjqTns7WuXhCUFozmec3qyvQX9GKRwHU4vC5
         9sO7LcG4W5VUFPkuwp2Gv4JVpPxMOiipMF0N/IY01JJVI0q9FBPZf9qDSeTZeZEDU8R1
         HtxHZxxujY2fheFmU5epcAhjOWQ3ftNaA1iovv9gSFl05fdFMVRqaUMJMEELGV+zN7Eu
         tZJVH4dLBKRS3BAYP7bAHwwxYX08TZh5yYqxUbbMetXKc/zBbsAOfCqN/PnnBDOYZyXq
         Z5AA==
X-Gm-Message-State: AOAM531Ay3nX9W8qPUGxQpfclROH2BGiZuztD/QDYVh00Fqz3DoDN3hA
        EgQK1xKnVFLeCsR2NfikdwmpzkrqyYJ6LQ==
X-Google-Smtp-Source: ABdhPJzrCm4XNH0FL54W6AmqJsw9tPpVqWagb5XRXTvqnMmoPdpSH4J2JHjjGGcN3y33m/SXN22/wg==
X-Received: by 2002:a2e:9cd6:: with SMTP id g22mr1245203ljj.344.1598628779073;
        Fri, 28 Aug 2020 08:32:59 -0700 (PDT)
Received: from localhost.localdomain (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
        by smtp.gmail.com with ESMTPSA id e14sm260034ljj.120.2020.08.28.08.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 08:32:57 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3] usb: gadget: pch_udc: Convert to use GPIO descriptors
Date:   Fri, 28 Aug 2020 17:30:55 +0200
Message-Id: <20200828153055.83383-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This switches the PCH UDC driver to use GPIO descriptors. The way
this is supposed to be used is confusing. The code contains the
following:

    /* GPIO port for VBUS detecting */
    static int vbus_gpio_port = -1; /* GPIO port number (-1:Not used) */

So a hardcoded GPIO number in the code. Further the probe() path
very clearly will exit if the GPIO is not found, so this driver
can only be configured by editing the code, hard-coding a GPIO
number into this variable.

This is simply not how we do things. My guess is that this is
used in products by patching a GPIO number into this variable and
shipping a kernel that is compile-time tailored for the target
system.

I switched this mechanism to using a GPIO descriptor associated
with the parent PCI device. This can be added by using the 16bit
subsystem ID or similar to identify which exact machine we are
running on and what GPIO is present on that machine, and then
add a GPIO descriptor using gpiod_add_lookup_table() from
<linux/gpio/machine.h>. Since I don't have any target systems
I cannot add this but I'm happy to help. I put in a FIXME so
the people actually using this driver knows what to do.

Cc: Felipe Balbi <balbi@kernel.org>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Rebased on v5.9-rc1
ChangeLog v1->v2:
- Collected Andy's tags.
---
 drivers/usb/gadget/udc/pch_udc.c | 55 +++++++++++++-------------------
 1 file changed, 22 insertions(+), 33 deletions(-)

diff --git a/drivers/usb/gadget/udc/pch_udc.c b/drivers/usb/gadget/udc/pch_udc.c
index 8afc31d94b0e..a3c1fc924268 100644
--- a/drivers/usb/gadget/udc/pch_udc.c
+++ b/drivers/usb/gadget/udc/pch_udc.c
@@ -12,12 +12,9 @@
 #include <linux/interrupt.h>
 #include <linux/usb/ch9.h>
 #include <linux/usb/gadget.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/irq.h>
 
-/* GPIO port for VBUS detecting */
-static int vbus_gpio_port = -1;		/* GPIO port number (-1:Not used) */
-
 #define PCH_VBUS_PERIOD		3000	/* VBUS polling period (msec) */
 #define PCH_VBUS_INTERVAL	10	/* VBUS polling interval (msec) */
 
@@ -301,13 +298,13 @@ struct pch_udc_ep {
 /**
  * struct pch_vbus_gpio_data - Structure holding GPIO informaton
  *					for detecting VBUS
- * @port:		gpio port number
+ * @port:		gpio descriptor for the VBUS GPIO
  * @intr:		gpio interrupt number
  * @irq_work_fall:	Structure for WorkQueue
  * @irq_work_rise:	Structure for WorkQueue
  */
 struct pch_vbus_gpio_data {
-	int			port;
+	struct gpio_desc	*port;
 	int			intr;
 	struct work_struct	irq_work_fall;
 	struct work_struct	irq_work_rise;
@@ -1254,7 +1251,7 @@ static int pch_vbus_gpio_get_value(struct pch_udc_dev *dev)
 	int vbus = 0;
 
 	if (dev->vbus_gpio.port)
-		vbus = gpio_get_value(dev->vbus_gpio.port) ? 1 : 0;
+		vbus = gpiod_get_value(dev->vbus_gpio.port) ? 1 : 0;
 	else
 		vbus = -1;
 
@@ -1356,42 +1353,30 @@ static irqreturn_t pch_vbus_gpio_irq(int irq, void *data)
 /**
  * pch_vbus_gpio_init() - This API initializes GPIO port detecting VBUS.
  * @dev:		Reference to the driver structure
- * @vbus_gpio_port:	Number of GPIO port to detect gpio
  *
  * Return codes:
  *	0: Success
  *	-EINVAL: GPIO port is invalid or can't be initialized.
  */
-static int pch_vbus_gpio_init(struct pch_udc_dev *dev, int vbus_gpio_port)
+static int pch_vbus_gpio_init(struct pch_udc_dev *dev)
 {
 	int err;
 	int irq_num = 0;
+	struct gpio_desc *gpiod;
 
-	dev->vbus_gpio.port = 0;
+	dev->vbus_gpio.port = NULL;
 	dev->vbus_gpio.intr = 0;
 
-	if (vbus_gpio_port <= -1)
-		return -EINVAL;
-
-	err = gpio_is_valid(vbus_gpio_port);
-	if (!err) {
-		pr_err("%s: gpio port %d is invalid\n",
-			__func__, vbus_gpio_port);
-		return -EINVAL;
-	}
-
-	err = gpio_request(vbus_gpio_port, "pch_vbus");
-	if (err) {
-		pr_err("%s: can't request gpio port %d, err: %d\n",
-			__func__, vbus_gpio_port, err);
-		return -EINVAL;
-	}
+	/* Retrieve the GPIO line from the USB gadget device */
+	gpiod = devm_gpiod_get(dev->gadget.dev.parent, NULL, GPIOD_IN);
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+	gpiod_set_consumer_name(gpiod, "pch_vbus");
 
-	dev->vbus_gpio.port = vbus_gpio_port;
-	gpio_direction_input(vbus_gpio_port);
+	dev->vbus_gpio.port = gpiod;
 	INIT_WORK(&dev->vbus_gpio.irq_work_fall, pch_vbus_gpio_work_fall);
 
-	irq_num = gpio_to_irq(vbus_gpio_port);
+	irq_num = gpiod_to_irq(gpiod);
 	if (irq_num > 0) {
 		irq_set_irq_type(irq_num, IRQ_TYPE_EDGE_BOTH);
 		err = request_irq(irq_num, pch_vbus_gpio_irq, 0,
@@ -1417,9 +1402,6 @@ static void pch_vbus_gpio_free(struct pch_udc_dev *dev)
 {
 	if (dev->vbus_gpio.intr)
 		free_irq(dev->vbus_gpio.intr, dev);
-
-	if (dev->vbus_gpio.port)
-		gpio_free(dev->vbus_gpio.port);
 }
 
 /**
@@ -2894,7 +2876,7 @@ static int pch_udc_pcd_init(struct pch_udc_dev *dev)
 {
 	pch_udc_init(dev);
 	pch_udc_pcd_reinit(dev);
-	pch_vbus_gpio_init(dev, vbus_gpio_port);
+	pch_vbus_gpio_init(dev);
 	return 0;
 }
 
@@ -3096,6 +3078,13 @@ static int pch_udc_probe(struct pci_dev *pdev,
 
 	dev->base_addr = pcim_iomap_table(pdev)[bar];
 
+	/*
+	 * FIXME: add a GPIO descriptor table to pdev.dev using
+	 * gpiod_add_descriptor_table() from <linux/gpio/machine.h> based on
+	 * the PCI subsystem ID. The system-dependent GPIO is necessary for
+	 * VBUS operation.
+	 */
+
 	/* initialize the hardware */
 	if (pch_udc_pcd_init(dev))
 		return -ENODEV;
-- 
2.26.2

