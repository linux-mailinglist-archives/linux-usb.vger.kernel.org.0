Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A646614D071
	for <lists+linux-usb@lfdr.de>; Wed, 29 Jan 2020 19:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgA2S0y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jan 2020 13:26:54 -0500
Received: from mx2.suse.de ([195.135.220.15]:46012 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbgA2S0x (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Jan 2020 13:26:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 71429B1EC;
        Wed, 29 Jan 2020 18:26:52 +0000 (UTC)
From:   Davidlohr Bueso <dave@stgolabs.net>
To:     oneukum@suse.com
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dave@stgolabs.net, Davidlohr Bueso <dbueso@suse.de>
Subject: [PATCH] usbnet: optimize barrier usage for Rmw atomic bitops
Date:   Wed, 29 Jan 2020 10:16:46 -0800
Message-Id: <20200129181646.25487-1-dave@stgolabs.net>
X-Mailer: git-send-email 2.16.4
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Use smp_mb__before_atomic() instead of smp_mb() and avoid the
unnecessary barrier for non LL/SC architectures, such as x86.

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
---
 drivers/net/usb/usbnet.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 5ec97def3513..24c767350e5e 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -1912,7 +1912,7 @@ int usbnet_resume (struct usb_interface *intf)
 			}
 		}
 
-		smp_mb();
+		smp_mb__before_atomic();
 		clear_bit(EVENT_DEV_ASLEEP, &dev->flags);
 		spin_unlock_irq(&dev->txq.lock);
 
-- 
2.16.4

