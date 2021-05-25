Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFCF38FD5E
	for <lists+linux-usb@lfdr.de>; Tue, 25 May 2021 11:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhEYJFw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 May 2021 05:05:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbhEYJFw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 May 2021 05:05:52 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6943C061756
        for <linux-usb@vger.kernel.org>; Tue, 25 May 2021 02:04:22 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id c20so29710712qkm.3
        for <linux-usb@vger.kernel.org>; Tue, 25 May 2021 02:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ms24khYHPj4BxD8bzoqSh7oXzx9g8e+VlN8nRkABfnM=;
        b=noMUn4A3hoc1YoGSzpAWkdbsgDYUzyzdez89ur60YWFmbmqz+NDEbOFYKQuM5m5ujy
         4/7nUbA+CmfoBKVdobCY89N+c+8dc8DFfk7X2qOeXDVdZ0jt8uJdOPAqhGPjBbdUcoEd
         UQuK/ImYC6QsZ1NeYeHsuQobEhiuA/vmf9qdHhCBdzrHc12OlmM+IxZLdDOKfuotdAsC
         zBccapTh/oWBrNtti4fB/RmJ9dVHoRIfCOf2bQDMUxmGU85m83WDaixp1fCiDWUEJWyl
         qrucjIGzVsfp46u9V9Tq4mMe7Bv2Ry4qM0AJ1T91qwHNsizm54oEgyeol6AykP2yKHun
         tzHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ms24khYHPj4BxD8bzoqSh7oXzx9g8e+VlN8nRkABfnM=;
        b=rqb26wnQEyUMW9Yd8YJNQdA/72VZC9KmhZEMsrJr8CD8q8D+MATkM2Yy12peuynt8g
         tgZ9d74/oGNT5X0njQpfSmXE8ssXf/hRH0jPoqu2Vbypy2HuC+Q4sXmfTCcZ4sTRAl+/
         gn9/QRR/yHDWCSMyiKD35hLeP/sM2TLxzR79S+bRlm7617bEoXARPYRtusLeX186EWsB
         mqeoIA2e9G+poVD0DqSVlrv4ju7iv10rU0wWC46kj8itfue55ck3KYRyUpdvSZ8QuzJ2
         Rkc3hRa4G2RAEeZYr4gQyM3gvVnOeIsUSXk48/aYu66aYk19hD3cukDARtgE3ubeu8NE
         NSpg==
X-Gm-Message-State: AOAM530dg3Sr2x0OpLSlk3UL6G5RT0dGoil/STwo/CPjC3IBPSxgtsLT
        PiGfLsKQxDzaWTzn7kMpzBVmuZ6MN3Gbh9DJs97SOw==
X-Google-Smtp-Source: ABdhPJz4dzxGAcWP5I8RNn1YYPCMKEFFKxJVd95mrxZffUuo18dYwbdmXGUybhXXSQasR/+4aAkUmJe5swiaPxK2nfA=
X-Received: by 2002:a37:4694:: with SMTP id t142mr34713012qka.265.1621933461620;
 Tue, 25 May 2021 02:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000d449f105c30fce00@google.com> <YKtvbeGYrceXVFAT@hovoldconsulting.com>
In-Reply-To: <YKtvbeGYrceXVFAT@hovoldconsulting.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Tue, 25 May 2021 11:04:10 +0200
Message-ID: <CACT4Y+bxT9CmqSp5rTRXcQA3LJMU63wKkSzTiHGGcZ085C4HeQ@mail.gmail.com>
Subject: Re: [syzbot] WARNING in qt2_attach/usb_submit_urb
To:     Johan Hovold <johan@kernel.org>
Cc:     syzbot <syzbot+19acce48d8344df49b3a@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        mathias.nyman@linux.intel.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 24, 2021 at 11:18 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, May 24, 2021 at 02:12:25AM -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    5cc59c41 USB: core: WARN if pipe direction != setup packet..
> > git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> > console output: https://syzkaller.appspot.com/x/log.txt?x=12dabf53d00000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=1206ee92dd3d988d
> > dashboard link: https://syzkaller.appspot.com/bug?extid=19acce48d8344df49b3a
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1198ed07d00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1772f1ddd00000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+19acce48d8344df49b3a@syzkaller.appspotmail.com
> >
> > usb 1-1: string descriptor 0 read error: -22
> > usb 1-1: New USB device found, idVendor=061d, idProduct=c170, bcdDevice=11.41
> > usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > quatech2 1-1:31.224: Quatech 2nd gen USB to Serial Driver converter detected
> > ------------[ cut here ]------------
> > usb 1-1: BOGUS control dir, pipe 80000280 doesn't match bRequestType 40
> > WARNING: CPU: 1 PID: 2635 at drivers/usb/core/urb.c:410 usb_submit_urb+0x14aa/0x1830 drivers/usb/core/urb.c:410
> > Modules linked in:
> > CPU: 1 PID: 2635 Comm: kworker/1:2 Not tainted 5.13.0-rc2-syzkaller #0
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > RIP: 0010:usb_submit_urb+0x14aa/0x1830 drivers/usb/core/urb.c:410
> > Code: 84 4c 01 00 00 e8 a6 14 b3 fd 4c 89 f7 e8 4e a7 1b ff 45 89 e8 44 89 e1 48 89 ea 48 89 c6 48 c7 c7 c0 09 63 86 e8 18 f1 fb 01 <0f> 0b 49 8d 4f 5c 48 b8 00 00 00 00 00 fc ff df 48 89 ca 48 89 4c
> > RSP: 0018:ffffc900001b6e08 EFLAGS: 00010286
> > RAX: 0000000000000000 RBX: ffff888116d8c058 RCX: 0000000000000000
> > RDX: ffff888114e61b40 RSI: ffffffff812a6013 RDI: fffff52000036db3
> > RBP: ffff888109d7e690 R08: 0000000000000001 R09: 0000000000000000
> > R10: ffffffff814b996b R11: 0000000000000000 R12: 0000000080000280
> > R13: 0000000000000040 R14: ffff888116d8c0a8 R15: ffff8881097ac900
> > FS:  0000000000000000(0000) GS:ffff8881f6900000(0000) knlGS:0000000000000000
> > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > CR2: 000055777d5bd160 CR3: 00000001045ec000 CR4: 00000000001506e0
> > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > Call Trace:
> >  usb_start_wait_urb+0x101/0x4c0 drivers/usb/core/message.c:58
> >  usb_internal_control_msg drivers/usb/core/message.c:102 [inline]
> >  usb_control_msg+0x31c/0x4a0 drivers/usb/core/message.c:153
> >  qt2_attach+0x82/0x550 drivers/usb/serial/quatech2.c:642
>
> I had already found this one but not yet posted the v2. Should be fixed
> here:
>
>         https://lore.kernel.org/r/20210524091705.4282-1-johan@kernel.org
>
> Johan

Hi Johan,

Thanks for double checking.
Let's tell syzbot about the fix:

#syz fix: USB: serial: quatech2: fix control-request directions
