Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F37037A5C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 18:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729862AbfFFQ7E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 12:59:04 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40436 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFQ7E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 12:59:04 -0400
Received: by mail-pg1-f193.google.com with SMTP id d30so1691419pgm.7
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2019 09:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pALyoPrTNuzrcmYyr6GKDh6TCpPY+q0BQz/s712cq0k=;
        b=CUdLtdNZJbN6HJcSsHxutHBBkB1t1LywdkKxLXFT8K+VD3Mgz8Cn0oyCcvTL30spjS
         r5K1lYeoUFRW7BIQDyMduwwxyntVul8LrlorCxsiEj/v62MDX5vi69Osn8/Q8qyblECU
         gLMjeHd1ogjBMbdUBI6+QiY796s+cBPLWLABs3QZL+TAuE2jMFNdeY/llzKOmtSOjlEe
         hrBnlfj4Vw//YJWxyhKtZ7tHb08e4AgbY6EEBkYHdqILUr6L7M2ecsU0VwvNIW55NX9r
         9EIrV4cv3mBNaxKluMJBo17PI0ngjVEl/ybBBZSKAvx0/gF0+6tKswS5mjr5eDlp8umt
         /xBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pALyoPrTNuzrcmYyr6GKDh6TCpPY+q0BQz/s712cq0k=;
        b=QiNhcoNsefQO6mJJ1f70X7+v609P/1tryYWz4Taz3avcvqiWuAmLVNwSh2x5/5zRVO
         PE81tSKTleSus1mAoZhJevYLbLIeLloEn87EbbAsOQpW2HIEpJHcNq4X8qTVBtcs7Ge8
         2F5U0zEVBdhcfNzvoHFcCUK6nZjyi5uuLAB11n6DmWkKVcUjtVKTCSx8PKDGFskf0BKW
         mJgJWPERPvOTviwbPPb1bC3RnInNSlqMfpzEYxCSqYciAppNgEc0HvipIvMZ1teYwzHm
         0mSUfAGht4gTzPcWaFZr/4UutMwdWSGvvNxPv2Q/bIW6f1gPZMzNyk7g9mEtagyJcu1T
         qMOw==
X-Gm-Message-State: APjAAAXiVQicvsIxO2RedXK2xUs4oNVYOz/ZwqzrLwSHbQDqBtf+VOjT
        VLyaXL0NSxsWpKpCXtAjuzJdaNgEjndoCxn/ANs=
X-Google-Smtp-Source: APXvYqydddRbx/ISJLWpy8MUluFitNqn/QwTr3fCvmbS+RocQWqBnb8AqMJoPBOMdiW0auFd+5K1drwWzutQU/SFr9k=
X-Received: by 2002:a63:c5:: with SMTP id 188mr4261840pga.108.1559840343033;
 Thu, 06 Jun 2019 09:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com> <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
 <20190604054045.GD1588@kroah.com> <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
 <20190605165857.GA23286@kroah.com>
In-Reply-To: <20190605165857.GA23286@kroah.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Fri, 7 Jun 2019 02:58:51 +1000
Message-ID: <CAB31r6X7g_ZqfDUYBh=eFZftA7dc2GppMeWtPxMJCg-X7BGxUA@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Finally I can name the first bad commit:

git bisect good
ad74b8649beaf1a22cf8641324e3321fa0269d16 is the first bad commit
commit ad74b8649beaf1a22cf8641324e3321fa0269d16
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Tue Apr 23 17:21:48 2019 +0300

   usb: typec: ucsi: Preliminary support for alternate modes

   With UCSI the alternate modes, just like everything else
   related to USB Type-C connectors, are handled in firmware.
   The operating system can see the status and is allowed to
   request certain things, for example entering and exiting the
   modes, but the support for alternate modes is very limited
   in UCSI. The feature is also optional, which means that even
   when the platform supports alternate modes, the operating
   system may not be even made aware of them.

   UCSI does not support direct VDM reading or writing.
   Instead, alternate modes can be entered and exited using a
   single custom command which takes also an optional SVID
   specific configuration value as parameter. That means every
   supported alternate mode has to be handled separately in
   UCSI driver.

   This commit does not include support for any specific
   alternate mode. The discovered alternate modes are now
   registered, but binding a driver to an alternate mode will
   not be possible until support for that alternate mode is
   added to the UCSI driver.

   Tested-by: Ajay Gupta <ajayg@nvidia.com>
   Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
   Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

