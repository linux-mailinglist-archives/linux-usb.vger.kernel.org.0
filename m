Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1CB4831AE
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2019 14:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730859AbfHFMp3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 6 Aug 2019 08:45:29 -0400
Received: from mail-ot1-f70.google.com ([209.85.210.70]:49824 "EHLO
        mail-ot1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728156AbfHFMp3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 6 Aug 2019 08:45:29 -0400
Received: by mail-ot1-f70.google.com with SMTP id l7so49268167otj.16
        for <linux-usb@vger.kernel.org>; Tue, 06 Aug 2019 05:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=7s3x+VIeW7VWFr3Qs7dGsSLveLCnDw+JlNZd45Qv5/M=;
        b=CIf80vryHPJ/pylx9wEFa7Xc6Xf+CjGPhonXncGPVRk/M1nmy5i3N4T7/7wsvjbu0H
         AjXUqxpS1YEaOfImylqz9LACbH8/6M9omW6xq9aBPO1qEVTwmcS8aWnJAPb2vAj07MRR
         UXs2KC/PZ6xl/t5kL0WfbckwEEACV9HB/YsX6EDW3hMef7wVaIYXigSlhpXhVK1m1/l7
         lpI1lPx2ONLwCel0RTA6xqV8kQUSFVP+yh1GaBzbuTerhGrLV8m+Dz1F5F4gP5cjtv1o
         q4FpYsz6jl/fBkr/B/Zo/70Ibnq80HFYqGk96sghXrNeLOZMtRK18InlDlKt618Pfjls
         zaQg==
X-Gm-Message-State: APjAAAVT6c1jVRl2awjZIxnsxKO6NIicoeM5vp7wVbl0S/KtM92P7NXQ
        95hLE1+kXlYQ2ZcAxYnmL6ASjCAAOQ2Sv5+hG5SLnF0GcEdA
X-Google-Smtp-Source: APXvYqzgtqYIkGVtGHpkiN1HAOHUzAiHQDWPemmWPIuEypdsZ5pn2bQaljFAi/3ic+8P51jA87KhTxj/izm58cDAf3JUE2SSml0C
MIME-Version: 1.0
X-Received: by 2002:a05:6638:38f:: with SMTP id y15mr3962211jap.143.1565095528400;
 Tue, 06 Aug 2019 05:45:28 -0700 (PDT)
Date:   Tue, 06 Aug 2019 05:45:28 -0700
In-Reply-To: <1565095525.8136.22.camel@suse.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000002923d058f72330d@google.com>
Subject: Re: Re: KMSAN: kernel-usb-infoleak in pcan_usb_pro_send_req
From:   syzbot <syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     glider@google.com, gregkh@linuxfoundation.org,
        gustavo@embeddedor.com, linux-usb@vger.kernel.org,
        oneukum@suse.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Am Dienstag, den 30.07.2019, 02:38 -0700 schrieb syzbot:
>> Hello,

>> syzbot found the following crash on:

>> HEAD commit:    41550654 [UPSTREAM] KVM: x86: degrade WARN to  
>> pr_warn_rate..
>> git tree:       kmsan
>> console output: https://syzkaller.appspot.com/x/log.txt?x=13e95183a00000
>> kernel config:   
>> https://syzkaller.appspot.com/x/.config?x=40511ad0c5945201
>> dashboard link:  
>> https://syzkaller.appspot.com/bug?extid=513e4d0985298538bf9b
>> compiler:       clang version 9.0.0 (/home/glider/llvm/clang
>> 80fee25776c2fb61e74c1ecb1a523375c2500b69)
>> syz repro:       
>> https://syzkaller.appspot.com/x/repro.syz?x=17eafa1ba00000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17b87983a00000

>> IMPORTANT: if you fix the bug, please add the following tag to the  
>> commit:
>> Reported-by: syzbot+513e4d0985298538bf9b@syzkaller.appspotmail.com

> #syz test: https://github.com/google/kasan.git 41550654

KMSAN bugs can only be tested on https://github.com/google/kmsan.git tree
because KMSAN tool is not upstreamed yet.
See https://goo.gl/tpsmEJ#kmsan-bugs for details.


>  From 6de76fa3df8aedc7a76dc0ecdea8308e38d4dccc Mon Sep 17 00:00:00 2001
> From: Oliver Neukum <oneukum@suse.com>
> Date: Tue, 6 Aug 2019 14:41:52 +0200
> Subject: [PATCH] pcan_usb_fd: zero out the common command buffer

> Lest we leak kernel memory to a device we better zero out buffers.

> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>   drivers/net/can/usb/peak_usb/pcan_usb_fd.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

> diff --git a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c  
> b/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
> index 34761c3a6286..47cc1ff5b88e 100644
> --- a/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
> +++ b/drivers/net/can/usb/peak_usb/pcan_usb_fd.c
> @@ -841,7 +841,7 @@ static int pcan_usb_fd_init(struct peak_usb_device  
> *dev)
>   			goto err_out;

>   		/* allocate command buffer once for all for the interface */
> -		pdev->cmd_buffer_addr = kmalloc(PCAN_UFD_CMD_BUFFER_SIZE,
> +		pdev->cmd_buffer_addr = kzalloc(PCAN_UFD_CMD_BUFFER_SIZE,
>   						GFP_KERNEL);
>   		if (!pdev->cmd_buffer_addr)
>   			goto err_out_1;
> --
> 2.16.4



