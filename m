Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA0B4F975
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 15:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfD3NCt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 09:02:49 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46792 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726264AbfD3NCs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 09:02:48 -0400
Received: by mail-pg1-f196.google.com with SMTP id n2so6789775pgg.13
        for <linux-usb@vger.kernel.org>; Tue, 30 Apr 2019 06:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EUf92X3/CFPF5O8LkOg3k5+MFVVEjqiXuDwCw5hULvo=;
        b=eZChldHjzdh6SZgyGrEdB1lIlKlNyR59umprzK+J6ojQgt3+w/1EtDjEAV+ugrS6IA
         XXSX2ARoW4VAX9SRxL2H4js6+yWNm4Be1QtUxe21Qtti6WwYxeUjau6ZN0BXjHROx95H
         CqmLFmYyXfLvBr6D8DXZ5PB+dY8bfLuR64oFlFAUKKajCY7ZEfyXhRmmI9Qiz3pJZK0o
         QXLQ9RdUom/CGMjeNbCMznBefRKB0VyLwNzVaR20v2/tu2bOTY+fxHkO8/U7WSToMhzB
         oonCY2LigvK4B9RHAh14IKb25kjV1SoxvmPLT0sTUQQmJWyfKLZTkBkj6vs4On2Hk/jM
         fNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EUf92X3/CFPF5O8LkOg3k5+MFVVEjqiXuDwCw5hULvo=;
        b=qqGGDbW1K0o+YIibX6cLYqtKnDxM281X2DXkGPzAusnc+SZFUNKuAdFEHdBzJWKO5x
         hzf9vA7Dkre6RBZKXlz/0C3Ri6ZUUq2a8PJxrrBiiJ9mm1kOf5EzdC3YJrp4mAh6qGub
         AOeJYmS3Hsi9zt7YV03mLdsJS+dkIK8mROS3h84+ayKVUfEi6xIQp5adcUKNSQi0YWyc
         pDQMnNKUOBKs6CbBS02EwrlPMbsaSIAa1dKMAGZ4/GaSxJRXMAbxa3s4erP7daPXurU0
         U48R1ucbQ91KACjuw6TJdGYaxa6TLuQ8L5OtG/J2P2DMb83lsXJJZBQH9s2exa1uN+rU
         57BA==
X-Gm-Message-State: APjAAAWRlYOaeJQSHrIptOaZo65iyrQIG6xKZWv7EjWJPzMYLtASITj7
        J4wLVIrhEJ4CWBxgfB5l9nRD78XlENxMkrAysAvU3g==
X-Google-Smtp-Source: APXvYqyx8gIOqCPX3v+F8e5U0qFzCC9+zaVq8B9iDlZjSphlUIZAkocPsy4BYNt/O7f9p528zhiBWFPTpZcGIf//zOg=
X-Received: by 2002:a65:5148:: with SMTP id g8mr24084881pgq.168.1556629367625;
 Tue, 30 Apr 2019 06:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <0000000000008d15ee058653b53e@google.com> <1556629116.20085.32.camel@suse.com>
In-Reply-To: <1556629116.20085.32.camel@suse.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 30 Apr 2019 15:02:36 +0200
Message-ID: <CAAeHK+w-miwjw78hbUmACgVhr+hbCN31SF+fNeEtdMn7-9=O+A@mail.gmail.com>
Subject: Re: KASAN: invalid-free in disconnect_rio
To:     Oliver Neukum <oneukum@suse.com>
Cc:     syzbot <syzbot+35f04d136fc975a70da4@syzkaller.appspotmail.com>,
        Cesar Miquel <miquel@df.uba.ar>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rio500-users@lists.sourceforge.net,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 30, 2019 at 2:58 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> On Fr, 2019-04-12 at 04:36 -0700, syzbot wrote:
> > Hello,
> >
> > syzbot found the following crash on:
> >
> > HEAD commit:    9a33b369 usb-fuzzer: main usb gadget fuzzer driver
> > git tree:       https://github.com/google/kasan/tree/usb-fuzzer
> > console output: https://syzkaller.appspot.com/x/log.txt?x=174ce2e3200000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=23e37f59d94ddd15
> > dashboard link: https://syzkaller.appspot.com/bug?extid=35f04d136fc975a70da4
> > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138150f3200000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1290c22d200000
> >
> > IMPORTANT: if you fix the bug, please add the following tag to the commit:
> > Reported-by: syzbot+35f04d136fc975a70da4@syzkaller.appspotmail.com
> >
> > usb 6-1: USB disconnect, device number 2
> > rio500 3-1:0.110: USB Rio disconnected.
> > usb 4-1: USB disconnect, device number 2
> > ==================================================================
> > usb 1-1: USB disconnect, device number 2
> > BUG: KASAN: double-free or invalid-free in slab_free mm/slub.c:3003 [inline]
> > BUG: KASAN: double-free or invalid-free in kfree+0xce/0x290 mm/slub.c:3958
> > usb 2-1: USB disconnect, device number 2
> >
>
> Try as I might, I don't understand this. I can see a memory leak,
> but not a double free.

I took a look at this some time ago, and I was under the impression
that this driver doesn't handle multiple devices being connected at
the same time well.

>
>         Regards
>                 Oliver
>