:040000 040000 f19a610d131d6d3e6397934562dd6112e78b2415
76df0e463eeacf57157adba0291fc9577c7d5145 M      dr
ivers

git bisect log
git bisect start
# bad: [132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a] Merge tag
'usb-5.2-rc1' of git://git.kernel.org/pub/scm/
linux/kernel/git/gregkh/usb
git bisect bad 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
# good: [86dc59e39031fb0d366d5b1f92db015b24bef70b] net: dsa: sja1105:
Make 'sja1105et_regs' and 'sja1105pq
rs_regs' static
git bisect good 86dc59e39031fb0d366d5b1f92db015b24bef70b
# good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge
git://git.kernel.org/pub/scm/linux/kernel/git/dav
em/net-next
git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
# good: [5d438e200215f61ca6a7aa69f3c4e035ac54d8ee] usb: typec: ucsi:
ccg: add get_fw_info function
git bisect good 5d438e200215f61ca6a7aa69f3c4e035ac54d8ee
# bad: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
'usb-serial-5.2-rc1' of https://git.kernel.org
/pub/scm/linux/kernel/git/johan/usb-serial into usb-next
git bisect bad 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
# bad: [e823d948b7e53dc982c867ac4ce7877fc0418897] usb: musb: dsps: Use
dev_get_drvdata()
git bisect bad e823d948b7e53dc982c867ac4ce7877fc0418897
# bad: [6fee3787ea7aebf25fecdce325ee9b2150c5727b] dt-bindings:
usb-xhci: Add r8a774c0 support
git bisect bad 6fee3787ea7aebf25fecdce325ee9b2150c5727b
# bad: [cf28369c634fafb5f4e81750cba6988cdb4b4490] usb: typec: Add
driver for NVIDIA Alt Modes
git bisect bad cf28369c634fafb5f4e81750cba6988cdb4b4490
# bad: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb: typec: ucsi:
Preliminary support for alternate mode
s
git bisect bad ad74b8649beaf1a22cf8641324e3321fa0269d16
# good: [5c9ae5a87573d38cfc4c740aafda2fa6ce06e401] usb: typec: ucsi:
ccg: add firmware flashing support
git bisect good 5c9ae5a87573d38cfc4c740aafda2fa6ce06e401
# first bad commit: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb:
typec: ucsi: Preliminary support for a
lternate modes

Best regards,
Vladimir

=D1=87=D1=82, 6 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 02:59, Greg KH <gre=
gkh@linuxfoundation.org>:
>
> On Wed, Jun 05, 2019 at 04:36:23PM +1000, Vladimir Yerilov wrote:
> > Good day Mr. Kroah-Hartman,
> >
> > I've found the culprit commit. It took a while though but now I'm sure:
> >
> > commit - brief decription - time - works (y) or not (n)
> > 670784fb4ebe54434e263837390e358405031d9e - rc1 2019-05-20
> > e260ad01f0aa9e96b5386d5cd7184afd949dc457 - rc0 2019-05-14 19:52:51 -070=
0 n
> > 8ea5b2abd07e2280a332bd9c1a7f4dd15b9b6c13 - rc0 2019-05-09 19:35:41 -070=
0 n
> > 54516da1ea859dd4f56ebba2e483d2df9d7c8a32 - rc0 2019-05-05 21:58:36 -070=
0 y
> > 71ae5fc87c34ecbdca293c2a5c563d6be2576558 - rc0 2019-05-06 20:29:45 -070=
0 y
> > 80f232121b69cc69a31ccb2b38c1665d770b0710 - rc0 2019-05-07 22:03:58 -070=
0 y
> > a2d635decbfa9c1e4ae15cb05b68b2559f7f827c - rc0 2019-05-08 21:35:19 -070=
0 n
> > 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a - rc0 2019-05-08 10:03:52 -070=
0 n
> > 86dc59e39031fb0d366d5b1f92db015b24bef70b - rc0 2019-05-08 09:46:44 -070=
0 y
> >
> > So 86dc59e39031fb0d366d5b1f92db015b24bef70b is the last working for
> > me, and 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a is the breaking one:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?h=3Dv5.2-rc3&id=3D132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
>
> 132d68d37d33 ("Merge tag 'usb-5.2-rc1' of git://git.kernel.org/pub/scm/li=
nux/kernel/git/gregkh/usb")
> is a merge point, which is odd, you should be able to drop down into
> that and find the exact wrong commit.
>
> what does 'git bisect log' show?
>
> thanks,
>
> greg k-h



--=20
----
Best regards,
Vladimir Yerilov
