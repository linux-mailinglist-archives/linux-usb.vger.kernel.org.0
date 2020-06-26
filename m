Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4DAE20B836
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 20:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbgFZS0H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 14:26:07 -0400
Received: from netrider.rowland.org ([192.131.102.5]:49509 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725780AbgFZS0G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 14:26:06 -0400
Received: (qmail 305618 invoked by uid 1000); 26 Jun 2020 14:26:05 -0400
Date:   Fri, 26 Jun 2020 14:26:05 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+145012a46658ac00fc9e@syzkaller.appspotmail.com>
Cc:     alsa-devel@alsa-project.org, andreyknvl@google.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        perex@perex.cz, syzkaller-bugs@googlegroups.com, tiwai@suse.com
Subject: Re: KASAN: use-after-free Read in line6_submit_audio_in_all_urbs
Message-ID: <20200626182605.GA305214@rowland.harvard.edu>
References: <000000000000d44c6d05a8ffe488@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000d44c6d05a8ffe488@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 26, 2020 at 10:18:12AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    fb574682 usbip: tools: fix module name in man page
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=156560b1100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=63b40b2ae167bad6
> dashboard link: https://syzkaller.appspot.com/bug?extid=145012a46658ac00fc9e
> compiler:       gcc (GCC) 10.1.0-syz 20200507
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+145012a46658ac00fc9e@syzkaller.appspotmail.com
> 
> snd_usb_toneport 5-1:0.0: URB in #0 submission failed (-19)
> snd_usb_toneport 5-1:0.0: URB in #0 submission failed (-19)
> snd_usb_toneport 5-1:0.0: URB in #0 submission failed (-19)
> snd_usb_toneport 5-1:0.0: URB in #0 submission failed (-19)
> ==================================================================
> BUG: KASAN: use-after-free in line6_submit_audio_in_all_urbs+0x10b/0x120 sound/usb/line6/capture.c:72
> Read of size 8 at addr ffff8881cffb1800 by task kworker/1:5/3257
> 
> CPU: 1 PID: 3257 Comm: kworker/1:5 Not tainted 5.8.0-rc1-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: events line6_startup_work
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0xf6/0x16e lib/dump_stack.c:118
>  print_address_description.constprop.0+0x1a/0x210 mm/kasan/report.c:383
>  __kasan_report mm/kasan/report.c:513 [inline]
>  kasan_report.cold+0x37/0x7c mm/kasan/report.c:530
>  line6_submit_audio_in_all_urbs+0x10b/0x120 sound/usb/line6/capture.c:72
>  line6_stream_start+0x207/0x230 sound/usb/line6/pcm.c:197
>  line6_pcm_acquire+0x161/0x210 sound/usb/line6/pcm.c:318
>  line6_startup_work+0x42/0x50 sound/usb/line6/driver.c:734
>  process_one_work+0x94c/0x15f0 kernel/workqueue.c:2269
>  worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
>  kthread+0x392/0x470 kernel/kthread.c:291
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:293
> 
> Allocated by task 76:
>  save_stack+0x1b/0x40 mm/kasan/common.c:48
>  set_track mm/kasan/common.c:56 [inline]
>  __kasan_kmalloc.constprop.0+0xc2/0xd0 mm/kasan/common.c:494
>  kmalloc include/linux/slab.h:555 [inline]
>  kzalloc include/linux/slab.h:669 [inline]
>  line6_init_pcm+0x2a7/0x9e0 sound/usb/line6/pcm.c:533
>  toneport_init+0xdd/0x6b0 sound/usb/line6/toneport.c:419
>  line6_probe+0xaa0/0x1330 sound/usb/line6/driver.c:809

It look like the cancel_delayed_work() in line6_disconnect() needs to be 
cancel_delayed_work_sync().  Unfortunately we can't test this until syzbot 
is able to reproduce the bug.

Alan Stern
