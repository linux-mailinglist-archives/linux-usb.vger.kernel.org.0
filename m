Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89848216D8D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 15:18:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgGGNSH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 09:18:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:49958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725944AbgGGNSH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 09:18:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A17B02075B;
        Tue,  7 Jul 2020 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594127887;
        bh=cyNJ9qwwemY4pAbK1IlAj5ok8N/j5XNwwuq1OCBFkTc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fz0rxZ+oVnk0uZQa8v9/0bbqeqiKNnJn0xNd79mhEOq/pjAwefuuyoD7O7hk9eOCn
         dHqNrF3BHouliVtJw8zVmTp9mI7QrePof8yOIDr7/qIN4iaWXpKkqeCU28H8ulZDaS
         Z4USTr4oR9u3a6FneiDpMIRNM2rQZf2TYBZMRUGk=
Date:   Tue, 7 Jul 2020 15:18:05 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kars Mulder <kerneldev@karsmulder.nl>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Pavel Machek <pavel@denx.de>,
        David Laight <David.Laight@aculab.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v2] usb: core: fix quirks_param_set() writing to a const
 pointer
Message-ID: <20200707131805.GB2890036@kroah.com>
References: <2eb7-5f046f80-f7-5cdcc200@136674391>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2eb7-5f046f80-f7-5cdcc200@136674391>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 07, 2020 at 02:51:02PM +0200, Kars Mulder wrote:
> The function quirks_param_set() takes as argument a const char* pointer
> to the new value of the usbcore.quirks parameter. It then casts this
> pointer to a non-const char* pointer and passes it to the strsep()
> function, which overwrites the value.
> 
> Fix this by creating a copy of the value using kstrdup() and letting
> that copy be written to by strsep().
> 
> Fixes: 027bd6cafd9a ("usb: core: Add "quirks" parameter for usbcore")
> Signed-off-by: Kars Mulder <kerneldev@karsmulder.nl>
> 
> ---
>  drivers/usb/core/quirks.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

What changed from v1?  Always put that below the --- line like the
documentation asks.

Please fix up and resend a v3.

thanks,

greg k-h
