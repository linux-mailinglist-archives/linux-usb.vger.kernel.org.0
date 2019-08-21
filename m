Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E15198006
	for <lists+linux-usb@lfdr.de>; Wed, 21 Aug 2019 18:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbfHUQ0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Aug 2019 12:26:45 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:35647 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727617AbfHUQ0p (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Aug 2019 12:26:45 -0400
Received: by mail-pl1-f194.google.com with SMTP id gn20so1603905plb.2
        for <linux-usb@vger.kernel.org>; Wed, 21 Aug 2019 09:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/lziEAnWIs7T/IMh7pvLAYKgxF1M/6L6xhkZk+PTzZo=;
        b=AF+IIIeHIq+dPK6gk+aCsHN2vKnAjqwvZuihG7Jet3NEoV5OgjEnchuWOGClLLH3iq
         Y4Jnmi7hlWG/Dn3ztrc+tWsOnALWnOX5vVTc1NtSiBX9F+jscmLYIJAQKZ5aQuAVYUG4
         0pRL70xnZAqBDUxRuuiTOIoV5mxKFMBLMtgYBwhHD/J2P/q3YXL66kEZXDdcTTLVlCf3
         HD4U4ZX4KkNuDt4YoJUbWJjJUOjBsfecG7bJFG/0BfxboCKOMO8unm3Y0oMLn27x/LOK
         BJgmeln/fKlN1V1JE43IY+76dixpXtcEDvQb7zOeu7A6BMVZ8Ayzq3Q9hyDlGxGu8Y04
         dffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/lziEAnWIs7T/IMh7pvLAYKgxF1M/6L6xhkZk+PTzZo=;
        b=BklESm0XViobJYvmZmg5TBGyvRWPjPj+ckdfp+RjfrLSITW60YFMG/h2mwdzQmyNU+
         jAQXNUO4WrpgzJ+qYY6kx8La9YyShhtYN+Thg/lI/KRL5jyVgYqWu8zc3kt7oTiDQaxi
         aeBXmnizTzsLJO1Gpazzq3Ptn+4i7sLrLRmaJQTW0Vj34WCByZ18yQGk5+xiArauRoIB
         4fz2oVpXbW7+Fk2sDmO3MJnJHmvpsVG/IJNgsc74QAcnDTGrBd90datTb5w9uiPRqLq6
         /+xj6ORgoCigl2XEaY72mwgel6Zp5FpskKvdjW1ZmMott9xTvBbzC/0V0jvL8akqVDad
         IsDQ==
X-Gm-Message-State: APjAAAWBGEeYpodUCseWoxfzZ/CvJbPyeDL6VOdM4IRFNanWrw/Qeg2o
        7feZIr29FKwfgqIddmVXkjMhWlbo8ltLFFuBkhHmng==
X-Google-Smtp-Source: APXvYqyWzm3ttwJ/qs5oATy4yQcZ4ErWYetxTfgsGlousGVCvxLNjVvJ3uxvSFrniw99IHUPTyRiot8PZ7LI3jrN8T0=
X-Received: by 2002:a17:902:bb94:: with SMTP id m20mr34062684pls.336.1566404804399;
 Wed, 21 Aug 2019 09:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+xQc5Ce6TwtERTmQ+6qSbuAmGikxCU5SNTdcDAynDEiig@mail.gmail.com>
 <Pine.LNX.4.44L0.1908211223070.1816-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1908211223070.1816-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 21 Aug 2019 18:26:33 +0200
Message-ID: <CAAeHK+z-o9naQXZoxwTXRh2WWQzFiRU9XruabNTTm31_1AbjAw@mail.gmail.com>
Subject: Re: KASAN: slab-out-of-bounds Read in hidraw_ioctl
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 21, 2019 at 6:24 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Wed, 21 Aug 2019, Andrey Konovalov wrote:
>
> > On Wed, Aug 21, 2019 at 3:37 PM syzbot
> > <syzbot+5a6c4ec678a0c6ee84ba@syzkaller.appspotmail.com> wrote:
> > >
> > > Hello,
> > >
> > > syzbot has tested the proposed patch but the reproducer still triggered
> > > crash:
> > > KASAN: slab-out-of-bounds Read in hidraw_ioctl
> >
> > Same here, a different bug.
>
> It looks like I've got the fix for both these bugs.  Testing now...

Great! Do you think "BUG: bad usercopy in hidraw_ioctl" can also be
fixed by one of those fixes?

>
> > > Tested on:
> > >
> > > commit:         e96407b4 usb-fuzzer: main usb gadget fuzzer driver
> > > git tree:       https://github.com/google/kasan.git
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=14f14a1e600000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=cfa2c18fb6a8068e
> > > compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> > > patch:          https://syzkaller.appspot.com/x/patch.diff?x=171cd95a600000
>
> Why don't these patch-test reports include the dashboard link?  It sure
> would be handy to have a copy of it here.
>
> Alan Stern
>
