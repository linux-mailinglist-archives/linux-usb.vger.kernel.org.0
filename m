Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CB2E1E75E6
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 08:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725863AbgE2G2B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 02:28:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgE2G2B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 02:28:01 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2147C03E969
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 23:28:00 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k5so1144414lji.11
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 23:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=ijLlgGgTpxuD4bDLTtarbPKDZq05INyr0ZXvB4+1dwE=;
        b=AJCphOIwZps3mNlcMuUuUb6WTmqZCfr6oVr3PLystaDn59OwNhZrNmsvBB7idPhetR
         VWcdf2n9+r1tkzKUjIIJVcp28bpia28WH7iHzPtE6B8QhNAPu27+QBXwZPJZZDeYToOO
         2jegjlIUCxrQvs8QOdbLfsmskLVn24avP5EPjdRpOu0kdevtKfWTpnO4kvEuIZm0aT9Y
         QQmHAhJsS03iYVagAginCfeae3nKpBP8M5sLANc+ZXdfQSzVzE6Ch62M8oTnTGJSwEHd
         KCI3zWam2GJqYQotD23J5keRJvDMHLLwHHyiu0k1dgZAiCpz5+MGStcOTDDv2pzRZvg7
         SqTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=ijLlgGgTpxuD4bDLTtarbPKDZq05INyr0ZXvB4+1dwE=;
        b=ZCzHIy0kw1iboicrCxxaC1a8+O2Huluma2aThaPvlV0KoYXFHrUwF6dJttCJxSULX3
         AspFgwMlmtNSSbS5kZi/6l1qGPyF+VM0McbkPxlNQyy1M+0gNLnFXSPZv4HhgXmFEBti
         NRVjBPrcn0FnQVHqj02qbsTOqW9ZZMnCk1otlZt+3CmqcGkO7SeVZNg+5BRsFBW3fh8m
         NMB6gMdO42/KXMkfPlFcYkswY/7cYO0IpVTgA7oGSR0ZVwQRRALfO0ZFDhd0o1Bxephz
         0+2D03OEFOjnqu9jbhd6vyrfSVC6mfLSJInIethPzeBt5hmLSLJf//BykqmwGLe3q5wG
         0UBQ==
X-Gm-Message-State: AOAM532gqK0tucD3xuU7pNeB9FwCHD7XhDhfZdZaMpGwFFP/7jLE+G3o
        gQW6TBo2HYupjDH7qy8UM49KCiPd
X-Google-Smtp-Source: ABdhPJwUbJLcHv3lYlTnPzj5IkeMM5CVnBTFoCk5IpHRlmKN68PHARjxPylwLbwMDS10wI22w4JrZQ==
X-Received: by 2002:a2e:9e97:: with SMTP id f23mr3392565ljk.182.1590733678925;
        Thu, 28 May 2020 23:27:58 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id r197sm2049593lff.5.2020.05.28.23.27.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 23:27:58 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Belisko Marek <marek.belisko@gmail.com>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: usb raw gadget impossible to sent buffer bigger than 3MB
In-Reply-To: <CAAfyv349wRnYdxrq4ejLTcgOfyjBoDiv1SSv6LEinatE3rxffg@mail.gmail.com>
References: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com> <87v9kg1l9d.fsf@kernel.org> <CAAfyv349wRnYdxrq4ejLTcgOfyjBoDiv1SSv6LEinatE3rxffg@mail.gmail.com>
Date:   Fri, 29 May 2020 09:27:54 +0300
Message-ID: <87sgfj1cid.fsf@kernel.org>
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

Belisko Marek <marek.belisko@gmail.com> writes:

