Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F3125B366
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 20:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgIBSH5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 14:07:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728142AbgIBSHq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 14:07:46 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F0A2C061245
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 11:07:45 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id v196so96876pfc.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 11:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VSHJHG5+upzM/goEP/xSDgS82DC6KInUZGDcM8Rgka0=;
        b=bHBkkk3TDfWb/oc46NO3T9Wcl1C1+WCRl3YsWSAYw6GuX8yxbSXolnyMtfb3PrpZQh
         XyZOf4ZwPmAQlmCGZ40oUd2zSE2aeefFxGG/1nZ9Hi0C0axG51w/+1I6O3Rra9oWYSrQ
         7xrsZTSbA/p1tYeU1w9VSaskHsyDopzrWLxA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VSHJHG5+upzM/goEP/xSDgS82DC6KInUZGDcM8Rgka0=;
        b=UD5Smau/JhPcW5U56MHyQP6fuNHOwb+y9MD1TEDV6nlykH377QndPfbN/XvPHyqsCF
         988R6Qu6XNtWHedsInfldB8iBIyEAAASfyYjMXUt169Ct8YJUfMn2hLjneB8OG5ibJRc
         LofjfRs/ABpXtNAAwcEZnYFVYEihbka8iEeA8dBy6Eweo5fSfYGTjJ9+r6LTUGVE1T6w
         Nvj/iKpP5Q5c2lEiMWW3EXmZlQaE+3zaFHVG58V121M3XRjNPzwbKSsAQSdzbeM+dapE
         RfPujUKw1Dz6unPsfyoxt5tm7trELd8QtWMR/LXx1bjzrPD9huORCRPRSmcIL4AzLoWx
         jgVw==
X-Gm-Message-State: AOAM531JxhgtrEz3/jK8iKDZNv/KJmB6rhY/NXTDTslpfBEZP0ICTwNN
        0q0scUdXqdo8btL0wv/jR2WE7g==
X-Google-Smtp-Source: ABdhPJxRtv/WZ5Qf90LITBn6Dc7Kzt8ZqfLowhGcvjpbau0PdWMveSmIGMrmf35bUmCxHnp16pPGkw==
X-Received: by 2002:a63:2a91:: with SMTP id q139mr2847387pgq.391.1599070065402;
        Wed, 02 Sep 2020 11:07:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id i1sm25205pgq.41.2020.09.02.11.07.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 11:07:44 -0700 (PDT)
Date:   Wed, 2 Sep 2020 11:07:43 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>, linux-usb@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH] USB: misc: Add usb_hub_pwr driver
Message-ID: <20200902180743.GF3419728@google.com>
References: <20200901132005.RFC.1.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <20200902060744.GA142357@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200902060744.GA142357@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Wed, Sep 02, 2020 at 08:07:44AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Sep 01, 2020 at 01:21:43PM -0700, Matthias Kaehlcke wrote:
> > diff --git a/drivers/usb/misc/Makefile b/drivers/usb/misc/Makefile
> > index da39bddb0604..2bd02388ca62 100644
> > --- a/drivers/usb/misc/Makefile
> > +++ b/drivers/usb/misc/Makefile
> > @@ -31,3 +31,4 @@ obj-$(CONFIG_USB_CHAOSKEY)		+= chaoskey.o
> >  
> >  obj-$(CONFIG_USB_SISUSBVGA)		+= sisusbvga/
> >  obj-$(CONFIG_USB_LINK_LAYER_TEST)	+= lvstest.o
> > +obj-$(CONFIG_USB_HUB_PWR)		+= usb_hub_pwr.o usb_hub_psupply.o
> 
> Why is this 2 files?  Why can't it just be one?

It's effectively two drivers that work together, it seemed cleaner to me
to have a file for every driver.

The 'usb_hub_psupply' driver (which probably should be named
'onboard_usb_hub' or similar) would even be useful on its own (taking
care of powering the hub on and potentially other setup actions)
with a bit of rework.

> And isn't this much the same thing as many of the other "misc" hub
> controller drivers we have?

There are some commonalities, however most of these drivers seem to
target USB hubs with an I2C bus, using custom 'commands' for initialization
and putting the hub in/out of standby.

The drivers in this patch have two goals:

- provide a generic (configurable) solution for powering up/initializing
  a USB hub
- enable support for powering down a USB hub during system suspend

> And to make it easier to review, can you split out the device tree
> descriptions so that the DT maintainers can review that?

Sure, I wasn't sure if this is the right approach, hence I only sent
an RFC without formal bindings to get initial feedback. As of now it
seems that you are at least not frontally opposed it ;-)
