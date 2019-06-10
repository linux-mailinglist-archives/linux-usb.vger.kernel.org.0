Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB773ADBA
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 05:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387504AbfFJDsV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jun 2019 23:48:21 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38015 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387457AbfFJDsV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jun 2019 23:48:21 -0400
Received: by mail-pl1-f193.google.com with SMTP id f97so3071229plb.5
        for <linux-usb@vger.kernel.org>; Sun, 09 Jun 2019 20:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VJlu1+KhNgij6ESKB7PKIP5M28kAMbM+QrFSJMsC+cs=;
        b=mJwqH+/sfJ1GA/dPE4kkm9QbgETwVYL+9245KP9yR+T3RMgR927gxVV9mp6PkbA8Zo
         JUqEqXLzTYr2JYA110GzV6d8Egp+wCs9kbZpK0zIXxePbz/eEgqLfnBlhJbp3Joo9agX
         oq4XGGgmLh+WO/kd0Sa3vtja4olY2cp+63ZuaIclGgDlFtU0Bk8F3kpS5gM4w7HMpIq1
         uv0Hv3ur9J+XbbZSJkMcO7wKNLYSvpRm9gxcUbt95IW/qh9cexz4Z3/EmfQfPpMZ5xrc
         zuTyEQCpvxzy8ljM5n85kFfkuEuKY+GHPZZAw2PDu8hqT0hoGpAXKQ9DW3ve607C8Rqu
         lsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VJlu1+KhNgij6ESKB7PKIP5M28kAMbM+QrFSJMsC+cs=;
        b=Ur45TDHSKPB5uOtdhbOVyGqg+TuUiXDs+TxvvR6eFytaNd50R35BIC//hj9bNQZPI3
         YoFflQwnQzmoi5ZHb7BJwK9gYd6MPZKgFUwMvI649riNZcfxH4kFcaEYVGmskiwfS/gq
         GGOmwJemdhloGs2zDg9Bnv9XQ10xbjKf+qfWhljKOvFxNaW6PCmvLjyGHkchLR4pRMx5
         UvxdVDB7vMQB6BIxBYtcwdONTeCALlj4R1fdewdeSC1qNGjUHn4OAyiE5H6VILKCCQGd
         cAL2Rj8DDjbZVSdIAt4Xg6PYJXuKs24QuaVqUDvQ9J7ipct/2eClELcA59FcI1iRSgmV
         E0CQ==
X-Gm-Message-State: APjAAAUexSlxvt/S6nck/k+wkqobM5MDu8Q5IkdQbs94H8ugTPJGJSBW
        l9GXPE4dtiSc5nepxe16tI0N3I18nYseo7qiXoSgRhOsapY=
X-Google-Smtp-Source: APXvYqyiLtGpXkOki4gPhK0WWaRGTOgNLnv9676R7Lrr6o2Ul3k/nuFQWggjoyqTld4OdJowftiqbl804lotGc94HWE=
X-Received: by 2002:a17:902:6948:: with SMTP id k8mr68169713plt.81.1560138500361;
 Sun, 09 Jun 2019 20:48:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com> <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
 <20190604054045.GD1588@kroah.com> <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
 <20190605165857.GA23286@kroah.com> <CAB31r6X7g_ZqfDUYBh=eFZftA7dc2GppMeWtPxMJCg-X7BGxUA@mail.gmail.com>
In-Reply-To: <CAB31r6X7g_ZqfDUYBh=eFZftA7dc2GppMeWtPxMJCg-X7BGxUA@mail.gmail.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Mon, 10 Jun 2019 13:48:07 +1000
Message-ID: <CAB31r6UfLMXtPS+W8fkfDgUw2Eskj6R2a6ves3hwU5661CoFjA@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi everyone,

Here is another bunch of bisect logs generated during the search of
BUG: unable to handle kernel NULL pointer dereference at
0000000000000370.
Strangely, none of these commits except
132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a cause logon issues, but
nevertheless, I think them all worth being looked into. Both rounds
were made just to be sure which commit introduced a bug.

