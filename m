Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7904A295901
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 09:25:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508481AbgJVHZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 03:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2506380AbgJVHZT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 03:25:19 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA70C0613CF
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 00:25:19 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id r8so379846qtp.13
        for <linux-usb@vger.kernel.org>; Thu, 22 Oct 2020 00:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DvfRuzq2t0P16AvKn55ain8yuYvafMCh1JlHhrSFzYk=;
        b=KJ8HFOnHbfrCizxBWaNMlvuGNfJdHOD3gwbsZ+VUMNGkVi+6ohc/inYKvMISepAVre
         S4UljXttqHyQc1ZoGQbZG7xEEN1zGhoLCb99sHoabsaNzi84Ra0j6dC1FtUNWrx0iHR2
         n4taQ+Wyh668FwuSnvpFoUJFH3XdeHTo0RJCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DvfRuzq2t0P16AvKn55ain8yuYvafMCh1JlHhrSFzYk=;
        b=Y7AS/GNvcpLLz8LyoIWEr1b48BMd4+vnOrDdTq1Z8BTa3FIfjDqPv76wtIaMC8kDD4
         OwhCv5lqbucuhcVWm38GCx9ebLTVZgihwZV4eESaoDG8DCMH856p5T3RCGlydQ+ezi4o
         8RK5yrY9uNuI+zpg5PXwpsRftER3U9x2E0G9iJpfDY1LMqlFXjjNNHO3ELKG1DDiIvt+
         Hm/Hli8OLwwbEd+pQUUsuJ933tAdQhh+ReV48/gq0OldYD9DU/52aQBM2bauVAY3NcYf
         Y7uOeMLtfN5na1Zl0pUFXAeI1NchJxFxxP9Mcdimixqn/pwgH1gJj70lNylfqM0qo4+/
         z4Sw==
X-Gm-Message-State: AOAM5314QbATfLfEVyL8beo3wBSJQ45LmTEgm5tJ8dALOgTSuvPCPmxJ
        k6MC2jGWxZB1qjooO3gstXwcx6hRDLoMbBP75ljhZg==
X-Google-Smtp-Source: ABdhPJz/QZs4ybfZd55bp0vnCtUoz6WIOCxFdqbybUp44s4ZZGlfb97HohIoFIoqkNTev/Rcy/p6hPgBFqyQFALNkA0=
X-Received: by 2002:aed:22c7:: with SMTP id q7mr728888qtc.141.1603351518703;
 Thu, 22 Oct 2020 00:25:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201022061554.3418060-1-pmalani@chromium.org>
 <20201022065719.GA1440360@kroah.com> <CACeCKacvhtSfQ=hGYHi3AdrTT+XY2RpKmPHuYWoxNVmRWMeBBA@mail.gmail.com>
 <20201022071753.GA1470296@kroah.com>
In-Reply-To: <20201022071753.GA1470296@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Thu, 22 Oct 2020 00:25:07 -0700
Message-ID: <CACeCKafjm-T5WnQNRbpKm3OwxqYH+_MxLMg60-=RrpJFBzcKyA@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: Expose Product Type VDOs via sysfs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Thu, Oct 22, 2020 at 12:17 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> > > > +What:                /sys/class/typec/<port>-partner/identity/product_type_vdo
> > > > +Date:                October 2020
> > > > +Contact:     Prashant Malani <pmalani@chromium.org>
> > > > +Description:
> > > > +             Product Type VDOs part of Discover Identity command result. 3 values
> > > > +             are displayed (for the 3 possible Product Type VDOs), one per line.
> > >
> > > sysfs is "one value per file", not "one value per line".  This is not
> > > ok.
> >
> > I see. Would listing these out as three separate vdos (i.e vdo0, vdo1,
> > vdo2) be better?
>
> Given that your current implementation is not acceptable, something has
> to change :)

Got it. I'd like to see if Heikki has any suggestions on naming these
entries better.

Thanks again and best regards,

-Prashant

>
> thanks,
>
> greg k-h
