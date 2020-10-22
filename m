Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B142957FA
	for <lists+linux-usb@lfdr.de>; Thu, 22 Oct 2020 07:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444393AbgJVFg6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Oct 2020 01:36:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444387AbgJVFg6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Oct 2020 01:36:58 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E27C0613CE
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2020 22:36:58 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id q199so424406qke.10
        for <linux-usb@vger.kernel.org>; Wed, 21 Oct 2020 22:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZY++dB0QY4h0w6GNfNiJM1CAihdWz5g1QdtsKpKfXiA=;
        b=batcfBvQ8Yzq+JplHIjrrkkuuM5S5utEGjVQdmtosqdEaSM+/SPT3ZzWZyVNH3TJRp
         V8QpMLYUW/B9SjmWpxRoj/mNhEeb0l+SUbsWKXNox5v3juLATuuCAxHieqjy4VXEpeDz
         YXKQ+OlTqjgKXcYmGIW1rPkNnm2oUUKjbqdzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZY++dB0QY4h0w6GNfNiJM1CAihdWz5g1QdtsKpKfXiA=;
        b=b9rH887nm6jIKwqjz3mAXwY4o6phAyBP8dYxhWImxmgwBLa16LyTcoecZXIRPFkyTA
         0oeEVkueP6BK1qAFFPK3sl5+0jnTEiiNtpeYGInbF3XX55UC0RRZXwpHb8GrHaEh3H26
         cqcPgvyTnggyXBfjaEjjU6SBDTrchaNyPI2LkW00Wf7+RdaFw1aqMzRygt702aoQNh+u
         M3BDRB34K6pCAr+YH4ofsgdkn+s9VWd+RLwRFoYHC5S5MmV1JpKcCEmGdSrmJMdHt6kW
         SwcudBIZZkr8gvpedTxz8TmboMr4+SJESxZ8k3z6qmFU+aY6visBor91j+KO/WK2tfas
         WFUQ==
X-Gm-Message-State: AOAM530opjYBNEXqbtkkOTCjnZ7sB+8Gt4zMh7hIKayZcan9DqqGB8LW
        ww02TJ+072clagyetrC9W2lzo5/+U7VPBkih0LCjZb0h5yc=
X-Google-Smtp-Source: ABdhPJzKqgM6zt/DmQMQ0cYtDDTuSdknzZT7HUdk4PJeZ4jGXsHtxfTO2/4L4DuDNPYPvCSrftOFTATjkViLsIoJkmI=
X-Received: by 2002:a37:a9c9:: with SMTP id s192mr851858qke.128.1603345017428;
 Wed, 21 Oct 2020 22:36:57 -0700 (PDT)
MIME-Version: 1.0
References: <20201021211802.774854-1-pmalani@chromium.org> <20201022053041.GA6523@kroah.com>
In-Reply-To: <20201022053041.GA6523@kroah.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Wed, 21 Oct 2020 22:36:46 -0700
Message-ID: <CACeCKaepecD8JUo_ie_KcWd8mgYZR-3y0dGwaYNs5G5ErMuDqg@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: Expose Product Type VDOs via sysfs
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

Thanks for taking a look.

On Wed, Oct 21, 2020 at 10:30 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Wed, Oct 21, 2020 at 02:18:02PM -0700, Prashant Malani wrote:
> > A PD-capable device can return up to 3 Product Type VDOs as part of its
> > DiscoverIdentity Response (USB PD Spec, Rev 3.0, Version 2.0, Section
> > 6.4.4.3.1). Add a sysfs attribute to expose these to userspace.
>
> You forgot to add the proper Documentation/ABI/ file at the same time,
> which makes this patch impossible to review properly and able to be
> applied :(
>
Sorry about that, will fix and resend.

Best regards,

-Prashant
> Please fix.
>
> thanks,
>
> greg k-h