Round one:
git bisect start
# bad: [132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a] Merge tag
'usb-5.2-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
git bisect bad 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
# good: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
'usb-serial-5.2-rc1' of
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into
usb-next
git bisect good 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
# good: [01e5d1830cf54ac45768ef9ceb3e79cea2e1198c] Merge tag
'mmc-v5.2' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc
git bisect good 01e5d1830cf54ac45768ef9ceb3e79cea2e1198c
# good: [6ffe0acc935f344eb0b35da07c034d5122222e77] Merge tag
'wireless-drivers-next-for-davem-2019-05-03' of
git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/wireless-drivers-next
git bisect good 6ffe0acc935f344eb0b35da07c034d5122222e77
# good: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
'usb-serial-5.2-rc1' of
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into
usb-next
git bisect good 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
# good: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
'usb-serial-5.2-rc1' of
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into
usb-next
git bisect good 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
# good: [2310673c3c12e4b7f8a31c41f67f701d24b0de86] Merge tag
'char-misc-5.2-rc1-part1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
git bisect good 2310673c3c12e4b7f8a31c41f67f701d24b0de86
# good: [67a242223958d628f0ba33283668e3ddd192d057] Merge tag
'for-5.2/block-20190507' of git://git.kernel.dk/linux-block
git bisect good 67a242223958d628f0ba33283668e3ddd192d057
# good: [82efe439599439a5e1e225ce5740e6cfb777a7dd] Merge tag
'devicetree-for-5.2' of
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect good 82efe439599439a5e1e225ce5740e6cfb777a7dd
# good: [54516da1ea859dd4f56ebba2e483d2df9d7c8a32] Merge branch
'r8169-replace-some-magic-with-more-speaking-functions'
git bisect good 54516da1ea859dd4f56ebba2e483d2df9d7c8a32
# good: [a9e41a529681b38087c91ebc0bb91e12f510ca2d] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net
git bisect good a9e41a529681b38087c91ebc0bb91e12f510ca2d
# good: [408b56ca5c8eea1e46d2094818de8acc7215cf58] usb: gadget: udc:
lpc32xx: simplify probe
git bisect good 408b56ca5c8eea1e46d2094818de8acc7215cf58
# good: [5799aecd64f2bb6c8175a2e86fbcb9e60d052221] usb: dwc2: Fix
channel disable flow
git bisect good 5799aecd64f2bb6c8175a2e86fbcb9e60d052221
# good: [b873e2d0ea1efc91fb603b727733525f07419f2b] usb: dwc3: Do core
validation early on probe
git bisect good b873e2d0ea1efc91fb603b727733525f07419f2b
# good: [2e487d280525b91b03976203b15aba365ec5b4e6] usb: dwc3: Rename
DWC3_DCTL_LPM_ERRATA
git bisect good 2e487d280525b91b03976203b15aba365ec5b4e6
# bad: [3515468a87a47781f6af818773650513ff14656a] Merge tag
'usb-for-v5.2' of
git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next
git bisect bad 3515468a87a47781f6af818773650513ff14656a
# bad: [12456e509be25d24fe479394852428517922d02a] Merge 5.1-rc7 into usb-ne=
xt
git bisect bad 12456e509be25d24fe479394852428517922d02a
# first bad commit: [12456e509be25d24fe479394852428517922d02a] Merge
5.1-rc7 into usb-next

