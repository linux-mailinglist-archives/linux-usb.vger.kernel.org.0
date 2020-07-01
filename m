Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B72A21045B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 08:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgGAG5k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 02:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgGAG5j (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jul 2020 02:57:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 125E6C061755
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 23:57:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n23so25673152ljh.7
        for <linux-usb@vger.kernel.org>; Tue, 30 Jun 2020 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=pOLnElTpt6WXP/Cwvkwg4VzuZ/ZxhoT9twHIrmck+fY=;
        b=kHYwzZtviJ43L6xpDTgW8dxNGqsHAs3jOrYUqMQ2uQdJkJXfe4tVhCsQUL8ddWYyFO
         N3zDw9YJw5qVtme/8M6+G4Ow+titHmmsJvQ8l9c2Z5gmS+TuNoEBl66PDHCSTnB1/1SY
         rLINpmsAhdjBM1/bPLMU2i7bLkCPxvdQfX/r8yacJ95J2txbXa+P7m+P55T5W7B7UJh2
         NIAA/DIMIFjXbJ2jZ4A7mGwNI/o+NTyulCSOUBy5GRI9frfrBvprgwU60DGffvspp8wF
         /is1hGPR/+SkBxnU/RQn1lsPs8citV5d7BuBRSmoZ/YbRq2qSG91FrAyaw71r42VQ6CX
         x2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=pOLnElTpt6WXP/Cwvkwg4VzuZ/ZxhoT9twHIrmck+fY=;
        b=ANP7e+44yBKVwPIBkq85YTH+fdxeYKSjwNw25CiODXsDY+4lHYKw6mCo0xFu0aA7oZ
         6KDXFY7Uv6tfE1O6NbTnEyWzSMxEyLolfanrQampRT5q1OnuOCdQu5pz6hAldi9CRSh1
         +XVhw+cKS+40F5fSxLkArtVtAIVsnS0aY5LAkJ6u+vatdjtanytX4hple+BnHST7kxdQ
         +ur+BuKnWfMEeKGeNq7CSWb20C4bTXJ7pjE+Ll4++reEK3V5fKKm4f1IGCZuC6ckZbeI
         Nrs2TbAxFTZHRHeBtu59ZSylXoSNVapPf488fXWYYtVM39NqavcSR1NqEQUFSELrV9oL
         WkdA==
X-Gm-Message-State: AOAM533PFGOV43p6Q5aRTaynGiNv9HL3wpFjdAPvC01fZge7UYHq4PuX
        NFb6naPtiMNtSUT6J5tf6qNju1nz
X-Google-Smtp-Source: ABdhPJxwoYGl3Xi+He179sXuogliOEZJArbzi98k4l7QNWzaGDm8I3nimuUxl/fBrj7gWVGSCPVzTw==
X-Received: by 2002:a2e:9891:: with SMTP id b17mr9083191ljj.22.1593586657243;
        Tue, 30 Jun 2020 23:57:37 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id y21sm1493003ljm.30.2020.06.30.23.57.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jun 2020 23:57:36 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Belisko Marek <marek.belisko@gmail.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: usb raw gadget impossible to sent buffer bigger than 3MB
In-Reply-To: <CAAfyv34X-+s=MSSqP9G9_kz6eOSNKGPgNjKSRdFUet=PNQczKw@mail.gmail.com>
References: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com> <87v9kg1l9d.fsf@kernel.org> <CAAfyv349wRnYdxrq4ejLTcgOfyjBoDiv1SSv6LEinatE3rxffg@mail.gmail.com> <87sgfj1cid.fsf@kernel.org> <CAAfyv34X-+s=MSSqP9G9_kz6eOSNKGPgNjKSRdFUet=PNQczKw@mail.gmail.com>
Date:   Wed, 01 Jul 2020 09:57:32 +0300
Message-ID: <87tuyr7meb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi,

Belisko Marek <marek.belisko@gmail.com> writes:
>> >> Belisko Marek <marek.belisko@gmail.com> writes:
>> >> > we're using USB RAW gadget for communicating with PC application. We
>> >> > have created loopback test which send file (any size) from PC to
>> >> > device and then same data are sent back to PC to verify roundtrip t=
ime
>> >> > (using bulk data transfer). Everything works fine up to 3MB file si=
ze.
>> >> > If we sent bigger file like e.g. 5M we can receive file on device b=
ut
>> >> > when we want to write to output endpoint we got:
>> >> >
>> >> > WARNING: CPU: 0 PID: 12299 at /kernel-source//mm/page_alloc.c:3725
>> >> > __alloc_pages_nodemask+0x1b0/0xde4
>> >> > [<c010fa08>] (unwind_backtrace) from [<c010c45c>] (show_stack+0x20/=
0x24)
>> >> > [<c010c45c>] (show_stack) from [<c04cc0d4>] (dump_stack+0x20/0x28)
>> >> > [<c04cc0d4>] (dump_stack) from [<c01324ac>] (__warn+0xec/0x108)
>> >> > [<c01324ac>] (__warn) from [<c0132598>] (warn_slowpath_null+0x30/0x=
38)
>> >> > [<c0132598>] (warn_slowpath_null) from [<c021ccb8>]
>> >> > (__alloc_pages_nodemask+0x1b0/0xde4)
>> >> > [<c021ccb8>] (__alloc_pages_nodemask) from [<c023b888>]
>> >> > (kmalloc_order+0x2c/0x48)
>> >> > [<c023b888>] (kmalloc_order) from [<c023b8d0>] (kmalloc_order_trace=
+0x2c/0xd4)
>> >> > [<c023b8d0>] (kmalloc_order_trace) from [<c0261c24>] (__kmalloc+0x4=
0/0x264)
>> >> > [<c0261c24>] (__kmalloc) from [<bf039bc4>] (ffs_epfile_io+0x13c/0x5=
70
>> >> > [usb_f_fs])
>> >> > [<bf039bc4>] (ffs_epfile_io [usb_f_fs]) from [<bf03a0c0>]
>> >> > (ffs_epfile_write_iter+0xc8/0x120 [usb_f_fs])
>> >> > [<bf03a0c0>] (ffs_epfile_write_iter [usb_f_fs]) from [<c02734bc>]
>> >> > (new_sync_write+0xc8/0xec)
>> >> > [<c02734bc>] (new_sync_write) from [<c027351c>] (__vfs_write+0x3c/0=
x48)
>> >> > [<c027351c>] (__vfs_write) from [<c02749a0>] (vfs_write+0xcc/0x158)
>> >> > [<c02749a0>] (vfs_write) from [<c02756ac>] (SyS_write+0x50/0x88)
>> >> > [<c02756ac>] (SyS_write) from [<c0107a20>] (ret_fast_syscall+0x0/0x=
54)
>> >> > ---[ end trace fe5f79fe415b9881 ]---
>> >> >
>> >> > and write ends up with: write /run/ffs/ep1: cannot allocate memory
>> >> >
>> >> > When checked free command there should be plenty of available memor=
y.
>> >> > Is there some limitation when writing to endpoint? We tried to split
>> >> > buffer to e.g. 3M and sent it and this works but looks like there is
>> >> > penalty when sending bigger files (100MB file received in 5secs whi=
cle
>> >> > sending back it took 2minutes). Thanks for ideas and hints.
>> >>
>> >> that's trying to allocate a 5MiB buffer in kernel space. It just goes
>> >> over max allocation size, I'm assuming. Which kernel version are you
>> >> using? Which gadget controller are you using?
>> > We' using mainline 4.12 kernel and gadget is raw gadget using ffs +
>>
>> that's old. Really, really old. You should ask for support from whoever
>> gave you that kernel. An alternative, upgrade to v5.6 latest stable or
>> latest v5.7-rc.
> We're in the process of kernel bump (we really have no vendor kernel
> we use mainline with few patches on top)
>>
>> > composite drivers.
>>
>> Right, and which UDC controller?
> Not sure if it is right but those options are enabled:
> EHCI support for OMAP3 and later chips
> OHCI support for OMAP3 and later chips

