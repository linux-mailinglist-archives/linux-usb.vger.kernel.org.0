Return-Path: <linux-usb+bounces-2000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CAF7D1485
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 19:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E21F1B2150B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Oct 2023 17:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B722200BE;
	Fri, 20 Oct 2023 17:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZJdXObzp"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 182551F940
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 17:03:59 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C86D6A
	for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 10:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697821434;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PXnWK6yDEEFlU5gQ/qSZhO9jwWsn8uutZ2XsLCYTa64=;
	b=ZJdXObzpGyoxVijstktoSDwJy/QlPTVGbxaaswBG+glXTRiWFPrYQZ5bSNaJfmJKCSz8A2
	ojIYknrHaSVow/14PGBZ/n5RwFsH5cieACEgdBG+OnLRqK+X3HIJp9NQdUL+SQPfhra73F
	egqJ3zxaNBopU79dqyik/MqKlLu3MJ4=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-zqmlqNy-PSS9HttxGgST3g-1; Fri, 20 Oct 2023 13:03:53 -0400
X-MC-Unique: zqmlqNy-PSS9HttxGgST3g-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-5b837dc4d91so752049a12.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Oct 2023 10:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697821431; x=1698426231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXnWK6yDEEFlU5gQ/qSZhO9jwWsn8uutZ2XsLCYTa64=;
        b=WGdBVrOKf1hU9Er5K1kDCbMxiTBscW+6ExstFAPbO9U9TLGQn9UgJPRa52t7CEuQJp
         1kMUuKItfggSG/UEwT7DoH8j+Y+x3Oxth0Zesw2bPdBjn3x0WhlLJEJWehV4YawdAsVo
         DAOFCWQTzHTmcvSJf6Nll/6+/GoSTIpLeR1YFkrWsrlcVcCRfPOZZAswUMGaBUmCj1w7
         xKwfh7naJ6XVR/Pl02KPsTzLi/VzN/RW7s9wjgFVCz+wIveRTJPViMhjHl4tzGUN00iG
         WJpySYjLU2HiyV51rogt8+DQDoAS9z1dnDMtElHyUUs8p/LJQLXWmXXLX3uVcyH6zRJ5
         S5iw==
X-Gm-Message-State: AOJu0Yzb861dmgguDe5+kUu2Xg5jGIB0/k0Z/QJD/FmYBEv23qlwl6At
	9XXzvSlDye7LQQ1eL7AV/cDeoCf5QuL7S74axF2b3OS4if2oPc91gQRj82NjXWtVsZX7T8Lz356
	6j84PGMFeN8VcZL/kWSP2
X-Received: by 2002:a17:90b:f98:b0:27d:3e90:9ee1 with SMTP id ft24-20020a17090b0f9800b0027d3e909ee1mr2761547pjb.23.1697821431513;
        Fri, 20 Oct 2023 10:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV8u8SqB5Zdp0bgC5MrhdPqfvH5+OIPyzDIxgGi/T0fslThxyuZrH20I+BlC/7gEG2T8j8vA==
X-Received: by 2002:a17:90b:f98:b0:27d:3e90:9ee1 with SMTP id ft24-20020a17090b0f9800b0027d3e909ee1mr2761514pjb.23.1697821431106;
        Fri, 20 Oct 2023 10:03:51 -0700 (PDT)
Received: from kernel-devel.local ([240d:1a:c0d:9f00:245e:16ff:fe87:c960])
        by smtp.gmail.com with ESMTPSA id 7-20020a17090a1a0700b0027d04d05d77sm3850299pjk.8.2023.10.20.10.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 10:03:50 -0700 (PDT)
From: Shigeru Yoshida <syoshida@redhat.com>
To: steve.glendinning@shawell.net,
	UNGLinuxDriver@microchip.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shigeru Yoshida <syoshida@redhat.com>,
	syzbot+c74c24b43c9ae534f0e0@syzkaller.appspotmail.com,
	syzbot+2c97a98a5ba9ea9c23bd@syzkaller.appspotmail.com
Subject: [PATCH net] net: usb: smsc95xx: Fix uninit-value access in smsc95xx_read_reg
Date: Sat, 21 Oct 2023 02:03:44 +0900
Message-ID: <20231020170344.2450248-1-syoshida@redhat.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported the following uninit-value access issue [1]:

smsc95xx 1-1:0.0 (unnamed net_device) (uninitialized): Failed to read reg index 0x00000030: -32
smsc95xx 1-1:0.0 (unnamed net_device) (uninitialized): Error reading E2P_CMD
=====================================================
BUG: KMSAN: uninit-value in smsc95xx_reset+0x409/0x25f0 drivers/net/usb/smsc95xx.c:896
 smsc95xx_reset+0x409/0x25f0 drivers/net/usb/smsc95xx.c:896
 smsc95xx_bind+0x9bc/0x22e0 drivers/net/usb/smsc95xx.c:1131
 usbnet_probe+0x100b/0x4060 drivers/net/usb/usbnet.c:1750
 usb_probe_interface+0xc75/0x1210 drivers/usb/core/driver.c:396
 really_probe+0x506/0xf40 drivers/base/dd.c:658
 __driver_probe_device+0x2a7/0x5d0 drivers/base/dd.c:800
 driver_probe_device+0x72/0x7b0 drivers/base/dd.c:830
 __device_attach_driver+0x55a/0x8f0 drivers/base/dd.c:958
 bus_for_each_drv+0x3ff/0x620 drivers/base/bus.c:457
 __device_attach+0x3bd/0x640 drivers/base/dd.c:1030
 device_initial_probe+0x32/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3d8/0x5a0 drivers/base/bus.c:532
 device_add+0x16ae/0x1f20 drivers/base/core.c:3622
 usb_set_configuration+0x31c9/0x38c0 drivers/usb/core/message.c:2207
 usb_generic_driver_probe+0x109/0x2a0 drivers/usb/core/generic.c:238
 usb_probe_device+0x290/0x4a0 drivers/usb/core/driver.c:293
 really_probe+0x506/0xf40 drivers/base/dd.c:658
 __driver_probe_device+0x2a7/0x5d0 drivers/base/dd.c:800
 driver_probe_device+0x72/0x7b0 drivers/base/dd.c:830
 __device_attach_driver+0x55a/0x8f0 drivers/base/dd.c:958
 bus_for_each_drv+0x3ff/0x620 drivers/base/bus.c:457
 __device_attach+0x3bd/0x640 drivers/base/dd.c:1030
 device_initial_probe+0x32/0x40 drivers/base/dd.c:1079
 bus_probe_device+0x3d8/0x5a0 drivers/base/bus.c:532
 device_add+0x16ae/0x1f20 drivers/base/core.c:3622
 usb_new_device+0x15f6/0x22f0 drivers/usb/core/hub.c:2589
 hub_port_connect drivers/usb/core/hub.c:5440 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5580 [inline]
 port_event drivers/usb/core/hub.c:5740 [inline]
 hub_event+0x53bc/0x7290 drivers/usb/core/hub.c:5822
 process_one_work kernel/workqueue.c:2630 [inline]
 process_scheduled_works+0x104e/0x1e70 kernel/workqueue.c:2703
 worker_thread+0xf45/0x1490 kernel/workqueue.c:2784
 kthread+0x3e8/0x540 kernel/kthread.c:388
 ret_from_fork+0x66/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x11/0x20 arch/x86/entry/entry_64.S:304

Local variable buf.i225 created at:
 smsc95xx_read_reg drivers/net/usb/smsc95xx.c:90 [inline]
 smsc95xx_reset+0x203/0x25f0 drivers/net/usb/smsc95xx.c:892
 smsc95xx_bind+0x9bc/0x22e0 drivers/net/usb/smsc95xx.c:1131

CPU: 1 PID: 773 Comm: kworker/1:2 Not tainted 6.6.0-rc1-syzkaller-00125-ge42bebf6db29 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/04/2023
Workqueue: usb_hub_wq hub_event
=====================================================

Similar to e9c65989920f ("net: usb: smsc75xx: Fix uninit-value access in
__smsc75xx_read_reg"), this issue is caused because usbnet_read_cmd() reads
less bytes than requested (zero byte in the reproducer). In this case,
'buf' is not properly filled.

This patch fixes the issue by returning -ENODATA if usbnet_read_cmd() reads
less bytes than requested.

sysbot reported similar uninit-value access issue [2]. The root cause is
the same as mentioned above, and this patch addresses it as well.

Fixes: 2f7ca802bdae ("net: Add SMSC LAN9500 USB2.0 10/100 ethernet adapter driver")
Reported-and-tested-by: syzbot+c74c24b43c9ae534f0e0@syzkaller.appspotmail.com
Reported-and-tested-by: syzbot+2c97a98a5ba9ea9c23bd@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=c74c24b43c9ae534f0e0 [1]
Closes: https://syzkaller.appspot.com/bug?extid=2c97a98a5ba9ea9c23bd [2]
Signed-off-by: Shigeru Yoshida <syoshida@redhat.com>
---
 drivers/net/usb/smsc95xx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/smsc95xx.c b/drivers/net/usb/smsc95xx.c
index 563ecd27b93e..0c875d18e93f 100644
--- a/drivers/net/usb/smsc95xx.c
+++ b/drivers/net/usb/smsc95xx.c
@@ -95,7 +95,9 @@ static int __must_check smsc95xx_read_reg(struct usbnet *dev, u32 index,
 	ret = fn(dev, USB_VENDOR_REQUEST_READ_REGISTER, USB_DIR_IN
 		 | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
 		 0, index, &buf, 4);
-	if (ret < 0) {
+	if (ret < 4) {
+		ret = ret < 0 ? ret : -ENODATA;
+
 		if (ret != -ENODEV)
 			netdev_warn(dev->net, "Failed to read reg index 0x%08x: %d\n",
 				    index, ret);
-- 
2.41.0


