Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3382DE3A5
	for <lists+linux-usb@lfdr.de>; Fri, 18 Dec 2020 15:03:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbgLRODr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Dec 2020 09:03:47 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:52879 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725995AbgLRODr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Dec 2020 09:03:47 -0500
Received: from fsav405.sakura.ne.jp (fsav405.sakura.ne.jp [133.242.250.104])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0BIE34Dp074984;
        Fri, 18 Dec 2020 23:03:05 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav405.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav405.sakura.ne.jp);
 Fri, 18 Dec 2020 23:03:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav405.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0BIE34iX074981
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Fri, 18 Dec 2020 23:03:04 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: KASAN: use-after-free Read in service_outstanding_interrupt
To:     oneukum@suse.com
References: <000000000000994d2a05b6b49959@google.com>
Cc:     syzbot <syzbot+9e04e2df4a32fb661daf@syzkaller.appspotmail.com>,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        andreyknvl@google.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        lee.jones@linaro.org
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <7a740f5a-65f9-b1d6-1224-4938d61b74a5@i-love.sakura.ne.jp>
Date:   Fri, 18 Dec 2020 23:03:02 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <000000000000994d2a05b6b49959@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello, Oliver.

I guess that this is caused by not checking WDM_DISCONNECTING/WDM_RESETTING
before usb_submit_urb(), and below diff seems to avoid use-after-free for
the C reproducer syzbot has found.

Since service_outstanding_interrupt() is called from service_interrupt_work()
without holding desc->rlock, it is possible that kill_urbs() is called by
wdm_disconnect() when service_outstanding_interrupt() is preempted between
spin_unlock_irq(&desc->iuspin) and usb_submit_urb(), isn't it?
Therefore, we also need to make sure that kill_urbs(desc) is called after
cancel_work_sync(&desc->service_outs_intr) which waits for
service_interrupt_work() to return completed, don't we?

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
 

