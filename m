Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E164346F960
	for <lists+linux-usb@lfdr.de>; Fri, 10 Dec 2021 03:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236133AbhLJCye (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 21:54:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236078AbhLJCyd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 21:54:33 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A9D5C0617A1
        for <linux-usb@vger.kernel.org>; Thu,  9 Dec 2021 18:50:58 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v15-20020a9d604f000000b0056cdb373b82so8303710otj.7
        for <linux-usb@vger.kernel.org>; Thu, 09 Dec 2021 18:50:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bIjkLnUs4ytDMRNkIDJbogMxp0jQrojkoozUNc/LbBw=;
        b=V3RChZflC5h6ijyqt3OnENG037HGQIF3vAfQD0yc1K7IHIZiLn8j3qLWYVFwe3n/n8
         1o1yONmdzIPQXNezC2BtIIbjV6ze+y8Tt7oZagsUe1kRNFk0i0xdQXLkK2TzW62Aieax
         ZWu88pPBv3EKvQyDW7SUEgx93TSHiTomuU4U+Z5RkF+aEoUYBoXEhuIPyP1p09F2paUC
         U/1Ks/sEnYOPYv5zM2qHQZvcgIA0Xq+Zn41I7uppQqIJU8K5G8cFxgKIPzBBJm5dpX/K
         oi0x4qhNyTGB6K8bD9L6lyUe5DCDgF/g2I3GshnQ3r8sXKiaYgAf3VDSDLD/d91o2mjX
         nFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bIjkLnUs4ytDMRNkIDJbogMxp0jQrojkoozUNc/LbBw=;
        b=6xLUQHDpeC8G5XHnXFX2zyULn7D4Y7LHdFPr1F/KI+6H6LfR5EhfJL/mHKT+vOtR+Y
         TWTG5cLN5pQIvFG+4e0ulMwiGsZeoJXMPBrL1JV6ADyBA2KvIcd87S86E9F5te8FOkc0
         /BsZ7S5VnnMDMO2OS1YHP0iMikOI1GLMl4yOQjqO+v87DdptLZe5iiuul2ikhr4c6eG0
         3N7SmE91ivVSYHLaNdiwly9Mj2Necuu20fCLyBuvIFR0jc+qjqGJRHrzyin4ala1ZpFb
         2P0v0ZqfZS5pusXFpRzmOXlzNca8nyNfqszPyOzt+NgSC3ENdVN+cBfXGb87cewfuWYf
         ACVg==
X-Gm-Message-State: AOAM531d/YYksQlrBfY2BidFba6O43OpQs1PLbqSg6yXCWNI3thfDWWU
        aZG/fMoGukWqKetLYdUOK9MFI8HZbNwGzH8Kdsg20y2C
X-Google-Smtp-Source: ABdhPJwbt+/behu8xQMgO+XFJW0YRSqBruRjFZ2CU05ep+otoIIrzD9WnJTGYZzA4dUUVL4Wlw6AvrxNZzEW0wlrD5M=
X-Received: by 2002:a9d:6c14:: with SMTP id f20mr9314711otq.141.1639104657707;
 Thu, 09 Dec 2021 18:50:57 -0800 (PST)
MIME-Version: 1.0
References: <CALgCfKVfzS27XB0AufBUhb8xnfq5dWhESuu1KfxycQ=EnUnp+g@mail.gmail.com>
 <984b7409-caaa-8ba6-8d5c-beff5f107628@suse.com> <CALgCfKX3rFUFTOfXsbLUaLdfcXA9oALhKLS9zfvtNCu8DemLAw@mail.gmail.com>
 <672cf564-79f4-f329-0e20-fdcbbcfd0d11@suse.com>
In-Reply-To: <672cf564-79f4-f329-0e20-fdcbbcfd0d11@suse.com>
From:   Maggie Maralit <maggie.roxas@gmail.com>
Date:   Fri, 10 Dec 2021 10:50:50 +0800
Message-ID: <CALgCfKXNb2=LC3YVJ_WepFuaWp2=HtYVCCE54pHDDg1_=6ipYQ@mail.gmail.com>
Subject: Re: An inquiry on supporting USB CDC ACM on Host PC as USB Host/Master
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Oliver,

These are all noted and understood.
Again, thank you for all your answers on this!

Regards,
Maggie

On Thu, Dec 9, 2021 at 11:29 PM Oliver Neukum <oneukum@suse.com> wrote:
>
>
> On 09.12.21 15:24, Maggie Maralit wrote:
> Hi,
> > My questions are:
> > 1. With CONFIG_USB_ACM very common and useful, why is it not enabled
> > by default in most platforms with USB ports like the x86_64 (normal
> > for laptops and Intel NUCs)?
>
> The upstream config is supposed to be minimal. Doing optimal
> configs is a task for distributions or people who compile their own kernel.
>
> > 2. Is there any rule or official statement from Linux Kernel
> > maintainers/experts, highly recommending platform developers (or
> > specific Ubuntu releases) to support this? (if there is, may I have a
> > link of the documentation mentioning such?)
> That is Ubuntu's job.
> > 3. And is there a possibility for that module to get installed in the
> > Linux Kernel just by the usual Linux commands (eg, "apt get
> > update/upgrade")?
> >
> That question depends on your distribution. I suppose every sane general
> purpose Linux distribution will compile and deliver cdc-acm, but I haven't
> checked.
>
> The configuration of your running kernel is in /proc/config.gz and is chosen
> by the developer's of Ubuntu if you are running their kernel.
>
>     HTH
>         Oliver
>
