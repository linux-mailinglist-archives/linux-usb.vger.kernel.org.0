Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF3C72841A0
	for <lists+linux-usb@lfdr.de>; Mon,  5 Oct 2020 22:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgJEUo2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Oct 2020 16:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgJEUoZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Oct 2020 16:44:25 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD06C0613CE
        for <linux-usb@vger.kernel.org>; Mon,  5 Oct 2020 13:44:23 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id m13so10021200otl.9
        for <linux-usb@vger.kernel.org>; Mon, 05 Oct 2020 13:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=i+a+onhnw5zyB3us1wI7DEbzeIgfstqEDNNlUgwfzAs=;
        b=KosbtFW5QSv368/xZbHD/8mJiLgmkIx7Mv5QznpfN9xqaMYO4OM4i7lUgxBCD6D4v5
         WmWe7YHNnti+6Yp3JVDoHwOaWXH2a9x+r9N55PnZF1zfReTFjQ0dKBrJCFXSLnkHGvzM
         9zgkhP2Cpsn2QZJjCDio0V3Li1x/WU4UPLmNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i+a+onhnw5zyB3us1wI7DEbzeIgfstqEDNNlUgwfzAs=;
        b=QaJ/5jPWpenB2/YN2Mg8MYOs6LWo1xKNxdOpRVaE87ErwCz4QxJLoRx0+uCMcYsh8f
         30jhG/FtiqXBYgA7Iqdz+QnJu4rRL5Z7JTNeJWxfCLopI6f/FE0xK4h0VWcHsiyj5/BY
         i6CuWqidpNw+OB6xdkgeXQAThJfhyTuy1rTLcDomYo3yt6j+8ORZpvVMLXI77C9fdu7D
         jNA2NVdIEvt0EoTpmFQ+o5gmYgNkAHGyEihRCj9VOOb/8XGyd7dIrJmtLfj9TTcjNy12
         0KtwQ0AYEFBklujpar9ojDDBUemGJh5jkoeWC36LEImZhCIsDY8Q6w/dAAWdP9g2ax0R
         rDxg==
X-Gm-Message-State: AOAM532rDpuvt/KarF9q0Xrv0wamhennGwHhvHZ6lC/pw4xpDtZNNbB4
        l+JSj6LQY0KaiBxb+upruP7enGmctMTghA==
X-Google-Smtp-Source: ABdhPJzy5iU3wH7kPqTGaJbPbc+1Alw03U6xfQy9cQQn617uy8ppWkmJUPmDPNWEb/PRIjO1b04qLA==
X-Received: by 2002:a05:6830:17d8:: with SMTP id p24mr807078ota.111.1601930662637;
        Mon, 05 Oct 2020 13:44:22 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id l23sm229649otk.79.2020.10.05.13.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 13:44:21 -0700 (PDT)
Subject: Re: KASAN: null-ptr-deref Write in event_handler
To:     Andrey Konovalov <andreyknvl@google.com>,
        Shuah Khan <shuah@kernel.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        syzbot <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com>,
        Nazime Hande Harputluoglu <handeharputlu@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <000000000000810a4405b0ece316@google.com>
 <CAAeHK+xWQp87S=bF2RfUjcudGaLVjk3yKLL-bxRzVM=YNRtzRA@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2947473d-76cd-a663-049a-4d51a97e2a3e@linuxfoundation.org>
