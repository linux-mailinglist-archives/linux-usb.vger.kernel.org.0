Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74D14228255
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 16:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgGUOgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 10:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726412AbgGUOgJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 10:36:09 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B566CC061794
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 07:36:09 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y2so21648031ioy.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 07:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3zHMY7uoBe+plmgrnJNFYp2bV9svgbeQB29fFF31qdI=;
        b=WPapAdIG7bhhcuoz2nOOscHWDP1st0CDoPX/5IfuERPpz2ShCnI78S6b/Rw/9CpLxs
         2tQXuPH7wFID3ekrzyxZHrpOjzPqnG1HXOcFoFDCAklN+kO2Aa3e6zL2YH6RhUpBQKLI
         fANro1JIqSLBDiucuFJS68k7fTCVeGxa42SnDVtSJNFV4aVwwl5XIRZLpihGSdNJ1xXz
         WGe3G5R/TGC/ZSUqe4qkGtEs6UfsIURbNbQ3yDdVamRtXDtlBBKy8nmRjugJRydigH9f
         f9gyACQRJn/0pNJWmKFzdHCj+zRUIqJzMdTBr73h1wdtDf/AakKoE//qdCXsrRtYovJL
         BQwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3zHMY7uoBe+plmgrnJNFYp2bV9svgbeQB29fFF31qdI=;
        b=A4uRDVn8zr7iTHPwlDteoaTA0NqeEvgYUo/mnyH6T7TqivhUo36yXJ0N6hM50o2f8f
         Wg1iDvLOfu3SEu94EqgFzsWhvD5PZcANbP6/wM6Z52mZR/SFb7gb5fPsFEHsFACdxNDM
         u8B/6RJpDnm9uVOwAO6vcwBNINyyV5wloEgLLswrnZPJhlfuEOEElL7TezuV33u3KfqM
         oER6shcLYtkwURA43KayHnK1FWPagiSsa2cpUs5Bn0+DcKBfaqkxURXFpSsFmbZeVB6l
         ol5Uj2jzSlegtkuFmD5T5scuTzxWUXq3JYs8+nKHdj4dRe7q7u7r/n5qIZMGWbsGJECS
         5dRw==
X-Gm-Message-State: AOAM533qeV6Ni0zqBUOf3cRMm8S8D0xDM9IsjMgaE43pRE42Iy40H65Q
        lBBOhwxCndQ6DKo8dKXngiSPuecBVxXK4dme6bF4045E
X-Google-Smtp-Source: ABdhPJxQXARwK7+5/cB1qoPniyIGIwG3YiI5UprFOfk1KuQT02NsXvoL24oeI6rYoZhEsveoHtBnPLRLZskE2oWNheQ=
X-Received: by 2002:a6b:b2d1:: with SMTP id b200mr27786168iof.137.1595342168861;
 Tue, 21 Jul 2020 07:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAJK_Yh-KwrrWeGY5s=RKJDhp0gyZBf+LsWCydKSfj0dEAYGHCA@mail.gmail.com>
 <20200720162422.GG1228057@rowland.harvard.edu> <CAJK_Yh_ZAvuSBFdUitkPbzp_L69Fuew7cTKbeTH3X8aJdOJeqw@mail.gmail.com>
 <20200720172951.GI1228057@rowland.harvard.edu> <CAJK_Yh8rPPMkxXLAyQDN7Ux=_NKcfvHgb1iyt7bZmej0q4P-Qg@mail.gmail.com>
 <20200721142345.GB1984873@kroah.com>
In-Reply-To: <20200721142345.GB1984873@kroah.com>
From:   =?UTF-8?B?U1pJR0VUVsOBUkkgSsOhbm9z?= <jszigetvari@gmail.com>
Date:   Tue, 21 Jul 2020 16:35:32 +0200
Message-ID: <CAJK_Yh9XaTHV2Q4Q+RyYkpzcwLZNZfYZwuFbgwNbUkS6f9O-tA@mail.gmail.com>
Subject: Re: linux usb gadget - mass storage
To:     Greg KH <greg@kroah.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, I can confirm that. The Pi Zero is running a 32-bit OS on top of
a 32-bit kernel.

