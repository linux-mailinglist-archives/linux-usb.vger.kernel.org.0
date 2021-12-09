Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7767E46E9E3
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 15:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238548AbhLIO2L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 09:28:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238538AbhLIO2K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 09:28:10 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19369C061746
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 06:24:37 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id x3-20020a05683000c300b0057a5318c517so6271924oto.13
        for <linux-usb@vger.kernel.org>; Thu, 09 Dec 2021 06:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BJjsjLHh4AEXuHz/G4TAA5IRzV2ifPEv2mBPB3zCJx8=;
        b=GtTgXzt2YXEX/3p0PqfdHtflL1kYeFLKv+3m+zMWyNLviPHHTzhdh4gNRuLi0LChxZ
         W1/F1hXSUIggOSOS455giE2rOlGefHT+RrfK+t9Ufoz4Gfy6vtDb+6YqwsifDypGsBj5
         llpt6VXlCdhLajSa8HvDSWACwMOIpvrnJA/Y9BXaDaz/0j2fBs9GtAnpCdVn8qD238us
         1fNNv002TwxtVXmZvDFXPwJYcbpJG9YbnoYE3Tq6KxkuVcykAEkHyslFD+JbkAP/+Ubd
         e4HOZ8dhahyOI2NmUUj1Cs+k6YYHQxI1Df0UntML6ajWnypv8doYBXXjCH9IRbi+cpA7
         HzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BJjsjLHh4AEXuHz/G4TAA5IRzV2ifPEv2mBPB3zCJx8=;
        b=6wTW0zCEXm+hPZthfKm1UQWp1keGKulpH8kPt5VEf1nuHIJhyoxByLZiFU2DyGhv0d
         vtd5wEiQZpVEa7vdsX2iSWCGjUliEYgEB9A9Ptkuifb9ofznkHxSt8lAOoW3WyBAtf/L
         Rvm/zEVXhCK7AdS/cKSyKSkC8dUxzRuaic6txMKwbxE+mv/cKKSRJcgusjJgu07HhEuB
         JthYwYUWb3PSLQfau1CEf0HQHNc4zrhXRLXa1H/SvnhrIg33sHMjJOs0oRDpjrX31WM/
         hI/Ari8442s4XPY8/EjBE3+BHamMx2+ep9hmLvZRehpmTyVFX7FWfpE6A50R0mrw3Jxp
         6H+A==
X-Gm-Message-State: AOAM5304WeYlzw0f2T5CYpLnV8LXLwAoRGdsWledsCEke3SdShqRGUGK
        N2U+ZaB6/+j2voJCPW0KO2RItaI+vQGmXi5e/KU=
X-Google-Smtp-Source: ABdhPJz+Rs7IYtKeatLUr+kxSR4ety5uwgwnKGR7E0aj+UIeRWRkuQ6cPZlC0XDXjislHe05qlzHP8QuSj034Wh5Wt4=
X-Received: by 2002:a9d:6c14:: with SMTP id f20mr5648109otq.141.1639059876240;
 Thu, 09 Dec 2021 06:24:36 -0800 (PST)
MIME-Version: 1.0
References: <CALgCfKVfzS27XB0AufBUhb8xnfq5dWhESuu1KfxycQ=EnUnp+g@mail.gmail.com>
 <984b7409-caaa-8ba6-8d5c-beff5f107628@suse.com>
In-Reply-To: <984b7409-caaa-8ba6-8d5c-beff5f107628@suse.com>
From:   Maggie Maralit <maggie.roxas@gmail.com>
Date:   Thu, 9 Dec 2021 22:24:27 +0800
Message-ID: <CALgCfKX3rFUFTOfXsbLUaLdfcXA9oALhKLS9zfvtNCu8DemLAw@mail.gmail.com>
Subject: Re: An inquiry on supporting USB CDC ACM on Host PC as USB Host/Master
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

Thank you for your very quick response and straightforward answers -
they're very helpful.

I am not sure if my next (and possibly last) set of questions makes
sense - and that is, I've noticed that only a few platforms have
enabled CONFIG_USB_ACM in their *_defconfigs.
I've checked Linux Kernel version 5.10.83 and only about 28 out of the
390 there have this enabled (of course I do get that some might not
have USB ports in the first place).
For one, the x86_64_defconfig there doesn't have CONFIG_USB_ACM
enabled, but weirdly, my laptop is an x86_64 but I can see cdc_acm in
my modinfo (I have Ubuntu 18.04 LTS and my Linux Kernel version is
5.4.0.91).
I'm sure I have not changed my laptop's Linux Kernel before - though
it does seem to be updating for some reason because Ubuntu 18.04's
tagged kernel version is v4.15.

My questions are:
1. With CONFIG_USB_ACM very common and useful, why is it not enabled
by default in most platforms with USB ports like the x86_64 (normal
for laptops and Intel NUCs)?
2. Is there any rule or official statement from Linux Kernel
maintainers/experts, highly recommending platform developers (or
specific Ubuntu releases) to support this? (if there is, may I have a
link of the documentation mentioning such?)
3. And is there a possibility for that module to get installed in the
Linux Kernel just by the usual Linux commands (eg, "apt get
update/upgrade")?

Again, thank you very much for your assistance.

Regards,
Maggie



On Thu, Dec 9, 2021 at 9:30 PM Oliver Neukum <oneukum@suse.com> wrote:
>
>
> On 09.12.21 14:09, Maggie Maralit wrote:
> > From my understanding of:
> > - CONFIG_USB_ACM (reference, how to enable in kernel) that produces
> > cdc-acm.ko under /lib/modules/<kernel
> > version>/kernel/drivers/usb/class
> Correct
> > - CONFIG_USB_CDC_COMPOSITE (reference, how to enable in kernel) that
> > produces g_cdc.ko under /lib/modules/<kernel
> > version>/kernel/drivers/usb/gadget/legacy
> Yes, though that driver is the older of the two versions available
> > CONFIG_USB_ACM is the one the user needs to have in their Linux-based
> > Host PC's Linux Kernel  because this is the USB CDC ACM handler for
> > the Host PC side (having USB Host/Master settings).
> Correct
> >
> > CONFIG_USB_CDC_COMPOSITE seems to be the USB CDC ACM handler for the
> > device side (having USB Device/Slave settings) which is on the side of
> > our Product.
> Yes
> >
> > We assume that as an outcome of enabling our users enabling
> > CONFIG_USB_ACM in their Linux Kernels, the Linux-based Host PC don't
> > have to install any extra USB drivers to communicate with our product.
> Correct. This driver is for all devices which advertise a the correct
> interfaces for the CDC ACM class of devices.
>
>     HTH
>         Oliver
>
