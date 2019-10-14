Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75982D6328
	for <lists+linux-usb@lfdr.de>; Mon, 14 Oct 2019 14:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730885AbfJNM4s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Oct 2019 08:56:48 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35836 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729752AbfJNM4s (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Oct 2019 08:56:48 -0400
Received: by mail-pf1-f194.google.com with SMTP id 205so10388747pfw.2
        for <linux-usb@vger.kernel.org>; Mon, 14 Oct 2019 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pyS+DrympKyI4FdnI2r2kXlN0WEKP6R4E5v/Ib2pOHo=;
        b=YDp68Zyk2ywgMVsWqmix1nrW5hNei5h6TonrN8JMUKCArSSX9z2yuhp6zSoI4u/aGS
         Xk0HT/EcCVmQUXT3Z+9YEwyX+TYybN5z2TdKIeWK89+vNPpbrhA13RvNNu3xMjvTp4CN
         N2u/L72QjH7otjbNBSQpt0PcNU/fq78yjMo/qGJJBXUWpiO2DkkEopyZxiUYGq5E73NH
         2lhvsHl2DpJmfdY9RpXvZBF/X91ezHas6607xDXtRhie+kQkivFpiQrWBPkhpLhrQnlV
         JjRdZlL/6kpuzoLgRGQ2tKBPfpOGmL2e1u/WXtIImnsi2RCBvaFdc8WNEuQ5qDi32GIP
         pJkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pyS+DrympKyI4FdnI2r2kXlN0WEKP6R4E5v/Ib2pOHo=;
        b=qZd9OhbsyFk5TI+i5VT2xl2dYouxKNCQjMKBLehkboWmOvbOt8gJqr3Hk6nnVKA/Qf
         GmTpG+2NXyJWSnnrb+4Z2ZfYzjijdHD48vb2vL+L2+WYt7JlRSAqhXoNc5bJ46qTkD1E
         ISrtghCIc2dNjQpe3XbYo99VXZgFNLZKfWWAsP4xjXAllUXRJVKDDmkvMuEeEryGpMP2
         BuxS85Yo/ZVezeT9Z2+Af3vev2o0i4Rv/opivtKF3sZmRXRdlVyeJ3hqRlCOR3sDR2+5
         m3XYftEMjrik5cirZ+yEAVFrudaOdjyF3/ovIH+7xiob4XfFsnmdBRZaEVGRO8RdVpF5
         7osA==
X-Gm-Message-State: APjAAAVUaHjGjOaRTmCmgm7dDemn0SrP1KgkFYEJYi5bxCBFAuovVUEu
        QPrpvu3pqcq2Ii9gMbJL4kuwubeI36A+ubzwX36ltg==
X-Google-Smtp-Source: APXvYqxE5OPcn3OUgyHT/ky5G2661dzw3FQJAA1da5dBNfVi6+WKL5gqbxEQO874AQKIgeroPf+VvwnmMXE495YiMCM=
X-Received: by 2002:a65:4c03:: with SMTP id u3mr33085293pgq.440.1571057807365;
 Mon, 14 Oct 2019 05:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+zR=S1cyaYfehyUDrpMGMXvxgLEeS8V2ze2HkwYUp6bjg@mail.gmail.com>
 <Pine.LNX.4.44L0.1910111039380.1529-100000@iolanthe.rowland.org> <20191011150646.GA1240544@kroah.com>
In-Reply-To: <20191011150646.GA1240544@kroah.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Mon, 14 Oct 2019 14:56:36 +0200
Message-ID: <CAAeHK+yCdTUtTMbH6r_r=hmS+Tk5mk6=nyRVuOFz6yvYSySKPA@mail.gmail.com>
Subject: Re: KMSAN: uninit-value in alauda_check_media
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Jaskaran Singh <jaskaransingh7654321@gmail.com>,
        syzbot <syzbot+e7d46eb426883fb97efd@syzkaller.appspotmail.com>,
        Alexander Potapenko <glider@google.com>,
        LKML <linux-kernel@vger.kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
        usb-storage@lists.one-eyed-alien.net
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 11, 2019 at 5:06 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Oct 11, 2019 at 10:53:47AM -0400, Alan Stern wrote:
> > On Fri, 11 Oct 2019, Andrey Konovalov wrote:
> >
> > > On Fri, Oct 11, 2019 at 4:08 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > > > Now yes, it's true that defining status as an array on the stack is
> > > > also a bug, since USB transfer buffers are not allowed to be stack
> > > > variables.
> > >
> > > Hi Alan,
> > >
> > > I'm curious, what is the reason for disallowing that? Should we try to
> > > somehow detect such cases automatically?
> >
> > Transfer buffers are read and written by DMA.  On systems that don't
> > have cache-coherent DMA controllers, it is essential that the CPU does
> > not access any cache line involved in a DMA transfer while the transfer
> > is in progress.  Otherwise the data in the cache would be different
> > from the data in the buffer, leading to corruption.
> >
> > (In theory it would be okay for the CPU to read (not write!) a cache
> > line assigned to a buffer for a DMA write (not read!) transfer.  But
> > even doing that isn't really a good idea.)
> >
> > (Also, this isn't an issue for x86 architectures, because x86 has
> > cache-coherent DMA.  But it is an issue on other architectures.)
> >
> > In practice, this means transfer buffers have to be allocated by
> > something like kmalloc, so that they occupies their own separate set of
> > cache lines.  Buffers on the stack obviously don't satisfy this
> > requirement.
> >
> > At some point there was a discussion about automatically detecting when
> > on-stack (or otherwise invalid) buffers are used for DMA transfers.  I
> > don't recall what the outcome was.
>
> A patchset from Kees was sent, but it needs a bit more work...

Hi Greg,

Could you send a link to the patchset?

Thanks!