Date:   Mon, 5 Oct 2020 14:44:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAeHK+xWQp87S=bF2RfUjcudGaLVjk3yKLL-bxRzVM=YNRtzRA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/5/20 8:04 AM, Andrey Konovalov wrote:
> On Mon, Oct 5, 2020 at 3:59 PM syzbot
> <syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    d3d45f82 Merge tag 'pinctrl-v5.9-2' of git://git.kernel.or..
>> git tree:       upstream
>> console output: https://syzkaller.appspot.com/x/log.txt?x=15781d8f900000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=89ab6a0c48f30b49
>> dashboard link: https://syzkaller.appspot.com/bug?extid=bf1a360e305ee719e364
>> compiler:       gcc (GCC) 10.1.0-syz 20200507
>> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16cbaa7d900000
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1364f367900000
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+bf1a360e305ee719e364@syzkaller.appspotmail.com
>>
>> vhci_hcd: stop threads
>> vhci_hcd: release socket
>> vhci_hcd: disconnect device
>> ==================================================================
>> BUG: KASAN: null-ptr-deref in instrument_atomic_write include/linux/instrumented.h:71 [inline]
>> BUG: KASAN: null-ptr-deref in atomic_fetch_add_relaxed include/asm-generic/atomic-instrumented.h:142 [inline]
>> BUG: KASAN: null-ptr-deref in refcount_add include/linux/refcount.h:201 [inline]
>> BUG: KASAN: null-ptr-deref in refcount_inc include/linux/refcount.h:241 [inline]
>> BUG: KASAN: null-ptr-deref in get_task_struct include/linux/sched/task.h:104 [inline]
>> BUG: KASAN: null-ptr-deref in kthread_stop+0x90/0x7e0 kernel/kthread.c:591
>> Write of size 4 at addr 000000000000001c by task kworker/u4:5/2519
>>
>> CPU: 1 PID: 2519 Comm: kworker/u4:5 Not tainted 5.9.0-rc7-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>> Workqueue: usbip_event event_handler
>> Call Trace:
>>   __dump_stack lib/dump_stack.c:77 [inline]
>>   dump_stack+0x198/0x1fd lib/dump_stack.c:118
>>   __kasan_report mm/kasan/report.c:517 [inline]
>>   kasan_report.cold+0x5/0x37 mm/kasan/report.c:530
>>   check_memory_region_inline mm/kasan/generic.c:186 [inline]
>>   check_memory_region+0x13d/0x180 mm/kasan/generic.c:192
>>   instrument_atomic_write include/linux/instrumented.h:71 [inline]
>>   atomic_fetch_add_relaxed include/asm-generic/atomic-instrumented.h:142 [inline]
>>   refcount_add include/linux/refcount.h:201 [inline]
>>   refcount_inc include/linux/refcount.h:241 [inline]
>>   get_task_struct include/linux/sched/task.h:104 [inline]
>>   kthread_stop+0x90/0x7e0 kernel/kthread.c:591
>>   vhci_shutdown_connection+0x170/0x2a0 drivers/usb/usbip/vhci_hcd.c:1015
>>   event_handler+0x1a5/0x450 drivers/usb/usbip/usbip_event.c:78
>>   process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
>>   worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
>>   kthread+0x3b5/0x4a0 kernel/kthread.c:292
>>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
>> ==================================================================
>> Kernel panic - not syncing: panic_on_warn set ...
>> CPU: 1 PID: 2519 Comm: kworker/u4:5 Tainted: G    B             5.9.0-rc7-syzkaller #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
>> Workqueue: usbip_event event_handler
>> Call Trace:
>>   __dump_stack lib/dump_stack.c:77 [inline]
>>   dump_stack+0x198/0x1fd lib/dump_stack.c:118
>>   panic+0x382/0x7fb kernel/panic.c:231
>>   end_report+0x4d/0x53 mm/kasan/report.c:104
>>   __kasan_report mm/kasan/report.c:520 [inline]
>>   kasan_report.cold+0xd/0x37 mm/kasan/report.c:530
>>   check_memory_region_inline mm/kasan/generic.c:186 [inline]
>>   check_memory_region+0x13d/0x180 mm/kasan/generic.c:192
>>   instrument_atomic_write include/linux/instrumented.h:71 [inline]
>>   atomic_fetch_add_relaxed include/asm-generic/atomic-instrumented.h:142 [inline]
>>   refcount_add include/linux/refcount.h:201 [inline]
>>   refcount_inc include/linux/refcount.h:241 [inline]
>>   get_task_struct include/linux/sched/task.h:104 [inline]
>>   kthread_stop+0x90/0x7e0 kernel/kthread.c:591
>>   vhci_shutdown_connection+0x170/0x2a0 drivers/usb/usbip/vhci_hcd.c:1015
>>   event_handler+0x1a5/0x450 drivers/usb/usbip/usbip_event.c:78
>>   process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
>>   worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
>>   kthread+0x3b5/0x4a0 kernel/kthread.c:292
>>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
>> Kernel Offset: disabled
>> Rebooting in 86400 seconds..
> 
> Hi Valentina and Shuah,
> 
> There appears to be a race condition in the USB/IP vhci_hcd shutdown
> procedure. It happens quite often during fuzzing with syzkaller, and
> prevents us from going deeper into the USB/IP code.
> 
> Could you advise us what would be the best fix for this?
> 

Hi Andrey,

Reading the comments for this routine, looks like there is an assumption
that context begins cleanup and race conditions aren't considered.

The right fix is holding vhci->lock and vdev->priv_lock to protect
critical sections in this routine. I will send a patch for this.

thanks,
-- Shuah


