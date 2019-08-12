Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1B8B8A116
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2019 16:29:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726585AbfHLO3Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Aug 2019 10:29:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36185 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbfHLO3Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Aug 2019 10:29:24 -0400
Received: by mail-pg1-f196.google.com with SMTP id l21so49572062pgm.3
        for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2019 07:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kgc+ufQa/zKT6FeOOI3s2h5y3JF0OeR98gHwBxUUxjA=;
        b=nMeaQV50kw90waitZt4DI4UbgHi0Uw62SALf7HVWPvK98JkbJpLn1gzs4mfkboMrXi
         7KE9Nbd4mWoAldp31j++yJ09anZKlos50PIb35FR9ie9bBeDpiR6OqTd9iZfpV9iGRIp
         swGiYSyyqzWH6q7kuJ0/WS8O5we1olYkCzCoBTwZaObfzeY3oDviimkyOO3qMdubo/ke
         v1A7+PyNqzauV1louLqxTgsMUtDF4n9aR66rPD+rjAK2uwPaiPwRYu39XClr1Ww3wr3+
         wgw9950xp338RugEz5vX3X/QZa5jH2OJuL1l0JygId5aOa4SqvtlceDtRLLzEGB4ZnR9
         w38g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kgc+ufQa/zKT6FeOOI3s2h5y3JF0OeR98gHwBxUUxjA=;
        b=r6o7FtEeaRtoruMEGfCkIshHl8bFNw4kAcr580c/LAO7y9lXfGK17N8xh9zBKyqDTP
         ZaleTOdLvzD0p1a+kLrEZAD9dkzU6nehcAzJJCOXeyTAEXFwvj75dYc8jsgDwInEOnjd
         44K/eMbHbyB2fRtQN6T3mOFgDnsJwc/FtUZ+IAnFlPaZBSlnufSlNe3UFtm21s38XKKK
         BV98LXwbrPENt3KxTU14xRYkzYHen+zunRSpy6o3Jq1RexKtMlBbkO17OioR1btzFXnm
         YSzoLHqhGjw2MlYwNRBjxapRoN635+SrHYUe6JGmZMBbKwVbDMTtUBk+cSbUGqB/Pqv+
         VO2g==
X-Gm-Message-State: APjAAAVaTSgp40JXeaK0F8vXOVEb8LyOcVnMbT9IeBbw9vKiQjX0In5o
        86y+hb1/8latNz06AjIqIWQ0BM0VnrI2NolYcvFRJg+l19ngdw==
X-Google-Smtp-Source: APXvYqw59HxhNslXOeCVJM1UuWIHtAtaIQHLyAZOmayA1aEom4L64qlboFBVN0z10ymtkOfMMCFzBzLibppH2aO5edk=
X-Received: by 2002:aa7:86c6:: with SMTP id h6mr36388002pfo.51.1565620163764;
 Mon, 12 Aug 2019 07:29:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+yWhR2bwknCA9pTjy8qFE3-xCcEEZ5Skm5=sYCuypvo_A@mail.gmail.com>
 <0000000000004de4e2058fb31c2b@google.com>
In-Reply-To: <0000000000004de4e2058fb31c2b@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 12 Aug 2019 16:29:12 +0200
Message-ID: <CAAeHK+y43XsSpg++xXW2yTHHHgTsatPFunn4_R4yP5=ZnXoHoQ@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in usbhid_power
To:     syzbot <syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com>
Cc:     Hillf Danton <hdanton@sina.com>,
        USB list <linux-usb@vger.kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 9, 2019 at 8:12 PM syzbot
<syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot has tested the proposed patch and the reproducer did not trigger
> crash:
>
> Reported-and-tested-by:
> syzbot+ef5de9c4f99c4edb4e49@syzkaller.appspotmail.com

OK, I'm duping this BUG to the similar one that Hillf fixed:

#syz dup: general protection fault in __pm_runtime_resume

If there are more issues with PM counters, syzbot will rereport them
once the fix is in its tree.

>
> Tested on:
>
> commit:         6a3599ce usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git
> kernel config:  https://syzkaller.appspot.com/x/.config?x=700ca426ab83faae
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> patch:          https://syzkaller.appspot.com/x/patch.diff?x=17fcd52c600000
>
> Note: testing is done by a robot and is best-effort only.
>
> --
> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000004de4e2058fb31c2b%40google.com.
