Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56D991038A9
	for <lists+linux-usb@lfdr.de>; Wed, 20 Nov 2019 12:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729172AbfKTLZE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 Nov 2019 06:25:04 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34283 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728376AbfKTLZD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 Nov 2019 06:25:03 -0500
Received: by mail-qk1-f195.google.com with SMTP id b188so660254qkg.1
        for <linux-usb@vger.kernel.org>; Wed, 20 Nov 2019 03:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rJPYiGKXpEMNQLJlyZqBJR8+8IIXsVVFLlcxm67gekc=;
        b=pCLRaYgg3Nv9opD/ko9q/x57IFuehCW8B0R9iex/5I6WfuOqky5d77IUALMAELT9w0
         pJc4AMzQ0WmWwsNoIE+6T0FbGI2vwggfY7Fj/IcDyselUqQfocP6+wGxPE9X+qNog/Uo
         y9iVORvDU5Qqijr6mVptLft/uRq443mEtBSqOKULLQfrHwRWynJGkiRmAwq9I2OfQuoM
         MpJCf7VpO9CMLZBey4HByRtgDU5qOi9psxPQH/QFCqrvxG1ioo1uqgzbrXjeOHIC1qzk
         JRqtHgqj3XWLCarXZ9b+K0i/2lb+8PmmEE6SmMWQ3x5qyqyZMQc5XRSNxwNdSJxHhzjD
         pVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rJPYiGKXpEMNQLJlyZqBJR8+8IIXsVVFLlcxm67gekc=;
        b=hmrKVAB/N7CbuNCmWAi06+bIdq+zhjGxz+MH6Nz/wI+6MvnW39f0SpHMr7HJMhKGvt
         k0jW+uAO/nnLE4cUhrXFQFjAwbMBCY4UX0AL5iCapLsoQ9BufLbTi/9hUk6gfBN+pjUK
         uTPccpp7EbhvBJ+BNKp5ms7OZWrQEPz+Oe7OD1VqmzPtxvBCLMxpjbfAYc1x8OQlb9SS
         cln08EJU0VWU26v1H+KNmVkmhi2tY8xe4rxJb9yQUM6jO+2bMGGJHCGXDC4CwEemZF9+
         MCGWffyvd7HGXxSKBVx3/JiLCVQ1BmhnGU5MMecUOxN/ClMXuEJHwHsUUk8MaHHKnB7P
         d62Q==
X-Gm-Message-State: APjAAAWbP2gk7afWDhaZ/NQDtOVTxVhwaUjJIRnjEDwJZtEOPKFpTLfg
        l3txWzjxM+9F5UfKuTCOioj5LfC6QAivwlJnt7bd1A==
X-Google-Smtp-Source: APXvYqzRemX2gUI2dfzg9EB4iJ4ZW+AQz1OyJ3lVN80mBtOXR9+mvOOYM4TxKoQkM3DSiazNgDrC0xmNwDkyfBYXPzk=
X-Received: by 2002:a37:6156:: with SMTP id v83mr1789842qkb.43.1574249102312;
 Wed, 20 Nov 2019 03:25:02 -0800 (PST)
MIME-Version: 1.0
References: <000000000000d9a391059713dc1f@google.com> <20191111160950.GA870254@kroah.com>
 <1574248737.14298.33.camel@suse.com>
In-Reply-To: <1574248737.14298.33.camel@suse.com>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Wed, 20 Nov 2019 12:24:50 +0100
Message-ID: <CACT4Y+ZQK4knKqPxESGspc1gBNA6rMTPW=28j3W-oexcyRRepw@mail.gmail.com>
Subject: Re: BUG: bad host security descriptor; not enough data (4 vs 5 left)
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Greg KH <greg@kroah.com>,
        syzbot <syzbot+d934a9036346e0215d8f@syzkaller.appspotmail.com>,
        Andrey Konovalov <andreyknvl@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 20, 2019 at 12:19 PM Oliver Neukum <oneukum@suse.com> wrote:
>
> Am Montag, den 11.11.2019, 17:09 +0100 schrieb Greg KH:
> > On Mon, Nov 11, 2019 at 07:34:08AM -0800, syzbot wrote:
> > > Hello,
> > >
> > > syzbot found the following crash on:
> > >
> > > HEAD commit:    3183c037 usb: gadget: add raw-gadget interface
> > > git tree:       https://github.com/google/kasan.git usb-fuzzer
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=3D12525dc6e=
00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=3D79de80330=
003b5f7
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=3Dd934a903634=
6e0215d8f
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D14ac740=
6e00000
> > > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D13eea39ae=
00000
> > >
> > > IMPORTANT: if you fix the bug, please add the following tag to the co=
mmit:
> > > Reported-by: syzbot+d934a9036346e0215d8f@syzkaller.appspotmail.com
> > >
> > > usb 1-1: config 0 interface 0 altsetting 0 has 3 endpoint descriptors=
,
> > > different from the interface descriptor's value: 4
> > > usb 1-1: New USB device found, idVendor=3D13dc, idProduct=3D5611,
> > > bcdDevice=3D2f.15
> > > usb 1-1: New USB device strings: Mfr=3D0, Product=3D0, SerialNumber=
=3D0
> > > usb 1-1: config 0 descriptor??
> > > hwa-hc 1-1:0.0: Wire Adapter v106.52 newer than groked v1.0
> > > hwa-hc 1-1:0.0: FIXME: USB_MAXCHILDREN too low for WUSB adapter (194 =
ports)
> > > usb 1-1: BUG: bad host security descriptor; not enough data (4 vs 5 l=
eft)
> > > usb 1-1: supported encryption types: =EF=BF=BDS =D0=81=EF=BF=BD=EF=BF=
=BD=EF=BF=BD|c =D0=81=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BDc =D0=81=EF=BF=BD=
=EF=BF=BD=EF=BF=BD
> > > usb 1-1: E: host doesn't support CCM-1 crypto
> > > hwa-hc 1-1:0.0: Wireless USB HWA host controller
> > > hwa-hc 1-1:0.0: new USB bus registered, assigned bus number 11
> >
> > wusb code, hah.  It's about to be deleted from the kernel because no on=
e
> > uses it and there is no hardware out there.  I wouldn't spend a ton of
> > time fuzzing it.
> >
> > One more good reason to just delete it soon...
>
> Unfortunately that is not an option for the stable trees. Before I try
> something quick and dirty here, I have a question for the testing team.
>
> What exactly crashed? There is nothing in the logs? Did you undergo
> an absolute freeze of the machine? Or do you tested for the word "BUG"
> in the logs?

Hi Oliver,

Yes, it's the "BUG:" on the console that's detected as kernel bug
(what's being produced by BUG_ON).

There are only 2 special bug types in syzkaller that are detected
based not on kernel output matching:
"lost connection to test machine":
https://syzkaller.appspot.com/bug?id=3Db97ec15bfe317ac1ddccb41f2a913d4f7a31=
c6d7
and "no output from test machine":
https://syzkaller.appspot.com/bug?id=3D0b210638616bb68109e9642158d4c0072770=
ae1c
(hopefully self-explanatory from the title).

The rest are based on output matching and what's matched is pretty
much the bug title/email subject.
