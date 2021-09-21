Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71AF6413575
	for <lists+linux-usb@lfdr.de>; Tue, 21 Sep 2021 16:36:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233643AbhIUOhj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Sep 2021 10:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233613AbhIUOhj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Sep 2021 10:37:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B870C061574
        for <linux-usb@vger.kernel.org>; Tue, 21 Sep 2021 07:36:10 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t8so32863569wri.1
        for <linux-usb@vger.kernel.org>; Tue, 21 Sep 2021 07:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FF1GBmm4qd6EmQ1+IdfeJQMoYUDIftI73uGchfWUKmM=;
        b=Tu9Bkyc4MoHgba+24ITvRBKBa0rdffv96VI5XYF3U7mT+ahqosCpIQbAbuxNGfizKB
         /eUNLnzIA+H6xnGINUmZGm8s8+yswm1vodKXO8NJnRlWlcl9CGdwurOwHtj3lSpMYQT7
         UfwYWXjyRtaeU4MJvVSjBVnOhwYowop0l5NinCB6zzCrFV2lBIBUoUHmDXWA+hcqpz4H
         nu8MzQoTchymI2EiYY0JBygNhI26lItn7r4NVldv6ifpypmpVN0lp6u8v7WkEY1ekjeB
         8n9tp0I68SFKB8hQvcqe5mFx7P6cmc3GfQU7s1Hck5UGfbb9oOV1Dt+gACwxbHfwYamT
         4tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=FF1GBmm4qd6EmQ1+IdfeJQMoYUDIftI73uGchfWUKmM=;
        b=CfS6BMCgh7mFkvDL4d/KYIeuhf3OBYPIScFrVwQgk89gjWQAQnCRj4eSFlgGg1BIw4
         V5hYRY28/FZUKk1ihcyefgavqi27G3pyA8jOARWui9ELrycVmz++HlHiGvrdoTAOrzN3
         NuIIPCrLCTtiMc+DC6Urr0XbjQE176P2/jurhjrFmmb3Mz5Z45lgd6ThlBMYssHo9YcX
         qKCTP7xV90xj6vJ6QGsQQ7lf2Bdophr3sS7a6YInbkR3S+3/+pwwdpblIUS2GltjmTyz
         lfcNDa+YgiHwru1/8hHix62XKIVFyF0BVeiUYDbPVvxV9pttFWi6fzi7oVKFGhJUCy3U
         cQrw==
X-Gm-Message-State: AOAM533HdGIvjPG2bjED2aqsXH5sQ0SSu9N7PUORUMeSy029bRd6gzxa
        3q2nMj8F97R7V70LuSrG140=
X-Google-Smtp-Source: ABdhPJwWqmhsubSyzvck62DY//+xxv7Gym4hS3C7Yt/A4GdYH2knk2kzqmikUhmEgcYc87tUNIxMYQ==
X-Received: by 2002:a7b:c217:: with SMTP id x23mr5079063wmi.192.1632234969087;
        Tue, 21 Sep 2021 07:36:09 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id l7sm2865172wmp.48.2021.09.21.07.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 07:36:08 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Tue, 21 Sep 2021 16:36:08 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] Partially revert "usb: Kconfig: using select for
 USB_COMMON dependency"
Message-ID: <YUnt2A200+OxO/ND@eldamar.lan>
References: <20170418023639.GE4152decadent!org!uk>
 <YUXcaBR3Yh4PqMxN@eldamar.lan>
 <YUXeicgdhRlp04tN@kroah.com>
 <YUXh+6vl+gwj5ze/@eldamar.lan>
 <YUnq/lnYIC5RsvMt@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUnq/lnYIC5RsvMt@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Tue, Sep 21, 2021 at 04:23:58PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 18, 2021 at 02:56:27PM +0200, Salvatore Bonaccorso wrote:
