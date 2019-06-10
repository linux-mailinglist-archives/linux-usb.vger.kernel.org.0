Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2A73B7E0
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2019 16:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391021AbfFJO50 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 10:57:26 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37531 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390087AbfFJO5Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 10:57:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id 19so4630705pfa.4
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yPZBJqautpo7MdFgnHPddXOAdYv4bcGCjakrmWFV0uw=;
        b=nzOLYdQJkbURjNiMK5Yuqb0qPn35zZdtxM9DK49Hd7AjMWWlmQaJah4qN44SBZ7W7Q
         ThfU/gghM4FtJ7IcOf/impkD0NeGu9S96UXzN2zK1yf+EY7Yq8yT+0zhz/m3VkgNpbiu
         x8f8aoGPGS3pbdsfn89Po1qi+EbmvHbU6K4vrfzOPBXIF7vvQiaVwKSc1X9LM9IAnKLG
         jD6ouooZliS0qIh4yw8MTcFw7+SEb1Yor6XsIRL3L3t5DD+ztAdBuSor+a3Ln+N7TcPl
         jtzKQeMO6S9xZ53sNBYkQL+5rrFeq5ohi4G6nMDlJ6bhh6scg3hCWupBsxjdnMWArs2+
         yz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yPZBJqautpo7MdFgnHPddXOAdYv4bcGCjakrmWFV0uw=;
        b=o/C1GsYd45myMOUDTOiStbl8F+Y21ESAo6utmEJj+SPl10PvQUnyqWOa5AE2f8gNzV
         Bup7CPzEx7vvOKYshvOzk/GGUwDiKtfyEIV0mu+l9bjSQ0An6GjzXpxZOt+d44mDM3Ce
         ELCG3/Z/M42dI0FyYyZVcw+DuZ2H7RjKtClv5zLmTFoP315QmTXSPU3G3LjEKKPfDRcK
         cwPx+BRU42Pmm7WcTmp+hqoYI/QUKVGHGy6zf63FFbmmf9u3uYLp0AxIfaL3t6UjNOJK
         CX/i6gTPeiFjvgMiQ6D8XUdYSkuDcgQ0DsjFKZ5RDkSXQr2ijUuYh4rUsPYd3u8ZSzh1
         lVPw==
X-Gm-Message-State: APjAAAWRwueVy9n0ZO0KioSF7F312fd5N7TWYpL90/uD41lPAf5+Ku6U
        9xzvM4cHz90jAVubAwSQquqGeErsicZ47lt8EGU=
X-Google-Smtp-Source: APXvYqyJL1fEEu6UPUsREp40j1Az1tcCfaC6unDYBQ85wx96mroGmWSUZvNBus6sVg0hUAyobFDk1MlNzj2l+hRkvo8=
X-Received: by 2002:aa7:8052:: with SMTP id y18mr43132308pfm.169.1560178644891;
 Mon, 10 Jun 2019 07:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com> <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
 <20190604054045.GD1588@kroah.com> <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
 <20190605165857.GA23286@kroah.com> <CAB31r6X7g_ZqfDUYBh=eFZftA7dc2GppMeWtPxMJCg-X7BGxUA@mail.gmail.com>
 <20190610143247.GB23343@kroah.com>
In-Reply-To: <20190610143247.GB23343@kroah.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Tue, 11 Jun 2019 00:57:13 +1000
Message-ID: <CAB31r6V0zMYos+=Y=ALZYE8uDoGL2qjwn6AWaVMthdExA2pBPQ@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I guess you meant the previous one, Greg (oops msg was just my excuse,
nothing more), so here it is:

>>
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
<<

