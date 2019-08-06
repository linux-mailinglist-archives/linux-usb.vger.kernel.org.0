Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E959783234
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 15:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732442AbfHFNFq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 09:05:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:58078 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731787AbfHFNFq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 6 Aug 2019 09:05:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 80D80B061;
        Tue,  6 Aug 2019 13:05:45 +0000 (UTC)
Message-ID: <1565096744.8136.23.camel@suse.com>
Subject: Re: KMSAN: kernel-usb-infoleak in pcan_usb_pro_send_req
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com>,
        gustavo@embeddedor.com, glider@google.com,
        syzkaller-bugs@googlegroups.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Date:   Tue, 06 Aug 2019 15:05:44 +0200
In-Reply-To: <00000000000014c877058ee2c4a6@google.com>
References: <00000000000014c877058ee2c4a6@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 30.07.2019, 02:38 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    41550654 [UPSTREAM] KVM: x86: degrade WARN to pr_warn_rate..
> git tree:       kmsan
> console output: https://syzkaller.appspot.com/x/log.txt?x=13e95183a00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
> dashboard link: https://syzkaller.appspot.com/bug?extid=513e4d0985298538bf9b
> compiler:       clang version 9.0.0 (/home/glider/llvm/clang  
> 80fee25776c2fb61e74c1ecb1a523375c2500b69)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17eafa1ba00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b87983a00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com

#syz test: https://github.com/google/kmsan.git 41550654

From 6de76fa3df8aedc7a76dc0ecdea8308e38d4dccc Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Tue, 6 Aug 2019 14:41:52 +0200
Subject: [PATCH] pcan_usb_fd: zero out the common command buffer

Lest we leak kernel memory to a device we better zero out buffers.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/can/usb/peak_usb/pcan_usb_fd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c b/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
index 34761c3a6286..47cc1ff5b88e 100644
--- a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
+++ b/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
@@ -841,7 +841,7 @@ static int pcan_usb_fd_init(struct peak_usb_device *dev)
 			goto err_out;
 
 		/* allocate command buffer once for all for the interface */
-		pdev->cmd_buffer_addr = kmalloc(PCAN_UFD_CMD_BUFFER_SIZE,
+		pdev->cmd_buffer_addr = kzalloc(PCAN_UFD_CMD_BUFFER_SIZE,
 						GFP_KERNEL);
 		if (!pdev->cmd_buffer_addr)
 			goto err_out_1;

