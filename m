Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8599D211BA6
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 07:44:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgGBFoj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 01:44:39 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:56122 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725263AbgGBFoj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jul 2020 01:44:39 -0400
Received: from fsav106.sakura.ne.jp (fsav106.sakura.ne.jp [27.133.134.233])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0625ib8t011112;
        Thu, 2 Jul 2020 14:44:37 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav106.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp);
 Thu, 02 Jul 2020 14:44:37 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav106.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0625iZnR011013
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Thu, 2 Jul 2020 14:44:36 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Andrey Konovalov <andreyknvl@google.com>,
        Oliver Neukum <oneukum@suse.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Arnd Bergmann <arnd@arndb.de>,
        USB list <linux-usb@vger.kernel.org>,
        syzbot <syzbot+854768b99f19e89d7f81@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <1590408381.2838.4.camel@suse.com>
 <4a686d9a-d09f-44f3-553c-bcf0bd8a8ea1@i-love.sakura.ne.jp>
 <082ae642-0703-6c26-39f6-d725e395ef9a@i-love.sakura.ne.jp>
 <CAAeHK+ww0YLUKGjQF5KfzoUUsdfLJdv5guUXRq4q46VfPiQubQ@mail.gmail.com>
 <27b7545e-8f41-10b8-7c02-e35a08eb1611@i-love.sakura.ne.jp>
 <CAAeHK+ww0u0G94z_Y7VXLCVTQVZ9thO0q69n+Fj3jKT6MtpPng@mail.gmail.com>
 <20200528194057.GA21709@rowland.harvard.edu>
 <CAAeHK+ySAnU03cvg1=+yHh0YK1UFO4mrv-N9FcDDMt_0AfGZSQ@mail.gmail.com>
 <20200528205807.GB21709@rowland.harvard.edu>
 <1590852311.14886.3.camel@suse.com>
 <20200530154728.GB29298@rowland.harvard.edu>
 <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
 <254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp>
 <CAAeHK+w+wBNksK_wpczad3AU4oLQRsjL_5G8p1R55Zh_FLhprg@mail.gmail.com>
 <c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp>
Message-ID: <b347b882-a986-24c6-2b37-0b1a092931b9@i-love.sakura.ne.jp>
Date:   Thu, 2 Jul 2020 14:44:35 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c85331fc-874c-6e46-a77f-0ef1dc075308@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/06/23 20:20, Tetsuo Handa wrote:
> Also, if wait_event() in wdm_flush() might fail to wake up (due to close() dependency
> problem this crash report is focusing on), wait_event_interruptible() in wdm_write() might
> also fail to wake up (unless interrupted) due to the same dependency. Then, why can't we
> wait for completion of wdm_out_callback() (with reasonable timeout) inside wdm_write() ?
> 
> I feel that wdm_flush() is so bogus (which could/should be removed).
> 

I'd like to simplify like below.

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index e3db6fbeadef..9631d1054799 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -151,7 +151,7 @@ static void wdm_out_callback(struct urb *urb)
 	kfree(desc->outbuf);
 	desc->outbuf = NULL;
 	clear_bit(WDM_IN_USE, &desc->flags);
-	wake_up(&desc->wait);
+	wake_up_all(&desc->wait);
 }
 
 static void wdm_in_callback(struct urb *urb)
@@ -426,6 +426,7 @@ static ssize_t wdm_write
 		clear_bit(WDM_IN_USE, &desc->flags);
 		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
 		rv = usb_translate_errors(rv);
+		wake_up_all(&desc->wait);
 		goto out_free_mem_pm;
 	} else {
 		dev_dbg(&desc->intf->dev, "Tx URB has been submitted index=%d\n",
@@ -434,6 +435,24 @@ static ssize_t wdm_write
 
 	usb_autopm_put_interface(desc->intf);
 	mutex_unlock(&desc->wlock);
+	if (rv >= 0 &&
+	    /*
+	     * needs both flags. We cannot do with one
+	     * because resetting it would cause a race
+	     * with write() yet we need to signal
+	     * a disconnect
+	     */
+	    wait_event_killable_timeout(desc->wait,
+					!test_bit(WDM_IN_USE, &desc->flags) ||
+					test_bit(WDM_DISCONNECTING, &desc->flags), 30 * HZ) == 0) {
+		if (mutex_lock_killable(&desc->wlock) == 0) {
+			if (!test_bit(WDM_DISCONNECTING, &desc->flags))
+				dev_err(&desc->intf->dev,
+					"Tx URB not responding index=%d\n",
+					le16_to_cpu(req->wIndex));
+			mutex_unlock(&desc->wlock);
+		}
+	}
 	return count;
 
 out_free_mem_pm:
@@ -583,30 +602,6 @@ static ssize_t wdm_read
 	return rv;
 }
 
-static int wdm_flush(struct file *file, fl_owner_t id)
-{
-	struct wdm_device *desc = file->private_data;
-
-	wait_event(desc->wait,
-			/*
-			 * needs both flags. We cannot do with one
-			 * because resetting it would cause a race
-			 * with write() yet we need to signal
-			 * a disconnect
-			 */
-			!test_bit(WDM_IN_USE, &desc->flags) ||
-			test_bit(WDM_DISCONNECTING, &desc->flags));
-
-	/* cannot dereference desc->intf if WDM_DISCONNECTING */
-	if (test_bit(WDM_DISCONNECTING, &desc->flags))
-		return -ENODEV;
-	if (desc->werr < 0)
-		dev_err(&desc->intf->dev, "Error in flush path: %d\n",
-			desc->werr);
-
-	return usb_translate_errors(desc->werr);
-}
-
 static __poll_t wdm_poll(struct file *file, struct poll_table_struct *wait)
 {
 	struct wdm_device *desc = file->private_data;
@@ -730,7 +725,6 @@ static const struct file_operations wdm_fops = {
 	.read =		wdm_read,
 	.write =	wdm_write,
 	.open =		wdm_open,
-	.flush =	wdm_flush,
 	.release =	wdm_release,
 	.poll =		wdm_poll,
 	.unlocked_ioctl = wdm_ioctl,

