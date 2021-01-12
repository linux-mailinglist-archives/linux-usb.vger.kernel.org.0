Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0892F3B33
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 20:54:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436646AbhALTv5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 14:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436692AbhALTv5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Jan 2021 14:51:57 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D23CAC0617A2
        for <linux-usb@vger.kernel.org>; Tue, 12 Jan 2021 11:51:16 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id 81so6568702ioc.13
        for <linux-usb@vger.kernel.org>; Tue, 12 Jan 2021 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XMCnKfDlWC5NXaPRRS8TxwObXdtJi2WrsGWt2QHzI54=;
        b=L94oFc8IAE5xkkOFsa3N6p3g6tBlvBIZznl0JlobapqE77CIco2llgkY9zQDzbbHjf
         a/90QXp05hkzoWgk0edPeDwEvSHm81hhnltLZjSDzPRKfk8wHplG83F2dmeaD22Rr4mV
         sQ6Fgqkafd8lwopIfU5C1A2wSEOhoXkuUWyQaCmWHZq1ip8uytg/RnxHwuBC05q0djeW
         LcHkCk5TtKkp42l0YMpwK4yf/eL6uFNf/Mxi+R5Eack/DLWShP5nbumywj3n3TZTKYc5
         4dLgWToOmJyBpVO0XLVX9qicUBBkakz8f6aFXhJUoCbSQmoxkl+YSeZgKXniFPnpwEA4
         9VHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XMCnKfDlWC5NXaPRRS8TxwObXdtJi2WrsGWt2QHzI54=;
        b=SRHUSqvZATOtTJTMCku6fzA+M+5OgBlOiCx7FESfbZae5+7mnnnYExY5Vy16Gw4vqs
         dlUZJbL6/WuHb+FBiDi7XFm9rbIlBv55z2wqrkNsnKHr3XwCM7NMty4rSxWJpXfGbOmP
         mQwm4xCMT+7nkFeYavAwlRJdv/VOUJwNcqGtQDV2HT7VfzO1BWTT4Lo/AchtL79nz7Sw
         JWhEjyQ0kit75WF7wqMqFdRk6HaKBGW0t+lh4nfs+2FX0vhABvvJ22wZL6bKKcsWW44Y
         Cc1I+dmqC4N/L7i20r586e44sb6xYSWcIG89V71Qc/BCMmWZUyUgmZjgOk5i61p3qKct
         IjfQ==
X-Gm-Message-State: AOAM532QcTub+T/TzXpy5LxSrgnmKj6OKYEN7oRXrq0zhVMdbRR4fmwr
        uExmBuRrIrUBkWofmtIDJkpHtz6trabM+XZtXMJTBRNx
X-Google-Smtp-Source: ABdhPJyU81gfbNCoevLtOczK7nrekjljaWP9V+lpH5yMihAuWGYMoa5RPElZW04ZokEFhm5CYEv9qLEhex4nnsZPylY=
X-Received: by 2002:a6b:f112:: with SMTP id e18mr479180iog.195.1610481076234;
 Tue, 12 Jan 2021 11:51:16 -0800 (PST)
MIME-Version: 1.0
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com> <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
 <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
 <CAMeQTsZA7a9WcJq2tudWhaJbc6Z4vb4jtcUnHOCzg9u3oLxzbw@mail.gmail.com> <X/1ksTC4SBgrQoak@kroah.com>
In-Reply-To: <X/1ksTC4SBgrQoak@kroah.com>
From:   Alan Cooper <alcooperx@gmail.com>
Date:   Tue, 12 Jan 2021 14:51:05 -0500
Message-ID: <CAOGqxeXE4D7Dyf-9c=evZMG+PTGrycKTpY1=VBk7OVAWKmyh0A@mail.gmail.com>
Subject: Re: Conflicting PCI ID in bdc driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I just checked with the hardware engineer that designed the BDC core.
The BDC PCI driver was used with an FPGA/PCIe board for design
verification and no one should be using this driver. I'll send a patch
that will remove this driver.

Thanks
Al

On Tue, Jan 12, 2021 at 3:57 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 12, 2021 at 09:42:58AM +0100, Patrik Jakobsson wrote:
> > On Tue, Jan 12, 2021 at 2:06 AM Alan Cooper <alcooperx@gmail.com> wrote:
> > >
> > > This driver was written for a PCI FPGA development board used to
> > > verify the controller logic and to help with driver development before
> > > adding the logic to our SoC's. I'm not sure why the driver was pushed
> > > upstream but I'd like to remove it. I'm checking with a few other
> > > groups to make sure I'm not missing anything.
> >
> > That would solve my problem. Is removing a driver acceptable for
> > stable submission?
>
> Not really, if there are users of that driver.  Why not just mark the
> config to depend on BROKEN instead?
>
> But first we need to ensure that the users of it are really all gone.
>
> > If not, it would be helpful to have a patch
> > suitable for stable that disables the driver before removal. I'm
> > somewhat tired of explaining to people how to blacklist bdc.
>
> Why not submit your driver for inclusion in the kernel tree?  We can
> make sure it doesn't conflict when that happens.
>
> thanks,
>
> greg k-h
