Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160441E76AA
	for <lists+linux-usb@lfdr.de>; Fri, 29 May 2020 09:31:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725855AbgE2Hba (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 29 May 2020 03:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725839AbgE2Hb3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 29 May 2020 03:31:29 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EE53C08C5C6
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 00:31:29 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id e10so991119edq.0
        for <linux-usb@vger.kernel.org>; Fri, 29 May 2020 00:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S8w6KpJa6E9P3Ab5+H5KQT60Yf2q4h8XKjA9OR105Sg=;
        b=uznq6OJA/q3HCkyJi+aENaj+slkF142Y4qd6bKwahLVoljTUH/eXUO9j2Makytl9ZI
         9VYwuIcKYfgkg2vdXJoht3e3ArD59/jNs++3kbWYCDTibRAt2ZKd5fQizJgMAuRAvHi+
         EE/O+lmXcPjGwy1pErLYrgxeyd+Um7ajvOCpwP3OhUjhx5R0HCXodIaITiwZQ03JGhi0
         Kvgh0/pl5JLowMchHEnkxAmHb6mf+xuQ+AVORMCt909UgVvsTTdlmbeAsigjZjQO7XjG
         M79HLWb0cwL3Y55qHLGlKRITzrg08ON/S8HKJD9U7eld9A2XKIdHFeROC+BeSfVbfNnX
         32Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S8w6KpJa6E9P3Ab5+H5KQT60Yf2q4h8XKjA9OR105Sg=;
        b=PNqmadfV0Iqslmzu+acfZYLuy9hxC87kB5dFIQksCYnMlTE+7gvLStLYLTXzTPvJ9V
         F88EX3kwy0E72u/phtJDY7v3/auY4EkaH0l80Is+LlqWwZGt+qka2SzKTjCC2STvuvyq
         NODMNskeveEjYRTV6Zj2CYCKg054DkyBjYPhZBTE0sUCq4NZAEXI+pg9k8WMqt+19TiV
         +cUmklkgJUFymC3zROlxrNRKegeka8dVQimC1OjgGwhvjU4Aq+n9900KLS8qLZKrmRAk
         BFHG7jD/7+vPHPlKQXTiA8Xt8py4rw4W+voiNeDN/6HQHImolfzM3ba6Li7hkPm+vjjD
         T/dg==
X-Gm-Message-State: AOAM530cUdA/zrzqwYIYuuoovWnN+6Q/6vWstKYQe4aifaBUo7abOfUt
        7KP1BAtRrkRObTRJQcKaeK5O7rTwPdGjISd8CtE=
X-Google-Smtp-Source: ABdhPJxtAvQIQjF25xAdnM3/gFW0Qm1H3FGWBgG4WzlHsJ+IuK2NhqamppDOtutr3gWhM7y8NZRHQy1hBKsQHe1C0+s=
X-Received: by 2002:a05:6402:690:: with SMTP id f16mr7178181edy.9.1590737488070;
 Fri, 29 May 2020 00:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com>
 <87v9kg1l9d.fsf@kernel.org> <CAAfyv349wRnYdxrq4ejLTcgOfyjBoDiv1SSv6LEinatE3rxffg@mail.gmail.com>
 <87sgfj1cid.fsf@kernel.org>
In-Reply-To: <87sgfj1cid.fsf@kernel.org>
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Fri, 29 May 2020 09:31:17 +0200
Message-ID: <CAAfyv34X-+s=MSSqP9G9_kz6eOSNKGPgNjKSRdFUet=PNQczKw@mail.gmail.com>
Subject: Re: usb raw gadget impossible to sent buffer bigger than 3MB
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, May 29, 2020 at 8:27 AM Felipe Balbi <balbi@kernel.org> wrote:
>
> Belisko Marek <marek.belisko@gmail.com> writes:
>
> > Hi,
> > On Thu, May 28, 2020 at 11:06 AM Felipe Balbi <balbi@kernel.org> wrote:
> >>
> >>
> >> Hi,
> >>
> >> Belisko Marek <marek.belisko@gmail.com> writes:
> >> > we're using USB RAW gadget for communicating with PC application. We
> >> > have created loopback test which send file (any size) from PC to
> >> > device and then same data are sent back to PC to verify roundtrip time
> >> > (using bulk data transfer). Everything works fine up to 3MB file size.
> >> > If we sent bigger file like e.g. 5M we can receive file on device but
> >> > when we want to write to output endpoint we got:
> >> >
> >> > WARNING: CPU: 0 PID: 12299 at /kernel-source//mm/page_alloc.c:3725
> >> > __alloc_pages_nodemask+0x1b0/0xde4
> >> > [<c010fa08>] (unwind_backtrace) from [<c010c45c>] (show_stack+0x20/0x24)
> >> > [<c010c45c>] (show_stack) from [<c04cc0d4>] (dump_stack+0x20/0x28)
> >> > [<c04cc0d4>] (dump_stack) from [<c01324ac>] (__warn+0xec/0x108)
> >> > [<c01324ac>] (__warn) from [<c0132598>] (warn_slowpath_null+0x30/0x38)
> >> > [<c0132598>] (warn_slowpath_null) from [<c021ccb8>]
> >> > (__alloc_pages_nodemask+0x1b0/0xde4)
> >> > [<c021ccb8>] (__alloc_pages_nodemask) from [<c023b888>]
> >> > (kmalloc_order+0x2c/0x48)
> >> > [<c023b888>] (kmalloc_order) from [<c023b8d0>] (kmalloc_order_trace+0x2c/0xd4)
> >> > [<c023b8d0>] (kmalloc_order_trace) from [<c0261c24>] (__kmalloc+0x40/0x264)
> >> > [<c0261c24>] (__kmalloc) from [<bf039bc4>] (ffs_epfile_io+0x13c/0x570
> >> > [usb_f_fs])
> >> > [<bf039bc4>] (ffs_epfile_io [usb_f_fs]) from [<bf03a0c0>]
> >> > (ffs_epfile_write_iter+0xc8/0x120 [usb_f_fs])
> >> > [<bf03a0c0>] (ffs_epfile_write_iter [usb_f_fs]) from [<c02734bc>]
> >> > (new_sync_write+0xc8/0xec)
> >> > [<c02734bc>] (new_sync_write) from [<c027351c>] (__vfs_write+0x3c/0x48)
> >> > [<c027351c>] (__vfs_write) from [<c02749a0>] (vfs_write+0xcc/0x158)
> >> > [<c02749a0>] (vfs_write) from [<c02756ac>] (SyS_write+0x50/0x88)
> >> > [<c02756ac>] (SyS_write) from [<c0107a20>] (ret_fast_syscall+0x0/0x54)
> >> > ---[ end trace fe5f79fe415b9881 ]---
> >> >
> >> > and write ends up with: write /run/ffs/ep1: cannot allocate memory
> >> >
> >> > When checked free command there should be plenty of available memory.
> >> > Is there some limitation when writing to endpoint? We tried to split
> >> > buffer to e.g. 3M and sent it and this works but looks like there is
> >> > penalty when sending bigger files (100MB file received in 5secs whicle
> >> > sending back it took 2minutes). Thanks for ideas and hints.
> >>
> >> that's trying to allocate a 5MiB buffer in kernel space. It just goes
> >> over max allocation size, I'm assuming. Which kernel version are you
> >> using? Which gadget controller are you using?
> > We' using mainline 4.12 kernel and gadget is raw gadget using ffs +
>
> that's old. Really, really old. You should ask for support from whoever
> gave you that kernel. An alternative, upgrade to v5.6 latest stable or
> latest v5.7-rc.
We're in the process of kernel bump (we really have no vendor kernel
we use mainline with few patches on top)
>
> > composite drivers.
>
> Right, and which UDC controller?
Not sure if it is right but those options are enabled:
EHCI support for OMAP3 and later chips
OHCI support for OMAP3 and later chips
>
> --
> balbi

Thanks and BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
