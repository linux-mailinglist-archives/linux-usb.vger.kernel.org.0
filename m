Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DAA52DF039
	for <lists+linux-usb@lfdr.de>; Sat, 19 Dec 2020 16:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgLSP0l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Dec 2020 10:26:41 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:57836 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbgLSP0l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Dec 2020 10:26:41 -0500
Received: from fsav404.sakura.ne.jp (fsav404.sakura.ne.jp [133.242.250.103])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0BJFPwsO049958;
        Sun, 20 Dec 2020 00:25:58 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav404.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp);
 Sun, 20 Dec 2020 00:25:58 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav404.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0BJFPw3b049955
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Sun, 20 Dec 2020 00:25:58 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH] USB: cdc-wdm: Fix use after free in
 service_outstanding_interrupt().
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     oneukum@suse.com
Cc:     syzbot <syzbot+9e04e2df4a32fb661daf@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        lee.jones@linaro.org
References: <000000000000994d2a05b6b49959@google.com>
 <7a740f5a-65f9-b1d6-1224-4938d61b74a5@i-love.sakura.ne.jp>
Message-ID: <620e2ee0-b9a3-dbda-a25b-a93e0ed03ec5@i-love.sakura.ne.jp>
Date:   Sun, 20 Dec 2020 00:25:53 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7a740f5a-65f9-b1d6-1224-4938d61b74a5@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

syzbot is reporting UAF at usb_submit_urb() [1], for
service_outstanding_interrupt() is not checking WDM_DISCONNECTING
before calling usb_submit_urb(). Close the race by doing same checks
wdm_read() does upon retry.

Also, while wdm_read() checks WDM_DISCONNECTING with desc->rlock held,
service_interrupt_work() does not hold desc->rlock. Thus, it is possible
that usb_submit_urb() is called from service_outstanding_interrupt() from
service_interrupt_work() after WDM_DISCONNECTING was set and kill_urbs()
 from wdm_disconnect() completed. Thus, move kill_urbs() in
wdm_disconnect() to after cancel_work_sync() (which makes sure that
service_interrupt_work() is no longer running) completed.

Although it seems to be safe to dereference desc->intf->dev in
service_outstanding_interrupt() even if WDM_DISCONNECTING was already set
because desc->rlock or cancel_work_sync() prevents wdm_disconnect() from
reaching list_del() before service_outstanding_interrupt() completes,
let's not emit error message if WDM_DISCONNECTING is set by
wdm_disconnect() while usb_submit_urb() is in progress.

[1] https://syzkaller.appspot.com/bug?extid=9e04e2df4a32fb661daf

Reported-by: syzbot <syzbot+9e04e2df4a32fb661daf@syzkaller.appspotmail.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/usb/class/cdc-wdm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index 02d0cfd23bb2..508b1c3f8b73 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -465,13 +465,23 @@ static int service_outstanding_interrupt(struct wdm_device *desc)
 	if (!desc->resp_count || !--desc->resp_count)
 		goto out;
 
+	if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
+		rv = -ENODEV;
+		goto out;
+	}
+	if (test_bit(WDM_RESETTING, &desc->flags)) {
+		rv = -EIO;
+		goto out;
+	}
+
 	set_bit(WDM_RESPONDING, &desc->flags);
 	spin_unlock_irq(&desc->iuspin);
 	rv = usb_submit_urb(desc->response, GFP_KERNEL);
 	spin_lock_irq(&desc->iuspin);
 	if (rv) {
-		dev_err(&desc->intf->dev,
-			"usb_submit_urb failed with result %d\n", rv);
+		if (!test_bit(WDM_DISCONNECTING, &desc->flags))
+			dev_err(&desc->intf->dev,
+				"usb_submit_urb failed with result %d\n", rv);
 
 		/* make sure the next notification trigger a submit */
 		clear_bit(WDM_RESPONDING, &desc->flags);
@@ -1027,9 +1037,9 @@ static void wdm_disconnect(struct usb_interface *intf)
 	wake_up_all(&desc->wait);
 	mutex_lock(&desc->rlock);
 	mutex_lock(&desc->wlock);
-	kill_urbs(desc);
 	cancel_work_sync(&desc->rxwork);
 	cancel_work_sync(&desc->service_outs_intr);
+	kill_urbs(desc);
 	mutex_unlock(&desc->wlock);
 	mutex_unlock(&desc->rlock);
 
-- 
2.25.1


