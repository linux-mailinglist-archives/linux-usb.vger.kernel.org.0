Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D172118F8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 03:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728767AbgGBBaO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 21:30:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:58792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728629AbgGBB1C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 21:27:02 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BEBE820748;
        Thu,  2 Jul 2020 01:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593653221;
        bh=RuIX7iairByS9vmms37vTUc7xISPXnSus2zIBvT/u58=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Cfa7G8HfRtNo4Kzebrn9QoK2atCzOLeeUBBQevguTeuxRUQlUFXs2H0UJ1c1vdncI
         m5On+EFVJLnv4kekrmtNd8NQ1L9HiPVdA0SRoUlXgtS3cjCNRvYNWpR/KgC6tFF06J
         REQwod93vdwlCFcR5pXD3eQFnj5VjH2TN6zJELAM=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
        syzbot+29dc7d4ae19b703ff947@syzkaller.appspotmail.com,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 09/17] usbnet: smsc95xx: Fix use-after-free after removal
Date:   Wed,  1 Jul 2020 21:26:41 -0400
Message-Id: <20200702012649.2701799-9-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012649.2701799-1-sashal@kernel.org>
References: <20200702012649.2701799-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>

[ Upstream commit b835a71ef64a61383c414d6bf2896d2c0161deca ]

Syzbot reports an use-after-free in workqueue context:

BUG: KASAN: use-after-free in mutex_unlock+0x19/0x40 kernel/locking/mutex.c:737
 mutex_unlock+0x19/0x40 kernel/locking/mutex.c:737
 __smsc95xx_mdio_read drivers/net/usb/smsc95xx.c:217 [inline]
 smsc95xx_mdio_read+0x583/0x870 drivers/net/usb/smsc95xx.c:278
 check_carrier+0xd1/0x2e0 drivers/net/usb/smsc95xx.c:644
 process_one_work+0x777/0xf90 kernel/workqueue.c:2274
 worker_thread+0xa8f/0x1430 kernel/workqueue.c:2420
 kthread+0x2df/0x300 kernel/kthread.c:255

It looks like that smsc95xx_unbind() is freeing the structures that are
still in use by the concurrently running workqueue callback. Thus switch
to using cancel_delayed_work_sync() to ensure the work callback really
is no longer active.

Reported-by: syzbot+29dc7d4ae19b703ff947@syzkaller.appspotmail.com
Signed-off-by: Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/smsc95xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index fc48da1c702d7..bcb99bee450a5 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -1338,7 +1338,7 @@ static void smsc95xx_unbind(struct usbnet *dev, struct usb_interface *intf)
 	struct smsc95xx_priv *pdata = (struct smsc95xx_priv *)(dev->data[0]);
 
 	if (pdata) {
-		cancel_delayed_work(&pdata->carrier_check);
+		cancel_delayed_work_sync(&pdata->carrier_check);
 		netif_dbg(dev, ifdown, dev->net, "free pdata\n");
 		kfree(pdata);
 		pdata = NULL;
-- 
2.25.1

