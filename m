Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB186102708
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 15:42:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728128AbfKSOlt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 09:41:49 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44678 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfKSOls (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Nov 2019 09:41:48 -0500
Received: by mail-pf1-f196.google.com with SMTP id q26so12253353pfn.11
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2019 06:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dF+ivxgCTPanWWoF5C1qzzPBT3PQ81LJ6vYrJ5PQ2+o=;
        b=d9MCjAtf3HcUeUDZxHNFN1stQiS49wMgNo3h4H0vX/o9JdElwWX1ywNG2EXThYd0RH
         +8cKRcvYNxir2JGucTC9qDkvAnfhhCW1oUlJ/O7O54NeuGPVjedoqsnoeCxrcFpVizvA
         e+w7+mW0+AabolNy6JD4ke6zN9p31LbQggY5kQ8JJH5DiO/PhH9Ocvt4U7gzuV5NbTqB
         2Tl+GDpnXxH/MIGmfHmZEXkLtrYgADsbvIrmOKswXFE1Jy20uZXQw4639Fr/gpyYG0Br
         Bol0KDBPWw2Wu1jear/lICrDt6UWwzZtAO9ynuu+YUmZA/SrV7YQpcqFK/Ww2iWV50dX
         PElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dF+ivxgCTPanWWoF5C1qzzPBT3PQ81LJ6vYrJ5PQ2+o=;
        b=fUUVDuzMMCFsfTI8xDlRSU7RGwozAe0DwsWzxNTNuEGkL6hHIWdG+aKfsvrEp/Qpg8
         FaFyHdrFvvqI3saeEaP68xzT+1t1hCxSK4QBKE0N5nDjXAnhRxh+MyHfjeSQp+HT0Rys
         IWrHVVzhD+in+Ic4PIKJL8n1vruMzflJG7Zmhi/IN9Jl1788vjg4BhnO3RVtHXHa1YkA
         g5rur8GfYhi25cCWY3uGggwzOduL9bdA+BrMviTdC4gOQKeM1UAzp1Q7Of25+ASvtV0g
         4yDm+vLrv4nNAHkFZO1cwEgGzyI247oQZXZC5rBkKqjfiY7kjzuUO012sWodFekse3mh
         nGPw==
X-Gm-Message-State: APjAAAXnnsvqC3QVA18iMPTth0sCsnjKEZQiVnRkfcZ8cxdA4HMLkzvE
        0e4LsTi7rfU64Vjp7TV068dfZZxmztHng0QKVSGNoasxxxA=
X-Google-Smtp-Source: APXvYqxdXyNFFcj5EZ5h5U7TXLjwCISllyxI/ZtTITEcJUZ+tLMedG7CTEI9fOQY3zr2M8tyq0eamnkb8U+8yPul9Fk=
X-Received: by 2002:a63:c804:: with SMTP id z4mr6093685pgg.440.1574174507326;
 Tue, 19 Nov 2019 06:41:47 -0800 (PST)
MIME-Version: 1.0
References: <000000000000835f920595f81bfa@google.com>
In-Reply-To: <000000000000835f920595f81bfa@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 19 Nov 2019 15:41:34 +0100
Message-ID: <CAAeHK+w6QNoy22Mo1juA-EWUe=zXjOtqmVNC0dWe_3ObUoWUvQ@mail.gmail.com>
Subject: Re: BUG: bad host encryption descriptor; descriptor is too short (0
 vs 5 needed)
To:     syzbot <syzbot+48fbe2f8fdcd2fbc1242@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 28, 2019 at 2:02 PM syzbot
<syzbot+48fbe2f8fdcd2fbc1242@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    22be26f7 usb-fuzzer: main usb gadget fuzzer driver
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D16eccc0f60000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D5fe29bc39eff9=
627
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D48fbe2f8fdcd2fb=
c1242
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D10d08e4ce00=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D11fb07ff60000=
0
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit=
:
> Reported-by: syzbot+48fbe2f8fdcd2fbc1242@syzkaller.appspotmail.com
>
> usb 1-1: config 0 interface 66 altsetting 0 has 3 endpoint descriptors,
> different from the interface descriptor's value: 4
> usb 1-1: New USB device found, idVendor=3D13dc, idProduct=3D5611,
> bcdDevice=3D40.15
> usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
> usb 1-1: config 0 descriptor??
> hwa-hc 1-1:0.66: Wire Adapter v125.52 newer than groked v1.0
> hwa-hc 1-1:0.66: FIXME: USB_MAXCHILDREN too low for WUSB adapter (53 port=
s)
> usb 1-1: BUG: bad host encryption descriptor; descriptor is too short (0 =
vs
> 5 needed)
> usb 1-1: supported encryption types: =EF=BF=BD=EF=BF=BD=EF=BF=BD=CF=81=EF=
=BF=BD=EF=BF=BD=EF=BF=BD|=EF=BF=BD=EF=BF=BD=CF=81=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=CF=81=EF=BF=BD=EF=BF=BD=EF=BF=BD
> usb 1-1: E: host doesn't support CCM-1 crypto
> hwa-hc 1-1:0.66: Cannot initialize internals: -19
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
