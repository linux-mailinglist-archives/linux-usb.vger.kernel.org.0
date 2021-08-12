Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5130A3EA20F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Aug 2021 11:32:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbhHLJcW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Aug 2021 05:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235776AbhHLJcV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Aug 2021 05:32:21 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17E9C061765
        for <linux-usb@vger.kernel.org>; Thu, 12 Aug 2021 02:31:56 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id t7-20020a17090a5d87b029017807007f23so14224081pji.5
        for <linux-usb@vger.kernel.org>; Thu, 12 Aug 2021 02:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FVskKCl1yiOLa7tUE7ecSFjkdCcT3iQIU3DHdWUifrk=;
        b=N2TulBv/LnNVY4R0n44Ryimm1NeBT5sGkW7wDOan3PefdEv6z8dCkKmVHCwRyf8hUY
         w4D019j82RLvfDJtrxXZSYnRLvk4xMvipUw7KRs2m5VkLsNx4w7nSNL6tlFewsz8ZG1t
         FjDJA0HYtqqXOB9vEsv81ledxzP5JQKTlugrA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FVskKCl1yiOLa7tUE7ecSFjkdCcT3iQIU3DHdWUifrk=;
        b=drUnv+QGaR69kfKZDxqr5GYQjOioK3H7Q3DgEJf7yOg9vJb5xzLN9fxuoJ9HU4w+za
         oA6VuVwH+agYnf4BhEAAltTdmiC1qfZwzhz0wkNrPfM+m1RrRAa1Z/2fZE1sv23fxHip
         G3G/AHLc8UweGbMozNS4zsJwCGGHhF2jFQYS/bkObYvsO6PVGFJV6j5fzfSyh4WIlV+T
         lJdueLkg3IDqlxQRxnjL8DcZVdw1vH1kY0nBg+xBwC4hG+NjNCa7gOrp7I/h8WUlpftV
         1RFbvl41+8NqQK2IpjVTIczzHcbcSsxqcm+wJyvjY222s0Y3AkcRmB7XyJ50oTmwdFb9
         iONg==
X-Gm-Message-State: AOAM533mpF+O9Bc+djHMKoYlqF+zbw4fB8u1pH6EtFEgOwXuVLFhfLsj
        Zj9cn+t7cMQnloarRjDq5+zzb/G8AxCekIrg9DCPHg==
X-Google-Smtp-Source: ABdhPJw9SD7zM/iPzd2ZyOctgSD64+UEsMwbfhKhVAvg3OelRUv1hIF9x3rMFpFUEWWBokQYqGnseHeQKWptCVgE4gk=
X-Received: by 2002:aa7:8d92:0:b029:3e0:8660:b9aa with SMTP id
 i18-20020aa78d920000b02903e08660b9aamr2266006pfr.55.1628760716086; Thu, 12
 Aug 2021 02:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210809165904.RFC.1.I5165a4a8da5cac23c9928b1ec3c3a1a7383b7c23@changeid>
 <YRDxTodNNqtnpPpn@kroah.com> <CAATdQgDSCzZtiDSQk94CYHfSb9Mq28OH7-RdaTZNv3oPrW3nkQ@mail.gmail.com>
 <7b48f4c132a8b4b3819282e961fbe8b3ed753069.camel@mediatek.com>
In-Reply-To: <7b48f4c132a8b4b3819282e961fbe8b3ed753069.camel@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Thu, 12 Aug 2021 17:31:45 +0800
Message-ID: <CAATdQgD1paUUmWhiLVq-+zq0V6=RTJw89ggk=R6cBUZO+5dB-Q@mail.gmail.com>
Subject: Re: [RFC PATCH] usb: xhci-mtk: handle bandwidth table rollover
To:     =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= 
        <Chunfeng.Yun@mediatek.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "linux-mediatek@lists.infradead.org" 
        <linux-mediatek@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

HI,

On Wed, Aug 11, 2021 at 5:02 PM Chunfeng Yun (=E4=BA=91=E6=98=A5=E5=B3=B0)
<Chunfeng.Yun@mediatek.com> wrote:
>
> On Mon, 2021-08-09 at 17:42 +0800, Ikjoon Jang wrote:
> > On Mon, Aug 9, 2021 at 5:11 PM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Mon, Aug 09, 2021 at 04:59:29PM +0800, Ikjoon Jang wrote:
> > > > xhci-mtk has 64 slots for periodic bandwidth calculations and
> > > > each
> > > > slot represents byte budgets on a microframe. When an endpoint's
> > > > allocation sits on the boundary of the table, byte budgets' slot
> > > > should be rolled over but the current implementation doesn't.
> > > >
> > > > This patch applies a 6 bits mask to the microframe index to
> > > > handle
> > > > its rollover 64 slots and prevent out-of-bounds array access.
> > > >
> > > > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> > > > ---
> > > >
> > > >  drivers/usb/host/xhci-mtk-sch.c | 79 +++++++++----------------
> > > > --------
> > > >  drivers/usb/host/xhci-mtk.h     |  1 +
> > > >  2 files changed, 23 insertions(+), 57 deletions(-)
> > >
> > > Why is this "RFC"?  What needs to be addressed in this change
> > > before it
> > > can be accepted?
> >
> > sorry, I had to mention why this is RFC:
> >
> > I simply don't know about the details of the xhci-mtk internals.
> > It was okay from my tests with mt8173 and I think this will be
> > harmless
> > as this is "better than before".
> >
> > But when I removed get_esit_boundary(), I really have no idea why
> > it was there. I'm wondering if there was another reason of that
> > function
> > other than just preventing out-of-bounds. Maybe chunfeng can answer
> > this?
> We use @esit to prevent out-of-bounds array access. it's not a ring,
> can't insert out-of-bounds value into head slot.

Thanks, so that function was only for out-of-bounds array access.
then I think we just can remove that function and use it as a ring.
Can you tell me _why_ it can't be used as a ring?

I think a transaction (e.g. esit_boundary =3D 7) can start its first SSPLIT
from Y_7 (offset =3D 7). But will that allocation be matched with this?

-               if ((offset + sch_ep->num_budget_microframes) > esit_bounda=
ry)
-                       break;

I mean I'm not sure why this is needed.

Until now, I couldn't find a way to accept the USB audio headset
with a configuration of { INT-IN 64 + ISOC-OUT 384 + ISOC-IN 192 }
without this patch.

>
> >
> > Thanks!
> >
> > >
> > > thanks,
> > >
> > > greg k-h
