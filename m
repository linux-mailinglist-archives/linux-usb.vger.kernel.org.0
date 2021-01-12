Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 538E22F253B
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 02:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731222AbhALBHW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Jan 2021 20:07:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727919AbhALBHV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Jan 2021 20:07:21 -0500
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com [IPv6:2607:f8b0:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BCCC061575
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 17:06:41 -0800 (PST)
Received: by mail-il1-x135.google.com with SMTP id q5so1276558ilc.10
        for <linux-usb@vger.kernel.org>; Mon, 11 Jan 2021 17:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nzaCmTGVAdPW30IiuwjYL3Fn07bGewXd18aF9G0+2qc=;
        b=l+3m6w2ChUjHooFb2JVRiUZSs6Ju541XhRlIxwm25+lti+tMcdw9tyDBt18vVurY95
         7B0W8s3rm/1N7LW+hshgdLUlIm/v3BAo1CGIgehQJkOUYyOfUK11Ym0MVdxB2x9cYyDu
         Qy0TP3Nzy1sRsUAx7t26A2dWNuOeeNI0E7LoYUa+2zdZoGXRT3Y5U4WkFd6mjsPLHNbA
         Kbg9U4Bj6i3UMrFTM+E95wdCAYwH/e19SEeDT/qflLR8Oy+lqKxmSD5CDh8nswQgwJ7X
         exeGHAOLjcPMzpTIdyDL6a5dDdoULB8/1uo2+Ti7wAkNuKoZqGAgf78YWGBdcGsOAkQB
         Zh0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nzaCmTGVAdPW30IiuwjYL3Fn07bGewXd18aF9G0+2qc=;
        b=Tf1JQGUaCEYyQws1LczAjPM195SbjHaH47D9S2XxESJ5o5jCCe2qRZasUKzA2mPQ5X
         5BWmV8/nqSObmP+yzf4N4iX7ufZaoKAK9GQZYaOG1kf45VCkxkVu/yjf0pZk1jtp5wqA
         8HACP0pFxBrbK5rLh8aXOUAxhiihNY4tvxfd9l8U9g3ZLW5RDt+KDmvC4yc157ricXJ5
         qxAp6OXibwvxmnA7FZl92s+goKuVQxAhHlLPAb4h+lFcpjl1FMzXLYvK3ezmK/V7Pp9X
         rNFTLnPwDp2F3NG7bkhEXMLtBBSYDJHHKvI8SY4hO0K3CtyqIX6nYa9IusFNg5jNr7jC
         8EUQ==
X-Gm-Message-State: AOAM5316e/gkbTYJI/ImPU4LwBdMc6QuGu8bp2I0mOtwItvtd7b+9fnE
        1G1Mb3GGZ168gUT3XFlcj79i8GvgRjJU5wuNKVI=
X-Google-Smtp-Source: ABdhPJygV84krkAH97KZ3B1w2Zc8aJ1T4OtkjT8IRuN8RlbjNaeDZhR2UzZKKH2qC8nc+0OtMJ694DIyFUnybnGn6lo=
X-Received: by 2002:a92:9881:: with SMTP id a1mr1663997ill.238.1610413600651;
 Mon, 11 Jan 2021 17:06:40 -0800 (PST)
MIME-Version: 1.0
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com> <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
In-Reply-To: <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
From:   Alan Cooper <alcooperx@gmail.com>
Date:   Mon, 11 Jan 2021 20:06:29 -0500
Message-ID: <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
Subject: Re: Conflicting PCI ID in bdc driver
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This driver was written for a PCI FPGA development board used to
verify the controller logic and to help with driver development before
adding the logic to our SoC's. I'm not sure why the driver was pushed
upstream but I'd like to remove it. I'm checking with a few other
groups to make sure I'm not missing anything.

Thanks
Al


On Mon, Jan 11, 2021 at 5:02 PM Patrik Jakobsson
<patrik.r.jakobsson@gmail.com> wrote:
>
> On Mon, Jan 11, 2021 at 9:29 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Mon, Jan 11, 2021 at 08:34:01PM +0100, Patrik Jakobsson wrote:
> > > Hi Al,
> > > The PCI device ID of 0x1570 in the bdc driver (bdc_pci.c) is
> > > conflicting with the Apple FacetimeHD webcam [1]. Is this caused by an
> > > incorrect ID in the bdc driver or are there actually two devices with
> > > the same ID in the wild? If we have a real conflict, how would we go
> > > about solving this?
> >
> > Looks like someone at broadcom messed up :(
> >
> > Can you look for any other fields in the device other than just the
> > vendor/device ids to verify that this really is a webcam so you can not
> > bind to the same thing this driver wants to bind to?
>
> Right, we could check the class. But I suppose it must be fixed in
> both drivers? bdc must not bind to the webcam and facetimehd must not
> bind to the UDC. So which class is bdc reporting?
> PCI_CLASS_SERIAL_USB_DEVICE?
>
> >
> > thanks,
> >
> > greg k-h