> Hi,
> On Thu, May 28, 2020 at 11:06 AM Felipe Balbi <balbi@kernel.org> wrote:
>>
>>
>> Hi,
>>
>> Belisko Marek <marek.belisko@gmail.com> writes:
>> > we're using USB RAW gadget for communicating with PC application. We
>> > have created loopback test which send file (any size) from PC to
>> > device and then same data are sent back to PC to verify roundtrip time
>> > (using bulk data transfer). Everything works fine up to 3MB file size.
>> > If we sent bigger file like e.g. 5M we can receive file on device but
>> > when we want to write to output endpoint we got:
>> >
>> > WARNING: CPU: 0 PID: 12299 at /kernel-source//mm/page_alloc.c:3725
>> > __alloc_pages_nodemask+0x1b0/0xde4
>> > [<c010fa08>] (unwind_backtrace) from [<c010c45c>] (show_stack+0x20/0x2=
4)
>> > [<c010c45c>] (show_stack) from [<c04cc0d4>] (dump_stack+0x20/0x28)
>> > [<c04cc0d4>] (dump_stack) from [<c01324ac>] (__warn+0xec/0x108)
>> > [<c01324ac>] (__warn) from [<c0132598>] (warn_slowpath_null+0x30/0x38)
>> > [<c0132598>] (warn_slowpath_null) from [<c021ccb8>]
>> > (__alloc_pages_nodemask+0x1b0/0xde4)
>> > [<c021ccb8>] (__alloc_pages_nodemask) from [<c023b888>]
>> > (kmalloc_order+0x2c/0x48)
>> > [<c023b888>] (kmalloc_order) from [<c023b8d0>] (kmalloc_order_trace+0x=
2c/0xd4)
>> > [<c023b8d0>] (kmalloc_order_trace) from [<c0261c24>] (__kmalloc+0x40/0=
x264)
>> > [<c0261c24>] (__kmalloc) from [<bf039bc4>] (ffs_epfile_io+0x13c/0x570
>> > [usb_f_fs])
>> > [<bf039bc4>] (ffs_epfile_io [usb_f_fs]) from [<bf03a0c0>]
>> > (ffs_epfile_write_iter+0xc8/0x120 [usb_f_fs])
>> > [<bf03a0c0>] (ffs_epfile_write_iter [usb_f_fs]) from [<c02734bc>]
>> > (new_sync_write+0xc8/0xec)
>> > [<c02734bc>] (new_sync_write) from [<c027351c>] (__vfs_write+0x3c/0x48)
>> > [<c027351c>] (__vfs_write) from [<c02749a0>] (vfs_write+0xcc/0x158)
>> > [<c02749a0>] (vfs_write) from [<c02756ac>] (SyS_write+0x50/0x88)
>> > [<c02756ac>] (SyS_write) from [<c0107a20>] (ret_fast_syscall+0x0/0x54)
>> > ---[ end trace fe5f79fe415b9881 ]---
>> >
>> > and write ends up with: write /run/ffs/ep1: cannot allocate memory
>> >
>> > When checked free command there should be plenty of available memory.
>> > Is there some limitation when writing to endpoint? We tried to split
>> > buffer to e.g. 3M and sent it and this works but looks like there is
>> > penalty when sending bigger files (100MB file received in 5secs whicle
>> > sending back it took 2minutes). Thanks for ideas and hints.
>>
>> that's trying to allocate a 5MiB buffer in kernel space. It just goes
>> over max allocation size, I'm assuming. Which kernel version are you
>> using? Which gadget controller are you using?
> We' using mainline 4.12 kernel and gadget is raw gadget using ffs +

that's old. Really, really old. You should ask for support from whoever
gave you that kernel. An alternative, upgrade to v5.6 latest stable or
latest v5.7-rc.

> composite drivers.

Right, and which UDC controller?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7Qq2oACgkQzL64meEa
mQaZyg/7B39trVsI4vOi7bFTK2IufLORLhvcmcFF92dq6pFiuiCeJVKbVqOkLhaD
wQ+vR0BW2pYqMnbaN3Q75PkTzSo4ZJRQ6L/V8spVg0I+GJjvWkkOE/7FD41qwS1z
0I9toE49gGOKu0nogjYTWSGuNHPE4AZ0/hyDk/I8jClrg3VOqAjEoKOEepi0v3Zn
8eIASpxtBbmqRZSjyt+uzaNdZDbkmOHNOcFkC6tOmiwDAKWwTu8fXB2jCi0z2P4K
1q7l2O0jwOclklqQhiZwrhZfnXNpZ7TPVHBfnI41yRUK9HL7FBPKhtHpvatHBCeU
nNsZ07MyCwebHkgSkTUHe0m/R3NgtFxfeW66rpntpO7y7TllQcn5kbvRmaMwYIWC
QtMoi7uaIMxnVruZgctUWTl0c2WNLDX7jz785MGlj306AdrSsmOTbNpLvRu8LTCZ
c9z31hxr0hYpefBXF5j7z54140PVMIVKzKSwX0E+wzq81+CQ4Tm/gfrLang0d4dD
Q7pJWJX5yZj17SlaBIMJC6vzN1PmwFky8ZqzYawM3i0A9DUDHW6RLbYrnd4sqxgf
d8GZtZHIALy2ZZd1/XciPS7irGfxYmeg8Y1NmvwGsRSlRKph5N3W6a0XeQmnfBTd
Iy6DGzlqB189fdwHWGOoY26BrfFU0az+UfVXRcMMdfsFD6zd24E=
=3jFf
-----END PGP SIGNATURE-----
--=-=-=--