Round two:
git bisect start
# bad: [132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a] Merge tag
'usb-5.2-rc1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
git bisect bad 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
# good: [86dc59e39031fb0d366d5b1f92db015b24bef70b] net: dsa: sja1105:
Make 'sja1105et_regs' and 'sja1105pqrs_regs' static
git bisect good 86dc59e39031fb0d366d5b1f92db015b24bef70b
# good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next
git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
# good: [5d438e200215f61ca6a7aa69f3c4e035ac54d8ee] usb: typec: ucsi:
ccg: add get_fw_info function
git bisect good 5d438e200215f61ca6a7aa69f3c4e035ac54d8ee
# good: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
'usb-serial-5.2-rc1' of
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into
usb-next
git bisect good 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
# good: [1e868545f2bb06f7dd4a1c97c5b9ed2615929cf0] usb: dwc2: gadget:
Move gadget phy init into core phy init
git bisect good 1e868545f2bb06f7dd4a1c97c5b9ed2615929cf0
# good: [c8006f67ae0371900e601112d9f9cd8fff1c8387] usb: dwc2: Set
actual frame number for completed ISOC transfer
git bisect good c8006f67ae0371900e601112d9f9cd8fff1c8387
# good: [c729969b2b692ce3ed362e60d38391e7671758ff] usb: dwc3: gadget:
Set lpm_capable
git bisect good c729969b2b692ce3ed362e60d38391e7671758ff
# good: [8d791929b2fbdf7734c1596d808e55cb457f4562] usb: dwc3: Fix
default lpm_nyet_threshold value
git bisect good 8d791929b2fbdf7734c1596d808e55cb457f4562
# good: [2e487d280525b91b03976203b15aba365ec5b4e6] usb: dwc3: Rename
DWC3_DCTL_LPM_ERRATA
git bisect good 2e487d280525b91b03976203b15aba365ec5b4e6
# bad: [3515468a87a47781f6af818773650513ff14656a] Merge tag
'usb-for-v5.2' of
git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb into usb-next
git bisect bad 3515468a87a47781f6af818773650513ff14656a
# bad: [12456e509be25d24fe479394852428517922d02a] Merge 5.1-rc7 into usb-ne=
xt
git bisect bad 12456e509be25d24fe479394852428517922d02a
# first bad commit: [12456e509be25d24fe479394852428517922d02a] Merge
5.1-rc7 into usb-next

