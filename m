Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF1BB37002
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbfFFJgm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 05:36:42 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44122 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbfFFJgm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 05:36:42 -0400
Received: by mail-pf1-f196.google.com with SMTP id t16so1139669pfe.11
        for <linux-usb@vger.kernel.org>; Thu, 06 Jun 2019 02:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h5do6viF1QYHmi9zodRPi2gOLo4d0RMmlNDMFVT6d0s=;
        b=OsdYFDR7n8GZdRL5hTrf1LRRH/9tb9lFqWF/NyqegA74ZymzpSfa/yOWd+/RJI3FC2
         EP9xp8H+aXNXZJbqvgJUhr6fKSIP0QH/VfSgN3IKkS6kgp3y2AGNt1DGV2i3rnKTW3rF
         W7YZTr2O+PdzdTzfbAh9rtTk+wWBxbIPZ1mZ2GOSjG40NIjEqu5fMHkmr5G74GIBhuHl
         Ls3TOrfObyb2b8nm8jYAk36//yPjN6Sp189zArN+BumidjIpwzLPAt0EkGWw2KEqD2RB
         qQNhenEviJeXFB0qj1Os9cAXXz2MeWsG5b56oA2M0OY//hJy5qAKUhUgRdRKe/hCchym
         HeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h5do6viF1QYHmi9zodRPi2gOLo4d0RMmlNDMFVT6d0s=;
        b=sqpv9H3aIh+h/243Zk3vrHSvcOJr7jZWYx0xVm7iKCgf4SiOmRyW9hefikcv0tg9Pc
         +0al4NBNRlZZ+l022m1LxXKxPEz7l0n+Xn0njVb3P52gFHKb4vxdNwmgCiHGi/i97xqe
         0AVRsgeLHUymLtEVDVzRb3EzyzTQY2TWipFp15X6Vd6VosMtkpXXQjWOlPATy/3YP+Vx
         rMGuNsnrtkt6Mye22cS7Cf6JrBtdm4JoUfHtDLjKPALBLAssAr2avP0sOv83z/d13GbW
         kejCLD3S9LtHQZnru1gf6g+AT5K0ERcVsj6saM4eKqFWy9ybEFd2BcGRnkPK4HUInZ7b
         BlOw==
X-Gm-Message-State: APjAAAUfrIbVlSjzxfziVi6AOP5I8MMVv9rtS1s0DxSBrWKFC1MjekAn
        UsuweOoBiyPFmsvdTgzo0lnwR2jjpegAphnvBFU=
X-Google-Smtp-Source: APXvYqzROQ9GT8kawWI3jKEoqOnh3Hx09LCAQTweL1WHj3945Ho2Ssly40NtqjWs7ugNVPcOKRihv2eQ1CPACDPA0cU=
X-Received: by 2002:a63:f402:: with SMTP id g2mr2409825pgi.197.1559813801667;
 Thu, 06 Jun 2019 02:36:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAB31r6U3Ha+JrbjGC+wKj-+gJfQ7dk+LSoL1n0tQBxVTPb2mRQ@mail.gmail.com>
 <20190603131258.GA10397@kroah.com> <CAB31r6VK12FXoPh6eNfE1v_Tgjv917Nh7699=TZpm4SkCVMm-w@mail.gmail.com>
 <20190604054045.GD1588@kroah.com> <CAB31r6WAkDPKyvY31Up=OAGXvhQgS23uW5YYQs601zUaaNaELg@mail.gmail.com>
 <20190605165857.GA23286@kroah.com>
In-Reply-To: <20190605165857.GA23286@kroah.com>
From:   Vladimir Yerilov <openmindead@gmail.com>
Date:   Thu, 6 Jun 2019 19:36:30 +1000
Message-ID: <CAB31r6W2qhLCa5ecddx8Kqe0=1QEdE5eeg_be71QuyX+ZWMtEQ@mail.gmail.com>
Subject: Re: kernel NULL pointer dereference, ucsi bug
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Thanks a lot! Now I understand how to work with bisect in general.
However, its log is unlikely to be of help because I use my distro
tools to make a kernel package. So I dropped down into the merge
commit and for now I am here:

index : kernel/git/davem/net-next.git
commit - time&date - works or not
80f232121b69cc69a31ccb2b38c1665d770b0710 - 2019-05-07 22:03:58 -0700 - y
5d438e200215f61ca6a7aa69f3c4e035ac54d8ee - 2019-04-25 11:03:52 +0200 - y
6f6a407a591ebe3e4c6bd2329b29862b3980a3ca - 2019-05-03 18:00:15 +0200 -
bug introduced? Not sure:
Jun 06 18:57:33 kernel: BUG: unable to handle kernel NULL pointer
dereference at 0000000000000370
But no log-in issues which were preventing me from logging in as whole
merge 132d68d37d33f1d0b9c1f507c8b4d64c27ecec8a did, so there must be
something else after this commit too. For now I marked it as "bad".
e823d948b7e53dc982c867ac4ce7877fc0418897 - 2019-04-30 17:55:08 +0200 -
this is being built at the moment.

Bisect log, just in case:
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
# bad: [6f6a407a591ebe3e4c6bd2329b29862b3980a3ca] Merge tag
'usb-serial-5.2-rc1' of
https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into
usb-next
git bisect bad 6f6a407a591ebe3e4c6bd2329b29862b3980a3ca

Have a good day,
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
