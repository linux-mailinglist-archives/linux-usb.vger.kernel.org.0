Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98CCF2D2F0C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Dec 2020 17:06:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730356AbgLHQFP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Dec 2020 11:05:15 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:40013 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730339AbgLHQFO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Dec 2020 11:05:14 -0500
Received: by mail-io1-f71.google.com with SMTP id l18so4065208iok.7
        for <linux-usb@vger.kernel.org>; Tue, 08 Dec 2020 08:04:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to:cc;
        bh=hpv3KpgmoGcPwhMUS1qClauW4ZVADBQBTB64O2CLwR4=;
        b=nUp+kz5fQ8AE/fbrqQskuX8pajxJqvYZRC+lq0x3hWKEexBqknNg0YYwI3lTlr5Og0
         s2kis8h2ikNkehps8K9wtM8Ml77BzYpYLEGRDnxNpZ5gYcuwfRsFGK1aWabMXiv9Mem+
         jqddoaTUqcK3/yoY85+TRDu9RVbbuOG9r1Mairuql6cXdGeZVZ/k55djfhR9a9E4+lGX
         XOcLvyhwBcWyxEszQ1UBiWhMzKabgWoAOFOFcalxMJtM43/TclhLOciGyWWCu5sfYGO1
         K38WdSI5iHm2hP17XFNkmOy8P/GXVBZsoJeceZKaXiOsypTqQjgXmGaMBUECYUzxhzhB
         itqA==
X-Gm-Message-State: AOAM532k5NiTiP/QvFxoKJYkazdcBXQsMVUb1u9MaduZyKEAX0UrFgqV
        ljJshrY54SlGCsOLW9AihWmRDXVL4ymeA9sZnRi/6RPfzURB
X-Google-Smtp-Source: ABdhPJxIGVVsKJL/d5PRR20afDIr8XtYWWU72tQIziAZzpTGYJm0Fp5YA4Zy8Ze/FdzNzHEb6E3CdYhJpubtEzHDbKXmyUhRLSD/
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1003:: with SMTP id n3mr13962774ilj.189.1607443467522;
 Tue, 08 Dec 2020 08:04:27 -0800 (PST)
Date:   Tue, 08 Dec 2020 08:04:27 -0800
In-Reply-To: <20201208160425.GA1298255@rowland.harvard.edu>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e0d6f805b5f61882@google.com>
Subject: Re: Re: general protection fault in tower_disconnect
From:   syzbot <syzbot+9be25235b7a69b24d117@syzkaller.appspotmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     andreyknvl@google.com, gregkh@linuxfoundation.org,
        legousb-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, starblue@users.sourceforge.net,
        stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> On Tue, Dec 08, 2020 at 03:53:16AM -0800, syzbot wrote:
