Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA83735368
	for <lists+linux-usb@lfdr.de>; Wed,  5 Jun 2019 01:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfFDXY6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 19:24:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727218AbfFDXYz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 4 Jun 2019 19:24:55 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B009F206C1;
        Tue,  4 Jun 2019 23:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559690694;
        bh=2A7cn2Sda4P0wHU74w42/T9BNRZ/O6FKBVZ/aM5WMm4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KmUMnPD8jyPdV+YGx/pqYttZle67jVCBHstowm4BvfqfkykTM6bhOd1mR17wKXrmk
         xAMUofwjFEFodiUaTIoBY3fIKItnuoW2tyPhJHQI29W30QpNb0yAr4C1fkmR17HShK
         Wuo85loZiMZuTPOQ1DvlovIx3ggWznlDYT0+FryQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Bernd Eckstein <3erndeckstein@gmail.com>,
        Oliver Zweigle <Oliver.Zweigle@faro.com>,
        Bernd Eckstein <3ernd.Eckstein@gmail.com>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 21/24] usbnet: ipheth: fix racing condition
Date:   Tue,  4 Jun 2019 19:24:12 -0400
Message-Id: <20190604232416.7479-21-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604232416.7479-1-sashal@kernel.org>
References: <20190604232416.7479-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Bernd Eckstein <3erndeckstein@gmail.com>

[ Upstream commit 94d250fae48e6f873d8362308f5c4d02cd1b1fd2 ]

Fix a racing condition in ipheth.c that can lead to slow performance.

Bug: In ipheth_tx(), netif_wake_queue() may be called on the callback
ipheth_sndbulk_callback(), _before_ netif_stop_queue() is called.
When this happens, the queue is stopped longer than it needs to be,
thus reducing network performance.

Fix: Move netif_stop_queue() in front of usb_submit_urb(). Now the order
is always correct. In case, usb_submit_urb() fails, the queue is woken up
again as callback will not fire.

Testing: This racing condition is usually not noticeable, as it has to
occur very frequently to slowdown the network. The callback from the USB
is usually triggered slow enough, so the situation does not appear.
However, on a Ubuntu Linux on VMWare Workstation, running on Windows 10,
the we loose the race quite often and the following speedup can be noticed:

Without this patch: Download:  4.10 Mbit/s, Upload:  4.01 Mbit/s
With this patch:    Download: 36.23 Mbit/s, Upload: 17.61 Mbit/s

Signed-off-by: Oliver Zweigle <Oliver.Zweigle@faro.com>
Signed-off-by: Bernd Eckstein <3ernd.Eckstein@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/ipheth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
index 3d8a70d3ea9b..3d71f1716390 100644
--- a/drivers/net/usb/ipheth.c
+++ b/drivers/net/usb/ipheth.c
@@ -437,17 +437,18 @@ static int ipheth_tx(struct sk_buff *skb, struct net_device *net)
 			  dev);
 	dev->tx_urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
 
+	netif_stop_queue(net);
 	retval = usb_submit_urb(dev->tx_urb, GFP_ATOMIC);
 	if (retval) {
 		dev_err(&dev->intf->dev, "%s: usb_submit_urb: %d\n",
 			__func__, retval);
 		dev->net->stats.tx_errors++;
 		dev_kfree_skb_any(skb);
+		netif_wake_queue(net);
 	} else {
 		dev->net->stats.tx_packets++;
 		dev->net->stats.tx_bytes += skb->len;
 		dev_consume_skb_any(skb);
-		netif_stop_queue(net);
 	}
 
 	return NETDEV_TX_OK;
-- 
2.20.1

