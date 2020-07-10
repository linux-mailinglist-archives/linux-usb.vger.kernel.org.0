Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B1321AFF6
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 09:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGJHUi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 03:20:38 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:56698 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725966AbgGJHUi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 10 Jul 2020 03:20:38 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 08D6C239FB6EC9E5B9A1;
        Fri, 10 Jul 2020 15:20:36 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Fri, 10 Jul 2020 15:20:26 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH -next] usb: gadget: udc: atmel: remove unused variable 'pp'
Date:   Fri, 10 Jul 2020 15:30:33 +0800
Message-ID: <20200710073033.58714-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Gcc report build warning as follows:

drivers/usb/gadget/udc/atmel_usba_udc.c:2106:22: warning:
 variable pp set but not used [-Wunused-but-set-variable]
 2106 |  struct device_node *pp;
      |                      ^~

After commit e78355b577c4 ("usb: gadget: udc: atmel: Don't
use DT to configure end point"), variable 'pp' is never used,
so removing it to avoid warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/gadget/udc/atmel_usba_udc.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/udc/atmel_usba_udc.c
index d69f61ff0181..a10b8d406e62 100644
--- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -2103,7 +2103,6 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 {
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *match;
-	struct device_node *pp;
 	int i, ret;
 	struct usba_ep *eps, *ep;
 	const struct usba_udc_config *udc_config;
@@ -2128,7 +2127,6 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 						GPIOD_IN);
 
 	if (fifo_mode == 0) {
-		pp = NULL;
 		udc->num_ep = udc_config->num_ep;
 		udc->configured_ep = 1;
 	} else {
@@ -2144,7 +2142,6 @@ static struct usba_ep * atmel_udc_of_init(struct platform_device *pdev,
 
 	INIT_LIST_HEAD(&eps[0].ep.ep_list);
 
-	pp = NULL;
 	i = 0;
 	while (i < udc->num_ep) {
 		const struct usba_ep_config *ep_cfg = &udc_config->config[i];