>> Hello,
>> 
>> syzbot found the following issue on:
>> 
>> HEAD commit:    08a02f95 USB: add RESET_RESUME quirk for Snapscan 1212
>> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1435927b500000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=d24ee9ecd7ce968e
>> dashboard link: https://syzkaller.appspot.com/bug?extid=9be25235b7a69b24d117
>> compiler:       gcc (GCC) 10.1.0-syz 20200507
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=15145f07500000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16b99413500000
>> 
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+9be25235b7a69b24d117@syzkaller.appspotmail.com
>> 
>> usb 1-1: USB disconnect, device number 2
>> general protection fault, probably for non-canonical address 0xdffffc0000000013: 0000 [#1] SMP KASAN
>> KASAN: null-ptr-deref in range [0x0000000000000098-0x000000000000009f]
>> CPU: 0 PID: 7 Comm: kworker/0:1 Not tainted 5.10.0-rc7-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>> Workqueue: usb_hub_wq hub_event
>> RIP: 0010:tower_disconnect+0x53/0x360 drivers/usb/misc/legousbtower.c:848
>> Code: 03 80 3c 02 00 0f 85 15 03 00 00 48 8b ab a8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd 98 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 06 0f 8e 7b 02 00 00 48 c7 c6 40 07 bb 87 48
>> RSP: 0018:ffffc9000007f7c0 EFLAGS: 00010202
>> RAX: dffffc0000000000 RBX: ffff888117ec0000 RCX: ffffffff8381f807
>> RDX: 0000000000000013 RSI: ffffffff83bab792 RDI: 0000000000000098
>> RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff898cc4ef
>> R10: 0000000000000002 R11: 0000000000000000 R12: ffff888117ec0090
>> R13: ffff888117ec0078 R14: ffff888117ec0030 R15: ffff888117ec0098
>> FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f557af47550 CR3: 00000001090f3000 CR4: 00000000001506f0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>>  usb_unbind_interface+0x1d8/0x8d0 drivers/usb/core/driver.c:458
>>  __device_release_driver+0x3bd/0x6f0 drivers/base/dd.c:1154
>>  device_release_driver_internal drivers/base/dd.c:1185 [inline]
>>  device_release_driver+0x26/0x40 drivers/base/dd.c:1208
>>  bus_remove_device+0x2eb/0x5a0 drivers/base/bus.c:533
>>  device_del+0x502/0xec0 drivers/base/core.c:3115
>>  usb_disable_device+0x35b/0x7b0 drivers/usb/core/message.c:1413
>>  usb_disconnect.cold+0x27d/0x780 drivers/usb/core/hub.c:2218
>>  hub_port_connect drivers/usb/core/hub.c:5074 [inline]
>>  hub_port_connect_change drivers/usb/core/hub.c:5363 [inline]
>>  port_event drivers/usb/core/hub.c:5509 [inline]
>>  hub_event+0x1c8a/0x42d0 drivers/usb/core/hub.c:5591
>>  process_one_work+0x933/0x1520 kernel/workqueue.c:2272
>>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2418
>>  kthread+0x38c/0x460 kernel/kthread.c:292
>>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:296
>> Modules linked in:
>> ---[ end trace 5aeb1d199be5d5f2 ]---
>> RIP: 0010:tower_disconnect+0x53/0x360 drivers/usb/misc/legousbtower.c:848
>> Code: 03 80 3c 02 00 0f 85 15 03 00 00 48 8b ab a8 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d bd 98 00 00 00 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 06 0f 8e 7b 02 00 00 48 c7 c6 40 07 bb 87 48
>> RSP: 0018:ffffc9000007f7c0 EFLAGS: 00010202
>> RAX: dffffc0000000000 RBX: ffff888117ec0000 RCX: ffffffff8381f807
>> RDX: 0000000000000013 RSI: ffffffff83bab792 RDI: 0000000000000098
>> RBP: 0000000000000000 R08: 0000000000000001 R09: ffffffff898cc4ef
>> R10: 0000000000000002 R11: 0000000000000000 R12: ffff888117ec0090
>> R13: ffff888117ec0078 R14: ffff888117ec0030 R15: ffff888117ec0098
>> FS:  0000000000000000(0000) GS:ffff8881f6a00000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f557af47550 CR3: 00000001090f3000 CR4: 00000000001506f0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>
> This is a simple thinko.
>
> Alan Stern
>
> #syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing 08a02f95

want 2 args (repo, branch), got 3

>
> Index: usb-devel/drivers/usb/misc/legousbtower.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/misc/legousbtower.c
> +++ usb-devel/drivers/usb/misc/legousbtower.c
> @@ -797,7 +797,7 @@ static int tower_probe(struct usb_interf
>  				      &get_version_reply,
>  				      sizeof(get_version_reply),
>  				      1000, GFP_KERNEL);
> -	if (!result) {
> +	if (result) {
>  		dev_err(idev, "get version request failed: %d\n", result);
>  		retval = result;
>  		goto error;
>
> -- 
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/20201208160425.GA1298255%40rowland.harvard.edu.
