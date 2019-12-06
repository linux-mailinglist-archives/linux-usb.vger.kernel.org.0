Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDC32114C6D
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2019 07:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbfLFGvE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 Dec 2019 01:51:04 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:36710 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfLFGvE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 Dec 2019 01:51:04 -0500
Received: by mail-pj1-f68.google.com with SMTP id n96so2337669pjc.3
        for <linux-usb@vger.kernel.org>; Thu, 05 Dec 2019 22:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XOnsoqGRAaLoguyleb6izqv2ryGmCpO2yB55bZ9uCHs=;
        b=VEk2/iz0gGOSRiwkzXfsOfCrbbXIkO2/ITi3ss8jRA4Ll3QVSmF6t1aC/AGNOUpRSG
         sHSGH1UsDiqZ0u6vJfT/8EqousxcjmOizaBID8+ncW0lkDqpyKdOGa32fUMRqVzhH0ud
         sZtik9JC+unyPzWczf+8WVaZNOPwDsTsMFqx/KkJDJ/LvF19JuXQfDJpDzwvcLbs6E7u
         pxS8C8g2zUZ6W+FZzhzxgSLnrrKiNsmiGrLrnLjoAOJJ08QJ+0NinWKTugi0pVDm/KO4
         XDejulSOU6m2DXkN2T0u6VQgz6uINv6VgGT1Zm/o9WE2DUR97FYVZlbKK/JQRc14aVE6
         MBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XOnsoqGRAaLoguyleb6izqv2ryGmCpO2yB55bZ9uCHs=;
        b=DUyHBLyConj9uCvjdSmDXKrD4rzd4nfOvEg+iuwJBvvCjwAyaN6Yn3WjRJQGbtjTc7
         uQrRCUKEZt1wbV8mzkuO8MJLivVfhMPR16rN/VwFV8YgRcD5xIxYkqqX7LekDWw5sh0/
         fybS0LXRHjH31fpKzjRcBp+knL9SzLsu2iXXLENm4IqIfds6T0DAJSJbHpfogxalchck
         qMXzTPY2DrhyZtyC4KXRD66h/+m22+p6A7Ez6OgJlksvJ8BeoCngUm1lM8zCRR0oAhs5
         dES+K2fTqj7cCho+2uy6q0nEmWlLxdf5iUT/tk3xXhjmFWPQHx3nj1s1+szIHRvSryJt
         Dn9A==
X-Gm-Message-State: APjAAAXI+qyPeDxoKsfftr3au+Hbo2WCBSQ37Tu9Y0WdTHVCNpRW1BVQ
        Le+L1BtecdXO7NdWRaPyy66nCYT1
X-Google-Smtp-Source: APXvYqwEIxpPPdkuTFHZwzdcw3v3lIxnVZcQm4kk25bFefe6cAcFVhxUpezzk6teahRPcYC9cyB83Q==
X-Received: by 2002:a17:90a:3247:: with SMTP id k65mr14173751pjb.61.1575615063594;
        Thu, 05 Dec 2019 22:51:03 -0800 (PST)
Received: from localhost.localdomain ([163.152.162.99])
        by smtp.gmail.com with ESMTPSA id k101sm1841210pjb.5.2019.12.05.22.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 22:51:03 -0800 (PST)
Date:   Fri, 6 Dec 2019 15:50:58 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191206065058.GA9792@localhost.localdomain>
References: <20191206032406.GE1208@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191206032406.GE1208@mail-itl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 06, 2019 at 04:24:06AM +0100, Marek Marczykowski-Górecki wrote:
> Hello,
> 
> I've hit an issue with recent 4.19 and 5.4 kernels. In short: if I
> connect Yubikey 4 and use its CCID interface (for example `ykman oath
> list` command), the client side hangs (100% reliably). After 60s I get a
> message that a CPU hangs waiting for a spinlock (see below).
> 
> I've bisected it to a ea44d190764b4422af ("usbip: Implement SG support
> to vhci-hcd and stub driver") commit. Which indeed is also backported to
> 4.19.
> 
> Any idea what is going on here? I can easily provide more information,
> if you tell me how to get it.
> 

Hi,

Thanks for reporting. Could you turn on lockdep and USBIP_DEBUG
in kernel config and send dmesg log? It will be helpful to figure
out lock dependency in vhci_hcd.

Regards,
Suwan Kim

