Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B02041068C
	for <lists+linux-usb@lfdr.de>; Sat, 18 Sep 2021 14:56:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236385AbhIRM5y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 18 Sep 2021 08:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236293AbhIRM5x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 18 Sep 2021 08:57:53 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC84BC061574
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 05:56:29 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id q26so19769607wrc.7
        for <linux-usb@vger.kernel.org>; Sat, 18 Sep 2021 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0BM9ZuFR5WO9me4OdiuxqrBVIAy461jo/g1M+z2+Lbc=;
        b=mt3oWa18SWbps8WaoxSqpGEG7QHEKgIntfBbgPfaAjojFbHrcZWlZVA/sqPUpXH9Vr
         aMuf04Tu8iidPkjYOQgDC9Jh81S1P6EQBszlrwVlQcI0S4yWKu5EZPoIR/fkNKt72G5W
         02UjiJlSwfqeyuQbQQL4awQ+bMWkzBLaPbCcQmRNLWWbwnXFFXF1nk4zgZrpootl3v9S
         XIs34RnMvV4IeLVF6PnVhmup0MQyrV2GNsL/B2cVuCv+kWS4MvwxQxrmMVDdlD5XuDBE
         ZUPXASLael9qxahik4+nHY13EfBTE3hKKOrGom4UnszACVeRUpgRv52La2lOdKs7rDZh
         XCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=0BM9ZuFR5WO9me4OdiuxqrBVIAy461jo/g1M+z2+Lbc=;
        b=1uhg9xpHTmWqAXHPjepibyKXCuWfE4jBqPAgSfan+JOFya5B1VR7AoTzg3/pcVP2hf
         D/1U2MEJeLU2bZsIB0kWCWjdyvw1Vlj/9/mVkv36tc3utfIrj4ZWR91zL7eH8XibDEmh
         f3r1UcfJ6hQA7aOPYkRlqk+bc8uv3x9eSUbJOhN2+9JC/VmFm3W/CnSIwwYOLNFjzLQT
         9SaDXMXwfRHvYT2S7aXI1ehLN5tqctU8LU916JZsLqCUgqGSjp42bPzOxe+p1Rp5ZPC0
         lXKzfM9SQ5GM56uwppPrYCj3lSByPBhSJlGU/5q3iyy51zCtFXTgwNNX36tgKUs1ocHE
         tCUg==
X-Gm-Message-State: AOAM533C1b9HJK66Xx/6Ie+9vRmo+Vryh4UL9wO9F01zCQBSXblYDVca
        GCKTNU6UBahjg6skqcxF2ds=
X-Google-Smtp-Source: ABdhPJzNuR4SAcZ7XiaBPYYHtT2QtHnb3g3NlX6oIOYgFB+yCiLF6cFCk+7VDnF+31P69Bz+5ZsSHw==
X-Received: by 2002:adf:e485:: with SMTP id i5mr17405851wrm.22.1631969788374;
        Sat, 18 Sep 2021 05:56:28 -0700 (PDT)
Received: from eldamar (80-218-24-251.dclient.hispeed.ch. [80.218.24.251])
        by smtp.gmail.com with ESMTPSA id q11sm13689702wmc.41.2021.09.18.05.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 05:56:27 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Date:   Sat, 18 Sep 2021 14:56:27 +0200
From:   Salvatore Bonaccorso <carnil@debian.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] Partially revert "usb: Kconfig: using select for
 USB_COMMON dependency"
Message-ID: <YUXh+6vl+gwj5ze/@eldamar.lan>
References: <20170418023639.GE4152decadent!org!uk>
 <YUXcaBR3Yh4PqMxN@eldamar.lan>
 <YUXeicgdhRlp04tN@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUXeicgdhRlp04tN@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Sat, Sep 18, 2021 at 02:41:45PM +0200, Greg Kroah-Hartman wrote:
> On Sat, Sep 18, 2021 at 02:32:40PM +0200, Salvatore Bonaccorso wrote:
> > Hi Greg,
> > 
> > This is a reply to a very old patch submission:
> > 
> > On Tue, Apr 18, 2017 at 02:36:39AM +0000, Ben Hutchings wrote:
> > > 
> > > This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> > > USB_LED_TRIG.  This config symbol has bool type and enables extra code
> > > in usb_common itself, not a separate driver.  Enabling it should not
> > > force usb_common to be built-in!
> > > 
> > > Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> > > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > > ---
> > >  drivers/usb/Kconfig | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> > > index fbe493d44e81..8270abe6c677 100644
> > > --- a/drivers/usb/Kconfig
> > > +++ b/drivers/usb/Kconfig
> > > @@ -154,8 +154,7 @@ source "drivers/usb/gadget/Kconfig"
> > > =20
> > >  config USB_LED_TRIG
> > >  	bool "USB LED Triggers"
> > > -	depends on LEDS_CLASS && LEDS_TRIGGERS
> > > -	select USB_COMMON
> > > +	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
> > >  	help
> > >  	  This option adds LED triggers for USB host and/or gadget activity.
> > 
> > Was going through the series of patches we had applied in Debian and
> > noticed while this was submitted by Ben back in 2017, it looks it was
> > never applied or considered. Would that be something you could pick
> > up? I'm inlining the original patch from Ben.
> > 
> > Regards,
> > Salvatore
> > 
> > From: Ben Hutchings <ben@decadent.org.uk>
> > Date: Wed, 11 Jan 2017 04:30:40 +0000
> > Subject: Partially revert "usb: Kconfig: using select for USB_COMMON  dependency"
> > 
> > This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
> > USB_LED_TRIG.  This config symbol has bool type and enables extra code
> > in usb_common itself, not a separate driver.  Enabling it should not
> > force usb_common to be built-in!
> > 
> > Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
> > Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> > ---
> >  drivers/usb/common/Kconfig | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
> > index d611477aae41..196f4a397587 100644
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
> 
> I would need it submitted in a format that I can apply it in, and your
> signed-off-by: added as well as it is coming through you.

Thanks for confirming! Find it attached/inline in a git am applicable
form and the Signed-off-by added.

Regards,
Salvatore

From de72d7df728722515b9700ff673a88ca6f8d9ace Mon Sep 17 00:00:00 2001
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 11 Jan 2017 04:30:40 +0000
Subject: [PATCH] Partially revert "usb: Kconfig: using select for USB_COMMON
 dependency"

This reverts commit cb9c1cfc86926d0e86d19c8e34f6c23458cd3478 for
USB_LED_TRIG.  This config symbol has bool type and enables extra code
in usb_common itself, not a separate driver.  Enabling it should not
force usb_common to be built-in!

Fixes: cb9c1cfc8692 ("usb: Kconfig: using select for USB_COMMON dependency")
Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
---
 drivers/usb/common/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/common/Kconfig b/drivers/usb/common/Kconfig
index 5e8a04e3dd3c..b856622431a7 100644
--- a/drivers/usb/common/Kconfig
+++ b/drivers/usb/common/Kconfig
@@ -6,8 +6,7 @@ config USB_COMMON
 
 config USB_LED_TRIG
 	bool "USB LED Triggers"
-	depends on LEDS_CLASS && LEDS_TRIGGERS
-	select USB_COMMON
+	depends on LEDS_CLASS && USB_COMMON && LEDS_TRIGGERS
 	help
 	  This option adds LED triggers for USB host and/or gadget activity.
 
-- 
2.33.0

