Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4B6365EC8
	for <lists+linux-usb@lfdr.de>; Tue, 20 Apr 2021 19:47:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhDTRrk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Apr 2021 13:47:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51754 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231549AbhDTRrk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Apr 2021 13:47:40 -0400
Received: from 111-240-142-99.dynamic-ip.hinet.net ([111.240.142.99] helo=localhost.localdomain)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <chris.chiu@canonical.com>)
        id 1lYuSo-00083M-3k; Tue, 20 Apr 2021 17:47:06 +0000
From:   chris.chiu@canonical.com
To:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org,
        m.v.b@runbox.com, hadess@hadess.net
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Chiu <chris.chiu@canonical.com>
Subject: [PATCH] USB: Add reset-resume quirk for WD19's Realtek Hub
Date:   Wed, 21 Apr 2021 01:46:51 +0800
Message-Id: <20210420174651.6202-1-chris.chiu@canonical.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Chris Chiu <chris.chiu@canonical.com>

Realtek Hub (0bda:5487) in Dell Dock WD19 sometimes fails to work
after the system resumes from suspend with remote wakeup enabled
device connected:
[ 1947.640907] hub 5-2.3:1.0: hub_ext_port_status failed (err = -71)
[ 1947.641208] usb 5-2.3-port5: cannot disable (err = -71)
[ 1947.641401] hub 5-2.3:1.0: hub_ext_port_status failed (err = -71)
[ 1947.641450] usb 5-2.3-port4: cannot reset (err = -71)

Information of this hub:
T:  Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 10 Spd=480  MxCh= 5
D:  Ver= 2.10 Cls=09(hub  ) Sub=00 Prot=02 MxPS=64 #Cfgs=  1
P:  Vendor=0bda ProdID=5487 Rev= 1.47
S:  Manufacturer=Dell Inc.
S:  Product=Dell dock
C:* #Ifs= 1 Cfg#= 1 Atr=e0 MxPwr=  0mA
I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=01 Driver=hub
E:  Ad=81(I) Atr=03(Int.) MxPS=   1 Ivl=256ms
I:* If#= 0 Alt= 1 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=02 Driver=hub
E:  Ad=81(I) Atr=03(Int.) MxPS=   1 Ivl=256ms

The failure results from the ETIMEDOUT by chance when turning on
the suspend feature for the specified port of the hub. The port
seems to be in an unknown state so the hub_activate during resume
fails the hub_port_status, then the hub will fail to work.

The quirky hub needs the reset-resume quirk to function correctly.

Signed-off-by: Chris Chiu <chris.chiu@canonical.com>
---
 drivers/usb/core/quirks.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/quirks.c b/drivers/usb/core/quirks.c
index 76ac5d6555ae..4e2483e34250 100644
--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -406,6 +406,7 @@ static const struct usb_device_id usb_quirk_list[] = {
 
 	/* Realtek hub in Dell WD19 (Type-C) */
 	{ USB_DEVICE(0x0bda, 0x0487), .driver_info = USB_QUIRK_NO_LPM },
+	{ USB_DEVICE(0x0bda, 0x5487), .driver_info = USB_QUIRK_RESET_RESUME },
 
 	/* Generic RTL8153 based ethernet adapters */
 	{ USB_DEVICE(0x0bda, 0x8153), .driver_info = USB_QUIRK_NO_LPM },
-- 
2.20.1

