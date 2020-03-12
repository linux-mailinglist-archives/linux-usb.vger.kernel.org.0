Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9213F182F9E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2020 12:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgCLLwP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Mar 2020 07:52:15 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:36919 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCLLwP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Mar 2020 07:52:15 -0400
Received: by mail-qk1-f196.google.com with SMTP id z25so695716qkj.4
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2020 04:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc;
        bh=ewWFX7ZV4FW5KSx9dDyQ7PhFxAd+CEDBeiUU3yod234=;
        b=Lx3BtzPwpxXbeq8G54tOwIUivKevkHHCujR8De1M56og2USVfZtvOwegryPP3FD8kI
         ACw4ZVOfTFVn4KBJuctKtPnmu8UQDS8dQz4zD6Pv0M31FVJb4fuVt0KNjztQ0J61wHax
         lhuLG6dDvHA44X7m0HiPaYaqy6+Flqd7/X/tZxSLCDaty3zt1A4FfPMMIHvxCYGhL9GD
         GUQ2S6BC+kNnEGB+IJfgdcp5wzdqIrK9LX/tS1AEfj2MeahKAuo3j+MrCgyeBk4ORB9Y
         O5h+fM0+FFIQhJ6LnFF3uqTNj21xIvfanF+AI5/gr1bQV1mHVGNPaXNrZvf8UZnbgLlz
         d4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc;
        bh=ewWFX7ZV4FW5KSx9dDyQ7PhFxAd+CEDBeiUU3yod234=;
        b=JTvSo0aGNImTnMRtnSGvb1sHP6qP9tri68RPTRhcyq4D1E+nazVeEbwUkbUm2Zhb1Q
         8G2iav55ayTgvQ+uaVtStMTU2jXzIZ3iGMb6PPV2PZ2TebaoFC7JzcySnbKEJpmSdIKn
         l1N8jba8c6mXxppPx1KoVdGs7ciy2uFbRbulhXCQSNnQJGCpGGYqo4VTnHrr4ev5LOz0
         63MjqQocZUK4MI9wQrRRFLtK/PTMWNCifhiD7O3mFf3mgH2n/tVENX445aAmxY8Ubyey
         B9RW582MZvAoQ7XPxn3UGvpRyd8pWPs9/mRh8jpcSqLarnvRMxjvDb3zp6LbUAJe/5W8
         yMLg==
X-Gm-Message-State: ANhLgQ3tS4iqFFAg9CBIdxQS9T3WT4YvAzd2isusCRxGOoSpwVTnkqgd
        ud0BppT3bU3QLjqm1AXdDyKJX2+A+swQMQ==
X-Google-Smtp-Source: ADFU+vuCcbbAs0dlvlal4ZAT2O2bbXDOiZbcPKPzg+4xM5AWHef2ZJASJNGIo32VyU9RBDUFhU+bXg==
X-Received: by 2002:a37:664d:: with SMTP id a74mr6953583qkc.256.1584013933030;
        Thu, 12 Mar 2020 04:52:13 -0700 (PDT)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com. [209.85.219.44])
        by smtp.gmail.com with ESMTPSA id r29sm5193579qkk.85.2020.03.12.04.52.11
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2020 04:52:12 -0700 (PDT)
From:   Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qv1-f44.google.com with SMTP id p60so2419421qva.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2020 04:52:11 -0700 (PDT)
X-Received: by 2002:ad4:4f92:: with SMTP id em18mr6746629qvb.226.1584013931295;
 Thu, 12 Mar 2020 04:52:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAP9ODKrH_7p1p1+9pXc-85m3yHHo_2YLouuXFBOLBr+gsSe+Ew@mail.gmail.com>
 <CAP9ODKrrgYgHvn6Rm8aC18z9gaCS51AFztD7xYF2H53hbPXS=w@mail.gmail.com> <20200312095304.GE14625@b29397-desktop>
