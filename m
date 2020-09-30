Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D83527EB51
	for <lists+linux-usb@lfdr.de>; Wed, 30 Sep 2020 16:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730653AbgI3Ost (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 30 Sep 2020 10:48:49 -0400
Received: from smtp09.smtpout.orange.fr ([80.12.242.131]:23166 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730586AbgI3Ost (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 30 Sep 2020 10:48:49 -0400
Received: from tomoyo.flets-east.jp ([153.230.197.127])
        by mwinf5d69 with ME
        id aEoZ2300H2lQRaH03EohP6; Wed, 30 Sep 2020 16:48:47 +0200
X-ME-Helo: tomoyo.flets-east.jp
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Wed, 30 Sep 2020 16:48:47 +0200
X-ME-IP: 153.230.197.127
From:   Vincent Mailhol <mailhol.vincent@wanadoo.fr>
To:     linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-can@vger.kernel.org, Wolfgang Grandegger <wg@grandegger.com>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arunachalam Santhanam <arunachalam.santhanam@in.bosch.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-usb@vger.kernel.org (open list:USB ACM DRIVER)
Subject: [PATCH v2 1/6] can: dev: can_get_echo_skb(): prevent call to kfree_skb() in hard IRQ context
Date:   Wed, 30 Sep 2020 23:45:28 +0900
Message-Id: <20200930144602.10290-2-mailhol.vincent@wanadoo.fr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200926175810.278529-1-mailhol.vincent@wanadoo.fr>
References: <20200926175810.278529-1-mailhol.vincent@wanadoo.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If a driver calls can_get_echo_skb() during a hardware IRQ (which is
often, but not always, the case), the 'WARN_ON(in_irq)' in
net/core/skbuff.c#skb_release_head_state() might be triggered, under
network congestion circumstances, together with the potential risk of
a NULL pointer dereference.

The root cause of this issue is the call to kfree_skb() instead of
dev_kfree_skb_irq() in net/core/dev.c#enqueue_to_backlog().

This patch prevents the skb to be freed within the call to netif_rx()
by incrementing its reference count with skb_get(). The skb is finally
freed by one of the in-irq-context safe functions:
dev_consume_skb_any() or dev_kfree_skb_any().  The "any" version is
used because some drivers might call can_get_echo_skb() in a normal
context.

The reason for this issue to occur is that initially, in the core
network stack, loopback skb were not supposed to be received in
hardware IRQ context. The CAN stack is an exeption.

This bug was previously reported back in 2017 in [1] but the proposed
patch never got accepted.

While [1] directly modifies net/core/dev.c, we try to propose here a
smoother modification local to CAN network stack (the assumption
behind is that only CAN devices are affected by this issue).

[1] https://patchwork.ozlabs.org/patch/835236/

Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
---
 drivers/net/can/dev.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/dev.c b/drivers/net/can/dev.c
index 68834a2853c9..e291fda395a0 100644
--- a/drivers/net/can/dev.c
+++ b/drivers/net/can/dev.c
@@ -512,7 +512,11 @@ unsigned int can_get_echo_skb(struct net_device *dev, unsigned int idx)
 	if (!skb)
 		return 0;
 
-	netif_rx(skb);
+	skb_get(skb);
+	if (netif_rx(skb) == NET_RX_SUCCESS)
+		dev_consume_skb_any(skb);
+	else
+		dev_kfree_skb_any(skb);
 
 	return len;
 }
-- 
2.26.2

