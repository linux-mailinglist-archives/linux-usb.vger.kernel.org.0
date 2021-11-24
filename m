Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC96045B827
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 11:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235412AbhKXKQS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 05:16:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:44888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234674AbhKXKQR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 24 Nov 2021 05:16:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE3126023F;
        Wed, 24 Nov 2021 10:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637748788;
        bh=w04T8LtJrwZpL6sIRlbc6IqauF/bkRZHaoZHVJDE1rE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MviFgPBrP/07EU2Jpd305SbZBZfm7tsfooa9jGsut5rH6ZSPJQMrSeA2qzDzbDsZw
         RldzW+PUHTe1V4toHPaZrKz1S168IOgP090ltDTpskpxjoR+0+/MgiMy6Wm/V3wCAF
         kDwIhDGusHoklBYxYEct7CcMjrexXv5SWfSLQoSA=
Date:   Wed, 24 Nov 2021 11:13:03 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jupiter <jupiter.hce@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Kernel 5.10 USB issues
Message-ID: <YZ4QL5CARZAVnaEE@kroah.com>
References: <CAA=hcWTukyvM0Hz-VgW_NG7Whc3i7GLGySzJ0iGHvxo3O1f5vQ@mail.gmail.com>
 <YZ3j9XKE0WjfkcsI@kroah.com>
 <CAA=hcWQ+u5QcqJd-ZqZfZd93K0j0f7prxna0yhVi=AWQrxa_UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA=hcWQ+u5QcqJd-ZqZfZd93K0j0f7prxna0yhVi=AWQrxa_UA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Nov 24, 2021 at 09:06:50PM +1100, Jupiter wrote:
> Thanks Greg.
> 
> > That is usually a hardware problem, the kernel can not disconnect a
> > device from the bus through software.
> 
> Understood, that is why I used the same HW to test both 4.19.75 and
> 5.10.59, that should rule out the HW problems, right?
> 
> > But, if 4.19 is working, can you use 'git bisect' between the two
> > kernels to find what caused the problem?
> 
> My bad, I have never used git bisect before, a quick google search did
> not help, the following command does not make sense at all, what are
> right commands to check 'git bisect'  to find what caused the problem?
> 
> For 4.19 kernel
> $ git bisect start
> Already on 'linux-4.19.y'
> Your branch is behind 'origin/linux-4.19.y' by 13117 commits, and can
> be fast-forwarded.
>   (use "git pull" to update your local branch)
> 
> For 5.10 kernel
> $  git bisect start
> Already on 'linux-5.10.y'
> Your branch is behind 'origin/linux-5.10.y' by 2311 commits, and can
> be fast-forwarded.
>   (use "git pull" to update your local branch)

Start working on the "master" branch and do:
	git bisect start
	git bisect good v4.19
	git bisect bad v5.10

and then go from there, building and testing the kernels it gives you.

Trying to bisect across the stable branches can be done, but it is very
tricky and not something that if you have not done 'git bisect' before,
I would recommend.  The above should be sufficient.

thanks,

greg k-h
