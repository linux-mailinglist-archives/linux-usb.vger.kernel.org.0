Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF03A1FDA95
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 02:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgFRAtC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 17 Jun 2020 20:49:02 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:62634 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726899AbgFRAtC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 17 Jun 2020 20:49:02 -0400
Received: from fsav107.sakura.ne.jp (fsav107.sakura.ne.jp [27.133.134.234])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 05I0muOV073274;
        Thu, 18 Jun 2020 09:48:56 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav107.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp);
 Thu, 18 Jun 2020 09:48:56 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav107.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 05I0mtbT073269
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Thu, 18 Jun 2020 09:48:56 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Oliver Neukum <oneukum@suse.com>
Cc:     Andrey Konovalov <andreyknvl@google.com>,
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
Message-ID: <254939d4-f3a1-8c7e-94e5-9862c02774fa@i-love.sakura.ne.jp>
Date:   Thu, 18 Jun 2020 09:48:50 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/06/08 11:24, Tetsuo Handa wrote:
> As far as I tested, it seems that usb_kill_urb() sometimes fails to call
> wdm_out_callback() despite the comment for usb_kill_urb() says
> 
>  * This routine cancels an in-progress request.  It is guaranteed that
>  * upon return all completion handlers will have finished and the URB
>  * will be totally idle and available for reuse.  These features make
>  * this an ideal way to stop I/O in a disconnect() callback or close()
>  * function.  If the request has not already finished or been unlinked
>  * the completion handler will see urb->status == -ENOENT.
> 
> . Is something still wrong? Or just replacing
> 
> 		BUG_ON(test_bit(WDM_IN_USE, &desc->flags) &&
> 		       !test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> with
> 
> 		wait_event(desc->wait, !test_bit(WDM_IN_USE, &desc->flags) ||
> 			   test_bit(WDM_DISCONNECTING, &desc->flags));
> 
> in the patch shown below is sufficient?

How is the progress?

Another debug printk() patch shown below says that while wdm_flush() waits for
clearing of WDM_IN_USE using wait_event(), concurrently executed wdm_write() also
waits for clearing of WDM_IN_USE using wait_event_interruptible(), and wdm_write() can
immediately set WDM_IN_USE again as soon as returning from wait_event_interruptible()
even if somebody was already waiting at wdm_flush() to clear WDM_IN_USE.

That is, wait_event() in wdm_flush() does not know whether there is usb_submit_urb()
request which is started after wait_event() found that WDM_IN_USE was cleared. Then,
what does this wait_event() in wdm_flush() want to flush? There is no need to wait for
completion of usb_submit_urb() ?

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index e3db6fbeadef..d2c4d8b9cc18 100644
--- a/drivers/usb/class/cdc-wdm.c
+++ b/drivers/usb/class/cdc-wdm.c
@@ -82,6 +82,7 @@ struct wdm_device {
 	spinlock_t		iuspin;
 
 	unsigned long		flags;
+	atomic_t                flushers;
 	u16			bufsize;
 	u16			wMaxCommand;
 	u16			wMaxPacketSize;
@@ -151,7 +152,7 @@ static void wdm_out_callback(struct urb *urb)
 	kfree(desc->outbuf);
 	desc->outbuf = NULL;
 	clear_bit(WDM_IN_USE, &desc->flags);
-	wake_up(&desc->wait);
+	wake_up_all(&desc->wait);
 }
 
 static void wdm_in_callback(struct urb *urb)
@@ -417,6 +418,13 @@ static ssize_t wdm_write
 	req->wValue = 0;
 	req->wIndex = desc->inum; /* already converted */
 	req->wLength = cpu_to_le16(count);
+	{
+		const int flushers = atomic_read(&desc->flushers);
+		if (flushers) {
+			printk(KERN_ERR "There is %u flushers.\n", flushers);
+			BUG_ON(1);
+		}
+	}
 	set_bit(WDM_IN_USE, &desc->flags);
 	desc->outbuf = buf;
 
@@ -424,6 +432,7 @@ static ssize_t wdm_write
 	if (rv < 0) {
 		desc->outbuf = NULL;
 		clear_bit(WDM_IN_USE, &desc->flags);
+		wake_up_all(&desc->wait);
 		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
 		rv = usb_translate_errors(rv);
 		goto out_free_mem_pm;
@@ -587,15 +596,20 @@ static int wdm_flush(struct file *file, fl_owner_t id)
 {
 	struct wdm_device *desc = file->private_data;
 
-	wait_event(desc->wait,
-			/*
-			 * needs both flags. We cannot do with one
-			 * because resetting it would cause a race
-			 * with write() yet we need to signal
-			 * a disconnect
-			 */
-			!test_bit(WDM_IN_USE, &desc->flags) ||
-			test_bit(WDM_DISCONNECTING, &desc->flags));
+	/*
+	 * needs both flags. We cannot do with one because resetting it would
+	 * cause a race with write() yet we need to signal a disconnect
+	 */
+	atomic_inc(&desc->flushers);
+	if (!wait_event_timeout(desc->wait, !test_bit(WDM_IN_USE, &desc->flags) ||
+				test_bit(WDM_DISCONNECTING, &desc->flags), 20 * HZ)) {
+		atomic_dec(&desc->flushers);
+		kill_urbs(desc);
+		BUG_ON(test_bit(WDM_IN_USE, &desc->flags) &&
+		       !test_bit(WDM_DISCONNECTING, &desc->flags));
+	} else {
+		atomic_dec(&desc->flushers);
+	}
 
 	/* cannot dereference desc->intf if WDM_DISCONNECTING */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))



[  103.934085][  T118] usb 5-1: New USB device found, idVendor=2400, idProduct=4200, bcdDevice=42.ef
[  103.934093][  T118] usb 5-1: New USB device strings: Mfr=0, Product=0, SerialNumber=2
[  103.934100][  T118] usb 5-1: SerialNumber: syz
[  103.934145][ T4108] udc-core: couldn't find an available UDC or it's busy
[  103.934151][ T4108] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.934810][ T4109] udc-core: couldn't find an available UDC or it's busy
[  103.934821][ T4109] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.935385][ T4110] udc-core: couldn't find an available UDC or it's busy
[  103.935392][ T4110] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.935411][ T4106] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.938481][ T4112] udc-core: couldn't find an available UDC or it's busy
[  103.939183][ T4113] udc-core: couldn't find an available UDC or it's busy
[  103.939192][ T4113] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.939415][ T4114] udc-core: couldn't find an available UDC or it's busy
[  103.939421][ T4114] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.943069][ T4115] udc-core: couldn't find an available UDC or it's busy
[  103.943257][ T4116] udc-core: couldn't find an available UDC or it's busy
[  103.943266][ T4116] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.944118][ T4117] udc-core: couldn't find an available UDC or it's busy
[  103.944129][ T4117] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.944160][ T4118] udc-core: couldn't find an available UDC or it's busy
[  103.944169][ T4118] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.944738][ T4112] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.946715][ T4115] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.947159][ T4119] udc-core: couldn't find an available UDC or it's busy
[  103.947165][ T4119] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.947315][ T4120] udc-core: couldn't find an available UDC or it's busy
[  103.947324][ T4120] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.948093][ T4121] udc-core: couldn't find an available UDC or it's busy
[  103.948103][ T4121] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.949190][ T4122] udc-core: couldn't find an available UDC or it's busy
[  103.950070][ T4123] udc-core: couldn't find an available UDC or it's busy
[  103.950080][ T4123] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.950580][ T4124] udc-core: couldn't find an available UDC or it's busy
[  103.950587][ T4124] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.953081][ T4125] udc-core: couldn't find an available UDC or it's busy
[  103.953430][ T4126] udc-core: couldn't find an available UDC or it's busy
[  103.953437][ T4126] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.953963][ T4122] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.954780][ T4128] udc-core: couldn't find an available UDC or it's busy
[  103.954786][ T4128] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.955864][ T4129] udc-core: couldn't find an available UDC or it's busy
[  103.955872][ T4129] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.955962][ T4127] udc-core: couldn't find an available UDC or it's busy
[  103.955968][ T4127] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.956010][ T4125] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.958600][ T4130] udc-core: couldn't find an available UDC or it's busy
[  103.958962][ T4131] udc-core: couldn't find an available UDC or it's busy
[  103.958972][ T4131] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.959737][ T4132] udc-core: couldn't find an available UDC or it's busy
[  103.959749][ T4132] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.963405][ T4133] udc-core: couldn't find an available UDC or it's busy
[  103.963413][ T4133] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.964329][ T4134] udc-core: couldn't find an available UDC or it's busy
[  103.965201][ T4135] udc-core: couldn't find an available UDC or it's busy
[  103.965211][ T4135] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.965511][ T4136] udc-core: couldn't find an available UDC or it's busy
[  103.965520][ T4136] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.966011][ T4130] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.966939][ T4137] udc-core: couldn't find an available UDC or it's busy
[  103.966946][ T4137] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.967467][ T4138] udc-core: couldn't find an available UDC or it's busy
[  103.967473][ T4138] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.967909][ T4134] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.969292][ T4139] udc-core: couldn't find an available UDC or it's busy
[  103.969301][ T4139] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.969708][ T4140] udc-core: couldn't find an available UDC or it's busy
[  103.969717][ T4140] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.970343][ T4141] udc-core: couldn't find an available UDC or it's busy
[  103.973658][  T118] hub 5-1:118.0: bad descriptor, ignoring hub
[  103.974100][ T4142] udc-core: couldn't find an available UDC or it's busy
[  103.974107][ T4142] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.974518][ T4141] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.974657][ T4143] udc-core: couldn't find an available UDC or it's busy
[  103.974663][ T4143] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.975767][ T4144] udc-core: couldn't find an available UDC or it's busy
[  103.975774][ T4144] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.976777][  T118] hub: probe of 5-1:118.0 failed with error -5
[  103.977257][ T4145] udc-core: couldn't find an available UDC or it's busy
[  103.977263][ T4145] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.978020][ T4146] udc-core: couldn't find an available UDC or it's busy
[  103.978029][ T4146] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.978223][ T4148] udc-core: couldn't find an available UDC or it's busy
[  103.978229][ T4148] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.978388][ T4147] udc-core: couldn't find an available UDC or it's busy
[  103.978396][ T4147] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.980149][ T4149] udc-core: couldn't find an available UDC or it's busy
[  103.982395][ T4151] udc-core: couldn't find an available UDC or it's busy
[  103.982468][ T4152] udc-core: couldn't find an available UDC or it's busy
[  103.982478][ T4152] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.982674][ T4153] udc-core: couldn't find an available UDC or it's busy
[  103.982682][ T4153] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.982780][ T4150] udc-core: couldn't find an available UDC or it's busy
[  103.982788][ T4150] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.983634][ T4149] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.983843][  T118] cdc_wdm 5-1:118.0: cdc-wdm0: USB WDM device
[  103.984589][ T4155] udc-core: couldn't find an available UDC or it's busy
[  103.984595][ T4155] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.985615][ T4156] udc-core: couldn't find an available UDC or it's busy
[  103.985624][ T4156] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.985747][ T4151] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.985906][ T4157] udc-core: couldn't find an available UDC or it's busy
[  103.985912][ T4157] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.987838][ T4158] udc-core: couldn't find an available UDC or it's busy
[  103.987845][ T4158] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.987955][ T4159] udc-core: couldn't find an available UDC or it's busy
[  103.987962][ T4159] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.988233][ T4160] udc-core: couldn't find an available UDC or it's busy
[  103.988239][ T4160] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.989778][ T4161] udc-core: couldn't find an available UDC or it's busy
[  103.990308][ T4162] udc-core: couldn't find an available UDC or it's busy
[  103.990319][ T4162] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.991055][ T4163] udc-core: couldn't find an available UDC or it's busy
[  103.993669][ T4161] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.994007][ T4164] udc-core: couldn't find an available UDC or it's busy
[  103.994142][ T4165] udc-core: couldn't find an available UDC or it's busy
[  103.994151][ T4165] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.995212][ T4166] udc-core: couldn't find an available UDC or it's busy
[  103.995222][ T4166] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  103.996400][ T4163] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  106.505076][ T4164] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  124.793950][ T3360] cdc_wdm 5-1:118.0: Error in flush path: -2
[  124.793977][ T4165] cdc_wdm 5-1:118.0: Error in flush path: -2
[  124.793987][ T4166] cdc_wdm 5-1:118.0: Error in flush path: -2
[  124.793997][ T4164] cdc_wdm 5-1:118.0: Error in flush path: -2
[  124.794461][ T4163] cdc_wdm 5-1:118.0: Error in flush path: -2
[  124.798193][ T4168] udc-core: couldn't find an available UDC or it's busy
[  124.798218][ T4168] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  124.798292][ T4169] udc-core: couldn't find an available UDC or it's busy
[  124.798315][ T4169] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  124.798531][ T4170] udc-core: couldn't find an available UDC or it's busy
[  124.798537][ T4170] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  124.812947][ T4170] There is 2 flushers.
[  124.812973][ T4161] cdc_wdm 5-1:118.0: Error in flush path: -32
[  124.812982][ T4168] cdc_wdm 5-1:118.0: Error in flush path: -32
[  124.812987][ T4169] cdc_wdm 5-1:118.0: Error in flush path: -32
[  124.823862][ T4170] ------------[ cut here ]------------
[  124.825440][ T4170] kernel BUG at drivers/usb/class/cdc-wdm.c:425!
[  124.827049][ T4170] invalid opcode: 0000 [#1] SMP KASAN
[  124.828439][ T4170] CPU: 3 PID: 4170 Comm: a.out Not tainted 5.7.0-rc5+ #27
[  124.830192][ T4170] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[  124.833192][ T4170] RIP: 0010:wdm_write+0xce7/0xf00
[  124.834683][ T4170] Code: 8b 7c 24 20 e8 ca 16 e5 fd 48 8b 54 24 18 e9 49 fa ff ff 89 34 24 e8 a8 ca be fd 8b 34 24 48 c7 c7 40 0f 01 86 e8 b2 2e aa fd <0f> 0b 48 89 ef e8 1f 16 e5 fd e9 ba f5 ff ff 48 89 cf 48 89 54 24
[  124.839523][ T4170] RSP: 0018:ffff8881e5ff7d30 EFLAGS: 00010286
[  124.841496][ T4170] RAX: 0000000000000014 RBX: ffff8881ee647800 RCX: ffffffff81d9c9dc
[  124.843673][ T4170] RDX: 0000000000000000 RSI: ffffffff81283169 RDI: ffff8881f6ce8dec
[  124.846399][ T4170] RBP: ffff8881ee647890 R08: ffffed103ed9e292 R09: ffff8881f6cf148f
[  124.848563][ T4170] R10: ffffed103dcc8f13 R11: ffffed103ed9e292 R12: 1ffff1103cbfefac
[  124.850559][ T4170] R13: 0000000000000010 R14: ffff8881e7fb5fac R15: 0000000000000000
[  124.852875][ T4170] FS:  00007fbf56199440(0000) GS:ffff8881f6cc0000(0000) knlGS:0000000000000000
[  124.855270][ T4170] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  124.857106][ T4170] CR2: 00007fbf55bef225 CR3: 00000001e61cd002 CR4: 00000000003606e0
[  124.859118][ T4170] Call Trace:
[  124.860123][ T4170]  ? wdm_probe+0x2b0/0x2b0
[  124.861567][ T4170]  ? remove_wait_queue+0x190/0x190
[  124.862896][ T4170]  ? wdm_probe+0x2b0/0x2b0
[  124.864214][ T4170]  __vfs_write+0x76/0x100
[  124.865314][ T4170]  vfs_write+0x185/0x510
[  124.866418][ T4170]  ksys_write+0xff/0x200
[  124.867653][ T4170]  ? __ia32_sys_read+0xb0/0xb0
[  124.868851][ T4170]  ? trace_hardirqs_off_caller+0x22/0x1c0
[  124.870283][ T4170]  do_syscall_64+0x9b/0x510
[  124.871575][ T4170]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
[  124.873352][ T4170] RIP: 0033:0x7fbf55cc2469
[  124.874481][ T4170] Code: 00 f3 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ff 49 2b 00 f7 d8 64 89 01 48
[  124.879954][ T4170] RSP: 002b:00007ffdc294dd58 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
[  124.882090][ T4170] RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fbf55cc2469
[  124.884573][ T4170] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
[  124.887178][ T4170] RBP: 0000000000000000 R08: 000000000000000f R09: 00007ffdc294dd8e
[  124.889941][ T4170] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
[  124.892208][ T4170] R13: 00000000000193a4 R14: 0000000000000000 R15: 0000000000000000
[  124.894103][ T4170] Modules linked in:
[  124.895465][ T4170] ---[ end trace 2aea2ce7d52c22e0 ]---
[  124.897307][ T4170] RIP: 0010:wdm_write+0xce7/0xf00
[  124.898975][ T4170] Code: 8b 7c 24 20 e8 ca 16 e5 fd 48 8b 54 24 18 e9 49 fa ff ff 89 34 24 e8 a8 ca be fd 8b 34 24 48 c7 c7 40 0f 01 86 e8 b2 2e aa fd <0f> 0b 48 89 ef e8 1f 16 e5 fd e9 ba f5 ff ff 48 89 cf 48 89 54 24
[  124.905012][ T4170] RSP: 0018:ffff8881e5ff7d30 EFLAGS: 00010286
[  124.906793][ T4170] RAX: 0000000000000014 RBX: ffff8881ee647800 RCX: ffffffff81d9c9dc
[  124.909151][ T4170] RDX: 0000000000000000 RSI: ffffffff81283169 RDI: ffff8881f6ce8dec
[  124.911276][ T4170] RBP: ffff8881ee647890 R08: ffffed103ed9e292 R09: ffff8881f6cf148f
[  124.913784][ T4170] R10: ffffed103dcc8f13 R11: ffffed103ed9e292 R12: 1ffff1103cbfefac
[  124.916882][ T4170] R13: 0000000000000010 R14: ffff8881e7fb5fac R15: 0000000000000000
[  124.919078][ T4170] FS:  00007fbf56199440(0000) GS:ffff8881f6cc0000(0000) knlGS:0000000000000000
[  124.921484][ T4170] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  124.923337][ T4170] CR2: 00007fbf55bef225 CR3: 00000001e61cd002 CR4: 00000000003606e0
[  124.925606][ T4170] cdc_wdm 5-1:118.0: Error in flush path: -32