J=C3=A1nos

Greg KH <greg@kroah.com> ezt =C3=ADrta (id=C5=91pont: 2020. j=C3=BAl. 21., =
K, 16:23):
>
> On Tue, Jul 21, 2020 at 02:20:27PM +0200, SZIGETV=C3=81RI J=C3=A1nos wrot=
e:
> > Hi Alan,
> >
> > Alan Stern <stern@rowland.harvard.edu> ezt =C3=ADrta (id=C5=91pont: 202=
0. j=C3=BAl.
> > 20., H, 19:29):
> > > 4.19 is a very old kernel.  You'd be a lot better off testing under a
> > > recent kernel, like 5.7.  It also would be more convenient to do your
> > > development on a regular PC instead of a Raspberry Pi.  You can use
> > > dummy-hcd for testing gadget drivers.
> >
> > Okay, I put together a Slackware-current based VM to conduct the
> > development work on.
> > I compiled a patched version of kernel 5.7.9 with all the necessary
> > config parameters to have USB gadget support with debugging enabled,
> > and also the dummy HCD.
> >
> > At first loaded the g_mass_storage module with a smaller ~700 MB iso
> > file, and it loaded seemingly fine, and functionality-wise it also
> > seemed to work fine, although there were frequent periodical debug
> > messages about the gadget returning command-failure status:
> > https://gist.github.com/jszigetvari/5bc4cdc8c55588907b71832558cb00a7
> >
> > After that as a test I tried to dd all the data from /dev/sr1 (that's
> > the device file the gadget was assigned) to /dev/null.
> > The process completed without any user-visible errors, although the
> > failure status related messages kept on appearing:
> > https://gist.github.com/jszigetvari/ffa19850c94f12510c0b78ed5aaba2e1
> >
> > Finally I tried to load the large, 11 GB CentOS iso file as the second
> > phase of the test. On the Raspberry Pi (with kernel 4.19) this was
> > when the crash happened, however this time it did not.
> > Originally Tiziano Bacocco's patch came around to be the time of the
> > 3.x kernels. The patch needed minimal adjustments to apply to 4.19 and
> > 5.4 and also to 5.7.9 (though there was a one line offset in
> > f_mass_storage.c).
> > https://gist.github.com/jszigetvari/5a9796c8af8a01c0edba6a8696540029
> >
> > Although I have to admit that on the Pi Zero I was using the g_multi
> > kernel module, and not g_mass_storage I assumed they share the same
> > code base, so they should work the same way.
> > On the Pi zero I need the extra serial and Ethernet interface to have
> > access to the Pi Zero, as it doesn't have a wireless NIC, and that's
> > why I chose g_multi.ko.
> >
> > In the end I did a dd with the 11 GB iso, and to my surprise it worked
> > well. dd returned without any errors and it did show the true 11 GB
> > size when it finished.
> > In the kernel logs most log entries were about block reads, but the
> > failure status messages were still around. If there was no activity on
> > the device, then they accounted for the majority of the logs
> > generated:
> > https://gist.github.com/jszigetvari/a9225fa3173e6c7b7b50673a494d9c37
> >
> > I have to admit, I stand puzzled why it worked on an x86_64-based
> > machine and crashed on the Pi Zero.
> > I guess the next step will be either:
> > * to try using g_multi instead of g_mass_storage on the test machine
> > * upgrade the Pi Zero to run kernel 5.4.x (AFAIK that's the latest one
> > can get from the Raspberry Pi Foundation's git repo), and recompile
> > that kernel version with the patch applied. (This will likely take a
> > few days.)
> >
> > Any further suggestions would also be welcome!
>
> One guess, the Pi Zero is running a 32bit kernel, while your desktop is
> running a 64bit one?
>
> greg k-h
