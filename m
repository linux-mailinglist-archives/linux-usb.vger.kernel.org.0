Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 737873BE68D
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 12:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbhGGKtE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 06:49:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:34072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231367AbhGGKtD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Jul 2021 06:49:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABD8D61C73;
        Wed,  7 Jul 2021 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625654783;
        bh=nNzZJwng2irCrIe12chkQH64Bszr3+XTYcgMZq4M6w0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Oyf0pvvJsxYR8or5zXBfWSkWP2gkgxiSJwjpbfPDTyahTwlOxtVMSbnSyrC287jNU
         Fc38ziP2batHNp9m8z9Tk2FSDpOGMkWI3uCotL6M1L6NOZFvfnTJoB1QTF2Un9XdRY
         fSlEkem5RVNsgIP0CC/YA4DsFziJvXhMiWk3s848=
Date:   Wed, 7 Jul 2021 12:46:20 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jeffrey Walton <noloader@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: CH341 driver and the 5.4 kernel
Message-ID: <YOWF/GmuPGlLNYpK@kroah.com>
References: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
 <YOVapvO9N8FhsIUC@kroah.com>
 <CAH8yC8nUZCSnnZQaS6g44=5X7pzvTr6i0pE2VzSr11EeCtpBoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH8yC8nUZCSnnZQaS6g44=5X7pzvTr6i0pE2VzSr11EeCtpBoQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 07, 2021 at 03:56:10AM -0400, Jeffrey Walton wrote:
> > > Does anyone know if the fixes and improvements for the CH341 have made
> > > their way into the 5.4 kernel?
> >
> > What specific commit are you looking for?
> 
> Well, I'm not really looking for a specific commit. I'm just trying to
> verify the various fixes are present in the kernel.

What specific fixes are you looking for?

> > And if you want to use this device, why not use a much more modern
> > kernel release?  5.4 is quite old for new hardware to be using, does
> > 5.13 work properly for you?
> 
> My bad, I thought 5.4 was a LTS kernel. The docs I read said it was
> released November 2019 and supported until 2026.

It is, but it is supported for the features that were present in the
5.4.0 release, nothing new is added.

> I'll try something newer. It looks like these are available:
> 
>     5.4.0, 5.6.0, 5.8.0, 5.10.0, 5.11.0

Why not try a kernel.org kernel?  If you are stuck with distro kernel,
please ask for support from them as they are the only ones that can do
anything with their kernel tree.

good luck!

greg k-h
