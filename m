Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B64540D6E
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 20:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347345AbiFGSsL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 14:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347044AbiFGSrf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 14:47:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4312B4A3E3;
        Tue,  7 Jun 2022 11:02:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 604C9618E1;
        Tue,  7 Jun 2022 18:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC02AC36AFE;
        Tue,  7 Jun 2022 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654624970;
        bh=AQJUPapWjuLINSh4e/xYgsJ69ZfH1rTid70rZGLesfg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oS+HyF7J2KDr5nNRPnqY7IPtlhtBcu+gtT1ITlPWaBDqqiWY3T0lMIE4q7BykyU1n
         nQjLjPNe54wFLRiteAtsWqCGSPHcZ2hJ2s6YbxR1kZCpIlyM19LxvrhmaPVgz1L6XV
         vCKH3rCc24mPGc5VKtcX1+U44x9+aNjstAVEhj60PYNI9jdcQ5cG9xE8hn360cOy1e
         J8kr61DV9H4/hybVSUfNUZFaBJ26OThRT/1zQVL7B2kyRScb98I91ke7oCtcszqg6f
         t8aSE+JZkP1WecqErKKBZxKVq3goK8CwcktbNTEaSTISwHGj6d5xTo9STLv0B4BSqq
         P+wu9I7vgMv7A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, hminas@synopsys.com,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 10/25] usb: dwc2: gadget: don't reset gadget's driver->bus
Date:   Tue,  7 Jun 2022 14:02:11 -0400
Message-Id: <20220607180229.482040-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607180229.482040-1-sashal@kernel.org>
References: <20220607180229.482040-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit 3120aac6d0ecd9accf56894aeac0e265f74d3d5a ]

UDC driver should not touch gadget's driver internals, especially it
should not reset driver->bus. This wasn't harmful so far, but since
commit fc274c1e9973 ("USB: gadget: Add a new bus for gadgets") gadget
subsystem got it's own bus and messing with ->bus triggers the
following NULL pointer dereference:

dwc2 12480000.hsotg: bound driver g_ether
8<--- cut here ---
Unable to handle kernel NULL pointer dereference at virtual address 00000000
[00000000] *pgd=00000000
Internal error: Oops: 5 [#1] SMP ARM
Modules linked in: ...
CPU: 0 PID: 620 Comm: modprobe Not tainted 5.18.0-rc5-next-20220504 #11862
Hardware name: Samsung Exynos (Flattened Device Tree)
PC is at module_add_driver+0x44/0xe8
LR is at sysfs_do_create_link_sd+0x84/0xe0
...
Process modprobe (pid: 620, stack limit = 0x(ptrval))
...
 module_add_driver from bus_add_driver+0xf4/0x1e4
 bus_add_driver from driver_register+0x78/0x10c
 driver_register from usb_gadget_register_driver_owner+0x40/0xb4
 usb_gadget_register_driver_owner from do_one_initcall+0x44/0x1e0
 do_one_initcall from do_init_module+0x44/0x1c8
 do_init_module from load_module+0x19b8/0x1b9c
 load_module from sys_finit_module+0xdc/0xfc
 sys_finit_module from ret_fast_syscall+0x0/0x54
Exception stack(0xf1771fa8 to 0xf1771ff0)
...
dwc2 12480000.hsotg: new device is high-speed
---[ end trace 0000000000000000 ]---

Fix this by removing driver->bus entry reset.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/r/20220505104618.22729-1-m.szyprowski@samsung.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/dwc2/gadget.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index dddc5d02b552..14f907cf71a3 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4302,7 +4302,6 @@ static int dwc2_hsotg_udc_start(struct usb_gadget *gadget,
 
 	WARN_ON(hsotg->driver);
 
-	driver->driver.bus = NULL;
 	hsotg->driver = driver;
 	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-- 
2.35.1

