Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF04F120996
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 16:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbfLPPYb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 10:24:31 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37656 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbfLPPYb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 10:24:31 -0500
Received: by mail-pj1-f67.google.com with SMTP id ep17so3125254pjb.4
        for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2019 07:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ND5vBVspC4LhdAQGe3ggsWBXQWro7jR0iz0KHNGVvLw=;
        b=tC911Ara1oubQlZRmd0EQc8fs74ektdtWTc7jF8D9vLvVG75qV5+RUMNCo6KqjO+//
         y41FWAultQTGUFsRflIG8h/U/2EFoRj7j2xt6yvW+EN83ixHwEnfIAXztV+AGeXK4hWD
         VLsWzyfyiy2ybehEjkb4qJDd2QvJdoptZkkf8BeM851P+InPvABc2+kLumSjskFhyAKt
         IKlwWdx0m/zXi4LtWcWbJbQIuZDRbZPKwGn3wwb53CMAz8QAhTVZ15AqAsfKM04bZy3x
         JmbEunD18YEnu5jwnyQZh2/EnzmOYfeTZKREwY2PeGpwvufl58/kYvJ16+Bb5kMAYEDF
         oTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ND5vBVspC4LhdAQGe3ggsWBXQWro7jR0iz0KHNGVvLw=;
        b=PyOiWSraWkPJssjQpq9Pre4l2+e8JmJQ749tRTnWpluZt73Kkqiz484d90BluSMjbx
         YQVXuOB+9hJweVenwJ6YIaZc2uHQ98zEvjAja7lXTb8LgnDTLKlhaf/Gf6LYanJQfSI4
         1a8JuHCb8I8I3jkmQjh1GIvJOxI2fFMgePzv4lDF0lpVIc6auGKVYN+BzUqpyZGzZtDC
         EyK69ioTUYt98VrQPluFomFEKtaZpzmJOhtlKYKxJS9MSmclWGs8H5DEqhahLhgmk5nA
         NrvSAieUQi3wLoFdpQrGw41fnsR1RgSl/sTWT/G/BSBVZ4CkBD8rWrcWJCYj6w1uOYBx
         6Tbw==
X-Gm-Message-State: APjAAAXZnq1zO1ADhIxRNkozEdmkrHNMvXR5BQanygjdcyiKm+CVUogf
        6waFfXZC8FgklEPWldGoa8U5Ebm25AdFTcD3KBA0gw==
X-Google-Smtp-Source: APXvYqxqW5DIvTi6oMsxschKtghuJzELK3hgPNRHB0NKXE9PBJFdVD+IHbjzim6ycnFxvpJonlDPB51dKCXaw7stUpU=
X-Received: by 2002:a17:90a:77c6:: with SMTP id e6mr12111173pjs.129.1576509870817;
 Mon, 16 Dec 2019 07:24:30 -0800 (PST)
MIME-Version: 1.0
References: <CAAeHK+yz3dtfx0Jfd4sbOcN8tSxp8+qAvW609sP_yJC5q6vq8A@mail.gmail.com>
 <Pine.LNX.4.44L0.1912161002080.1406-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1912161002080.1406-100000@iolanthe.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 16 Dec 2019 16:24:19 +0100
Message-ID: <CAAeHK+w3ymXpBeBNCddLPDZuVg8fTgxKVb6U=MSgH_zXxZqxjg@mail.gmail.com>
Subject: Re: Re: general protection fault in usb_set_interface
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     syzbot <syzbot+7fa38a608b1075dfd634@syzkaller.appspotmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>, mans@mansr.com,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 16, 2019 at 4:05 PM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Mon, 16 Dec 2019, Andrey Konovalov wrote:
>
> > On Fri, Dec 13, 2019 at 8:51 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > >
> > > On Fri, 13 Dec 2019, Andrey Konovalov wrote:
> > >
> > > > > > Let's retry here:
> > > > >
> > > > > > #syz test: https://github.com/google/kasan.git f0df5c1b
> > > > >
> > > > > This bug is already marked as fixed. No point in testing.
> > > > >
> > > >
> > > > Hm, that explains some of the weirdness. It doesn't explain though
> > > > neither why the patch was actually tested when Alan requested it nor
> > > > why syzbot sent no reply.
> > >
> > > In the meantime, is there any way to get syzbot to test the new patch
> > > with the old reproducer?  Perhaps tell it to re-open this bug?
> >
> > No, we can only test this manually now. I can run the reproducer for
> > you. Should I revert the fix for this bug and then apply your patch?
> > What's the expected result?
>
> Please simply run the patch as it is, with no other changes.  The
> expected result is a use-after-free Read in usbvision_v4l2_open, just
> as with c7b0ec009a216143df30.

I've tried to run both the reproducer from this thread and the log
from the other one on 5.5-rc1 with your patch (and other USB fuzzing
patches) applied, but didn't get any crashes.

Thanks!
