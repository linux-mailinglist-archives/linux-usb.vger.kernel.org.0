Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9644489C6D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jan 2022 16:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236380AbiAJPmR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jan 2022 10:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236373AbiAJPmQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jan 2022 10:42:16 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3FA7C061748
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 07:42:16 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id y10so2390553qtw.1
        for <linux-usb@vger.kernel.org>; Mon, 10 Jan 2022 07:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DDN57VZ5dxd2+2ecHBrgkClEZHp+sgIvGNjxzq+ARR0=;
        b=G3DPk4/fTlHo+oKZp/8aMtDAnQuoyrUUK5rQPsQuzpQAY3r19uOOSzQrYfj/M6Gigj
         sArLVoXQsQFFdtBg06v8db1A/bkXcvCOochIku4VRDOhdNLntpv3xHMPMLDe3TbZjQlW
         KRWrVE0pzbYAA/taQLahAxpTUGN9jdxuf7V/KuYUlHKW66PbL6aXxSieXmI5MIvEteUX
         1e3ajgxV4omx+ZK/6xxRrH1IOM4nVxMxPXQut6cGX6Pj5+6l4d5nzuIp4elLKQ/PJxBU
         RAICtb+laDO4uktMJyj01ks6/KS2iway1wfRQYaMIfIVoXkPCqNcWDbevtbPyoby4G7j
         D3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DDN57VZ5dxd2+2ecHBrgkClEZHp+sgIvGNjxzq+ARR0=;
        b=Dav+pgWxZh0EB3AuzDDrifliHuJCzNrWeSELzx6gJPHXdwxO1tAkMk9/hknPZp+6H7
         YOCbnV+a/KAKxuQxcM48+Uib153vfYG1A5HgK3qfnzCXKgpm1tS9gZfxofMzIEWn5cEJ
         KhaxF4oV4jT8ePeFvbRTEc3l8v8x/gF0ODwkA647+q8DVeE1hmyCrKLTbsDXErHSc7yE
         HSoU4s8bf/u6rT+R7UGbuxRaBDJvorx6LK1Zs1LiuB2cBgagm4Zwe2+edCmK3/e1AmZL
         u/gUVBneVW2+k6ZQk1g7D3CL50JPvDZ0m3PG1xxxQZ9WLHvWKaY553FpkeibP52Iit0+
         uDow==
X-Gm-Message-State: AOAM533iP6IoxAjfkAWYOaoWRH+yTNWwovIYMYHvxDwkmS7YHdGkkzM5
        MVfR64vZjqYUXD9/lhTGJCUWUn7v7isgqbDpgDrwzg==
X-Google-Smtp-Source: ABdhPJzilu5eKKCnPAvRjZ+iSnCsvCDyVDuwUko3ioYoySqoWMaWxkQuhLvM2Cgo6p/1WrpqMN9x8WKhF8iNRWmwXps=
X-Received: by 2002:a05:622a:2d5:: with SMTP id a21mr263977qtx.56.1641829335633;
 Mon, 10 Jan 2022 07:42:15 -0800 (PST)
MIME-Version: 1.0
References: <000000000000be665505d4d9ebd6@google.com> <60e9caf1-7b9f-c5a4-a3e8-ff9135e16197@gmail.com>
In-Reply-To: <60e9caf1-7b9f-c5a4-a3e8-ff9135e16197@gmail.com>
From:   Alexander Potapenko <glider@google.com>
Date:   Mon, 10 Jan 2022 16:41:39 +0100
Message-ID: <CAG_fn=U_z-J2ZxVKD5CvTkOStfqtZ9eCx4qj0cJfzqz44EjFjA@mail.gmail.com>
Subject: Re: [syzbot] KMSAN: kernel-usb-infoleak in usbnet_write_cmd (3)
To:     Pavel Skripkin <paskripkin@gmail.com>
Cc:     syzbot <syzbot+003c0a286b9af5412510@syzkaller.appspotmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        johan@kernel.org, LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 6, 2022 at 11:17 PM Pavel Skripkin <paskripkin@gmail.com> wrote=
:
>
> On 1/5/22 21:28, syzbot wrote:
> > Hello,
> >
> > syzbot found the following issue on:
> >
> > HEAD commit:    81c325bbf94e kmsan: hooks: do not check memory in kmsan=
_in..
> > git tree:       https://github.com/google/kmsan.git master
> > console output: https://syzkaller.appspot.com/x/log.txt?x=3D14a07163b00=
000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D2d8b9a11641=
dc9aa
> > dashboard link: https://syzkaller.appspot.com/bug?extid=3D003c0a286b9af=
5412510
> > compiler:       clang version 14.0.0 (/usr/local/google/src/llvm-git-mo=
norepo 2b554920f11c8b763cd9ed9003f4e19b919b8e1f), GNU ld (GNU Binutils for =
Debian) 2.35.2
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D100165dbb=
00000
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D10c97e77b00=
000
> >
> > IMPORTANT: if you fix the issue, please add the following tag to the co=
mmit:
> > Reported-by: syzbot+003c0a286b9af5412510@syzkaller.appspotmail.com
> >
>
> Heh, I think, more reports like this will appear soon. Syzbot learned
> how to tweak usb read functions return values, I guess?

This has been possible long ago. I think these new reports are related
to fresh KMSAN changes (and also the fact KMSAN was broken for a while
last year, and is now catching up).

> #syz test: https://github.com/google/kmsan.git master
>
>
>
> With regards,
> Pavel Skripkin



--=20
Alexander Potapenko
Software Engineer

Google Germany GmbH
Erika-Mann-Stra=C3=9Fe, 33
80636 M=C3=BCnchen

Gesch=C3=A4ftsf=C3=BChrer: Paul Manicle, Halimah DeLaine Prado
Registergericht und -nummer: Hamburg, HRB 86891
Sitz der Gesellschaft: Hamburg
