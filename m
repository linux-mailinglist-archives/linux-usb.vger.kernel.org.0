Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C125C464468
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 02:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346037AbhLABJW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 20:09:22 -0500
Received: from esa1.mentor.iphmx.com ([68.232.129.153]:39188 "EHLO
        esa1.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346186AbhLABIx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 20:08:53 -0500
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Tue, 30 Nov 2021 20:08:53 EST
IronPort-SDR: sUsWnaFyeYZ3/Zuyg6ybdrYg8DL2y2xBeWHTtkjsmvv246khNJ7nfRTlrHJJHGN1vS5eGU7823
 v8RTX5c6V0neVD+DrOqcH1ezSIW5TKaDiQpeAxk9mF17SA+9slGaSYXZb+irHPREth/J8uFul3
 edN77dXVdJWmohMBQhQSyN01Q8Pqz2+5aOnzBEk157pIQKdMylygBrMVm9TxpYR/zhz6hzOByw
 B26fRcbVV2KbOzbnrFx3ZwcS/aEkufH7RuSzuk7GXByqwu5yU5DPOl5e7BkSlT6asDy2Hfaszo
 8kVLcbPs+CAOzx4D/OpjgjKV
X-IronPort-AV: E=Sophos;i="5.87,277,1631606400"; 
   d="scan'208";a="71611758"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 30 Nov 2021 16:58:23 -0800
IronPort-SDR: kaC1UpZo/S4GTz4vqvORKmEiqVhgwb2n+DkOGu9Xe3sP52eoGn/NOo6ylTRjkbQBoxXpwXOHqS
 8k6Law+Qbn/YggvrNbmhrFX0hvWvqIWrBp6yqLdyv78I2+pO9tTJMYBMd6bgQcTbAo2/kUit5y
 LmrgFVZA24pXCJlWy9+0S2PmiFMnuwJ9gaICEYI6B9GnEmI56F0N9Sh0zfJv34c2L5hmg7+HVa
 8hxR/9r31kfmzatsAJ0jnKwxP2/nw3nRUqHdLJIQvf5L1jYOFQ5CCErLvNIiisb+ZtioJk/9Kf
 aJ8=
From:   Sanjeev Chugh <sanjeev_chugh@mentor.com>
To:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>
CC:     <sanjeev_chugh@mentor.com>
Subject: [PATCH V1 1/1] usb: hub: introduce delay after usb hub mutex release
Date:   Wed, 1 Dec 2021 06:28:08 +0530
Message-ID: <1638320288-6465-1-git-send-email-sanjeev_chugh@mentor.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Rogue usb sticks can cause endless port connect change events
due to unstable electric connection between usb chip and
the port. Port connect change will cause device enumeration for
the new device connection and new device processing is done with
the usb hub mutex acquired. This can cause very short time gap
between unlock/lock of hub device mutex. So if some thread is
running at low priority than hub_thread, it can face hub device
mutex starvation.

This commit introduces a sleep of 25ms after the hub device mutex is
unlocked in hub_events so that if hub_thread is stuck in a
endless loop, all other threads will get fair amount of chance
to acquire the usb hub mutex.

Signed-off-by: Sanjeev Chugh <sanjeev_chugh@mentor.com>
---
 drivers/usb/core/hub.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 00070a8..0be2acc 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -5763,6 +5763,17 @@ static void hub_event(struct work_struct *work)
 out_hdev_lock:
 	usb_unlock_device(hdev);
 
+	/*
+	 * Rogue usb sticks can cause endless device connection
+	 * events due to unstable electric connection. This
+	 * can cause very short time gap between unlock/lock
+	 * of hub device mutex thus causing mutex starvation
+	 * for some other lower priority thread. Thus sleep
+	 * would give fair chance to all other threads to
+	 * acquire the usb hub mutex.
+	 */
+	msleep(25);
+
 	/* Balance the stuff in kick_hub_wq() and allow autosuspend */
 	usb_autopm_put_interface(intf);
 	kref_put(&hub->kref, hub_release);
-- 
2.7.4

