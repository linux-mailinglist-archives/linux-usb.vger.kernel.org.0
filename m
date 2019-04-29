Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48DCDEB99
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 22:25:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729348AbfD2UZL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 16:25:11 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45549 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729219AbfD2UZL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 16:25:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id e24so5876683pfi.12
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1CtnNJLTKQeKNqe9H3oBDsxYahuwKgdqS6BDAiuhis=;
        b=OcOdYGSjoqGgP+9qozjThuOdbyNJa2g6ba6tCSN6FKW/tyzs29nVCI7Fz7gaZNDgL/
         c3vT8CAWS7fOYEJErBqVjf8RzH9wA30+oGIvuyP1eLzXiHJFzioonQw1+AlOTEwQyS4c
         GMiesjzrgBHUYCWjr/Vk46dXGbbgi2ZzO65hbbQVnJgmeNv476wyNMlrtITcGyiJx/vH
         zgLnh4FYseW4CERtnqnRJYO32P3Sm4XADgvX1+G6zj8ODYQ9C8UKGM7F7TXsiycpVH70
         pWxIKHlOfeLbMLxLewSbQDFoBkv9WdayP2LdQpAZ6A6hHThcphMWjZ8HZuseBdSRILrX
         QVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1CtnNJLTKQeKNqe9H3oBDsxYahuwKgdqS6BDAiuhis=;
        b=rQb/7WnPfqYIUP7dgRAp/MmCfn/ZJpyu8ZXS7iBLEXHBCZW/o5iW/DKITwh196icf8
         h1hLf5v06QROFE2DBcrmtw7hQKk6W0+eUXgoUn5WyM0MwzGLv3dyn1lY+6GIjarpW6QN
         RJC4upz25Vv/tOmgz/Gckxi256E60Q3+S/5bkUG0jUGkW/sYhFKNK0jA7Hmr8/6gRU3P
         k7y+e04BpkXzI8vY5VkCS23a9pQXO250qOG0YzmQ+BCT6NHhsQcYxZySk+a64KE4L3NO
         4yqGbMdssPpDDXesuARI0cLQ0qr7VlcwcodTA21Z7vWGnUTJi+S6iX9RRWqDez793ecM
         BKpw==
X-Gm-Message-State: APjAAAXkUo99xeFQailm+m9wKZsSYMu0yt4J7qsVSBGHiYzpO6n/XHWL
        uK8mIsK+DMK8T/lncQkeWGki2TB3j7/ZjNMGTdK9Mg==
X-Google-Smtp-Source: APXvYqytEv9jIthvMXb7Hr5O4G+5mBszKnFY+cirNvsMeaj7P5tbMGKThw6V77WF0CzrbH30lOEo4eY0phP299nii9E=
X-Received: by 2002:a65:5148:: with SMTP id g8mr19379147pgq.168.1556569510211;
 Mon, 29 Apr 2019 13:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000f69c3b0587aa1bc5@google.com> <Pine.LNX.4.44L0.1904291604510.1632-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1904291604510.1632-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 29 Apr 2019 22:24:59 +0200
Message-ID: <CAAeHK+w2YKjSuTT39Rvb9mkdD=HuaYLhgZu4==hK18f=7fNxvQ@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hex_string
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+a9fefd18c7b240f19c54@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, rafael@kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 29, 2019 at 10:07 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 29 Apr 2019, syzbot wrote:
>
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    43151d6c usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=139ac37f200000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=4183eeef650d1234
> > dashboard link: https://syzkaller.appspot.com/bug?extid=a9fefd18c7b240f19c54
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17f3b338a00000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+a9fefd18c7b240f19c54@syzkaller.appspotmail.com
> >
> > ==================================================================
> > BUG: KASAN: slab-out-of-bounds in hex_string+0x418/0x4b0 lib/vsprintf.c:975
> > Read of size 1 at addr ffff88821a41bd38 by task kworker/0:1/12
> >
> > CPU: 0 PID: 12 Comm: kworker/0:1 Not tainted 5.1.0-rc3-319004-g43151d6 #6
> > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> > Google 01/01/2011
> > Workqueue: usb_hub_wq hub_event
> > Call Trace:
> >   __dump_stack lib/dump_stack.c:77 [inline]
> >   dump_stack+0xe8/0x16e lib/dump_stack.c:113
> >   print_address_description+0x6c/0x236 mm/kasan/report.c:187
> >   kasan_report.cold+0x1a/0x3c mm/kasan/report.c:317
> >   hex_string+0x418/0x4b0 lib/vsprintf.c:975
> >   pointer+0x460/0x910 lib/vsprintf.c:1985
> >   vsnprintf+0x5a0/0x16b0 lib/vsprintf.c:2400
> >   pointer+0x60b/0x910 lib/vsprintf.c:2038
> >   vsnprintf+0x5a0/0x16b0 lib/vsprintf.c:2400
> >   vscnprintf+0x29/0x80 lib/vsprintf.c:2499
> >   vprintk_store+0x45/0x4b0 kernel/printk/printk.c:1900
> >   vprintk_emit+0x210/0x5a0 kernel/printk/printk.c:1957
> >   dev_vprintk_emit+0x50e/0x553 drivers/base/core.c:3185
> >   dev_printk_emit+0xbf/0xf6 drivers/base/core.c:3196
> >   __dev_printk+0x1ed/0x215 drivers/base/core.c:3208
> >   _dev_info+0xdc/0x10e drivers/base/core.c:3254
> >   dlfb_parse_vendor_descriptor drivers/video/fbdev/udlfb.c:1532 [inline]
>
> Accessing beyond the end of the descriptor.
>
> #syz test: https://github.com/google/kasan.git usb-fuzzer

Hi Alan,

Thanks for the patch!

syzbot should now be able to understand the quilt patch format that
you use, feel free to give it a try next time :)

>
> --- a/drivers/video/fbdev/udlfb.c
> +++ b/drivers/video/fbdev/udlfb.c
> @@ -1511,6 +1511,7 @@ static int dlfb_parse_vendor_descriptor(
>         char *buf;
>         char *desc_end;
>         int total_len;
> +       int width;
>
>         buf = kzalloc(MAX_VENDOR_DESCRIPTOR_SIZE, GFP_KERNEL);
>         if (!buf)
> @@ -1529,9 +1530,10 @@ static int dlfb_parse_vendor_descriptor(
>         }
>
>         if (total_len > 5) {
> +               width = min(total_len, 11);
>                 dev_info(&intf->dev,
> -                        "vendor descriptor length: %d data: %11ph\n",
> -                        total_len, desc);
> +                        "vendor descriptor length: %d data: %*ph\n",
> +                        total_len, width, desc);
>
>                 if ((desc[0] != total_len) || /* descriptor length */
>                     (desc[1] != 0x5f) ||   /* vendor descriptor type */
>
>
