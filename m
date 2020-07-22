Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA33522900B
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 07:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgGVFpj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 01:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbgGVFpi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 01:45:38 -0400
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3E84C061794
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 22:45:38 -0700 (PDT)
Received: by mail-qv1-xf43.google.com with SMTP id p7so539749qvl.4
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 22:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d+Rv9gQvN0AWnY5gVIaLU80kapVHfuJxmwxIwJzoHMk=;
        b=oeaiGdLEuPXvvGGRyyv+qcZK6w7JgCFRHSlWYaS+2k1K3/r7Ie9nQzla9c0MOfKSkC
         dqvD7SgQTZ78kaLgmw7+t47lSkF5UPC0I19WU04b5fxCf789jVvYjutLlYQ9w/B8+nBc
         tf1VHEQSMXBCbRGQJAM2taPToNeuE3wnvoRKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d+Rv9gQvN0AWnY5gVIaLU80kapVHfuJxmwxIwJzoHMk=;
        b=TWSQsALos1hKUbSv/fMaRubsxAi4SMhAcGmNOoBlt7nSV4gYv++YM+86BxnKdh453J
         VHLy/qvTA0ou8NAzSeqTb2RGsJ7ACpBn9pbphViMKMt754rpLoUUJYs/ix/j3CvZ0mY/
         Y6g7+yhsMfPjn3yjNI7XKGNbXUIm4gAWqHpuD/8ZRzMd2JW2bYFbzd8txPnA4SC1fWLZ
         HMnmyjU52Y6G9cbfL4r4gk+keS4ZjkRfwo56VdyyV8ASfhRhL34hvFBupVon4tKDQ9v6
         eNq6Ir4yCVgfOHwG+GHW9Hkjaz6RKew6gT+DIr1esLNLO/tIBOJGWZsQwkXM+N12VYgh
         ExWw==
X-Gm-Message-State: AOAM531axl/BAVbiKMVdaAYDWVcZXozac+GwHMj29d9YU9sBY1JtRwQz
        uwnaWX6wg5ds+AhnOk6DMB1rgUQGnBRW2xFWe+JelA==
X-Google-Smtp-Source: ABdhPJwNmcfvobOrUb98dXI5/ItCU+Jfs+8us7sPptpHgNxeinrBuclasZ71lmCoP3hx76F/TZbveZYq1JcXE2X9twI=
X-Received: by 2002:a05:6214:3ac:: with SMTP id m12mr29065289qvy.18.1595396737801;
 Tue, 21 Jul 2020 22:45:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
 <20200615142645.56209-10-mika.westerberg@linux.intel.com> <20200717061600.GC68629@google.com>
 <20200720090233.GT5180@lahna.fi.intel.com>
In-Reply-To: <20200720090233.GT5180@lahna.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 21 Jul 2020 22:45:27 -0700
Message-ID: <CACeCKacXTFGipmywe1DxkPJK60ZwFD+bE0CS9b-bg-p12daqDA@mail.gmail.com>
Subject: Re: [PATCH 09/17] thunderbolt: Do not tunnel USB3 if link is not USB4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

On Mon, Jul 20, 2020 at 2:02 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2020 at 11:16:00PM -0700, Prashant Malani wrote:
> > Hi Mika,
> >
> > Sorry for the late comment..
>
> Sorry for the late reply, was on vacation ;-)
>
> > On Mon, Jun 15, 2020 at 05:26:37PM +0300, Mika Westerberg wrote:
> > > USB3 tunneling is possible only over USB4 link so don't create USB3
> > > tunnels if that's not the case.
> > >
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > >  drivers/thunderbolt/tb.c      |  3 +++
> > >  drivers/thunderbolt/tb.h      |  2 ++
> > >  drivers/thunderbolt/tb_regs.h |  1 +
> > >  drivers/thunderbolt/usb4.c    | 24 +++++++++++++++++++++---
> > >  4 files changed, 27 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> > > index 55daa7f1a87d..2da82259e77c 100644
> > > --- a/drivers/thunderbolt/tb.c
> > > +++ b/drivers/thunderbolt/tb.c
> > > @@ -235,6 +235,9 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
> > >     if (!up)
> > >             return 0;
> > >
> > > +   if (!sw->link_usb4)
> > > +           return 0;
> > On both here and the previous "up" check; should we be returning 0?
> > Wouldn't it be better to return an appropriate error code? It sounds
> > like 0 is considered a success....
>
> The idea here is that you can call this function for every type of
> router (can be one without USB3 adapters so TBT 3,1,2) and it creates
> the tunnel if conditions for USB3 tunneling are met. It is not
> considered an error.
>
> However, if the operations fail for some reason we return appropriate
> error code.

Got it. Thanks for the explanation!

BR,

-Prashant
