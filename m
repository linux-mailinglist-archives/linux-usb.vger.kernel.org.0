Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C76D2F2A6C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 09:58:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387677AbhALI55 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 03:57:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:58014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726890AbhALI55 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 03:57:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16290208E4;
        Tue, 12 Jan 2021 08:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610441836;
        bh=/BWI8ml44u+WpRQf99FUNdGQQolq2s8YmjvOgv2Gx9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=P6v4HZnmbIf6s1L1kvGXIqJr72THbA1JTNmmDWZ+7hwGEEb2Qegb6siJTVFaK+Xx6
         JV1t71yA5/PlkJyCNBZtsvV1eCp+LqPJjSWdGYzz6AfFyPAKPWo7ow+2hwpk54xny0
         vopr8rQLZFm22raeL67E39XSnc9MwoqcwfnJjiy8=
Date:   Tue, 12 Jan 2021 09:58:25 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc:     Alan Cooper <alcooperx@gmail.com>, Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Conflicting PCI ID in bdc driver
Message-ID: <X/1ksTC4SBgrQoak@kroah.com>
References: <CAMeQTsacNs-YVWeX6vFJyMBLeD_AX6imNQRodV_X-QS54wAREA@mail.gmail.com>
 <X/y1ekqBrjXK8lZO@kroah.com>
 <CAMeQTsaL0mx=WW2Ekr2gh_aCWKnumS4mSr5tTH_ac+cdarzxMA@mail.gmail.com>
 <CAOGqxeUkZ8VK-D3xutVvQk7e2t1=9GzLQL7oHz0GTj_FMdVeqw@mail.gmail.com>
 <CAMeQTsZA7a9WcJq2tudWhaJbc6Z4vb4jtcUnHOCzg9u3oLxzbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMeQTsZA7a9WcJq2tudWhaJbc6Z4vb4jtcUnHOCzg9u3oLxzbw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 12, 2021 at 09:42:58AM +0100, Patrik Jakobsson wrote:
> On Tue, Jan 12, 2021 at 2:06 AM Alan Cooper <alcooperx@gmail.com> wrote:
> >
> > This driver was written for a PCI FPGA development board used to
> > verify the controller logic and to help with driver development before
> > adding the logic to our SoC's. I'm not sure why the driver was pushed
> > upstream but I'd like to remove it. I'm checking with a few other
> > groups to make sure I'm not missing anything.
> 
> That would solve my problem. Is removing a driver acceptable for
> stable submission?

Not really, if there are users of that driver.  Why not just mark the
config to depend on BROKEN instead?

But first we need to ensure that the users of it are really all gone.

> If not, it would be helpful to have a patch
> suitable for stable that disables the driver before removal. I'm
> somewhat tired of explaining to people how to blacklist bdc.

Why not submit your driver for inclusion in the kernel tree?  We can
make sure it doesn't conflict when that happens.

thanks,

greg k-h
