Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F34F71352B8
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 06:27:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725922AbgAIF1A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 00:27:00 -0500
Received: from mgwkm02.jp.fujitsu.com ([202.219.69.169]:19228 "EHLO
        mgwkm02.jp.fujitsu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725893AbgAIF1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jan 2020 00:27:00 -0500
X-Greylist: delayed 665 seconds by postgrey-1.27 at vger.kernel.org; Thu, 09 Jan 2020 00:26:58 EST
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by mgwkm02.jp.fujitsu.com with smtp
         id 64cb_436b_62952815_1bd9_4e84_a96f_b3cf2cd28b45;
        Thu, 09 Jan 2020 14:15:45 +0900
Received: from durio.utsfd.cs.fujitsu.co.jp (durio.utsfd.cs.fujitsu.co.jp [10.24.20.112])
        by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id ED6FAAC0066
        for <linux-usb@vger.kernel.org>; Thu,  9 Jan 2020 14:15:44 +0900 (JST)
Received: by durio.utsfd.cs.fujitsu.co.jp (Postfix, from userid 1008)
        id A41131FF281; Thu,  9 Jan 2020 14:15:44 +0900 (JST)
From:   Keiya Nobuta <nobuta.keiya@fujitsu.com>
To:     gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, Keiya Nobuta <nobuta.keiya@fujitsu.com>
Subject: [PATCH] usb: core: hub: Improved device recognition on remote wakeup
Date:   Thu,  9 Jan 2020 14:14:48 +0900
Message-Id: <20200109051448.28150-1-nobuta.keiya@fujitsu.com>
X-Mailer: git-send-email 2.17.1
X-TM-AS-GCONF: 00
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If hub_activate() is called before D+ has stabilized after remote
wakeup, the following situation might occur:

         __      ___________________
        /  \    /
D+   __/    \__/

Hub  _______________________________
          |  ^   ^           ^
          |  |   |           |
Host _____v__|___|___________|______
          |  |   |           |
          |  |   |           \-- Interrupt Transfer (*3)
          |  |    \-- ClearPortFeature (*2)
          |   \-- GetPortStatus (*1)
          \-- Host detects remote wakeup

- D+ goes high, Host starts running by remote wakeup
- D+ is not stable, goes low
- Host requests GetPortStatus at (*1) and gets the following hub status:
  - Current Connect Status bit is 0
  - Connect Status Change bit is 1
- D+ stabilizes, goes high
- Host requests ClearPortFeature and thus Connect Status Change bit is
  cleared at (*2)
- After waiting 100 ms, Host starts the Interrupt Transfer at (*3)
- Since the Connect Status Change bit is 0, Hub returns NAK.

In this case, port_event() is not called in hub_event() and Host cannot
recognize device. To solve this issue, flag change_bits even if only
Connect Status Change bit is 1 when got in the first GetPortStatus.

This issue occurs rarely because it only if D+ changes during a very
short time between GetPortStatus and ClearPortFeature. However, it is
fatal if it occurs in embedded system.

Signed-off-by: Keiya Nobuta <nobuta.keiya@fujitsu.com>
---
 drivers/usb/core/hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index f229ad6..77f8eb1 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1192,6 +1192,7 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
 			 * PORT_OVER_CURRENT is not. So check for any of them.
 			 */
 			if (udev || (portstatus & USB_PORT_STAT_CONNECTION) ||
+			    (portchange & USB_PORT_STAT_C_CONNECTION) ||
 			    (portstatus & USB_PORT_STAT_OVERCURRENT) ||
 			    (portchange & USB_PORT_STAT_C_OVERCURRENT))
 				set_bit(port1, hub->change_bits);
-- 
2.7.4