In-Reply-To: <20200312095304.GE14625@b29397-desktop>
Date:   Thu, 12 Mar 2020 08:51:59 -0300
X-Gmail-Original-Message-ID: <CAP9ODKr2jJqN1W6MLLstHwyu+15g7xMN5T-SKb0YYvVBAVHbLw@mail.gmail.com>
Message-ID: <CAP9ODKr2jJqN1W6MLLstHwyu+15g7xMN5T-SKb0YYvVBAVHbLw@mail.gmail.com>
Subject: Re: Error when unloading g_serial module
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Otavio Salvador <otavio@ossystems.com.br>,
        Felipe Balbi <balbi@kernel.org>,
        "sorganov@gmail.com" <sorganov@gmail.com>,
        "mirq-linux@rere.qmqm.pl" <mirq-linux@rere.qmqm.pl>,
        "felixhaedicke@web.de" <felixhaedicke@web.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 12, 2020 at 6:53 AM Peter Chen <peter.chen@nxp.com> wrote:
> On 20-03-07 16:51:48, Otavio Salvador wrote:
> > Sorry, here is the log withoiut any out-of-tree module:
> > [root@rv1108 ~]# modprobe  -r g_serial
> > [   86.928476] 8<--- cut here ---
> > [   86.928781] Unable to handle kernel NULL pointer dereference at
> > virtual address 000000d4
> > [   86.929511] pgd = 2c058c2d
> > [   86.929766] [000000d4] *pgd=6591f835, *pte=00000000, *ppte=00000000
> > [   86.930350] Internal error: Oops: 17 [#1] SMP ARM
> > [   86.930778] Modules linked in: usb_f_acm u_serial g_serial(-)
> > libcomposite configfs zram zsmalloc clk_rk808 rtc_rk808 spi_rockchip
> > [   86.931872] CPU: 0 PID: 498 Comm: sat Not tainted 5.4.23 #41
> > [   86.932376] Hardware name: Rockchip (Device Tree)
> > [   86.932818] PC is at _raw_spin_lock_irq+0x8/0x44
> > [   86.933254] LR is at gs_close+0x28/0x1e4 [u_serial]
> > [   86.933696] pc : [<c08483b0>]    lr : [<bf03fd28>]    psr: a00e0093
> > [   86.934255] sp : c5c05d38  ip : 00005401  fp : ffffffed
> > [   86.934724] r10: c6716db8  r9 : 00000000  r8 : c096d664
> > [   86.935191] r7 : c5c07b40  r6 : 000000d4  r5 : c0d05c88  r4 : 00000000
> > [   86.935774] r3 : 79f4b188  r2 : c63ca600  r1 : c5c07b40  r0 : 000000d4
> > [   86.936366] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM
> > Segment none
> > [   86.937010] Control: 10c5387d  Table: 65be406a  DAC: 00000051
> > [   86.937528] Process sat (pid: 498, stack limit = 0x87e8ad9f)
> > [   86.938041] Stack: (0xc5c05d38 to 0xc5c06000)
> > [   86.938440] 5d20:
> >     0f300000 c6716db8
> > [   86.939172] 5d40: c5c07b40 c63ca600 c5c07b40 79f4b188 c63ca600
> > 00000000 c0ae9318 c5c07b40
> > [   86.939904] 5d60: c096d664 00000000 c6716db8 c04f47cc 00000000
> > c04fc400 c63ca600 00000000
> > [   86.940637] 5d80: 00000000 c63ca600 c5c07b40 c0ae9318 c5c04000
> > c096d664 0f300000 c6716db8
> > [   86.941370] 5da0: ffffffed c04f66a0 800e0093 00000902 c0d8ecd8
> > c593d180 c0d05c88 00000081
> > [   86.942101] 5dc0: 00000000 79f4b188 00000000 c096d6e4 c0d05c88
> > c5910e40 00000000 c6716db8
> > [   86.942833] 5de0: c5c07b40 00000000 c5c07b40 c02b3250 c5c05ec0
> > 79f4b188 c5c05ec0 c5c07b40
> > [   86.943565] 5e00: c6716db8 c5c07b48 c02b3174 00000006 c6716db8
> > c02aa874 c5c05ec0 00000000
> > [   86.944296] 5e20: 00000902 00000000 00000000 00000006 c6716db8
> > c02bd920 c0161a04 00000100
> > [   86.945029] 5e40: 00000000 000041ed 00000000 00000000 c0d05c88
> > 00000041 00000000 c014fc70
> > [   86.945761] 5e60: ffffe000 00000000 c0a7273c c0152494 600e0013
> > c5813b90 00000002 c6716db8
> > [   86.946493] 5e80: c708b9d0 c6ef1bb0 00000000 c5813b7c c0a6abdc
> > 79f4b188 c0d8ecd8 c0d05c88
> > [   86.947225] 5ea0: c0d05c88 c5c05f70 00000001 fffff000 c5c04000
> > 00000142 b63a3874 c02bf5f0
> > [   86.947958] 5ec0: c708b9d0 c6ef1bb0 ad6e75ef 00000006 c70da015
> > c6371e40 00000000 c6cba6e8
> > [   86.948689] 5ee0: c6716db8 00000101 00000002 00000054 00000000
> > 00000000 00000000 c5c05f00
> > [   86.949424] 5f00: c583b600 c583ba58 00000000 c0843628 c583ba40
> > c583b600 c0d05c88 c01556a8
> > [   86.950155] 5f20: ffffe000 79f4b188 00000011 00000020 c70da000
> > 00000000 00000000 00000002
> > [   86.950890] 5f40: ffffff9c c02cea14 00000902 79f4b188 ffffff9c
> > 00000011 c0d05c88 ffffff9c
> > [   86.951622] 5f60: c70da000 c02abd18 00000000 79f4b188 00000902
> > c0150000 00000006 00000100
> > [   86.952355] 5f80: 00000001 79f4b188 003e75dc 00677470 00000011
> > 00000142 c0101204 c5c04000
> > [   86.953088] 5fa0: 00000142 c0101000 003e75dc 00677470 ffffff9c
> > 003e75dc 00000902 00000000
> > [   86.953824] 5fc0: 003e75dc 00677470 00000011 00000142 b57ff011
> > 00020000 00020000 b63a3874
> > [   86.954555] 5fe0: 00000002 b63a3688 b65a48d0 b6fa567c 600e0010
> > ffffff9c 00000000 00000000
> > [   86.955312] [<c08483b0>] (_raw_spin_lock_irq) from [<bf03fd28>]
> > (gs_close+0x28/0x1e4 [u_serial])
> > [   86.956121] [<bf03fd28>] (gs_close [u_serial]) from [<c04f47cc>]
> > (tty_release+0xf0/0x47c)
> > [   86.956864] [<c04f47cc>] (tty_release) from [<c04f66a0>]
> > (tty_open+0x118/0x3fc)
> > [   86.957528] [<c04f66a0>] (tty_open) from [<c02b3250>]
> > (chrdev_open+0xdc/0x1a8)
> > [   86.958184] [<c02b3250>] (chrdev_open) from [<c02aa874>]
> > (do_dentry_open+0x21c/0x3f0)
> > [   86.958898] [<c02aa874>] (do_dentry_open) from [<c02bd920>]
> > (path_openat+0x470/0x1174)
> > [   86.959615] [<c02bd920>] (path_openat) from [<c02bf5f0>]
> > (do_filp_open+0x70/0xdc)
> > [   86.960293] [<c02bf5f0>] (do_filp_open) from [<c02abd18>]
> > (do_sys_open+0x180/0x214)
> > [   86.960985] [<c02abd18>] (do_sys_open) from [<c0101000>]
> > (ret_fast_syscall+0x0/0x54)
> > [   86.961671] Exception stack(0xc5c05fa8 to 0xc5c05ff0)
> > [   86.962130] 5fa0:                   003e75dc 00677470 ffffff9c
> > 003e75dc 00000902 00000000
> > [   86.962863] 5fc0: 003e75dc 00677470 00000011 00000142 b57ff011
> > 00020000 00020000 b63a3874
> > [   86.963591] 5fe0: 00000002 b63a3688 b65a48d0 b6fa567c
> > [   86.964054] Code: f57ff05b e12fff1e f10c0080 f590f000 (e1903f9f)
> > [   86.964603] ---[ end trace 2e9f93ef91ffad40 ]---
> > [root@rv1108 ~]#
> >
>
> Did you run any applications on it? I can't trigger it by using
> the latest usb-linus tree, no matter the connection is there or not.

Yes, we do.  We could reproduce it using minicom, for example.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