those are host controllers :-) Are you running on OMAP3? If that's the
case, then you're using MUSB. Still, please give it a whirl with
something more recent just to rule out the possibility that the problem
hasn't already been fixed.

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl78M9wACgkQzL64meEa
mQZ77Q/8CxMsYLkL8I2Ye9BmJyFnj+7I/Uqr9L/byMnM/aSIAuYn/bgWhDNiTlBS
j7PF+GxUH7VAeieR+g2Wlh2nOe0RqtPfKj3Df7Eaf+6PiXUeBAMojwnQcrwZqzQT
UYLkRruZ5Lhyt96w1JeEd+V42oChtDdIg/QGXQhT30mFoF1WWPN1GSPSzF5rqdE8
tUbJZEzswUCYR2J+tiewhu4VmbsMAHnYUMN6QsZVwAKQ+fhEOoFFRW+U8g70+Eek
XoFLf+/BOI9Y+2S11AG4tB2dTPdR9F70CGAVeb/07CYN6/u9gWe8VdMHfBN1A98l
C3EI7uT/rjVm1udMbjzkbhvL4gVyM/XWfP/Pka26anfToJmi1nD9yQ53RlE7KWha
b1WTaV6Pp9IAiXWIQQZXLn24TfrdNMioShEnP8rjDs8zYCywUXu/ofnf+2m+TQ+F
WKcNCkSJF6EiB7hahxfFfNyjaTOg63bf3BUdfWPMlEMAM3ldH/h0IF69LD3zryU7
kvqmECT5bShZk3xyugNQJrQzeaTKGuggAZBfwJfCyouOH0G6x9J6YBq67PB5ick6
6NbjrtKurTWhj03zij4iJjMz6gRTcAShYdzJZc+K3UaVPshuMt5ezJcOzTCy9wt9
9/IezIon9GwSE4Av40/waPMo8TwotMP75Z3FSU9J8zGiVBhytvA=
=2VpF
-----END PGP SIGNATURE-----
--=-=-=--
