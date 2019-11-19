Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A14C1026FF
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2019 15:41:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbfKSOlc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Nov 2019 09:41:32 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:33478 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727255AbfKSOlc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Nov 2019 09:41:32 -0500
Received: by mail-pj1-f68.google.com with SMTP id o14so2724165pjr.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2019 06:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OSYfTpCeLoiCz6ar4Y5YCkx3V+95c+mgOu5iGHlEmLs=;
        b=mIh147tKxoB5iHq6Sr1ixvt392/H81YC4txurdUXGO4fdsuRJsZfRNmzjoYizdd6rX
         nGc7h+zlPVktQFpLiQCQMN3PAFS85Dc7P9Kxb0HSfmfILyTZUvPAs1NQw4Y8IvKGbRvP
         u8vGOxhGMWYqNB7ep+7hpo7JbeAgD6vTzGFYgpT+zXXPXmS2m7UdGtylxU5Gl12pacO/
         vdh65ZlWJk3w/TT+waRzqqrvSRtVQ7nq+jLQa2pND8LEO5bvL03GQhgZuqOoxWWukfrS
         5ZYiJKH1QsdRlqIi3oHjLKCdCUPhkRQKuvHk0iQbmgwAHmdIzHXBYH1YE9Ne1xMF16gz
         oXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OSYfTpCeLoiCz6ar4Y5YCkx3V+95c+mgOu5iGHlEmLs=;
        b=e46DsQ3xb+/HCnknOysa0E7Cgchu4dsCN4tUEdrSLlGGTcum+MauGMXoovbB9NWUBn
         yoNB8xVC7PrQi7UayD+4Jp5SAzuGux8rYvsa4I/cUV+4BevOJ9pVWotefxnMlgGkQmLG
         ScLBpntAkrW1LpqCaYvL2H7ho8x9/XuTOcvlZyrvnmqrj2XU2TbwQV0k3D5w2fhr1AF8
         V1ClbpG36XxFCjlyrkOwYHiHN8KQpL/Ezt/LlnOutthCIwIISV6ID8PpnKXokJNYlX90
         rQ5c+qqC4HGBmmpj/dKAhuaCsE785Gckq7/rEx9qZFaAB13DRvI5BJZ+axWjNcxif7Tp
         sRmQ==
X-Gm-Message-State: APjAAAUgj4YRzviXhpIsRC3YQ5hNIUiKgrjnDUCRnSI+ERFSLSo3pCpm
        YucgyyIQ759zq1bWig3XqKHjeXbyq8CJ7nC1GKk7kQ==
X-Google-Smtp-Source: APXvYqwNT/0sPHSivxokIq2Ao+cp8Lh+ljvm77BDSPn8sYnI3sbqDNPMhQ1jWCaHD21W7sfzidfYsTd4IcmvXsUCiK0=
X-Received: by 2002:a17:902:9682:: with SMTP id n2mr31713409plp.336.1574174491437;
 Tue, 19 Nov 2019 06:41:31 -0800 (PST)
MIME-Version: 1.0
References: <000000000000d5795d0596acbc93@google.com>
In-Reply-To: <000000000000d5795d0596acbc93@google.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 19 Nov 2019 15:41:19 +0100
Message-ID: <CAAeHK+w599vgUcfDMtK+HDfQRw6Xnt-RzaVzeqGKJuoLf81_EA@mail.gmail.com>
Subject: Re: BUG: bad host security descriptor; not enough data (2 vs 5 left)
To:     syzbot <syzbot+8a8429a8b80280ff1c80@syzkaller.appspotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 6, 2019 at 1:32 PM syzbot
<syzbot+8a8429a8b80280ff1c80@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following crash on:
>
> HEAD commit:    b1aa9d83 usb: raw: add raw-gadget interface
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D153a1f8ae0000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D79de80330003b=
5f7
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D8a8429a8b80280f=
f1c80
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D10893fcce00=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D15bbaa62e0000=
0
>
> IMPORTANT: if you fix the bug, please add the following tag to the commit=
:
> Reported-by: syzbot+8a8429a8b80280ff1c80@syzkaller.appspotmail.com
>
> usb 1-1: config 0 interface 0 altsetting 0 has 3 endpoint descriptors,
> different from the interface descriptor's value: 4
> usb 1-1: New USB device found, idVendor=3D13dc, idProduct=3D5611,
> bcdDevice=3D40.15
> usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=3D0
> usb 1-1: config 0 descriptor??
> hwa-hc 1-1:0.0: Wire Adapter v106.52 newer than groked v1.0
> hwa-hc 1-1:0.0: FIXME: USB_MAXCHILDREN too low for WUSB adapter (194 port=
s)
> usb 1-1: BUG: bad host security descriptor; not enough data (2 vs 5 left)
> usb 1-1: supported encryption types: =EF=BF=BD=EF=BF=BD=CF=81=EF=BF=BD=EF=
=BF=BD=EF=BF=BD|=EF=BF=BD=EF=BF=BD=CF=81=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=CF=81=EF=BF=BD=EF=BF=BD=EF=BF=BD
> usb 1-1: E: host doesn't support CCM-1 crypto
> hwa-hc 1-1:0.0: Cannot initialize internals: -19
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
