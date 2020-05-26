Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27FC1D4C46
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 13:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgEOLQa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 07:16:30 -0400
Received: from esa2.microchip.iphmx.com ([68.232.149.84]:32902 "EHLO
        esa2.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726237AbgEOLQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 07:16:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1589541388; x=1621077388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/40a+Xw95DGQQJ2+L1yejq9q/M1oXwbhYnFs602PHAg=;
  b=OTQ2D3I4wkTiz+iRP1UiF+K4PbKvBo2JeCT4inztaV1LHPZXny/wFAFU
   CB+XlhaNo0F4kRRXRa/WZ9lwRtPAsEf24MoCqgL4qCog59alP2j/s0wVh
   XRleH52EGOzzc/OY5Nmpd52/py5NO23aOwh0l0k9SKN/GBH+wrHteLXW4
   QiLfK1cHt30BxSHyBFdYybvYlT2H4NazqelVqndZ4O+eqP7yV6ySGa336
   +XRlFXuFd2uVe0Ryo6AwDIcqG80tsatkJhy6kzvrWlbWr+vRqVkUrxMD3
   ZsPAWctTxJOX4m9l0X1AUzJtkMZXVEkv/OeRpLnfpD0ARVqgJFhtIhFt4
   Q==;
IronPort-SDR: ZhHdvmBtstDBEEBJRD9Jbcrvs7hNd2Go3Q8JoBEOo3ZuAJJ5DGDu+8hCSDdkNMF7ZcFd15wgLs
 EVsr8Hj/staXk/mfe15ierBCoEiY7sTU9xIj+44a0+ZvNOViKajve5uLPwR6fJQrBOjniQ703N
 RMOLNPnfe/EsGNMyutsOfUmAFU30A/gb5/KX3YiT2lRLURx+8fmqxmT/PyPIaIAtJAentyHn0t
 Oyn0ryQi+3F9/ZtcRWNRLWnxHJFxzHb2R8QvlpMdgCTY+5e+8WqZDQlEFIEE6v6B+Lqm4sUM7c
 rE8=
X-IronPort-AV: E=Sophos;i="5.73,395,1583218800"; 
   d="scan'208";a="75380490"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 May 2020 04:16:26 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 15 May 2020 04:16:26 -0700
Received: from cristi-P53.lan (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Fri, 15 May 2020 04:16:23 -0700
From:   <cristian.birsan@microchip.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <ludovic.desroches@microchip.com>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: [PATCH v2 1/7] usb: gadget: udc: atmel: use of_find_matching_node_and_match
Date:   Fri, 15 May 2020 14:16:25 +0300
Message-ID: <20200515111631.31210-2-cristian.birsan@microchip.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515111631.31210-1-cristian.birsan@microchip.com>
References: <20200515111631.31210-1-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

Instead of trying to match every possible compatible use
of_find_matching_node_and_match() and pass the compatible array.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index 22200341c8ec..2b154085dc6a 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2052,6 +2052,13 @@ static const struct of_device_id atmel_udc_dt_ids[] = {
 
 MODULE_DEVICE_TABLE(of, atmel_udc_dt_ids);
 
+static const struct of_device_id atmel_pmc_dt_ids[] = {
+	{ .compatible = "atmel,at91sam9g45-pmc" },
+	{ .compatible = "atmel,at91sam9rl-pmc" },
+	{ .compatible = "atmel,at91sam9x5-pmc" },
+	{ /* sentinel */ }
+};
+
 static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 						    struct usba_udc *udc)
 {
@@ -2067,13 +2074,17 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 		return ERR_PTR(-EINVAL);
 
 	udc->errata = match->data;
-	udc->pmc = syscon_regmap_lookup_by_compatible("atmel,at91sam9g45-pmc");
-	if (IS_ERR(udc->pmc))
-		udc->pmc = syscon_regmap_lookup_by_compatible("atmel,at91sam9rl-pmc");
-	if (IS_ERR(udc->pmc))
-		udc->pmc = syscon_regmap_lookup_by_compatible("atmel,at91sam9x5-pmc");
-	if (udc->errata && IS_ERR(udc->pmc))
-		return ERR_CAST(udc->pmc);
+	if (udc->errata) {
+		pp = of_find_matching_node_and_match(NULL, atmel_pmc_dt_ids,
+						     NULL);
+		if (!pp)
+			return ERR_PTR(-ENODEV);
+
+		udc->pmc = syscon_node_to_regmap(pp);
+		of_node_put(pp);
+		if (IS_ERR(udc->pmc))
+			return ERR_CAST(udc->pmc);
+	}
 
 	udc->num_ep = 0;
 
-- 
2.17.1

