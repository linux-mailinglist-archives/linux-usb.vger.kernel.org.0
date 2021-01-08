Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F10DB2EEB8A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 03:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbhAHC5S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jan 2021 21:57:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726358AbhAHC5S (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jan 2021 21:57:18 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317B6C0612F4
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 18:56:38 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id z12so2885839pjn.1
        for <linux-usb@vger.kernel.org>; Thu, 07 Jan 2021 18:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3O9zuZkl9ZCDWe21i1b+VXFMIgQt5YzM+o0I5kD2q18=;
        b=EsLZpaTiHt45R+RX9vSof5hFiKU/thtsi7O0RCTnt7lezGkxOIc+1P6/BWbTv9yESI
         p8CTkQQLqtCqTaS8bEbkrsgrOkCPgzXnm3odm7+DBejXM4P1aP388fNOcOrFZZMUuiYH
         eiJqFXqS2CE+gC5m/PJv6Yjwm0TbnubxcYJ2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3O9zuZkl9ZCDWe21i1b+VXFMIgQt5YzM+o0I5kD2q18=;
        b=bf4s/UI7dwIfbdf9QCvjVidfzau8v6sgneRwMvuk/Z0VSEjrx8egWk9IJe/xB/TWu3
         nKUo2EaEkLWJZmHvwOWk804HlVp3jSkODrtV6FIM3pp/vSrCWSotwGOvNvIrG1J0I6O5
         jHy0subxBvgZJPi52dIWkav/Spk05xUYOAFA7Melbw6w/jy4SOLBVBpHZn6fmDKFS5S6
         l4o00xA3Jv5vrZSSCFYI8MJRcevPW2kyja7RePzBXNshMbwv6BDMghJrdthS6i2vUx/W
         PUnxRrjHwgVFptoOgbF313xn/xtKK/VtlDO+TPD4l3rhPTKawJNJdofwc/CtMrbWOEWN
         IEYQ==
X-Gm-Message-State: AOAM530NOmK1UuEcNPZFAVJ/gb8E1jb2H4wHKb2aTBi9za7AJZIDmCm6
        3huFXf3r2EDpuXNSKSEjLfdY2c/cj1zlwUC/0V9cag==
X-Google-Smtp-Source: ABdhPJzKGxYU6yAsvjkCKTP+2vQ3R7MIV+PsqPkURWLcF6PiijJ9ZVBxcWLGKVYSFjx9ws0RQhVHdLOmDDgsMI6i+zI=
X-Received: by 2002:a17:90a:2e83:: with SMTP id r3mr1457895pjd.112.1610074597749;
 Thu, 07 Jan 2021 18:56:37 -0800 (PST)
MIME-Version: 1.0
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
In-Reply-To: <2aea44f0-85e7-fd55-2c35-c1d994f20e03@linux.intel.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Fri, 8 Jan 2021 10:56:26 +0800
Message-ID: <CAATdQgBSh+Rkfj5a=g=4LwoNYcG+87zTJJF-VdeaA4WH5ARhuA@mail.gmail.com>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-usb@vger.kernel.org,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Tianping Fang <tianping.fang@mediatek.com>,
        Zhanyong Wang <zhanyong.wang@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 7, 2021 at 7:07 PM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
>
> On 29.12.2020 8.24, Ikjoon Jang wrote:
> > xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > to handle its own sw bandwidth managements and stores bandwidth data
> > into internal table every time add_endpoint() is called,
> > so when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> >
> > This patch adds two more hooks from check_bandwidth() and
> > reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > from reset_bandwidth().
> >
> > Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> >
>
> ...
>
> >
> > diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> > index d4a8d0efbbc4..e1fcd3cf723f 100644
> > --- a/drivers/usb/host/xhci.c
> > +++ b/drivers/usb/host/xhci.c
> > @@ -2882,6 +2882,12 @@ static int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev)
> >       xhci_dbg(xhci, "%s called for udev %p\n", __func__, udev);
> >       virt_dev = xhci->devs[udev->slot_id];
> >
> > +     if (xhci->quirks & XHCI_MTK_HOST) {
> > +             ret = xhci_mtk_check_bandwidth(hcd, udev);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
>
> Just noticed that XHCI_MTK_HOST quirk is only set in xhci-mtk.c.
> xhci-mtk.c calls xhci_init_driver(..., xhci_mtk_overrides) with a .reset override function.
>
> why not add override functions for .check_bandwidth and .reset_bandwidth to xhci_mtk_overrides instead?
>
> Another patch to add similar overrides for .add_endpoint and .drop_endpoint should probably be
> done so that we can get rid of the xhci_mtk_add/drop_ep_quirk() calls in xhci.c as well

Yes, I agree.
Let me submit another patch adding more overridables to xhci_driver_overrides.
Thanks.

>
> Thanks
> -Mathias
>