=D0=BF=D1=82, 7 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 02:58, Vladimir Yer=
ilov <openmindead@gmail.com>:
>
> Finally I can name the first bad commit:
>
> git bisect good
> ad74b8649beaf1a22cf8641324e3321fa0269d16 is the first bad commit
> commit ad74b8649beaf1a22cf8641324e3321fa0269d16
> Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Date:   Tue Apr 23 17:21:48 2019 +0300
>
>    usb: typec: ucsi: Preliminary support for alternate modes
>
>    With UCSI the alternate modes, just like everything else
>    related to USB Type-C connectors, are handled in firmware.
>    The operating system can see the status and is allowed to
>    request certain things, for example entering and exiting the
>    modes, but the support for alternate modes is very limited
>    in UCSI. The feature is also optional, which means that even
>    when the platform supports alternate modes, the operating
>    system may not be even made aware of them.
>
>    UCSI does not support direct VDM reading or writing.
>    Instead, alternate modes can be entered and exited using a
>    single custom command which takes also an optional SVID
>    specific configuration value as parameter. That means every
>    supported alternate mode has to be handled separately in
>    UCSI driver.
>
>    This commit does not include support for any specific
>    alternate mode. The discovered alternate modes are now
>    registered, but binding a driver to an alternate mode will
>    not be possible until support for that alternate mode is
>    added to the UCSI driver.
>
>    Tested-by: Ajay Gupta <ajayg@nvidia.com>
>    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> :040000 040000 f19a610d131d6d3e6397934562dd6112e78b2415
> 76df0e463eeacf57157adba0291fc9577c7d5145 M      dr
> ivers
>
> git bisect log
> git bisect start
> # bad: [132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a] Merge tag
> 'usb-5.2-rc1' of git://git.kernel.org/pub/scm/
> linux/kernel/git/gregkh/usb
> git bisect bad 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
> # good: [86dc59e39031fb0d366d5b1f92db015b24bef70b] net: dsa: sja1105:
> Make 'sja1105et_regs' and 'sja1105pq
> rs_regs' static
> git bisect good 86dc59e39031fb0d366d5b1f92db015b24bef70b
> # good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge
> git://git.kernel.org/pub/scm/linux/kernel/git/dav
> em/net-next
> git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
> # good: [5d438e200215f61ca6a7aa69f3c4e035ac54d8ee] usb: typec: ucsi:
> ccg: add get_fw_info function
> git bisect good 5d438e200215f61ca6a7aa69f3c4e035ac54d8ee
> # bad: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
> 'usb-serial-5.2-rc1' of https://git.kernel.org
> /pub/scm/linux/kernel/git/johan/usb-serial into usb-next
> git bisect bad 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
> # bad: [e823d948b7e53dc982c867ac4ce7877fc0418897] usb: musb: dsps: Use
> dev_get_drvdata()
> git bisect bad e823d948b7e53dc982c867ac4ce7877fc0418897
> # bad: [6fee3787ea7aebf25fecdce325ee9b2150c5727b] dt-bindings:
> usb-xhci: Add r8a774c0 support
> git bisect bad 6fee3787ea7aebf25fecdce325ee9b2150c5727b
> # bad: [cf28369c634fafb5f4e81750cba6988cdb4b4490] usb: typec: Add
> driver for NVIDIA Alt Modes
> git bisect bad cf28369c634fafb5f4e81750cba6988cdb4b4490
> # bad: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb: typec: ucsi:
> Preliminary support for alternate mode
> s
> git bisect bad ad74b8649beaf1a22cf8641324e3321fa0269d16
> # good: [5c9ae5a87573d38cfc4c740aafda2fa6ce06e401] usb: typec: ucsi:
> ccg: add firmware flashing support
> git bisect good 5c9ae5a87573d38cfc4c740aafda2fa6ce06e401
> # first bad commit: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb:
> typec: ucsi: Preliminary support for a
> lternate modes
>
> Best regards,
> Vladimir
>
> =D1=87=D1=82, 6 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 02:59, Greg KH <g=
regkh@linuxfoundation.org>:
> >
> > On Wed, Jun 05, 2019 at 04:36:23PM +1000, Vladimir Yerilov wrote:
> > > Good day Mr. Kroah-Hartman,
> > >
> > > I've found the culprit commit. It took a while though but now I'm sur=
e:
> > >
> > > commit - brief decription - time - works (y) or not (n)
> > > 670784fb4ebe54434e263837390e358405031d9e - rc1 2019-05-20
> > > e260ad01f0aa9e96b5386d5cd7184afd949dc457 - rc0 2019-05-14 19:52:51 -0=
700 n
> > > 8ea5b2abd07e2280a332bd9c1a7f4dd15b9b6c13 - rc0 2019-05-09 19:35:41 -0=
700 n
> > > 54516da1ea859dd4f56ebba2e483d2df9d7c8a32 - rc0 2019-05-05 21:58:36 -0=
700 y
> > > 71ae5fc87c34ecbdca293c2a5c563d6be2576558 - rc0 2019-05-06 20:29:45 -0=
700 y
> > > 80f232121b69cc69a31ccb2b38c1665d770b0710 - rc0 2019-05-07 22:03:58 -0=
700 y
> > > a2d635decbfa9c1e4ae15cb05b68b2559f7f827c - rc0 2019-05-08 21:35:19 -0=
700 n
> > > 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a - rc0 2019-05-08 10:03:52 -0=
700 n
> > > 86dc59e39031fb0d366d5b1f92db015b24bef70b - rc0 2019-05-08 09:46:44 -0=
700 y
> > >
> > > So 86dc59e39031fb0d366d5b1f92db015b24bef70b is the last working for
> > > me, and 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a is the breaking one:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/co=
mmit/?h=3Dv5.2-rc3&id=3D132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
> >
> > 132d68d37d33 ("Merge tag 'usb-5.2-rc1' of git://git.kernel.org/pub/scm/=
linux/kernel/git/gregkh/usb")
> > is a merge point, which is odd, you should be able to drop down into
> > that and find the exact wrong commit.
> >
> > what does 'git bisect log' show?
> >
> > thanks,
> >
> > greg k-h
>
>
>
> --
> ----
> Best regards,
> Vladimir Yerilov



--=20
----
Best regards,
Vladimir Yerilov
