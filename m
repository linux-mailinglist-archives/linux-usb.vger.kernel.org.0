Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9398540ABA
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jun 2022 20:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244348AbiFGSXk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jun 2022 14:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352066AbiFGSQx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jun 2022 14:16:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEDBE26AE7;
        Tue,  7 Jun 2022 10:50:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 69D8A6159C;
        Tue,  7 Jun 2022 17:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F3AC3411F;
        Tue,  7 Jun 2022 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654624221;
        bh=Z8ey3TR9HSAz7Jk3DAJWQVnOD8FtyqL33tzMAuZs4Lc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XkagYrZvxJNRP5hHdmAYnSUCvdRtKrN2tNqqvxyxQimgcuVkF+3wDZI8d9V6+Jb3q
         qEnSInUDMO9cDppKWo96as5+o9DVnSS31ZuXsq7mi+Cl5Gkz7X+eoeZ3TG9s8Oi2yH
         JNX8lE5+I1TDefP6bQ374l47MFldJa2NpIlXHzyW36AxVmTnJ0ScpIodpK4vxVWl/d
         no/9Zuj8wvqAr42GLe3Zr/8H59I9FrEcsZvYix0HzdHt2z3QjjWzPlJBNQdFidifIz
         Bk1M8TnXq+dWkbsKns21vc+2zLpEAVdYK0Qxp5z0SDyGYz7AA4oZgZsEOGSmC/vdAW
         CvYO0RFqFZCqg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>, hminas@synopsys.com,
        linux-usb@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 19/68] usb: dwc2: gadget: don't reset gadget's driver->bus
Date:   Tue,  7 Jun 2022 13:47:45 -0400
Message-Id: <20220607174846.477972-19-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220607174846.477972-1-sashal@kernel.org>
References: <20220607174846.477972-1-sashal@kernel.org>
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
index eee3504397e6..fe2a58c75861 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -4544,7 +4544,6 @@ static int dwc2_hsotg_udc_start(struct usb_gadget *gadget,
 
 	WARN_ON(hsotg->driver);
 
-	driver->driver.bus = NULL;
 	hsotg->driver = driver;
 	hsotg->gadget.dev.of_node = hsotg->dev->of_node;
 	hsotg->gadget.speed = USB_SPEED_UNKNOWN;
-- 
2.35.1

