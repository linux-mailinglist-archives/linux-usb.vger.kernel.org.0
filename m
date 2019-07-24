Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 061737318E
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2019 16:25:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfGXOZK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Jul 2019 10:25:10 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46188 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfGXOZK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Jul 2019 10:25:10 -0400
Received: by mail-pg1-f196.google.com with SMTP id k189so2280235pgk.13
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2019 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zeiboGSV7ypLA6dVtPYsNtNIh035XqkP74sEvzaLWW8=;
        b=Pmagx+/ziuTOsvielbY4z1LP1u14ot91S39ggDgrdZTUssRHH0vrvUR/uxFpkCYjBN
         WjMoRkhoe5I3OHMUlooZdztdfA6xrrwrofkfJq965JFnbnr0o52wIt5iWzm0kahaGFTu
         h9nSIU2rCswCk3Ez5biY2V3LuYv3lA7UZraFCg9LnLvFbalWqgIuT9KVjUNJfQsf2P8N
         I98AigjLweb3NRV2ApOuRPVLLAyzxfuyrtcaJ34BHJ8iXDRiwEkcqV+Rw3iIRPC0lshp
         pYLAkeF+C04MpVqPOCitVVUk13ccsAj6eUkj4KKya1in7YFPNizfJ37N5wPPL5TMb+At
         l/Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zeiboGSV7ypLA6dVtPYsNtNIh035XqkP74sEvzaLWW8=;
        b=UuxvMS36PvIBgbHyUlPccv4+XsSzL1A0lZnOkKNz92kjqSNmL3RtHRR/VsIbdxn2pc
         DvldX0KXDYq+5ZOqsRo2kQNgRa3yqGUcbHJcvIjD7rZexjExpZrqwBFP5ekqxcKX7LiR
         adkaxil4jx5xMj8G4wuGB5c9PPoCcX0s/oRl941uXaoOcoNeEQ/IY8c/gy7sTLYHT2+Y
         kkA1AAFg38eE6M495/4ycXvj+v+xY6TeFqjO8moLIITbhQb5BTEZ+wllvBUyayF+A+6A
         1g46Nh8MbbjmHzAXDiXnJCvNhC6kMVqoiVKWloB9Ky9WDRIFjz3te+UW4gGzqPGi8sWM
         dmFA==
X-Gm-Message-State: APjAAAVhTV8EvRiNNGq7DpEXzWa+Rt77yWuNwo0sqQcV8IHuIWHiKBPH
        NUiG3FqWQsl/4YDR0hJVJm2bem6YdtB9p33IxTLgsw==
X-Google-Smtp-Source: APXvYqwfjIKHX+tJXl8xh6pWa+B5dCG49t49e2sDtBf7Bs0Yz/UNqB0hu6apHj84EXj2entUm4ziZIPPAJhdd+XcnxI=
X-Received: by 2002:a63:c442:: with SMTP id m2mr82929692pgg.286.1563978309069;
 Wed, 24 Jul 2019 07:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000bb4247058e589a20@google.com> <1563977855.4670.8.camel@suse.com>
In-Reply-To: <1563977855.4670.8.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 24 Jul 2019 16:24:58 +0200
Message-ID: <CAAeHK+xqTgexC8sQtsXpsnEv5VpqgUDxR8kLfHa7NHeUR_p7OQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 24, 2019 at 4:17 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Dienstag, den 23.07.2019, 05:48 -0700 schrieb syzbot:
> >
> > Freed by task 243:
> >   save_stack+0x1b/0x80 /mm/kasan/common.c:71
> >   set_track /mm/kasan/common.c:79 [inline]
> >   __kasan_slab_free+0x130/0x180 /mm/kasan/common.c:451
> >   slab_free_hook /mm/slub.c:1421 [inline]
> >   slab_free_freelist_hook /mm/slub.c:1448 [inline]
> >   slab_free /mm/slub.c:2994 [inline]
> >   kfree+0xd7/0x280 /mm/slub.c:3949
> >   skb_free_head+0x8b/0xa0 /net/core/skbuff.c:588
> >   skb_release_data+0x41f/0x7c0 /net/core/skbuff.c:608
> >   skb_release_all+0x46/0x60 /net/core/skbuff.c:662
> >   __kfree_skb /net/core/skbuff.c:676 [inline]
> >   consume_skb /net/core/skbuff.c:736 [inline]
> >   consume_skb+0xc0/0x2f0 /net/core/skbuff.c:730
> >   skb_free_datagram+0x16/0xf0 /net/core/datagram.c:328
> >   netlink_recvmsg+0x65e/0xea0 /net/netlink/af_netlink.c:2001
> >   sock_recvmsg_nosec /net/socket.c:877 [inline]
> >   sock_recvmsg /net/socket.c:894 [inline]
> >   sock_recvmsg+0xca/0x110 /net/socket.c:890
> >   ___sys_recvmsg+0x271/0x5a0 /net/socket.c:2448
> >   __sys_recvmsg+0xe9/0x1b0 /net/socket.c:2497
> >   do_syscall_64+0xb7/0x560 /arch/x86/entry/common.c:301
> >   entry_SYSCALL_64_after_hwframe+0x49/0xbe
>
> How reliable is this trace? It seems very likely to me that this bug
> is the same bug as
>
> syzbot <syzbot+ded1794a717e3b235226@syzkaller.appspotmail.com>
> KASAN: use-after-free Read in hidraw_ioctl
>
> which shows a race with disconnect() instead of some networking code,
> which I really cannot fathom.

To me the alloc/free stack trace doesn't seem to have anything to do
with the access stack trace here, so I wouldn't rely on them. This is
a limitation of KASAN and can happen when there's a wild memory access
or a huge out-of-bounds or some kind of a racy-use-after-free.

>
>         Regards
>                 Oliver
>
