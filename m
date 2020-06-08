Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A7E71F1162
	for <lists+linux-usb@lfdr.de>; Mon,  8 Jun 2020 04:24:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgFHCYu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 7 Jun 2020 22:24:50 -0400
Received: from www262.sakura.ne.jp ([202.181.97.72]:51536 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgFHCYt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 7 Jun 2020 22:24:49 -0400
Received: from fsav301.sakura.ne.jp (fsav301.sakura.ne.jp [153.120.85.132])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 0582OjHH026162;
        Mon, 8 Jun 2020 11:24:45 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav301.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp);
 Mon, 08 Jun 2020 11:24:45 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav301.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 0582OjOH026159
        (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
        Mon, 8 Jun 2020 11:24:45 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] USB: cdc-wdm: Call wake_up_all() when clearing WDM_IN_USE
 bit.
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
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <0c43caf8-1135-1d38-cb57-9c0f84c4394d@i-love.sakura.ne.jp>
Date:   Mon, 8 Jun 2020 11:24:42 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200530154728.GB29298@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020/05/31 0:47, Alan Stern wrote:
> On Sat, May 30, 2020 at 05:25:11PM +0200, Oliver Neukum wrote:
>> Am Donnerstag, den 28.05.2020, 16:58 -0400 schrieb Alan Stern:
>>> On Thu, May 28, 2020 at 09:51:35PM +0200, Andrey Konovalov wrote:
>>
>>>>> I don't understand what the problem is.  Can you explain in more general
>>>>> terms -- nothing specific to wdm or anything like that -- what you are
>>>>> concerned about?  Is this something that could happen to any gadget
>>>>> driver?  Or any USB class device driver?  Or does it only affect
>>>>> usespace components of raw-gadget drivers?
>>>>
>>>> So, AFAIU, we have a driver whose flush() callback blocks on
>>>> wait_event(), which can only terminate when either 1) the driver
>>>> receives a particular USB response from the device or 2) the device
>>>> disconnects.
>>>
>>> This sounds like a bug in the driver.  What would it do if someone had a 
>>
>> Arguably yes. I will introduce a timeout. Unfortunately flush()
>> requires a non-interruptible sleep, as you cannot sanely return EAGAIN.
> 
> But maybe you can kill some URBs and drop some data.

You mean call usb_kill_urb() via kill_urbs() ?

As far as I tested, it seems that usb_kill_urb() sometimes fails to call
wdm_out_callback() despite the comment for usb_kill_urb() says

 * This routine cancels an in-progress request.  It is guaranteed that
 * upon return all completion handlers will have finished and the URB
 * will be totally idle and available for reuse.  These features make
 * this an ideal way to stop I/O in a disconnect() callback or close()
 * function.  If the request has not already finished or been unlinked
 * the completion handler will see urb->status == -ENOENT.

. Is something still wrong? Or just replacing

		BUG_ON(test_bit(WDM_IN_USE, &desc->flags) &&
		       !test_bit(WDM_DISCONNECTING, &desc->flags));

with

		wait_event(desc->wait, !test_bit(WDM_IN_USE, &desc->flags) ||
			   test_bit(WDM_DISCONNECTING, &desc->flags));

in the patch shown below is sufficient?

diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
index e3db6fbeadef..3e92e79ce0a0 100644
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
@@ -424,6 +424,7 @@ static ssize_t wdm_write
 	if (rv < 0) {
 		desc->outbuf = NULL;
 		clear_bit(WDM_IN_USE, &desc->flags);
+		wake_up_all(&desc->wait);
 		dev_err(&desc->intf->dev, "Tx URB error: %d\n", rv);
 		rv = usb_translate_errors(rv);
 		goto out_free_mem_pm;
@@ -587,15 +588,16 @@ static int wdm_flush(struct file *file, fl_owner_t id)
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
+	if (!wait_event_timeout(desc->wait, !test_bit(WDM_IN_USE, &desc->flags) ||
+				test_bit(WDM_DISCONNECTING, &desc->flags), 20 * HZ)) {
+		kill_urbs(desc);
+		BUG_ON(test_bit(WDM_IN_USE, &desc->flags) &&
+		       !test_bit(WDM_DISCONNECTING, &desc->flags));
+	}
 
 	/* cannot dereference desc->intf if WDM_DISCONNECTING */
 	if (test_bit(WDM_DISCONNECTING, &desc->flags))


[  208.339533] [ T5240] cdc_wdm 5-1:118.0: Error in flush path: -2
[  208.339614] [ T5224] cdc_wdm 5-1:118.0: Error in flush path: -2
[  208.339753] [ T5184] cdc_wdm 5-1:118.0: Error in flush path: -2
[  208.339811] [ T5223] cdc_wdm 5-1:118.0: Error in flush path: -2
[  208.339820] [ T5242] cdc_wdm 5-1:118.0: Error in flush path: -2
[  208.339902] [ T5222] cdc_wdm 5-1:118.0: Error in flush path: -2
[  208.339988] [ T5201] cdc_wdm 5-1:118.0: Error in flush path: -2
[  208.343226] [ T5270] udc-core: couldn't find an available UDC or it's busy
[  208.343237] [ T5270] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.343693] [ T5271] udc-core: couldn't find an available UDC or it's busy
[  208.343700] [ T5271] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.345655] [ T5273] udc-core: couldn't find an available UDC or it's busy
[  208.345863] [ T5275] udc-core: couldn't find an available UDC or it's busy
[  208.345870] [ T5275] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.345933] [ T5272] udc-core: couldn't find an available UDC or it's busy
[  208.345943] [ T5272] misc raw-gadget: fail, usb_gadget_probe_driver returned -16
[  208.345982] [ T5274] udc-core: couldn't find an available UDC or it's busy
[  208.346007] [ T5274] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.347209] [ T5276] udc-core: couldn't find an available UDC or it's busy
[  208.348035] [ T5273] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.356463] [ T5182] ------------[ cut here ]------------
[  208.356752] [ T5276] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.358439] [ T5182] kernel BUG at drivers/usb/class/cdc-wdm.c:599!
[  208.358481] [ T5182] invalid opcode: 0000 [#1] SMP KASAN
[  208.377041] [ T5271] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.378521] [ T5182] CPU: 1 PID: 5182 Comm: a.out Not tainted 5.7.0-rc5+ #22
[  208.406262] [ T5274] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.406692] [ T5182] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[  208.406703] [ T5182] RIP: 0010:wdm_flush+0x363/0x460
[  208.409106] [ T5277] udc-core: couldn't find an available UDC or it's busy
[  208.409114] [ T5277] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.411250] [ T5278] udc-core: couldn't find an available UDC or it's busy
[  208.411464] [ T5182] Code: 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 90 00 00 00 48 8b 83 90 00 00 00 a8 04 0f 85 85 fd ff ff e8 0d 28 bf fd <0f> 0b bd ed ff ff ff e9 00 fe ff ff 4c 89 e7 e8 79 73 e5 fd e9 d0
[  208.411467] [ T5182] RSP: 0018:ffff8881e8ed7df0 EFLAGS: 00010293
[  208.411470] [ T5182] RAX: 0000000000000000 RBX: ffff8881f44d5800 RCX: ffffffff837d9974
[  208.411472] [ T5182] RDX: ffff8881e734b180 RSI: ffffffff837d99a3 RDI: ffff8881f44d5890
[  208.411473] [ T5182] RBP: ffff8881f44d5890 R08: ffffed103e89ab13 R09: ffff8881f44d5897
[  208.411479] [ T5182] R10: ffffed103e89ab12 R11: ffffed103e89ab13 R12: 0000000000000000
[  208.414031] [ T5278] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.415966] [ T5182] R13: ffff8881e8ed7e18 R14: ffff8881f44d59e0 R15: ffffed103e89ab12
[  208.415973] [ T5182] FS:  00007f95f02a3440(0000) GS:ffff8881f6c40000(0000) knlGS:0000000000000000
[  208.456966] [ T5278] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.456971] [ T5277] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.456974] [ T5275] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.456988] [ T5276] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.456991] [ T5272] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.457405] [ T5273] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.457527] [ T5182] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  208.458378] [ T5279] udc-core: couldn't find an available UDC or it's busy
[  208.458384] [ T5279] misc raw-gadget: fail, usb_gadget_probe_driver returned -16
[  208.458606] [ T5280] udc-core: couldn't find an available UDC or it's busy
[  208.458611] [ T5280] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.460681] [ T5281] udc-core: couldn't find an available UDC or it's busy
[  208.460925] [ T5282] udc-core: couldn't find an available UDC or it's busy
[  208.460936] [ T5282] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.461031] [ T5283] udc-core: couldn't find an available UDC or it's busy
[  208.461037] [ T5283] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.461268] [ T5284] udc-core: couldn't find an available UDC or it's busy
[  208.461273] [ T5284] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.462427] [ T5182] CR2: 00007fb0ae7797a0 CR3: 00000001eb03d002 CR4: 00000000003606e0
[  208.462435] [ T5182] Call Trace:
[  208.462444] [ T5182]  ? wdm_poll+0x230/0x230
[  208.463320] [ T5285] udc-core: couldn't find an available UDC or it's busy
[  208.463325] [ T5285] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.464664] [ T5281] misc raw-gadget: fail, usb_gadget_probe_driver returned -16
[  208.466731] [ T5182]  ? remove_wait_queue+0x190/0x190
[  208.466737] [ T5182]  ? wdm_poll+0x230/0x230
[  208.466743] [ T5182]  filp_close+0xad/0x160
[  208.466749] [ T5182]  __close_fd+0x112/0x1d0
[  208.466755] [ T5182]  __x64_sys_close+0x67/0xc0
[  208.466762] [ T5182]  ? lockdep_hardirqs_on+0x3f1/0x5b0
[  208.466767] [ T5182]  do_syscall_64+0x9b/0x510
[  208.466774] [ T5182]  entry_SYSCALL_64_after_hwframe+0x49/0xb3
[  208.466780] [ T5182] RIP: 0033:0x7f95efdc3f30
[  208.466786] [ T5182] Code: 00 64 c7 00 0d 00 00 00 b8 ff ff ff ff eb 90 b8 ff ff ff ff eb 89 0f 1f 40 00 83 3d d9 27 2c 00 00 75 10 b8 03 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 31 c3 48 83 ec 08 e8 be 95 01 00 48 89 04 24
[  208.466791] [ T5182] RSP: 002b:00007ffc958cd6d8 EFLAGS: 00000246 ORIG_RAX: 0000000000000003
[  208.466799] [ T5182] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f95efdc3f30
[  208.476513] [ T5280] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.478577] [ T5182] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000004
[  208.478581] [ T5182] RBP: 0000000000000000 R08: 000000000000000f R09: 00007ffc958cd70e
[  208.478586] [ T5182] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
[  208.482884] [ T5286] udc-core: couldn't find an available UDC or it's busy
[  208.483534] [ T5182] R13: 000000000002daa7 R14: 0000000000000000 R15: 0000000000000000
[  208.483536] [ T5182] Modules linked in:
[  208.483635] [ T5182] ---[ end trace 6a73cddfff8988f4 ]---
[  208.485364] [ T5286] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.487479] [ T5182] RIP: 0010:wdm_flush+0x363/0x460
[  208.506707] [ T5282] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.508658] [ T5182] Code: 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 90 00 00 00 48 8b 83 90 00 00 00 a8 04 0f 85 85 fd ff ff e8 0d 28 bf fd <0f> 0b bd ed ff ff ff e9 00 fe ff ff 4c 89 e7 e8 79 73 e5 fd e9 d0
[  208.528782] [ T5287] udc-core: couldn't find an available UDC or it's busy
[  208.529695] [ T5182] RSP: 0018:ffff8881e8ed7df0 EFLAGS: 00010293
[  208.529699] [ T5182] RAX: 0000000000000000 RBX: ffff8881f44d5800 RCX: ffffffff837d9974
[  208.529701] [ T5182] RDX: ffff8881e734b180 RSI: ffffffff837d99a3 RDI: ffff8881f44d5890
[  208.529703] [ T5182] RBP: ffff8881f44d5890 R08: ffffed103e89ab13 R09: ffff8881f44d5897
[  208.529705] [ T5182] R10: ffffed103e89ab12 R11: ffffed103e89ab13 R12: 0000000000000000
[  208.529706] [ T5182] R13: ffff8881e8ed7e18 R14: ffff8881f44d59e0 R15: ffffed103e89ab12
[  208.529709] [ T5182] FS:  00007f95f02a3440(0000) GS:ffff8881f6c40000(0000) knlGS:0000000000000000
[  208.529718] [ T5182] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  208.530960] [ T5287] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.537715] [ T5182] CR2: 00007fb0ae7797a0 CR3: 00000001eb03d002 CR4: 00000000003606e0
[  208.577096] [ T5284] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.577105] [ T5281] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.577108] [ T5287] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.577111] [ T5283] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.577525] [ T5286] cdc_wdm 5-1:118.0: Error in flush path: -32
[  208.578527] [ T5288] udc-core: couldn't find an available UDC or it's busy
[  208.578533] [ T5288] misc raw-gadget: fail, usb_gadget_probe_driver returned -16
[  208.580556] [ T5291] udc-core: couldn't find an available UDC or it's busy
[  208.580644] [ T5289] udc-core: couldn't find an available UDC or it's busy
[  208.580646] [ T5290] udc-core: couldn't find an available UDC or it's busy
[  208.580652] [ T5289] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.580655] [ T5290] misc raw-gadget: fail, usb_gadget_probe_driver returned -16
[  208.580844] [ T5292] udc-core: couldn't find an available UDC or it's busy
[  208.580851] [ T5292] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.581053] [ T5293] udc-core: couldn't find an available UDC or it's busy
[  208.581058] [ T5293] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.599340] [ T5294] udc-core: couldn't find an available UDC or it's busy
[  208.599866] [ T5291] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.601707] [ T5294] misc raw-gadget: fail, usb_gadget_probe_driver returned -19
[  208.616268] [ T5289] cdc_wdm 5-1:118.0: Error in flush path: -32

