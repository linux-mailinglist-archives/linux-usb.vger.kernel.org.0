Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530FD29791E
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 23:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756957AbgJWVwg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Oct 2020 17:52:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756953AbgJWVwg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Oct 2020 17:52:36 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B875FC0613CE
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 14:52:35 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id i7so1617832qti.6
        for <linux-usb@vger.kernel.org>; Fri, 23 Oct 2020 14:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QceJnC4dRZPNkE1Yt9KuuGN8xx+4GwM1datfjLxkevI=;
        b=WQkCZZCHD6jm8iZpwmjelqu62p54kzklxbWMj9e47TSQ/ZoawDCnqq1XnyNgtNr1Yw
         2ITC0kxWyZzXaZmsOjYG8/dRfkcM9mUmRQD2unmG8cHb8ZgQUJrcH+IQNifUWp4YOFp0
         IEy8KWJXFe06CxAJPb8PYBarepEpRo9W1/aWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QceJnC4dRZPNkE1Yt9KuuGN8xx+4GwM1datfjLxkevI=;
        b=Pv64z6o9rig/6pFjH+DnxXZ8nDCk0oJ2UeDrp5F1c9arbpDEVrpk04PENpSfSXeew2
         loU/dnt3veOkQnUlfLrshvmvAYiNPiIyoUotylJ8KtJaIvkwOxEf53K14nJMmMOvk04f
         EcAGmKd4VQWmmsw+DALBDpEBWjt//9SoLmNNSFFu6uUGrvBilW+VddpnVBA3R2ueSd7X
         VytGcQEZksVeOP6J6VNNDr3xJ9MczQVN75NnRdDMW3V7ruwJX2Djmf8klnDXBLWMgxN5
         Qd2mMw19k0KUO9z+ndvbghNkCueg2fbfIqUJaP0hsDvZKtFqEjCLd+JPWgR2bz5NOXy4
         osFg==
X-Gm-Message-State: AOAM531o0qs/I4wvMAiSd4jZJCF+WUBqVX0Sv/jYYO9eS2COas0341Qk
        sdkvvSB8Ne8OZdf2ec7LOdHUCjNMFcnOBnmZhplk2g==
X-Google-Smtp-Source: ABdhPJzxXiLM9Nysgq5xrTIC3dLNLCltoNzSRKxMC5NQrfFdsOPRswCaJmdEcvw3BhdladEH4EyKNknvu/OiuiZsQo0=
X-Received: by 2002:ac8:5a45:: with SMTP id o5mr4581914qta.182.1603489954911;
 Fri, 23 Oct 2020 14:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20201022061554.3418060-1-pmalani@chromium.org>
 <20201022065719.GA1440360@kroah.com> <CACeCKacvhtSfQ=hGYHi3AdrTT+XY2RpKmPHuYWoxNVmRWMeBBA@mail.gmail.com>
In-Reply-To: <CACeCKacvhtSfQ=hGYHi3AdrTT+XY2RpKmPHuYWoxNVmRWMeBBA@mail.gmail.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Fri, 23 Oct 2020 14:52:23 -0700
Message-ID: <CACeCKac-kfL_thmNRWs8sfj8TszNbrGZk2qptrJ1DLeuwQ9QCQ@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 12:13 AM Prashant Malani <pmalani@chromium.org> wrote:
>
> Thanks for reviewing the patch, Greg.
>
> On Wed, Oct 21, 2020 at 11:56 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > >
> > > +What:                /sys/class/typec/<port>-cable/identity/product_type_vdo
> > > +Date:                October 2020
> > > +Contact:     Prashant Malani <pmalani@chromium.org>
> > > +Description:
> > > +             Product Type VDOs part of Discover Identity command result. 3 values
> > > +             are displayed (for the 3 possible Product Type VDOs), one per line.
> > > +             The values will show 0s until Discover Identity command result becomes
> > > +             available. The values can be polled.
> >
> > Why are you describing the same value in two different locations?
>
> Both cable and partner can have Discover Identity VDOs and they are
> listed separately in sysfs.
> The other VDOs (id_header, cert_stat and product) have separate
> descriptions for cable and partner too.
> Perhaps there is a case for consolidating the listings here (factor
> out the ones which are common to cable and partner).
>

Just an update: I added a patch to the series which consolidates these
repeat identity entries into 1 location:
https://lore.kernel.org/linux-usb/20201023214328.1262883-1-pmalani@chromium.org/

Thanks and best regards,
