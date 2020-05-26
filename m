Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE8B1C95B5
	for <lists+linux-usb@lfdr.de>; Thu,  7 May 2020 17:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728094AbgEGP5b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 May 2020 11:57:31 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:52195 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgEGP5O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 May 2020 11:57:14 -0400
X-Originating-IP: 87.231.134.186
Received: from localhost (87-231-134-186.rev.numericable.fr [87.231.134.186])
        (Authenticated sender: gregory.clement@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 0A9F5C001A;
        Thu,  7 May 2020 15:57:10 +0000 (UTC)
From:   Gregory CLEMENT <gregory.clement@bootlin.com>
To:     Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux-arm-kernel@lists.infradead.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [PATCH v2 1/3] usb: gadget: udc: atmel: Don't use DT to configure end point
Date:   Thu,  7 May 2020 17:56:49 +0200
Message-Id: <20200507155651.1094142-2-gregory.clement@bootlin.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200507155651.1094142-1-gregory.clement@bootlin.com>
References: <20200507155651.1094142-1-gregory.clement@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The endpoint configuration used to be stored in the device tree,
however the configuration depend on the "version" of the controller
itself.

This information is already documented by the compatible string. It
then possible to just rely on the compatible string and completely
remove the full ep configuration done in the device tree as it was
already the case for all the other USB device controller.

Acked-by: Cristian Birsan <cristian.birsan@microchip.com>
Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 112 +++++++++++++++---------
 drivers/usb/gadget/udc/atmel_usba_udc.h |  12 +++
 2 files changed, 84 insertions(+), 40 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 6e0432141c40..f4c83514e527 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2043,10 +2043,56 @@ static const struct usba_udc_errata at91sam9g45_errata = {
 	.pulse_bias = at91sam9g45_pulse_bias,
 };
 
+static const struct usba_ep_config ep_config_sam9[] __initconst = {
+	{ .nr_banks = 1 },				/* ep 0 */
+	{ .nr_banks = 2, .can_dma = 1, .can_isoc = 1 },	/* ep 1 */
+	{ .nr_banks = 2, .can_dma = 1, .can_isoc = 1 },	/* ep 2 */
+	{ .nr_banks = 3, .can_dma = 1 },		/* ep 3 */
+	{ .nr_banks = 3, .can_dma = 1 },		/* ep 4 */
+	{ .nr_banks = 3, .can_dma = 1, .can_isoc = 1 },	/* ep 5 */
+	{ .nr_banks = 3, .can_dma = 1, .can_isoc = 1 },	/* ep 6 */
+};
+
+static const struct usba_ep_config ep_config_sama5[] __initconst = {
+	{ .nr_banks = 1 },				/* ep 0 */
+	{ .nr_banks = 3, .can_dma = 1, .can_isoc = 1 },	/* ep 1 */
+	{ .nr_banks = 3, .can_dma = 1, .can_isoc = 1 },	/* ep 2 */
+	{ .nr_banks = 2, .can_dma = 1, .can_isoc = 1 },	/* ep 3 */
+	{ .nr_banks = 2, .can_dma = 1, .can_isoc = 1 },	/* ep 4 */
+	{ .nr_banks = 2, .can_dma = 1, .can_isoc = 1 },	/* ep 5 */
+	{ .nr_banks = 2, .can_dma = 1, .can_isoc = 1 },	/* ep 6 */
+	{ .nr_banks = 2, .can_dma = 1, .can_isoc = 1 },	/* ep 7 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 8 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 9 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 10 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 11 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 12 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 13 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 14 */
+	{ .nr_banks = 2, .can_isoc = 1 },		/* ep 15 */
+};
+
+static const struct usba_udc_config udc_at91sam9rl_cfg = {
+	.errata = &at91sam9rl_errata,
+	.config = ep_config_sam9,
+	.num_ep = ARRAY_SIZE(ep_config_sam9),
+};
+
+static const struct usba_udc_config udc_at91sam9g45_cfg = {
+	.errata = &at91sam9g45_errata,
+	.config = ep_config_sam9,
+	.num_ep = ARRAY_SIZE(ep_config_sam9),
+};
+
+static const struct usba_udc_config udc_sama5d3_cfg = {
+	.config = ep_config_sama5,
+	.num_ep = ARRAY_SIZE(ep_config_sama5),
+};
+
 static const struct of_device_id atmel_udc_dt_ids[] = {
-	{ .compatible = "atmel,at91sam9rl-udc", .data = &at91sam9rl_errata },
-	{ .compatible = "atmel,at91sam9g45-udc", .data = &at91sam9g45_errata },
-	{ .compatible = "atmel,sama5d3-udc" },
+	{ .compatible = "atmel,at91sam9rl-udc", .data = &udc_at91sam9rl_cfg },
+	{ .compatible = "atmel,at91sam9g45-udc", .data = &udc_at91sam9g45_cfg },
+	{ .compatible = "atmel,sama5d3-udc", .data = &udc_sama5d3_cfg },
 	{ /* sentinel */ }
 };
 
@@ -2055,18 +2101,19 @@ MODULE_DEVICE_TABLE(of, atmel_udc_dt_ids);
 static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 						    struct usba_udc *udc)
 {
-	u32 val;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match;
 	struct device_node *pp;
 	int i, ret;
 	struct usba_ep *eps, *ep;
+	const struct usba_udc_config *udc_config;
 
 	match = of_match_node(atmel_udc_dt_ids, np);
 	if (!match)
 		return ERR_PTR(-EINVAL);
 
-	udc->errata = match->data;
+	udc_config = match->data;
+	udc->errata = udc_config->errata;
 	udc->pmc = syscon_regmap_lookup_by_compatible("atmel,at91sam9g45-pmc");
 	if (IS_ERR(udc->pmc))
 		udc->pmc = syscon_regmap_lookup_by_compatible("atmel,at91sam9rl-pmc");
@@ -2082,8 +2129,7 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 
 	if (fifo_mode == 0) {
 		pp = NULL;
-		while ((pp = of_get_next_child(np, pp)))
-			udc->num_ep++;
+		udc->num_ep = udc_config->num_ep;
 		udc->configured_ep = 1;
 	} else {
 		udc->num_ep = usba_config_fifo_table(udc);
@@ -2100,52 +2146,38 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 
 	pp = NULL;
 	i = 0;
-	while ((pp = of_get_next_child(np, pp)) && i < udc->num_ep) {
+	while (i < udc->num_ep) {
+		const struct usba_ep_config *ep_cfg = &udc_config->config[i];
+
 		ep = &eps[i];
 
-		ret = of_property_read_u32(pp, "reg", &val);
-		if (ret) {
-			dev_err(&pdev->dev, "of_probe: reg error(%d)\n", ret);
-			goto err;
-		}
-		ep->index = fifo_mode ? udc->fifo_cfg[i].hw_ep_num : val;
+		ep->index = fifo_mode ? udc->fifo_cfg[i].hw_ep_num : i;
+
+		/* Only the first EP is 64 bytes */
+		if (ep->index == 0)
+			ep->fifo_size = 64;
+		else
+			ep->fifo_size = 1024;
 
-		ret = of_property_read_u32(pp, "atmel,fifo-size", &val);
-		if (ret) {
-			dev_err(&pdev->dev, "of_probe: fifo-size error(%d)\n", ret);
-			goto err;
-		}
 		if (fifo_mode) {
-			if (val < udc->fifo_cfg[i].fifo_size) {
+			if (ep->fifo_size < udc->fifo_cfg[i].fifo_size)
 				dev_warn(&pdev->dev,
-					 "Using max fifo-size value from DT\n");
-				ep->fifo_size = val;
-			} else {
+					 "Using default max fifo-size value\n");
+			else
 				ep->fifo_size = udc->fifo_cfg[i].fifo_size;
-			}
-		} else {
-			ep->fifo_size = val;
 		}
 
-		ret = of_property_read_u32(pp, "atmel,nb-banks", &val);
-		if (ret) {
-			dev_err(&pdev->dev, "of_probe: nb-banks error(%d)\n", ret);
-			goto err;
-		}
+		ep->nr_banks = ep_cfg->nr_banks;
 		if (fifo_mode) {
-			if (val < udc->fifo_cfg[i].nr_banks) {
+			if (ep->nr_banks < udc->fifo_cfg[i].nr_banks)
 				dev_warn(&pdev->dev,
-					 "Using max nb-banks value from DT\n");
-				ep->nr_banks = val;
-			} else {
+					 "Using default max nb-banks value\n");
+			else
 				ep->nr_banks = udc->fifo_cfg[i].nr_banks;
-			}
-		} else {
-			ep->nr_banks = val;
 		}
 
-		ep->can_dma = of_property_read_bool(pp, "atmel,can-dma");
-		ep->can_isoc = of_property_read_bool(pp, "atmel,can-isoc");
+		ep->can_dma = ep_cfg->can_dma;
+		ep->can_isoc = ep_cfg->can_isoc;
 
 		sprintf(ep->name, "ep%d", ep->index);
 		ep->ep.name = ep->name;
diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.h b/drivers/usb/gadget/udc/atmel_usba_udc.h
index a0225e4543d4..48e332439ed5 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.h
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.h
@@ -290,6 +290,12 @@ struct usba_ep {
 #endif
 };
 
+struct usba_ep_config {
+	u8					nr_banks;
+	unsigned int				can_dma:1;
+	unsigned int				can_isoc:1;
+};
+
 struct usba_request {
 	struct usb_request			req;
 	struct list_head			queue;
@@ -307,6 +313,12 @@ struct usba_udc_errata {
 	void (*pulse_bias)(struct usba_udc *udc);
 };
 
+struct usba_udc_config {
+	const struct usba_udc_errata *errata;
+	const struct usba_ep_config *config;
+	const int num_ep;
+};
+
 struct usba_udc {
 	/* Protect hw registers from concurrent modifications */
 	spinlock_t lock;
-- 
2.26.2

