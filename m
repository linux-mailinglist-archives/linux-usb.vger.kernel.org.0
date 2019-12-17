Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A8C122CAB
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 14:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727899AbfLQNPl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 08:15:41 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39861 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727029AbfLQNPl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 08:15:41 -0500
Received: by mail-pl1-f195.google.com with SMTP id z3so4571722plk.6
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2019 05:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PaUSE0i/E4dAKUPfsxcD2yIPlQcR3DFv2n8z6uzKeUA=;
        b=aU8hKUArC7YGPpcFfOhvJ1VhZ2D9uXK4x2Gu0P2UMxxReV/EVjOTKD9DCEcxFpc0qm
         JhB1Jc0j04r4FyqR9A75qkJi4o61xqSbYA/QJJniSniyDMyxa1m1OvqvRNmyJfQzrEY9
         PU/jWoCpMtp7l4L2zzGEZfoO7bUVfKXuHU2ECXhy8NmgIvLULkoTl28002drQiJqxTeu
         1LOD3bffSvv+nnWNXYpOM+1DHSgX5RWhcA/5zRrLYhO1k34VpHxLU5/PR5LDcBKoLE6y
         5Wnqw2zjXGUXkO3o4jbYny8b1LEMiwEpwRt6NATX1Slm7B3qJLJgkSHtou46BR+c/PkU
         kQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PaUSE0i/E4dAKUPfsxcD2yIPlQcR3DFv2n8z6uzKeUA=;
        b=WZ/QlpsP4fEXfhtbtccCoTSiJKviU/+dx8MngNnbNVFXhVnDCP2JKjMDBD1jRWLH+M
         tfxhwlMeEU1r/e0/lEopWDHp7l5x6s47ZWAAU+XY6KCB/fykiMkunPZFJy8tA4Q/eEAO
         9eqayvNo3CcnYQfn/MtVlMygEmcR9x71tcUuIh9rF1YO1713VqjaeOkehOD4mECNKdQ9
         yAM/xwWEXRqqZzyeqvgwhFjs2mtSW9QeAM02VTst5oMNv5rfoJolxe4NkD1AXA+rD5Gr
         ncUfEik0ByZJiKz0ioNq7KWFQIH9aCbrO54rNOXa8xuoWzqE/MnRLREYG92JNWFO4GLR
         hxJg==
X-Gm-Message-State: APjAAAU5/7N+p+o3cwTdeMPT0p8wilQV1aZXvZOgDiI42XqDbYpGuMGJ
        gdrrB7zX0rDIGeCqDa7xSfbi+1b0hzksmbNPofiqHl/88XM=
X-Google-Smtp-Source: APXvYqySbnyo1U6H2RCB8pDbqOvuRYm9QgEOPUUhy2kDCoMm8Dd5Ss0BoUuE7nRR/WOJ8ht57ESPFePrZwwAUayUEIE=
X-Received: by 2002:a17:902:6b03:: with SMTP id o3mr1655529plk.252.1576588540116;
 Tue, 17 Dec 2019 05:15:40 -0800 (PST)
MIME-Version: 1.0
References: <000000000000029d340599e61e11@google.com>
In-Reply-To: <000000000000029d340599e61e11@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 17 Dec 2019 14:15:29 +0100
Message-ID: <CAAeHK+xOzKuNU0GNtqqdgx=rfrJhu4=yd_knBTBuDA5MKDu10A@mail.gmail.com>
Subject: Re: BUG: bad host security descriptor; not enough data (3 vs 5 left)
To:     syzbot <syzbot+7b2f76fab6cdba59689b@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 17, 2019 at 2:15 PM syzbot
<syzbot+7b2f76fab6cdba59689b@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    4cc037ec usb: gadget: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=17597049e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a2d3f61a19fd0cf1
> dashboard link: https://syzkaller.appspot.com/bug?extid=7b2f76fab6cdba59689b
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1724ae99e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17ed23a6e00000
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+7b2f76fab6cdba59689b@syzkaller.appspotmail.com
>
> usb 1-1: config 0 interface 0 altsetting 0 has 3 endpoint descriptors,
> different from the interface descriptor's value: 4
> usb 1-1: New USB device found, idVendor=13dc, idProduct=5611,
> bcdDevice=2f.15
> usb 1-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> usb 1-1: config 0 descriptor??
> hwa-hc 1-1:0.0: Wire Adapter v106.52 newer than groked v1.0
> hwa-hc 1-1:0.0: FIXME: USB_MAXCHILDREN too low for WUSB adapter (194 ports)
> usb 1-1: BUG: bad host security descriptor; not enough data (3 vs 5 left)
> usb 1-1: supported encryption types:
> usb 1-1: E: host doesn't support CCM-1 crypto
> hwa-hc 1-1:0.0: Wireless USB HWA host controller
> hwa-hc 1-1:0.0: new USB bus registered, assigned bus number 11
>
>
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches

#syz dup: BUG: bad host security descriptor; not enough data (4 vs 5 left)
