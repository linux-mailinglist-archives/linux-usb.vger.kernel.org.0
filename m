Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5989D2118E4
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 03:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbgGBB3a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 21:29:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:59106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729427AbgGBB1R (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 21:27:17 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ACC3C2083E;
        Thu,  2 Jul 2020 01:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593653236;
        bh=Qxq0x4f/Ohc7tuomfAoYtbvko6bmA3BVpIifCaAKF70=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Eq0qYRVsefEAezDn6tlB5spTaEsNGGdV6RDgrEEULDepjwIOJ+z3vFmaum/xbbMwY
         4uze/S+Twvlqpabst7eWXMtYvJlDLq3yuduqgVERqbgqbhkQ1uGfTs2OvWnbVO2VA1
         92m5c/kbliBSG4sieA0VBf9lAcGrPWsUhTW3bZGk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zqiang <qiang.zhang@windriver.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Kyungtae Kim <kt0755@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 03/13] usb: usbtest: fix missing kfree(dev->buf) in usbtest_disconnect
Date:   Wed,  1 Jul 2020 21:27:02 -0400
Message-Id: <20200702012712.2701986-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200702012712.2701986-1-sashal@kernel.org>
References: <20200702012712.2701986-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Zqiang <qiang.zhang@windriver.com>

[ Upstream commit 28ebeb8db77035e058a510ce9bd17c2b9a009dba ]

BUG: memory leak
unreferenced object 0xffff888055046e00 (size 256):
  comm "kworker/2:9", pid 2570, jiffies 4294942129 (age 1095.500s)
  hex dump (first 32 bytes):
    00 70 04 55 80 88 ff ff 18 bb 5a 81 ff ff ff ff  .p.U......Z.....
    f5 96 78 81 ff ff ff ff 37 de 8e 81 ff ff ff ff  ..x.....7.......
  backtrace:
    [<00000000d121dccf>] kmemleak_alloc_recursive
include/linux/kmemleak.h:43 [inline]
    [<00000000d121dccf>] slab_post_alloc_hook mm/slab.h:586 [inline]
    [<00000000d121dccf>] slab_alloc_node mm/slub.c:2786 [inline]
    [<00000000d121dccf>] slab_alloc mm/slub.c:2794 [inline]
    [<00000000d121dccf>] kmem_cache_alloc_trace+0x15e/0x2d0 mm/slub.c:2811
    [<000000005c3c3381>] kmalloc include/linux/slab.h:555 [inline]
    [<000000005c3c3381>] usbtest_probe+0x286/0x19d0
drivers/usb/misc/usbtest.c:2790
    [<000000001cec6910>] usb_probe_interface+0x2bd/0x870
drivers/usb/core/driver.c:361
    [<000000007806c118>] really_probe+0x48d/0x8f0 drivers/base/dd.c:551
    [<00000000a3308c3e>] driver_probe_device+0xfc/0x2a0 drivers/base/dd.c:724
    [<000000003ef66004>] __device_attach_driver+0x1b6/0x240
drivers/base/dd.c:831
    [<00000000eee53e97>] bus_for_each_drv+0x14e/0x1e0 drivers/base/bus.c:431
    [<00000000bb0648d0>] __device_attach+0x1f9/0x350 drivers/base/dd.c:897
    [<00000000838b324a>] device_initial_probe+0x1a/0x20 drivers/base/dd.c:944
    [<0000000030d501c1>] bus_probe_device+0x1e1/0x280 drivers/base/bus.c:491
    [<000000005bd7adef>] device_add+0x131d/0x1c40 drivers/base/core.c:2504
    [<00000000a0937814>] usb_set_configuration+0xe84/0x1ab0
drivers/usb/core/message.c:2030
    [<00000000e3934741>] generic_probe+0x6a/0xe0 drivers/usb/core/generic.c:210
    [<0000000098ade0f1>] usb_probe_device+0x90/0xd0
drivers/usb/core/driver.c:266
    [<000000007806c118>] really_probe+0x48d/0x8f0 drivers/base/dd.c:551
    [<00000000a3308c3e>] driver_probe_device+0xfc/0x2a0 drivers/base/dd.c:724

Acked-by: Alan Stern <stern@rowland.harvard.edu>
Reported-by: Kyungtae Kim <kt0755@gmail.com>
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
Link: https://lore.kernel.org/r/20200612035210.20494-1-qiang.zhang@windriver.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/misc/usbtest.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index e31f72b3a22c5..54b8e8645e0bb 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -2771,6 +2771,7 @@ static void usbtest_disconnect(struct usb_interface *intf)
 
 	usb_set_intfdata(intf, NULL);
 	dev_dbg(&intf->dev, "disconnect\n");
+	kfree(dev->buf);
 	kfree(dev);
 }
 
-- 
2.25.1

