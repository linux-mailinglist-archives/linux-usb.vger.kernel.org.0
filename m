Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F0ED375623
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 17:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235076AbhEFPBw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 11:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235026AbhEFPBw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 May 2021 11:01:52 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7CB6C061574
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 08:00:53 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id k127so5177508qkc.6
        for <linux-usb@vger.kernel.org>; Thu, 06 May 2021 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wnPWvebsLpWqkrgssMxxziUnTuI2lMgL+wHmlHihUo0=;
        b=ZatXpqHIBpF4zhWfm4wG0j3tasAauayBHHJLd5R4AUda+bkDSsfL/haw69SivVlKfz
         q/euFcBEhT/sWxTPsKy8Wvb7mOUGGR3g/NFaE/+VRoKgbaSUu560Brc6iuuRqRApAnbj
         6tLRAUYgTn6cAY9xz7iRDp0gWdl0ZgLk69gS3sLGU2WECmJVm9JW3bHywc7YUoZV3IJo
         2zFKoM1gvv2lqgytki5oO11b7FY0Bi1m/pqt2la6zxoZ5cHuBqopKtcbVdUI8oERbYfB
         Il4qyf3IwZ1DUJINyoGqVfMzP6PSsIBx1apn9tbvyuKbIiyC3upYb48J2dwU7TKSFf7G
         3zig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wnPWvebsLpWqkrgssMxxziUnTuI2lMgL+wHmlHihUo0=;
        b=gOMRQG77eeeB3YXdN8yCOGcOP3apOn5L6Hkhw3mJyR1WT/C3zxZ33vAwLXrLSbG5WM
         akH4x4Ny6GNe43uaIU3+j7aSAtZzwPM4My4knSDbECyEwwSdWg6eoaXhALS5npIayeqw
         Mj2zM6qw1sMMqJIqx61X08chLSGGBsLAD2BO5MF69gki5zIxIkrAMcOwLsyRpHrjRRSw
         D9pgwgMw2Yp1AMJWAYG2VqTqUZ7mWRuF70Ry+Ai2c7NnI36tDARgPJoF0a33wFit0Atm
         DCv/bTHnaVhhdiZLulwTvq79RJPvAIgdQh4RujGbaGdERHOSlTQ1Kd7PPz7x2X4aOpgP
         YHJQ==
X-Gm-Message-State: AOAM533Fcy3G3gEOj2PBXSvvKAeRRs95NAYsLokfK9dXPy/0cV8zua5P
        FRrW9Mk9H3YXA8rMr4zf1/2kYZfdBrrJMsw/O3AbRQ==
X-Google-Smtp-Source: ABdhPJw49gJsVB0KnaLsnNWT/f9nsGNoD86YZOc44K+29dWFrmXJQgU+zsNwUxCtB9baHOqhxVQreTCNOrDapSXP8EA=
X-Received: by 2002:a37:c20a:: with SMTP id i10mr4479130qkm.350.1620313252874;
 Thu, 06 May 2021 08:00:52 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000fdc0be05c1a6d68f@google.com> <20210506142210.GA37570@pc638.lan>
 <20210506145722.GC1955@kadam>
In-Reply-To: <20210506145722.GC1955@kadam>
From:   Dmitry Vyukov <dvyukov@google.com>
Date:   Thu, 6 May 2021 17:00:41 +0200
Message-ID: <CACT4Y+bEpri=MaveEOSeGGa3i-hwVgt3Cq13GMQxPLWu7g+ThA@mail.gmail.com>
Subject: Re: [syzbot] WARNING in __vmalloc_node_range
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Uladzislau Rezki <urezki@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 6, 2021 at 4:57 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Thu, May 06, 2021 at 04:22:10PM +0200, Uladzislau Rezki wrote:
> > Seems like vmalloc() is called with zero size passed:
> >
> > <snip>
> > void *__vmalloc_node_range(unsigned long size, unsigned long align,
> >                       unsigned long start, unsigned long end, gfp_t gfp_mask,
> >                       pgprot_t prot, unsigned long vm_flags, int node,
> >                       const void *caller)
> > {
> >       struct vm_struct *area;
> >       void *addr;
> >       unsigned long real_size = size;
> >       unsigned long real_align = align;
> >       unsigned int shift = PAGE_SHIFT;
> >
> > 2873  if (WARN_ON_ONCE(!size))
> >               return NULL;
> > <snip>
> >
> > from the dvb_dmx_init() driver:
> >
> > <snip>
> > int dvb_dmx_init(struct dvb_demux *dvbdemux)
> > {
> >       int i;
> >       struct dmx_demux *dmx = &dvbdemux->dmx;
> >
> >       dvbdemux->cnt_storage = NULL;
> >       dvbdemux->users = 0;
> > 1251  dvbdemux->filter = vmalloc(array_size(sizeof(struct dvb_demux_filter),
> > <snip>                                              dvbdemux->filternum));
>
> Indeed.
>
> It is a mystery because array_size() should never return less than
> sizeof(struct dvb_demux_filter).  That's the whole point of the
> array_size() function is that it returns ULONG_MAX if there is an
> integer overflow.

But it will return 0 if dvbdemux->filternum==0, right?
