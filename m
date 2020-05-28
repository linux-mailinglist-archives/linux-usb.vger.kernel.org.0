Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33251E5B6C
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 11:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728118AbgE1JGp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 05:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728028AbgE1JGp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 05:06:45 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05696C05BD1E
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 02:06:45 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id m18so32416231ljo.5
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=IBvt5JfEB2QKN9QHVuz5jCudOUlIjzGTB3J+Xke3uqI=;
        b=OYJU0aTF52knULvyfYnXKkiT8Kjup8c29tbj8Mz7XNlHWhBogWq41KBdOHbv7wCwXz
         jF3cXFOC+LfJrnGKpyNKlc2hPFmi+oSN49gIcRQ4/p5p4IHZuOZDg3Jo6WtpB+k4M7sD
         tRdgbGkzWktfQ2sxhXqK0ZNdvBJZAaHAMKrOq776QYwb5izzxddrOLnYBn3qtLlg4B6C
         re6UmhFfGtOEFBtb8VTu0aiN8OaqCnBLtLcXlwFIPxml4A3CXsw8nAMixpcHoAlnetMI
         aVjyNTlibFeFxHI7LpgvaqFv0P60FMdcqo35q8/6qozapi8XeMox82bw7yoeqBe1U8lJ
         aEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:in-reply-to:references
         :date:message-id:mime-version;
        bh=IBvt5JfEB2QKN9QHVuz5jCudOUlIjzGTB3J+Xke3uqI=;
        b=lkI8Na7HdsmUY7M40GgIIkjRUkkAQBcGoYes7vtDJyAoekHfGe6+YPhVqq/JbuDhpM
         Z08+JQZ+LghaArIpMrS3M2PgQzR6datJLKZLCDFAt0h2/aXclz9UX3aNHYTtgGfrrOuq
         jvyJMqGzWjZ6j08Vg8RMbmoW7Cn+5MmyNGiXHboNSY0kGxY2FFtM/N9gVvvAw2jCpze/
         9YtYHCkEOlvci6Span0jyzgeWoWx/lFv4mJzMgtSMRcCV+AdFp4K0+DxltzdO9RfRMeg
         JxNeJGYCYlUDuwV27gQbJAuzEAUOvAZ4YPpQOIYj+xuHG1o4ahuXPTdbOzMvH9cOal1J
         T9mQ==
X-Gm-Message-State: AOAM532rsDyfJFAAY2K4ara2BTu+zIx8FEKBO/VM0ZVxOK3cCi8+L0km
        XwECu76B1WO3frAsVapKfGAIY4Fj
X-Google-Smtp-Source: ABdhPJw1F5ExwMmdnjVgrUYJmeKKBLq1BsnuUojIimgvwRdSwq37zy8XaxTjznEeIuqgr78j6ciFaA==
X-Received: by 2002:a2e:83c7:: with SMTP id s7mr1047528ljh.68.1590656803161;
        Thu, 28 May 2020 02:06:43 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id i11sm1316956ljb.1.2020.05.28.02.06.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 May 2020 02:06:42 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Belisko Marek <marek.belisko@gmail.com>,
        Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: usb raw gadget impossible to sent buffer bigger than 3MB