> The kernel log:
> [ 6452.701016] usb 1-1: New USB device found, idVendor=1050, idProduct=0407, bcdDevice= 4.27
> [ 6452.701049] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [ 6452.701075] usb 1-1: Product: Yubikey 4 OTP+U2F+CCID
> [ 6452.701092] usb 1-1: Manufacturer: Yubico
> [ 6452.711566] input: Yubico Yubikey 4 OTP+U2F+CCID as /devices/platform/vhci_hcd.0/usb1/1-1/1-1:1.0/0003:1050:0407.0001/input/input1
> [ 6452.762251] hid-generic 0003:1050:0407.0001: input,hidraw0: USB HID v1.10 Keyboard [Yubico Yubikey 4 OTP+U2F+CCID] on usb-vhci_hcd.0-1/input0
> [ 6452.770270] hid-generic 0003:1050:0407.0002: hiddev96,hidraw1: USB HID v1.10 Device [Yubico Yubikey 4 OTP+U2F+CCID] on usb-vhci_hcd.0-1/input1
> [ 6530.805002] vhci_hcd: unlink->seqnum 111
> [ 6530.805024] vhci_hcd: urb->status -104
> [ 6531.386607] usb 1-1: recv xbuf, 42
> [ 6531.386701] vhci_hcd: stop threads
> [ 6531.386718] vhci_hcd: release socket
> [ 6531.386734] vhci_hcd: disconnect device
> [ 6531.386800] usb 1-1: USB disconnect, device number 2
> [ 6591.409099] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 6591.409130] rcu:     1-...!: (0 ticks this GP) idle=53a/1/0x4000000000000000 softirq=18978/18978 fqs=0 
> [ 6591.409158] rcu:     (detected by 0, t=60002 jiffies, g=17933, q=893)
> [ 6591.409181] Sending NMI from CPU 0 to CPUs 1:
> [ 6591.410415] NMI backtrace for cpu 1
> [ 6591.410416] CPU: 1 PID: 338 Comm: kworker/1:2 Tainted: G           O      4.19.84-1.pvops.qubes.x86_64 #1
> [ 6591.410417] Workqueue: usb_hub_wq hub_event
> [ 6591.410417] RIP: 0010:_raw_spin_lock_irqsave+0x22/0x40
> [ 6591.410418] Code: 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 53 9c 58 0f 1f 44 00 00 48 89 c3 fa 66 0f 1f 44 00 00 31 c0 ba 01 00 00 00 f0 0f b1 17 <85> c0 75 05 48 89 d8 5b c3 89 c6 e8 3e 1c 7e ff 66 90 48 89 d8 5b
> [ 6591.410419] RSP: 0000:ffffc900009dfaf8 EFLAGS: 00000046
> [ 6591.410419] RAX: 0000000000000000 RBX: 0000000000000082 RCX: 0000000000000000
> [ 6591.410420] RDX: 0000000000000001 RSI: ffff88801e633e40 RDI: ffff888006740be0
> [ 6591.410420] RBP: ffff888006740be0 R08: 0000000000000000 R09: ffffffff81346f00
> [ 6591.410420] R10: ffff888014f5b5d8 R11: 0000000000000000 R12: 00000000ffffff94
> [ 6591.410421] R13: ffff88803ff06000 R14: ffff88803ff06000 R15: ffff88801e633e40
> [ 6591.410421] FS:  0000000000000000(0000) GS:ffff8880f5b00000(0000) knlGS:0000000000000000
> [ 6591.410421] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 6591.410422] CR2: 00005eede8b122a8 CR3: 000000000220a002 CR4: 00000000003606e0
> [ 6591.410422] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [ 6591.410423] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [ 6591.410423] Call Trace:
> [ 6591.410423]  vhci_urb_dequeue+0x2b/0x280 [vhci_hcd]
> [ 6591.410423]  usb_hcd_flush_endpoint+0x119/0x190
> [ 6591.410424]  usb_disable_endpoint+0x7b/0xa0
> [ 6591.410424]  usb_disable_interface+0x3e/0x50
> [ 6591.410424]  usb_unbind_interface+0x117/0x250
> [ 6591.410425]  device_release_driver_internal+0x17d/0x240
> [ 6591.410425]  bus_remove_device+0xe5/0x150
> [ 6591.410425]  device_del+0x161/0x360
> [ 6591.410426]  ? usb_remove_ep_devs+0x1b/0x30
> [ 6591.410426]  usb_disable_device+0x93/0x240
> [ 6591.410426]  usb_disconnect+0x90/0x270
> [ 6591.410427]  hub_port_connect+0x83/0xab0
> [ 6591.410427]  hub_event+0x8d1/0xab0
> [ 6591.410427]  process_one_work+0x191/0x370
> [ 6591.410428]  worker_thread+0x4f/0x3b0
> [ 6591.410428]  kthread+0xf8/0x130
> [ 6591.410428]  ? rescuer_thread+0x340/0x340
> [ 6591.410428]  ? kthread_create_worker_on_cpu+0x70/0x70
> [ 6591.410429]  ret_from_fork+0x35/0x40
> [ 6591.410432] rcu: rcu_sched kthread starved for 60002 jiffies! g17933 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x402 ->cpu=1
> [ 6591.411962] rcu: RCU grace-period kthread stack dump:
> [ 6591.411980] rcu_sched       I    0    10      2 0x80000000
> [ 6591.411998] Call Trace:
> [ 6591.412015]  ? __schedule+0x3f5/0x870
> [ 6591.412030]  schedule+0x32/0x80
> [ 6591.412044]  schedule_timeout+0x16f/0x350
> [ 6591.412059]  ? __next_timer_interrupt+0xc0/0xc0
> [ 6591.412077]  rcu_gp_kthread+0x569/0x950
> [ 6591.412092]  kthread+0xf8/0x130
> [ 6591.412106]  ? rcu_nocb_kthread+0x560/0x560
> [ 6591.412119]  ? kthread_create_worker_on_cpu+0x70/0x70
> [ 6591.412136]  ret_from_fork+0x35/0x40
> 
> Some more details are available here:
> https://github.com/QubesOS/qubes-issues/issues/5498
> 
> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