The above bisect log was my initial try to find a commit which
introduced an issue. I came to
ad74b8649beaf1a22cf8641324e3321fa0269d16 eventually.
The latter bisect tries ended up at
12456e509be25d24fe479394852428517922d02a, which is merge, as I
understand, so the actual culprit is
ad74b8649beaf1a22cf8641324e3321fa0269d16 anyways.
PS: rc4 is still a no-go for me (just to re-iterate how severe the
problem is): not only error logs I see but I cannot log in as well,
system hangs up completely (haven't tried REISUB though).

=D0=B2=D1=82, 11 =D0=B8=D1=8E=D0=BD. 2019 =D0=B3. =D0=B2 00:32, Greg KH <gr=
egkh@linuxfoundation.org>:
>
> On Fri, Jun 07, 2019 at 02:58:51AM +1000, Vladimir Yerilov wrote:
> > Finally I can name the first bad commit:
> >
> > git bisect good
> > ad74b8649beaf1a22cf8641324e3321fa0269d16 is the first bad commit
> > commit ad74b8649beaf1a22cf8641324e3321fa0269d16
> > Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Date:   Tue Apr 23 17:21:48 2019 +0300
> >
> >    usb: typec: ucsi: Preliminary support for alternate modes
> >
> >    With UCSI the alternate modes, just like everything else
> >    related to USB Type-C connectors, are handled in firmware.
> >    The operating system can see the status and is allowed to
> >    request certain things, for example entering and exiting the
> >    modes, but the support for alternate modes is very limited
> >    in UCSI. The feature is also optional, which means that even
> >    when the platform supports alternate modes, the operating
> >    system may not be even made aware of them.
> >
> >    UCSI does not support direct VDM reading or writing.
> >    Instead, alternate modes can be entered and exited using a
> >    single custom command which takes also an optional SVID
> >    specific configuration value as parameter. That means every
> >    supported alternate mode has to be handled separately in
> >    UCSI driver.
> >
> >    This commit does not include support for any specific
> >    alternate mode. The discovered alternate modes are now
> >    registered, but binding a driver to an alternate mode will
> >    not be possible until support for that alternate mode is
> >    added to the UCSI driver.
> >
> >    Tested-by: Ajay Gupta <ajayg@nvidia.com>
> >    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> >    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >
> > :040000 040000 f19a610d131d6d3e6397934562dd6112e78b2415
> > 76df0e463eeacf57157adba0291fc9577c7d5145 M      dr
> > ivers
> >
> > git bisect log
> > git bisect start
> > # bad: [132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a] Merge tag
> > 'usb-5.2-rc1' of git://git.kernel.org/pub/scm/
> > linux/kernel/git/gregkh/usb
> > git bisect bad 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a
> > # good: [86dc59e39031fb0d366d5b1f92db015b24bef70b] net: dsa: sja1105:
> > Make 'sja1105et_regs' and 'sja1105pq
> > rs_regs' static
> > git bisect good 86dc59e39031fb0d366d5b1f92db015b24bef70b
> > # good: [80f232121b69cc69a31ccb2b38c1665d770b0710] Merge
> > git://git.kernel.org/pub/scm/linux/kernel/git/dav
> > em/net-next
> > git bisect good 80f232121b69cc69a31ccb2b38c1665d770b0710
> > # good: [5d438e200215f61ca6a7aa69f3c4e035ac54d8ee] usb: typec: ucsi:
> > ccg: add get_fw_info function
> > git bisect good 5d438e200215f61ca6a7aa69f3c4e035ac54d8ee
> > # bad: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
> > 'usb-serial-5.2-rc1' of https://git.kernel.org
> > /pub/scm/linux/kernel/git/johan/usb-serial into usb-next
> > git bisect bad 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca
> > # bad: [e823d948b7e53dc982c867ac4ce7877fc0418897] usb: musb: dsps: Use
> > dev_get_drvdata()
> > git bisect bad e823d948b7e53dc982c867ac4ce7877fc0418897
> > # bad: [6fee3787ea7aebf25fecdce325ee9b2150c5727b] dt-bindings:
> > usb-xhci: Add r8a774c0 support
> > git bisect bad 6fee3787ea7aebf25fecdce325ee9b2150c5727b
> > # bad: [cf28369c634fafb5f4e81750cba6988cdb4b4490] usb: typec: Add
> > driver for NVIDIA Alt Modes
> > git bisect bad cf28369c634fafb5f4e81750cba6988cdb4b4490
> > # bad: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb: typec: ucsi:
> > Preliminary support for alternate mode
> > s
> > git bisect bad ad74b8649beaf1a22cf8641324e3321fa0269d16
> > # good: [5c9ae5a87573d38cfc4c740aafda2fa6ce06e401] usb: typec: ucsi:
> > ccg: add firmware flashing support
> > git bisect good 5c9ae5a87573d38cfc4c740aafda2fa6ce06e401
> > # first bad commit: [ad74b8649beaf1a22cf8641324e3321fa0269d16] usb:
> > typec: ucsi: Preliminary support for a
> > lternate modes
> >
> > Best regards,
> > Vladimir
>
>
> Heikki, any thoughts?
>
> Vladimir, can you post the oops message again?  I don't see it here in
> the email thread anymore.
>
> thanks,
>
> greg k-h



--=20
----
Best regards,
Vladimir Yerilov
