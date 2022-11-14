Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C20B628A99
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 21:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236559AbiKNUiM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Nov 2022 15:38:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235636AbiKNUiK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Nov 2022 15:38:10 -0500
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr [80.12.242.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624BB1145E
        for <linux-usb@vger.kernel.org>; Mon, 14 Nov 2022 12:38:08 -0800 (PST)
Received: from pop-os.home ([86.243.100.34])
        by smtp.orange.fr with ESMTPA
        id ugDVoF0uQzQOKugDVozxfW; Mon, 14 Nov 2022 21:38:06 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 14 Nov 2022 21:38:06 +0100
X-ME-IP: 86.243.100.34
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: fotg210-udc: Remove a useless assignment
Date:   Mon, 14 Nov 2022 21:38:04 +0100
Message-Id: <deab9696fc4000499470e7ccbca7c36fca17bd4e.1668458274.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

There is no need to use an intermediate array for these memory allocations,
so, axe it.

While at it, turn a '== NULL' into a shorter '!' when testing memory
allocation failure.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/fotg210/fotg210-udc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.c b/drivers/usb/fotg210/fotg210-udc.c
index 3c357ce42d3b..52b1d69843dd 100644
--- a/drivers/usb/fotg210/fotg210-udc.c
+++ b/drivers/usb/fotg210/fotg210-udc.c
@@ -1090,7 +1090,6 @@ int fotg210_udc_probe(struct platform_device *pdev)
 {
 	struct resource *res, *ires;
 	struct fotg210_udc *fotg210 = NULL;
-	struct fotg210_ep *_ep[FOTG210_MAX_NUM_EP];
 	int ret = 0;
 	int i;
 
@@ -1114,10 +1113,9 @@ int fotg210_udc_probe(struct platform_device *pdev)
 		goto err;
 
 	for (i = 0; i < FOTG210_MAX_NUM_EP; i++) {
-		_ep[i] = kzalloc(sizeof(struct fotg210_ep), GFP_KERNEL);
-		if (_ep[i] == NULL)
+		fotg210->ep[i] = kzalloc(sizeof(struct fotg210_ep), GFP_KERNEL);
+		if (!fotg210->ep[i])
 			goto err_alloc;
-		fotg210->ep[i] = _ep[i];
 	}
 
 	fotg210->reg = ioremap(res->start, resource_size(res));
-- 
2.34.1

