Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091C67C3D6
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2019 15:42:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727230AbfGaNmp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Jul 2019 09:42:45 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:58854 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726907AbfGaNmo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Jul 2019 09:42:44 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id jRii2000T05gfCL01RiihM; Wed, 31 Jul 2019 15:42:42 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsosM-0001G5-KD; Wed, 31 Jul 2019 15:42:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hsosM-0004rU-JK; Wed, 31 Jul 2019 15:42:42 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] usb: wusbcore: Spelling s/disconenct/disconnect/
Date:   Wed, 31 Jul 2019 15:42:41 +0200
Message-Id: <20190731134241.18647-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/usb/wusbcore/devconnect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/wusbcore/devconnect.c b/drivers/usb/wusbcore/devconnect.c
index a93837d57d53bd04..1170f8baf6084df9 100644
--- a/drivers/usb/wusbcore/devconnect.c
+++ b/drivers/usb/wusbcore/devconnect.c
@@ -49,7 +49,7 @@
  *                              for processing a DN_Alive pong from a device.
  *
  *   wusb_handle_dn_disconnect()Called by notif.c:wusb_handle_dn() to
- *                              process a disconenct request from a
+ *                              process a disconnect request from a
  *                              device.
  *
  *   __wusb_dev_disable()       Called by rh.c:wusbhc_rh_clear_port_feat() when
-- 
2.17.1

