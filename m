Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4CF23FD28
	for <lists+linux-usb@lfdr.de>; Sun,  9 Aug 2020 09:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgHIH3z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Aug 2020 03:29:55 -0400
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:57382 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbgHIH3z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Aug 2020 03:29:55 -0400
Received: from localhost.localdomain ([93.22.150.139])
        by mwinf5d64 with ME
        id DKVq2300630hzCV03KVqWt; Sun, 09 Aug 2020 09:29:53 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 09 Aug 2020 09:29:53 +0200
X-ME-IP: 93.22.150.139
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     balbi@kernel.org, gregkh@linuxfoundation.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        nkristam@nvidia.com, yuehaibing@huawei.com,
        heikki.krogerus@linux.intel.com
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] usb: gadget: tegra-xudc: Avoid GFP_ATOMIC where it is not needed
Date:   Sun,  9 Aug 2020 09:29:48 +0200
Message-Id: <20200809072948.743269-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to use GFP_ATOMIC here. It is a probe function, no
spinlock is taken.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index d6ff68c06911..9aa4815c1c59 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3733,7 +3733,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	unsigned int i;
 	int err;
 
-	xudc = devm_kzalloc(&pdev->dev, sizeof(*xudc), GFP_ATOMIC);
+	xudc = devm_kzalloc(&pdev->dev, sizeof(*xudc), GFP_KERNEL);
 	if (!xudc)
 		return -ENOMEM;
 
-- 
2.25.1