In-Reply-To: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com>
References: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com>
Date:   Thu, 28 May 2020 12:06:38 +0300
Message-ID: <87v9kg1l9d.fsf@kernel.org>
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
> we're using USB RAW gadget for communicating with PC application. We
> have created loopback test which send file (any size) from PC to
> device and then same data are sent back to PC to verify roundtrip time
> (using bulk data transfer). Everything works fine up to 3MB file size.
> If we sent bigger file like e.g. 5M we can receive file on device but
> when we want to write to output endpoint we got:
>
> WARNING: CPU: 0 PID: 12299 at /kernel-source//mm/page_alloc.c:3725
> __alloc_pages_nodemask+0x1b0/0xde4
> [<c010fa08>] (unwind_backtrace) from [<c010c45c>] (show_stack+0x20/0x24)
> [<c010c45c>] (show_stack) from [<c04cc0d4>] (dump_stack+0x20/0x28)
> [<c04cc0d4>] (dump_stack) from [<c01324ac>] (__warn+0xec/0x108)
> [<c01324ac>] (__warn) from [<c0132598>] (warn_slowpath_null+0x30/0x38)
> [<c0132598>] (warn_slowpath_null) from [<c021ccb8>]
> (__alloc_pages_nodemask+0x1b0/0xde4)
> [<c021ccb8>] (__alloc_pages_nodemask) from [<c023b888>]
> (kmalloc_order+0x2c/0x48)
> [<c023b888>] (kmalloc_order) from [<c023b8d0>] (kmalloc_order_trace+0x2c/=
0xd4)
> [<c023b8d0>] (kmalloc_order_trace) from [<c0261c24>] (__kmalloc+0x40/0x26=
4)
> [<c0261c24>] (__kmalloc) from [<bf039bc4>] (ffs_epfile_io+0x13c/0x570
> [usb_f_fs])
> [<bf039bc4>] (ffs_epfile_io [usb_f_fs]) from [<bf03a0c0>]
> (ffs_epfile_write_iter+0xc8/0x120 [usb_f_fs])
> [<bf03a0c0>] (ffs_epfile_write_iter [usb_f_fs]) from [<c02734bc>]
> (new_sync_write+0xc8/0xec)
> [<c02734bc>] (new_sync_write) from [<c027351c>] (__vfs_write+0x3c/0x48)
> [<c027351c>] (__vfs_write) from [<c02749a0>] (vfs_write+0xcc/0x158)
> [<c02749a0>] (vfs_write) from [<c02756ac>] (SyS_write+0x50/0x88)
> [<c02756ac>] (SyS_write) from [<c0107a20>] (ret_fast_syscall+0x0/0x54)
> ---[ end trace fe5f79fe415b9881 ]---
>
> and write ends up with: write /run/ffs/ep1: cannot allocate memory
>
> When checked free command there should be plenty of available memory.
> Is there some limitation when writing to endpoint? We tried to split
> buffer to e.g. 3M and sent it and this works but looks like there is
> penalty when sending bigger files (100MB file received in 5secs whicle
> sending back it took 2minutes). Thanks for ideas and hints.

that's trying to allocate a 5MiB buffer in kernel space. It just goes
over max allocation size, I'm assuming. Which kernel version are you
using? Which gadget controller are you using?

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7Pfx4ACgkQzL64meEa
mQa1hg//cQmcZWw4JuJxl9qthxQ/rfzb6myn7sAMV1wIvTcQMmoO49T2D6stZo8F
sZJ0r19E3QzlOoGIZBYiyD4aZ74uthnfi9YLh2itU1R5dlWL8RREJiPa/GooLW8j
ZQlIsitg5pzMbO3epeN2OuQq0IL3yYrCaQooeKcoHjuq+5C10pbHF4z2GbjPOFQY
/UhE+ga/+5kJuopE9W4DENMi0OENeoPD9OG/ACIfvisXM6O76chmBMflyzhDOppF
iRnmHmB0Tc9co76he48AeqRkd6WjvlD830cCfx1JoaZKQVvy2waYr494YHFki56T
mSa7cdWxtZmjGmV7WmJR42SWOYYIXRxujPBpXzgQ1eeA2RGzYZ+DgWHd14JAsOS0
1raI7NbjUp1u6SN9BiLLVnmUVkPhxdNbTghL0UdZEe/EWzs2DxUJcf4km0zD+ieF
iCOZZl9EzTNJVhiJSwa6FiMe7P8c/OiT0rGLfvR8E5ZIB9b0eldt04qI3fE2DIG7
6bEJnTbHYYgFDks3hPLB7vVc1uXcrIZPXBM20oSNKTe3rfvgiyr6F9VzKNsljZ4j
to/33aw3jQsxRqgGwAg/6illCT+mKQahsTCvr+IFAILeufRRJLDdB7SbQIMOFgtB
mI8G/O9dk7saNzMYonEkY9+WgktV0NEhKJM4fOjvu7P7rcuNxAY=
=CyCE
-----END PGP SIGNATURE-----
--=-=-=--
