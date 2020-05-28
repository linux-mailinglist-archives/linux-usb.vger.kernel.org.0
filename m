Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D09BA1E5B7B
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 11:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgE1JKg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 05:10:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728080AbgE1JKg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 05:10:36 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4176C05BD1E
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 02:10:35 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id n24so31270835ejd.0
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 02:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wQ0MYe0z6hAN4jQvNg17FLUQPBXUxV7Zgii5Q2qDRDc=;
        b=nw+AGFDXxa4bKD3+irl6quJ4LpRJmK++HeSly2R63G/9ASUbSjow3bNmlyECrnNQWV
         roIHjWZtr1PC0CfplJudD9gtVDFZ4rSGCnunSL1GY56nnoiOEgsUU+5jIretGiLos5P8
         g9boGYv/dcuRyIAj/RhkXNVldk0pTTOQIJgn/6JPD2nbWYXGL6NpreuVqET7iLY16+Dz
         IhduiV5cSIjeIm/9amQbu/YqSEjRpwnKBWfvaSr2R6zO1D4m+x3mygz38vDz88jT116N
         dlVOJ7lyB8bJdOeARMsAayAbtn1Jo3c5SQpWaBNwDNGTrJDBhnXdhiETJM/pVCsG2wr4
         y59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wQ0MYe0z6hAN4jQvNg17FLUQPBXUxV7Zgii5Q2qDRDc=;
        b=DqAQVKKpaGbmSvu7wHsU9rIPdB4jl16lrIkQaUZCb4H5NeCLoxhVVocjQF0SpyK5HW
         2KiEqkiieBL6jPgxdY7IN/E4CS0qNBWAcmTbp+S5mRRhu64B44oRFDmbc1cVWB+uvZva
         LxFalzKUMl44Pk5/E5jH+eHyS+0YtyrNfHA4YmmV9arYhU2F+X+R52G0yTYADbFAQDFh
         bUtFUvhZnuehjgqpg2tlfiiOtrx5FtAxYrtIlgVvwU3wDn7FZ12U3qDC8/b3I+XvQhh2
         Atg5fxLCTLosDYtowIugHLIHTcdqN+9rj7UfVlv/ZZEjpas2VgAYPulEkxuod3jZMv9l
         iwpA==
X-Gm-Message-State: AOAM531TXvxjQfFRl3619nzCHL5SZGtGvQKaZwSjNXZ4Mo7BWBd3frr6
        favgl/t9tfGlD6anI14bYj0heedReDGfAU7uzc4=
X-Google-Smtp-Source: ABdhPJxX3OtFutPeTCiBQ1qxX5LoPYyWO/ggj5PC4gwPUwL5lOGoDCSQDdn+I6xfqaNgXQesUUZEdu06ZwjrmdykEbQ=
X-Received: by 2002:a17:906:4993:: with SMTP id p19mr2167550eju.67.1590657034492;
 Thu, 28 May 2020 02:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv37cFWsvoprz2jZ=jkdiTqxjPSYr_c6w5YYiaKWUe_-V1A@mail.gmail.com>
 <87v9kg1l9d.fsf@kernel.org>
In-Reply-To: <87v9kg1l9d.fsf@kernel.org>
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Thu, 28 May 2020 11:10:23 +0200
Message-ID: <CAAfyv349wRnYdxrq4ejLTcgOfyjBoDiv1SSv6LEinatE3rxffg@mail.gmail.com>
Subject: Re: usb raw gadget impossible to sent buffer bigger than 3MB
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
On Thu, May 28, 2020 at 11:06 AM Felipe Balbi <balbi@kernel.org> wrote:
>
>
> Hi,
>
> Belisko Marek <marek.belisko@gmail.com> writes:
> > we're using USB RAW gadget for communicating with PC application. We
> > have created loopback test which send file (any size) from PC to
> > device and then same data are sent back to PC to verify roundtrip time
> > (using bulk data transfer). Everything works fine up to 3MB file size.
> > If we sent bigger file like e.g. 5M we can receive file on device but
> > when we want to write to output endpoint we got:
> >
> > WARNING: CPU: 0 PID: 12299 at /kernel-source//mm/page_alloc.c:3725
> > __alloc_pages_nodemask+0x1b0/0xde4
> > [<c010fa08>] (unwind_backtrace) from [<c010c45c>] (show_stack+0x20/0x24)
> > [<c010c45c>] (show_stack) from [<c04cc0d4>] (dump_stack+0x20/0x28)
> > [<c04cc0d4>] (dump_stack) from [<c01324ac>] (__warn+0xec/0x108)
> > [<c01324ac>] (__warn) from [<c0132598>] (warn_slowpath_null+0x30/0x38)
> > [<c0132598>] (warn_slowpath_null) from [<c021ccb8>]
> > (__alloc_pages_nodemask+0x1b0/0xde4)
> > [<c021ccb8>] (__alloc_pages_nodemask) from [<c023b888>]
> > (kmalloc_order+0x2c/0x48)
> > [<c023b888>] (kmalloc_order) from [<c023b8d0>] (kmalloc_order_trace+0x2c/0xd4)
> > [<c023b8d0>] (kmalloc_order_trace) from [<c0261c24>] (__kmalloc+0x40/0x264)
> > [<c0261c24>] (__kmalloc) from [<bf039bc4>] (ffs_epfile_io+0x13c/0x570
> > [usb_f_fs])
> > [<bf039bc4>] (ffs_epfile_io [usb_f_fs]) from [<bf03a0c0>]
> > (ffs_epfile_write_iter+0xc8/0x120 [usb_f_fs])
> > [<bf03a0c0>] (ffs_epfile_write_iter [usb_f_fs]) from [<c02734bc>]
> > (new_sync_write+0xc8/0xec)
> > [<c02734bc>] (new_sync_write) from [<c027351c>] (__vfs_write+0x3c/0x48)
> > [<c027351c>] (__vfs_write) from [<c02749a0>] (vfs_write+0xcc/0x158)
> > [<c02749a0>] (vfs_write) from [<c02756ac>] (SyS_write+0x50/0x88)
> > [<c02756ac>] (SyS_write) from [<c0107a20>] (ret_fast_syscall+0x0/0x54)
> > ---[ end trace fe5f79fe415b9881 ]---
> >
> > and write ends up with: write /run/ffs/ep1: cannot allocate memory
> >
> > When checked free command there should be plenty of available memory.
> > Is there some limitation when writing to endpoint? We tried to split
> > buffer to e.g. 3M and sent it and this works but looks like there is
> > penalty when sending bigger files (100MB file received in 5secs whicle
> > sending back it took 2minutes). Thanks for ideas and hints.
>
> that's trying to allocate a 5MiB buffer in kernel space. It just goes
> over max allocation size, I'm assuming. Which kernel version are you
> using? Which gadget controller are you using?
We' using mainline 4.12 kernel and gadget is raw gadget using ffs +
composite drivers.
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
