Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2B6A1BD1CF
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 03:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbgD2Bmv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 21:42:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgD2Bmu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 21:42:50 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07E0C03C1AD
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 18:42:50 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d184so311667pfd.4
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2020 18:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bMPFW6u9WfJ/4+rocfUieYqAKXa0HKwVKi2Z/RSXab8=;
        b=ME7VNmTKIgunHtICSeS/WAOTZvSQDb82bL+6R/aw+jnvECcV9An7fxur72SL0JRxI3
         jiC9T8Cac3PEwBd55Q7wQ/Xu5eA+Tgfj4PaaM93BRWYAUM5YU2GV6Se2OUi1Joc7quHX
         vFLT/prBwyFNvPAzMC75Jgo1EwTLOZAOFX8ubr4JzbezSkC9+gBUNpTwikA4rJ0zbTU5
         g9Zaaxxr1rqwqkJ4Bqp1qLLH/Gg4tRngljrmHo8hlQKZsdF9Xhf3NtxBaApgFsPcO3UD
         y5qDsOnMWyCgARQR3Gk8M12BOADeK5basBdrmZ+lNka8N33EoR8SJlL2osXc/hQRjq9v
         Z0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bMPFW6u9WfJ/4+rocfUieYqAKXa0HKwVKi2Z/RSXab8=;
        b=l8eOWTtvNC4tmVZ6tA3F9L7ys6RSA/TIXO1n2fh5JByX2jKm8A7M/mp/WLbxTilZtI
         EEOziA9MfwcMYwKB/iDP5SoO4uGxZ0gOO5ajSdU5xPi+RGu6PPTXbTvp31QBm/HxgDVP
         AHEZU160Ci/ropNb7XKxJC3LUXXFgZkdrOyC2LJajGSt0OYJd4Ybdpgsnxr91KiuBLl9
         pbJf+G9K56LKFDX3Yb57Fz/JqtMNbrAaZhvlbxkltxlyVKNWTqpZDuWJpCMMAnW7Ie/q
         evjHBdnHMUA9wtxu2thGuosViXttbtzGaJHdkVmNBRHCyGv7iM1x/jL8nfqGyQVwc2uT
         CXRw==
X-Gm-Message-State: AGi0PuazXIv9WyEgI5FgdiC65XNWbqx7NRhufkqUPMd+LiOV45n2Wr+U
        BXwccEnhUsF4N/Tw4sn25ctpvoWv0x0WXYyzTX9nMA==
X-Google-Smtp-Source: APiQypI5PF4xdbAKzLQ45pzvhpScisVo+qay5iLSCMHEom547sjhe4X0VZCaeeyQZaViKV8UHa+dlk9X03LTfSwBfDU=
X-Received: by 2002:a63:cf02:: with SMTP id j2mr6683835pgg.130.1588124569719;
 Tue, 28 Apr 2020 18:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeHK+yscLbzCh3P5uhOpxtB8-xhQbBSmSHpj6ugM=AMqjE7NA@mail.gmail.com>
 <Pine.LNX.4.44L0.2004282110170.26482-100000@netrider.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.2004282110170.26482-100000@netrider.rowland.org>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Wed, 29 Apr 2020 03:42:38 +0200
Message-ID: <CAAeHK+yVWgLD9DLNea_vBt3zj=3fLfw2Ai5U8=9sJ+QvmK0o-Q@mail.gmail.com>
Subject: Re: [PATCH] usb: raw-gadget: fix gadget endpoint selection
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 29, 2020 at 3:14 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>
> On Tue, 28 Apr 2020, Andrey Konovalov wrote:
>
> > Hi Alan,
> >
> > This patch uses the approach that I mentioned in the discussion about
> > endpoint selection. Does this look acceptable?
>
> I haven't had time to look through it yet.
>
> > I'm not sure which endpoint limits it makes sense to expose via
> > USB_RAW_IOCTL_EPS_INFO. I'm more or less sure about maxpacket_limit
> > and max_streams, but I don't exactly know what maxburst is used for.
> > Maybe there are some others?
>
> maxburst is a USB-3 thing.  It mainly affects just throughput, not
> functionality, and it's handled pretty much entirely by the hardware.
> You shouldn't worry about it, at least, not now.

The question is whether it will be needed when/if I ever add proper
USB3 support. It would be good to figure out which endpoint attributes
we need to expose now, rather than having to add another ioctl later.

> > I also wonder if we need to expose ep0 limits via USB_RAW_IOCTL_EPS_INFO too.
> > expose ep0 parameters?
>
> I don't think there are any significant attributes for ep0.  In
> general, gadget drivers have to live with what the hardware supports --
> or else fail to run at all.  After all, the driver can't substitute a
> different endpoint for ep0.

This is a good point. No need to export ep0 attributes then I guess.

Thanks!
