Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E382119D2C
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2019 14:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbfEJMYk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 May 2019 08:24:40 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:14523 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727071AbfEJMYj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 May 2019 08:24:39 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cd56d600000>; Fri, 10 May 2019 05:24:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 10 May 2019 05:24:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 10 May 2019 05:24:37 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 10 May
 2019 12:24:37 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 10 May 2019 12:24:37 +0000
Received: from jilin-desktop.nvidia.com (Not Verified[10.19.120.147]) by hqnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5cd56d830000>; Fri, 10 May 2019 05:24:37 -0700
From:   Jim Lin <jilin@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <mathias.nyman@intel.com>,
        <stern@rowland.harvard.edu>, <kai.heng.feng@canonical.com>,
        <drinkcat@chromium.org>, <keescook@chromium.org>,
        <nsaenzjulienne@suse.de>, <jflat@chromium.org>, <malat@debian.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jim Lin <jilin@nvidia.com>
Subject: [PATCH v9 1/2] usb: hub : Add devaddr in struct usb_device
Date:   Fri, 10 May 2019 20:24:29 +0800
Message-ID: <1557491070-24715-2-git-send-email-jilin@nvidia.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1557491070-24715-1-git-send-email-jilin@nvidia.com>
References: <1557491070-24715-1-git-send-email-jilin@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1557491040; bh=SkELTXba1xxG9U2KUe+7F2x6XXpE2vOxSmsWLd9awc8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=D4RlhVzAVz1YKGjqUTngXo48maFUNZWR/G4y7V5USxhN2SROp6RdYZ5fHvDVg7ZFg
         PiV4Iml8LOJKfSESU0Wzxo9PeO6emlO8mR3Os8WCZybd86npZEclr98u7qfkwozOAt
         5HojGywvDSwKs/nD/Znc4iQhP1+cnGmczfuhbf2evQQ+WCjhdu0iq2PS7SB7/cqkRp
         28QB2CqTr5aogl7sjb0Zqc+8KsH2bdl1PMISzvbjBnothh9m1NMqasnDe7WoNtSS4x
         BWiLAeJg0T/SX+ygs/rhBADCtSGAubNDbfK/xqKA+xRRI/2hYcR2qUGhJmVNYjLYNQ
         PdHW6ZLkUB60A==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The Clear_TT_Buffer request sent to the hub includes the address of
the LS/FS child device in wValue field. usb_hub_clear_tt_buffer()
uses udev->devnum to set the address wValue. This won't work for
devices connected to xHC.

For other host controllers udev->devnum is the same as the address of
the usb device, chosen and set by usb core. With xHC the controller
hardware assigns the address, and won't be the same as devnum.

Here we add devaddr in "struct usb_device" for
usb_hub_clear_tt_buffer() to use.

Signed-off-by: Jim Lin <jilin@nvidia.com>
---
v2: xhci_clear_tt_buffer_complete: add static, shorter indentation
    , remove its claiming in xhci.h
v3: Add description for clearing_tt (xhci.h)
v4: Remove clearing_tt flag because hub_tt_work has hub->tt.lock
    to protect for Clear_TT_Buffer to be run serially.
    Remove xhci_clear_tt_buffer_complete as it's not necessary.
    Same reason as the above.
    Extend usb_hub_clear_tt_buffer parameter
v5: Not extending usb_hub_clear_tt_buffer parameter
    Add description.
v6: Remove unused parameter slot_id from xhci_clear_hub_tt_buffer
v7: Add devaddr field in "struct usb_device"
v8: split as two patches, change type from int to u8 for devaddr.
v9: Use pahole to find place to put devaddr in struct usb_device.
    Remove space between type cast and variable.
    hub.c changed from v8
    clear->devinfo |= (u16) (udev->devaddr << 4);
    to 
    clear->devinfo |= ((u16)udev->devaddr) << 4;
    to solve a problem if devaddr is larger than 16.


 drivers/usb/core/hub.c | 4 +++-
 include/linux/usb.h    | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 15a2934dc29d..0d4b289be103 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -873,7 +873,7 @@ int usb_hub_clear_tt_buffer(struct urb *urb)
 	/* info that CLEAR_TT_BUFFER needs */
 	clear->tt = tt->multi ? udev->ttport : 1;
 	clear->devinfo = usb_pipeendpoint (pipe);
-	clear->devinfo |= udev->devnum << 4;
+	clear->devinfo |= ((u16)udev->devaddr) << 4;
 	clear->devinfo |= usb_pipecontrol(pipe)
 			? (USB_ENDPOINT_XFER_CONTROL << 11)
 			: (USB_ENDPOINT_XFER_BULK << 11);
@@ -2125,6 +2125,8 @@ static void update_devnum(struct usb_device *udev, int devnum)
 	/* The address for a WUSB device is managed by wusbcore. */
 	if (!udev->wusb)
 		udev->devnum = devnum;
+	if (!udev->devaddr)
+		udev->devaddr = (u8)devnum;
 }
 
 static void hub_free_dev(struct usb_device *udev)
diff --git a/include/linux/usb.h b/include/linux/usb.h
index 4229eb74bd2c..5641965e44a1 100644
--- a/include/linux/usb.h
+++ b/include/linux/usb.h
@@ -566,6 +566,7 @@ struct usb3_lpm_parameters {
  * @tt: Transaction Translator info; used with low/full speed dev, highspeed hub
  * @ttport: device port on that tt hub
  * @toggle: one bit for each endpoint, with ([0] = IN, [1] = OUT) endpoints
+ * @devaddr: device address, XHCI: assigned by HW, others: same as devnum
  * @parent: our hub, unless we're the root
  * @bus: bus we're part of
  * @ep0: endpoint 0 data (default control pipe)
@@ -643,6 +644,7 @@ struct usb_device {
 	int		ttport;
 
 	unsigned int toggle[2];
+	u8 devaddr;
 
 	struct usb_device *parent;
 	struct usb_bus *bus;
-- 
2.1.4

