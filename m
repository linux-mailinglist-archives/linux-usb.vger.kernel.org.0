Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E7940641C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Sep 2021 02:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhIJAmR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Sep 2021 20:42:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234059AbhIJAZR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Sep 2021 20:25:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26E1760FDA;
        Fri, 10 Sep 2021 00:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631233447;
        bh=89qAxeF7d8EcRMdisVdxfZqjiiryQiuZO4RWpQGxMoM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ej/jjonCYY/SQ2rHS8Ag4K0RlWf9d0Bd4Dt+9uBc3nMIAk9bC8XcePq6NdXcAGBg1
         6XE8evMMLBh5RxbK7ZLdQuNe6mDLbvfygdCr8Nx+fizqV0raPA0mopSEiEZd23gGON
         NjNdPAUAMDA/sWUZKi7Bi7SXWJEvcxg/UsIEzT8d7bE78W9wtQSBHLbt5YlirCHkgg
         USxbdIjdhKtdpRbFV+Ox2SGobrfV0HKZ6u+MGEiIO6hJasLtKc8gNg5fgidGOwSP2f
         HMp6EoDTyPoRl6xIXD0NOtszqZaFB/6LKPcf3AnIYWbN6wNy0kyCFFifQGvFaOAZaJ
         WOKMB5ZYQ37yQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Anirudh Rayabharam <mail@anirudhrb.com>,
        syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com,
        Jiri Kosina <jkosina@suse.cz>, Sasha Levin <sashal@kernel.org>,
        linux-usb@vger.kernel.org, linux-input@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 02/14] HID: usbhid: free raw_report buffers in usbhid_stop
Date:   Thu,  9 Sep 2021 20:23:51 -0400
Message-Id: <20210910002403.176887-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002403.176887-1-sashal@kernel.org>
References: <20210910002403.176887-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Anirudh Rayabharam <mail@anirudhrb.com>

[ Upstream commit f7744fa16b96da57187dc8e5634152d3b63d72de ]

Free the unsent raw_report buffers when the device is removed.

Fixes a memory leak reported by syzbot at:
https://syzkaller.appspot.com/bug?id=7b4fa7cb1a7c2d3342a2a8a6c53371c8c418ab47

Reported-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
Tested-by: syzbot+47b26cd837ececfc666d@syzkaller.appspotmail.com
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
Signed-off-by: Jiri Kosina <jkosina@suse.cz>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hid/usbhid/hid-core.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index d51fc2be0e10..c7da6ec4d923 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -500,7 +500,7 @@ static void hid_ctrl(struct urb *urb)
 
 	if (unplug) {
 		usbhid->ctrltail = usbhid->ctrlhead;
-	} else {
+	} else if (usbhid->ctrlhead != usbhid->ctrltail) {
 		usbhid->ctrltail = (usbhid->ctrltail + 1) & (HID_CONTROL_FIFO_SIZE - 1);
 
 		if (usbhid->ctrlhead != usbhid->ctrltail &&
@@ -1185,9 +1185,20 @@ static void usbhid_stop(struct hid_device *hid)
 		usbhid->intf->needs_remote_wakeup = 0;
 
 	clear_bit(HID_STARTED, &usbhid->iofl);
+
 	spin_lock_irq(&usbhid->lock);	/* Sync with error and led handlers */
 	set_bit(HID_DISCONNECTED, &usbhid->iofl);
+	while (usbhid->ctrltail != usbhid->ctrlhead) {
+		if (usbhid->ctrl[usbhid->ctrltail].dir == USB_DIR_OUT) {
+			kfree(usbhid->ctrl[usbhid->ctrltail].raw_report);
+			usbhid->ctrl[usbhid->ctrltail].raw_report = NULL;
+		}
+
+		usbhid->ctrltail = (usbhid->ctrltail + 1) &
+			(HID_CONTROL_FIFO_SIZE - 1);
+	}
 	spin_unlock_irq(&usbhid->lock);
+
 	usb_kill_urb(usbhid->urbin);
 	usb_kill_urb(usbhid->urbout);
 	usb_kill_urb(usbhid->urbctrl);
-- 
2.30.2

