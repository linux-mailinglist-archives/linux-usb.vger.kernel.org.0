Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0923E02C6
	for <lists+linux-usb@lfdr.de>; Wed,  4 Aug 2021 16:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238560AbhHDOGq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Aug 2021 10:06:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238567AbhHDOGp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Aug 2021 10:06:45 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4519AC06179C
        for <linux-usb@vger.kernel.org>; Wed,  4 Aug 2021 07:06:33 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso3768677pjo.1
        for <linux-usb@vger.kernel.org>; Wed, 04 Aug 2021 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7jonaqYUQJ0diYuQBbvYjToEHMp/OqMbSlxfrN33MdQ=;
        b=Ap9tlhDdEp/AJBj4+9xnNJYAH05TJNTE9T/+nvoyXzwrPO1vwIm/fsmsBTew+7/Y6Q
         PFi4tXAMw3L70vXk2NpKBWTLjk4dLFPXjGTrMEzXYBH4YAwrlY++hdW5jnskj90WpIRT
         TYt1DbcqyZcutqm7YwT24ePu7gI09rK/BdDHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7jonaqYUQJ0diYuQBbvYjToEHMp/OqMbSlxfrN33MdQ=;
        b=dFzp5qBl6GpoK53VmjmSrxdLkQaa8b9ZVnFfSR/9vS9a+IET00jnidBCuk30V8F9qY
         /5ZEWeGbVZ3VaJN0JS8OJ/fFNnF6Mq06grrWjjN9tfEZ6GfbPlSos3qtkfq3YFS9N70S
         ZSR32BB0PWHMlNtnuk4mPBY2BhwKRadViDpm1KSzp1nbQA42+CcaRB2kUQImeyC0SnIN
         4eqncjmsPwZ4k7LSM6JeqtgHiAX4AZnUtTKl7OQnPosysCQ5eKUm+O44GPiZxtAHGPtU
         QouHRCk30XzThaA689caIEImRzsejTEHaBVybcRWlWuX85hUVTYAkIfHbbQosTvWnP0B
         oH+w==
X-Gm-Message-State: AOAM533JvbbJkKjH5L+qj08BFVMPHQRq6/kF9hE9Gm+43yxLJw1uMclQ
        QvIecsm2XDLPtx8BpQG0eFo+Eclv6tk6nVQbg211tg==
X-Google-Smtp-Source: ABdhPJyBXL0MlcNDm9Hj6VmY9zZtlebY6O+dFuoHiEnNNkxOsmsy453mYWi6o74BLFoLuQVRX6FtB/RCRaV0q3U05UU=
X-Received: by 2002:a17:90a:e513:: with SMTP id t19mr10011223pjy.144.1628085992692;
 Wed, 04 Aug 2021 07:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-8-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgDWkohpzgr=z+uzro4m9Bd=v88DNnJ-M88-5-0annhH_w@mail.gmail.com> <1628054384.14982.12.camel@mhfsdcap03>
In-Reply-To: <1628054384.14982.12.camel@mhfsdcap03>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 4 Aug 2021 22:06:21 +0800
Message-ID: <CAATdQgA9WeKr2UkrcAKY1rP22GtT0bMezdWkb-wyF9Yjx2p_9w@mail.gmail.com>
Subject: Re: [PATCH 08/11] usb: xhci-mtk: update fs bus bandwidth by bw_budget_table
To:     Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-usb@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Eddie Hung <eddie.hung@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Wed, Aug 4, 2021 at 1:19 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Tue, 2021-08-03 at 14:05 +0800, Ikjoon Jang wrote:
> > Hi Chunfeng,
> >
> > On Fri, Jul 30, 2021 at 4:51 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > Use @bw_budget_table[] to update fs bus bandwidth due to
> > > not all microframes consume @bw_cost_per_microframe, see
> > > setup_sch_info().
> > >
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > > ---
> > >  drivers/usb/host/xhci-mtk-sch.c | 17 +++++++----------
> > >  1 file changed, 7 insertions(+), 10 deletions(-)
> > >
> > > diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
> > > index 0bb1a6295d64..10c0f0f6461f 100644
> > > --- a/drivers/usb/host/xhci-mtk-sch.c
> > > +++ b/drivers/usb/host/xhci-mtk-sch.c
> > > @@ -458,8 +458,8 @@ static int check_fs_bus_bw(struct mu3h_sch_ep_info *sch_ep, int offset)
> > >                  * Compared with hs bus, no matter what ep type,
> > >                  * the hub will always delay one uframe to send data
> > >                  */
> > > -               for (j = 0; j < sch_ep->cs_count; j++) {
> > > -                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_cost_per_microframe;
> > > +               for (j = 0; j < sch_ep->num_budget_microframes; j++) {
> > > +                       tmp = tt->fs_bus_bw[base + j] + sch_ep->bw_budget_table[j];
> > >                         if (tmp > FS_PAYLOAD_MAX)
> > >                                 return -ESCH_BW_OVERFLOW;
> > >                 }
> > > @@ -534,21 +534,18 @@ static void update_sch_tt(struct mu3h_sch_ep_info *sch_ep, bool used)
> > >  {
> > >         struct mu3h_sch_tt *tt = sch_ep->sch_tt;
> > >         u32 base, num_esit;
> > > -       int bw_updated;
> > >         int i, j;
> > >
> > >         num_esit = XHCI_MTK_MAX_ESIT / sch_ep->esit;
> > >
> > > -       if (used)
> > > -               bw_updated = sch_ep->bw_cost_per_microframe;
> > > -       else
> > > -               bw_updated = -sch_ep->bw_cost_per_microframe;
> > > -
> > >         for (i = 0; i < num_esit; i++) {
> > >                 base = sch_ep->offset + i * sch_ep->esit;
> > >
> > > -               for (j = 0; j < sch_ep->cs_count; j++)
> > > -                       tt->fs_bus_bw[base + j] += bw_updated;
> > > +               for (j = 0; j < sch_ep->num_budget_microframes; j++)
> > > +                       if (used)
> > > +                               tt->fs_bus_bw[base + j] += sch_ep->bw_budget_table[j];
> > > +                       else
> > > +                               tt->fs_bus_bw[base + j] -= sch_ep->bw_budget_table[j];
> >
> > I agree that xhci-mtk-sch still has more rooms for tt periodic bandwidth
> > but I think this approach could trigger a problem.
> See updat_bus_bw(), when add fs ep's bandwidth, it uses
> bw_budget_table[], so prefer to use the same way
>
> >
> > for example, if there are two endpoints scheduled in the same u-frame index,
> > * ep1out  = iso 192bytes bw_budget_table[] = { 188, 188, 0, ...} --> y0
> > * ep2in = int 64bytes, bw_budget_table[] = { 0, 0, 64, ... }  --> y0
> >
> > (If this is possible allocation from this patch),
> > I guess xhci-mtk could have some problems on internal scheduling?
>
> Test it on dvt env. don't encounter issues;
>

As you can see In the above example, this patch starts to allow that allocation.
Do you mean that we don't have to worry about such a case (on all MTK
platforms)?

thanks

> Thanks
>
> >
> > >         }
> > >
> > >         if (used)
> >
> > > --
> > > 2.18.0
> > >
>
