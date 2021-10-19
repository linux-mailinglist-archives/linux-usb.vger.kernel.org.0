Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E444E433D39
	for <lists+linux-usb@lfdr.de>; Tue, 19 Oct 2021 19:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhJSRXn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Oct 2021 13:23:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:53500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229991AbhJSRXm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 Oct 2021 13:23:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 813ED61212;
        Tue, 19 Oct 2021 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634664089;
        bh=HXk6VKSOvsrHuAlHyvJGetOpf6OjbPzOt5lQJNfwcUY=;
        h=From:To:Cc:Subject:Date:From;
        b=ubAXN2NQR15NtHwubtu6LjIh2p04zoZFPGTrdT677PRNnB/qCMUeGdyvNgdP9wIPX
         Flf5YvySgLebz1OWRpYj3paU9QbNzfwQkw6sa5YPWiaxujiEVfGT01xvRqJBYuCmu8
         24j+z7elFVCio+JOa4V3eM/JaXn3oh3hm5zSMleazY44FkcuHflphoxttZ/Yy/Ws0L
         6NHTwWshgumUnBRgN9P/NJ8AxR2ioKOQZdEGqogAZpIYT1YM13m6JgPFzrGDHFkLnu
         PclMrqNE+uBn9YWSeHhWYbl3YgBz3kegVCLymdS4F8mdQ8sPiTfma7FXDfbCv4131l
         nsjcI3gGRqmvA==
From:   Jakub Kicinski <kuba@kernel.org>
To:     balbi@kernel.org, gregkh@linuxfoundation.org
Cc:     Jakub Kicinski <kuba@kernel.org>, lorenzo@google.com,
        manish.narani@xilinx.com, maze@google.com,
        linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: u_ether: use eth_hw_addr_set()
Date:   Tue, 19 Oct 2021 10:21:24 -0700
Message-Id: <20211019172124.1413620-1-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Commit 406f42fa0d3c ("net-next: When a bond have a massive amount
of VLANs...") introduced a rbtree for faster Ethernet address look
up. To maintain netdev->dev_addr in this tree we need to make all
the writes to it got through appropriate helpers.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: balbi@kernel.org
CC: gregkh@linuxfoundation.org
CC: lorenzo@google.com
CC: manish.narani@xilinx.com
CC: maze@google.com
CC: linux-usb@vger.kernel.org
---
 drivers/usb/gadget/function/u_ether.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 85a3f6d4b5af..e0ad5aed6ac9 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -754,6 +754,7 @@ struct eth_dev *gether_setup_name(struct usb_gadget *g,
 	struct eth_dev		*dev;
 	struct net_device	*net;
 	int			status;
+	u8			addr[ETH_ALEN];
 
 	net = alloc_etherdev(sizeof *dev);
 	if (!net)
@@ -773,9 +774,10 @@ struct eth_dev *gether_setup_name(struct usb_gadget *g,
 	dev->qmult = qmult;
 	snprintf(net->name, sizeof(net->name), "%s%%d", netname);
 
-	if (get_ether_addr(dev_addr, net->dev_addr))
+	if (get_ether_addr(dev_addr, addr))
 		dev_warn(&g->dev,
 			"using random %s ethernet address\n", "self");
+	eth_hw_addr_set(net, addr);
 	if (get_ether_addr(host_addr, dev->host_mac))
 		dev_warn(&g->dev,
 			"using random %s ethernet address\n", "host");
-- 
2.31.1

