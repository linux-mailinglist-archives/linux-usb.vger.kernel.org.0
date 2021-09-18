Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A41D410676
	for <lists+linux-usb@lfdr.de>; Sat, 18 Sep 2021 14:41:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234748AbhIRMnM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Sep 2021 08:43:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:60998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232440AbhIRMnL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 18 Sep 2021 08:43:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 378946126A;
        Sat, 18 Sep 2021 12:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631968907;
        bh=ejZGkc9q2bUjMRf3LA+rekEUKHneGZtkpUfJFou4kZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rIxsrQdy6GWpy3bzjO0HCUdhbeCxobtPAx6bKtp6tjBjY3UVYdV7LRf9N7CCNh2NN
         vAuHW/EhSAsAoBzmyDIK2qNwD9XKGhX5Z6N+C2zY8vlfks1b2y7NZLNpZmk9JPZd+y
         gA2XsN9iNhFYQBo7PoJ4R8KST2rPAJ9IWZbRERe8=
Date:   Sat, 18 Sep 2021 14:41:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     linux-usb@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] Partially revert "usb: Kconfig: using select for
 USB_COMMON dependency"
Message-ID: <YUXeicgdhRlp04tN@kroah.com>
References: <20170418023639.GE4152decadent!org!uk>
 <YUXcaBR3Yh4PqMxN@eldamar.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUXcaBR3Yh4PqMxN@eldamar.lan>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Sep 18, 2021 at 02:32:40PM +0200, Salvatore Bonaccorso wrote:
> Hi Greg,
> 
> This is a reply to a very old patch submission:
> 
> On Tue, Apr 18, 2017 at 02:36:39AM +0000, Ben Hutchings wrote:
> > 
> > This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> > USB_LED_TRIG.  This config symbol has bool type and enables extra code
> > in usb_common itself, not a separate driver.  Enabling it should not
> > force usb_common to be built-in!
> > 
> > Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > ---
> >  drivers/usb/Kconfig | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> > index fbe493d44e81..8270abe6c677 100644
> > --- a/drivers/usb/Kconfig
> > +++ b/drivers/usb/Kconfig
> > @@ -154,8 +154,7 @@ source "drivers/usb/gadget/Kconfig"
> > =20
> >  config USB_LED_TRIG
> >  	bool "USB LED Triggers"
> > -	depends on LEDS_CLASS && LEDS_TRIGGERS
> > -	select USB_COMMON
> > +	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
> >  	help
> >  	  This option adds LED triggers for USB host and/or gadget activity.
> 
> Was going through the series of patches we had applied in Debian and
> noticed while this was submitted by Ben back in 2017, it looks it was
> never applied or considered. Would that be something you could pick
> up? I'm inlining the original patch from Ben.
> 
> Regards,
> Salvatore
> 
> From: Ben Hutchings <ben@decadent.org.uk>
> Date: Wed, 11 Jan 2017 04:30:40 +0000
> Subject: Partially revert "usb: Kconfig: using select for USB_COMMON  dependency"
> 
> This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> USB_LED_TRIG.  This config symbol has bool type and enables extra code
> in usb_common itself, not a separate driver.  Enabling it should not
> force usb_common to be built-in!
> 
> Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> ---
>  drivers/usb/common/Kconfig | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
> index d611477aae41..196f4a397587 100644
> --- a/drivers/usb/common/Kconfig
> +++ b/drivers/usb/common/Kconfig
> @@ -6,8 +6,7 @@ config USB_COMMON
>  
>  config USB_LED_TRIG
>  	bool "USB LED Triggers"
> -	depends on LEDS_CLASS && LEDS_TRIGGERS
> -	select USB_COMMON
> +	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
>  	help
>  	  This option adds LED triggers for USB host and/or gadget activity.
>  

I would need it submitted in a format that I can apply it in, and your
signed-off-by: added as well as it is coming through you.

thanks,

greg k-h