> > Hi Greg,
> > 
> > On Sat, Sep 18, 2021 at 02:41:45PM +0200, Greg Kroah-Hartman wrote:
> > > On Sat, Sep 18, 2021 at 02:32:40PM +0200, Salvatore Bonaccorso wrote:
> > > > Hi Greg,
> > > > 
> > > > This is a reply to a very old patch submission:
> > > > 
> > > > On Tue, Apr 18, 2017 at 02:36:39AM +0000, Ben Hutchings wrote:
> > > > > 
> > > > > This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> > > > > USB_LED_TRIG.  This config symbol has bool type and enables extra code
> > > > > in usb_common itself, not a separate driver.  Enabling it should not
> > > > > force usb_common to be built-in!
> > > > > 
> > > > > Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> > > > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > > > > ---
> > > > >  drivers/usb/Kconfig | 3 +--
> > > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> > > > > index fbe493d44e81..8270abe6c677 100644
> > > > > --- a/drivers/usb/Kconfig
> > > > > +++ b/drivers/usb/Kconfig
> > > > > @@ -154,8 +154,7 @@ source "drivers/usb/gadget/Kconfig"
> > > > > =20
> > > > >  config USB_LED_TRIG
> > > > >  	bool "USB LED Triggers"
> > > > > -	depends on LEDS_CLASS && LEDS_TRIGGERS
> > > > > -	select USB_COMMON
> > > > > +	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
> > > > >  	help
> > > > >  	  This option adds LED triggers for USB host and/or gadget activity.
> > > > 
> > > > Was going through the series of patches we had applied in Debian and
> > > > noticed while this was submitted by Ben back in 2017, it looks it was
> > > > never applied or considered. Would that be something you could pick
> > > > up? I'm inlining the original patch from Ben.
> > > > 
> > > > Regards,
> > > > Salvatore
> > > > 
> > > > From: Ben Hutchings <ben@decadent.org.uk>
> > > > Date: Wed, 11 Jan 2017 04:30:40 +0000
> > > > Subject: Partially revert "usb: Kconfig: using select for USB_COMMON  dependency"
> > > > 
> > > > This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> > > > USB_LED_TRIG.  This config symbol has bool type and enables extra code
> > > > in usb_common itself, not a separate driver.  Enabling it should not
> > > > force usb_common to be built-in!
> > > > 
> > > > Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> > > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > > > ---
> > > >  drivers/usb/common/Kconfig | 3 +--
> > > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
> > > > index d611477aae41..196f4a397587 100644
> > > > --- a/drivers/usb/common/Kconfig
> > > > +++ b/drivers/usb/common/Kconfig
> > > > @@ -6,8 +6,7 @@ config USB_COMMON
> > > >  
> > > >  config USB_LED_TRIG
> > > >  	bool "USB LED Triggers"
> > > > -	depends on LEDS_CLASS && LEDS_TRIGGERS
> > > > -	select USB_COMMON
> > > > +	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
> > > >  	help
> > > >  	  This option adds LED triggers for USB host and/or gadget activity.
> > > >  
> > > 
> > > I would need it submitted in a format that I can apply it in, and your
> > > signed-off-by: added as well as it is coming through you.
> > 
> > Thanks for confirming! Find it attached/inline in a git am applicable
> > form and the Signed-off-by added.
> > 
> > Regards,
> > Salvatore
> > 
> > >From de72d7df728722515b9700ff673a88ca6f8d9ace Mon Sep 17 00:00:00 2001
> > From: Ben Hutchings <ben@decadent.org.uk>
> > Date: Wed, 11 Jan 2017 04:30:40 +0000
> > Subject: [PATCH] Partially revert "usb: Kconfig: using select for USB_COMMON
> >  dependency"
> > 
> > This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> > USB_LED_TRIG.  This config symbol has bool type and enables extra code
> > in usb_common itself, not a separate driver.  Enabling it should not
> > force usb_common to be built-in!
> > 
> > Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
> > ---
> >  drivers/usb/common/Kconfig | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
> > index 5e8a04e3dd3c..b856622431a7 100644
> > --- a/drivers/usb/common/Kconfig
> > +++ b/drivers/usb/common/Kconfig
> > @@ -6,8 +6,7 @@ config USB_COMMON
> >  
> >  config USB_LED_TRIG
> >  	bool "USB LED Triggers"
> > -	depends on LEDS_CLASS && LEDS_TRIGGERS
> > -	select USB_COMMON
> > +	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
> >  	help
> >  	  This option adds LED triggers for USB host and/or gadget activity.
> >  
> > -- 
> > 2.33.0
> > 
> 
> I need this as a real submission, not as part of a previous email.

Apologies. The last interation hopefully is okay now. Just sent it
again.

Regards,
Salvatore
