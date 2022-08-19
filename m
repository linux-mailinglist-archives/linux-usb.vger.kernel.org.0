Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9ED59A5C7
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 20:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350645AbiHSSqc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 14:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350407AbiHSSqb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 14:46:31 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id DD95D4BA6E
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 11:46:29 -0700 (PDT)
Received: (qmail 235846 invoked by uid 1000); 19 Aug 2022 14:46:28 -0400
Date:   Fri, 19 Aug 2022 14:46:28 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Fedor Pchelkin <pchelkin@ispras.ru>
Cc:     Alexey Khoroshilov <khoroshilov@ispras.ru>,
        ath9k-devel@qca.qualcomm.com, ldv-project@linuxtesting.org,
        eli.billauer@gmail.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        andreyknvl@google.com, gustavoars@kernel.org,
        ingrassia@epigenesys.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
        oneukum@suse.com, tiwai@suse.de, syzkaller-bugs@googlegroups.com
Subject: Re: WARNING in hif_usb_alloc_rx_urbs/usb_submit_urb
Message-ID: <Yv/ahFW577q5woup@rowland.harvard.edu>
References: <09fbc5ed-d67e-8308-1e49-2de6f2cea7dd@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09fbc5ed-d67e-8308-1e49-2de6f2cea7dd@ispras.ru>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 19, 2022 at 09:34:44PM +0300, Fedor Pchelkin wrote:
> Hi Alan,
> 
> Fri, 9 Oct 2020 at 21:55:51 UTC+3, Alan Stern wrote:
> > To the ath9k_htc maintainers:
> > This is an attempt to fix a bug detected by the syzbot fuzzer. The bug
> > arises when a USB device claims to be an ATH9K but doesn't have the
> > expected endpoints. (In this case there was a bulk endpoint where the
> > driver expected an interrupt endpoint.) The kernel needs to be able to
> > handle such devices without getting an internal error.
> 
> We are facing the similar warnings [1] in
> hif_usb_alloc_rx_urbs/usb_submit_urb:
> 
> usb 1-1: ath9k_htc: Firmware ath9k_htc/htc_9271-1.4.0.fw requested
> usb 1-1: ath9k_htc: Transferred FW: ath9k_htc/htc_9271-1.4.0.fw, size: 51008
> ------------[ cut here ]------------
> usb 1-1: BOGUS urb xfer, pipe 3 != type 1
> WARNING: CPU: 3 PID: 500 at drivers/usb/core/urb.c:493
> usb_submit_urb+0xce2/0x1430 drivers/usb/core/urb.c:493
> Modules linked in:
> CPU: 3 PID: 500 Comm: kworker/3:2 Not tainted 5.10.135-syzkaller #0
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1
> 04/01/2014
> Workqueue: events request_firmware_work_func
> RIP: 0010:usb_submit_urb+0xce2/0x1430 drivers/usb/core/urb.c:493
> Code: 84 d4 02 00 00 e8 0e 00 80 fc 4c 89 ef e8 06 2d 35 ff 41 89 d8 44 89
> e1 4c 89 f2 48 89 c6 48 c7 c7 c0 f0 a8 88 e8 0e a6 b9 02 <0f> 0b e9 c6 f8 ff
> ff e8 e2 ff 7f fc 48 81 c5 88 06 00 00 e9 f2 f7
> RSP: 0018:ffff888147227b60 EFLAGS: 00010282
> RAX: 0000000000000000 RBX: 0000000000000001 RCX: 0000000000000000
> RDX: ffff888147218000 RSI: ffffffff815909c5 RDI: ffffed1028e44f5e
> RBP: ffff888021509850 R08: 0000000000000001 R09: ffff888237d38ba7
> R10: 0000000000000000 R11: 0000000000000001 R12: 0000000000000003
> R13: ffff888021a330a0 R14: ffff88800f82b5a0 R15: ffff88801466a900
> FS:  0000000000000000(0000) GS:ffff888237d00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055b2994526c8 CR3: 000000001e730000 CR4: 0000000000350ee0
> Call Trace:
>  ath9k_hif_usb_alloc_rx_urbs drivers/net/wireless/ath/ath9k/hif_usb.c:908
> [inline]
>  ath9k_hif_usb_alloc_urbs+0x75e/0x1010
> drivers/net/wireless/ath/ath9k/hif_usb.c:1019
>  ath9k_hif_usb_dev_init drivers/net/wireless/ath/ath9k/hif_usb.c:1109
> [inline]
>  ath9k_hif_usb_firmware_cb+0x142/0x530
> drivers/net/wireless/ath/ath9k/hif_usb.c:1242
>  request_firmware_work_func+0x12e/0x240
> drivers/base/firmware_loader/main.c:1097
>  process_one_work+0x9af/0x1600 kernel/workqueue.c:2279
>  worker_thread+0x61d/0x12f0 kernel/workqueue.c:2425
>  kthread+0x3b4/0x4a0 kernel/kthread.c:313
>  ret_from_fork+0x22/0x30 arch/x86/entry/entry_64.S:299
> 
> Fri, 9 Oct 2020 at 21:55:51 UTC+3, Alan Stern wrote:
> > I don't know if all the devices used by the ath9k_htc driver are
> > expected to have all of these endpoints and no others. I just added
> > checks for the ones listed in the hif_usb.h file.
> 
> I agree with you: kernel should definitely handle itself the situation
> when endpoint definitions do not correspond to the expected ones because
> this problem arises in Syzkaller cases. I suppose adding the endpoints
> to be checked listed in the hif_usb.h file would be enough.
> 
> However, it is probable that those warnings can only be triggered with
> fuzzer and can't happen in real applications. Perhaps it is Syzkaller
> which does not name endpoints correctly in a way that suits real
> implementation. But overall, some method of checking endpoints should
> be implemented inside ath9k driver, and the code you proposed does this
> functionality.
> 
> [1]: https://groups.google.com/g/syzkaller-bugs/c/umu68ITBsRg/m/xy8dtA5JAQAJ

Good.  Should I add your Acked-by: to the patch and submit it?

Alan Stern
