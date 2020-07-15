Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97E432212FA
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 18:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgGOQtW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 12:49:22 -0400
Received: from mail.ispras.ru ([83.149.199.84]:35020 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725832AbgGOQtV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 12:49:21 -0400
X-Greylist: delayed 547 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jul 2020 12:49:20 EDT
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPS id 6827D4089F09;
        Wed, 15 Jul 2020 16:40:11 +0000 (UTC)
From:   Evgeny Novikov <novikov@ispras.ru>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Evgeny Novikov <novikov@ispras.ru>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jason Yan <yanaijie@huawei.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        ldv-project@linuxtesting.org
Subject: [PATCH] usb: gadget: net2272: skip BAR1 on error handling paths in probe
Date:   Wed, 15 Jul 2020 19:40:09 +0300
Message-Id: <20200715164009.32341-1-novikov@ispras.ru>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

net2272_rdk1_probe() skips "i == 1" (BAR1) during allocation of
resources. The patch does this on error hanling paths as well.

Found by Linux Driver Verification project (linuxtesting.org).

Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
---
 drivers/usb/gadget/udc/net2272.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/gadget/udc/net2272.c b/drivers/usb/gadget/udc/net2272.c
index 928057b206f1..639631d44b00 100644
--- a/drivers/usb/gadget/udc/net2272.c
+++ b/drivers/usb/gadget/udc/net2272.c
@@ -2370,6 +2370,8 @@ net2272_rdk1_probe(struct pci_dev *pdev, struct net2272 *dev)
 
  err:
 	while (--i >= 0) {
+		if (i == 1)
+			continue;	/* BAR1 unused */
 		iounmap(mem_mapped_addr[i]);
 		release_mem_region(pci_resource_start(pdev, i),
 			pci_resource_len(pdev, i));
-- 
2.16.4

