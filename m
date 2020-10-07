Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826CF28687A
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 21:42:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbgJGTme (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 15:42:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728336AbgJGTme (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 15:42:34 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D84B8C061755
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 12:42:32 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id e10so1994990pfj.1
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 12:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+MTNsq1y/zL9otQzntOcuNP+rJZZdA/q9TeNguwjb4o=;
        b=co2PrZHK+kSFOoCGdvqvpAnvZdvxRs6PRJq4XjX26qVaG8wxBfHLYJ8oW6D1J5HCS1
         R6VDgIF3XUaw0xyJ6lz6Q/SmnJcF127xDDBiF0xVb12sPxhbPIyFAXAq0wQ2bZ8GJ8wo
         I1Yl3QaqHBHr50xYVOYmub6KXmEQ+YPdTzr/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+MTNsq1y/zL9otQzntOcuNP+rJZZdA/q9TeNguwjb4o=;
        b=YgtDwqjMMTMyaY52XOROCbD8VMETm+Pi56or8SXZhwJSnBSFZT7nExzt0axY058RRw
         GXGHXXgwZiGwFYQxuXWluws4uypWvt2NJXUPLgVQhtDSqxsotHgj2yy1ND+jgiZBTwKc
         Z3OJNXc+yVhIZ1B2R2DTTaGlG21MeIHWl7cZq6Q6rdsr9LYRqu9vV9/qUEV1dPIHfAr6
         tXZLtmtzOQWhP9X1n3cICrvNe7N3+AWXPfHdfjiODy3mftkQvEIbJugsJGlaqm0WQtWP
         +adiraW4Pj9nv3sEwXozV60gJ5LQ1Gz5cq2v/X7+1d+SEOPzBFtM1/nO43/NVsNYpHpe
         Pp3A==
X-Gm-Message-State: AOAM533KPgZkxlbBw6kcwtaA2ySKXU4uflUvXUXw5p73sy4v4C4Ix1KM
        j+ihmmPHIK55L6e95lLLFUhhRw==
X-Google-Smtp-Source: ABdhPJyL2g1I4C7VbuYxHrv5bxnCSiByaTaRhewc2kNH07T06Ix7Lro8CkW5H6L2ZyQMomwa4f5Xsg==
X-Received: by 2002:a17:90b:14d4:: with SMTP id jz20mr4143682pjb.106.1602099752450;
        Wed, 07 Oct 2020 12:42:32 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id f15sm1521957pfk.21.2020.10.07.12.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 12:42:31 -0700 (PDT)
Date:   Wed, 7 Oct 2020 12:42:29 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Doug Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Stephen Boyd <swboyd@chromium.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@nxp.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: usb: Add binding for discrete
 onboard USB hubs
Message-ID: <20201007194229.GC620323@google.com>
References: <20201006004510.GD4135817@google.com>
 <20201006141820.GA416765@rowland.harvard.edu>
 <20201006165957.GA191572@google.com>
 <20201006171524.GB423499@rowland.harvard.edu>
 <20201006192536.GB191572@google.com>
 <20201007010023.GA438733@rowland.harvard.edu>
 <20201007160336.GA620323@google.com>
 <20201007163838.GA457977@rowland.harvard.edu>
 <20201007172847.GB620323@google.com>
 <20201007192542.GA468921@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201007192542.GA468921@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 07, 2020 at 03:25:42PM -0400, Alan Stern wrote:
> On Wed, Oct 07, 2020 at 10:28:47AM -0700, Matthias Kaehlcke wrote:
> > On Wed, Oct 07, 2020 at 12:38:38PM -0400, Alan Stern wrote:
> > > On Wed, Oct 07, 2020 at 09:03:36AM -0700, Matthias Kaehlcke wrote:
> > > > Ok, I wasn't sure if the hubs suspend asynchronously from each other. If they
> > > > do it should indeed not be a problem to have the "master" wait for its peers.
> > > 
> > > Well, order of suspending is selectable by the user.  It can be either 
> > > asynchronous or reverse order of device registration, which might pose a 
> > > problem.  We don't know in advance which of two peer hubs will be 
> > > registered first.  It might be necessary to introduce some additional 
> > > explicit synchronization.
> > 
> > I'm not sure we are understanding each other completely. I agree that
> > synchronization is needed to have the primary hub wait for its peers, that
> > was one of my initial concerns.
> > 
> > Lets use an example to clarify my secondary concern: a hub chip provides a
> > USB 3 and a USB 2 hub, lets say the USB 3 hub is the primary.
> > 
> > Here is some pseudo-code for the suspend function:
> > 
> > hub_suspend(hub)
> >   ...
> > 
> >   if (hub->primary) {
> >     device_pm_wait_for_dev(hub->peer)
> > 
> >     // check for connected devices and turn regulator off
> >   }
> > 
> >   ...
> > }
> > 
> > What I meant with 'asynchronous suspend' in this context:
> > 
> > Can hub_suspend() of the peer hub be executed (asynchronously) while the
> > primary is blocked on device_pm_wait_for_dev(),
> 
> Yes, that's exactly what would happen with async suspend.
> 
> >  or would the primary wait
> > forever if the peer hub isn't suspended yet?
> 
> That wouldn't happen.  device_pm_wait_for_dev is smart; it will return 
> immediately if neither device uses async suspend.  But in that case you 
> could end up removing power from the peer hub before it had suspended.
> 
> That's why I said you might need to add additional synchronization.  The 
> suspend routines for the two hubs could each check to see whether the 
> other device had suspended yet, and the last one would handle the power 
> regulator.  The additional synchronization is for the case where the two 
> checks end up being concurrent.

That was exactly my initial concern and one of the reasons I favor(ed) a
platform instead of a USB driver:

> otherwise all hubs need to know their peers and check in suspend if they
> are the last hub standing, only then the power can be switched off.

To which you replied:

> you just need to make the "master" hub wait for its peer to suspend, which
> is easy to do.

However that apparently only works if async suspend is enabled, and we
can't rely on that.

With the peers checking on each other you lose effectively the notion
of a primary.

Going back to the binding:

  &usb_1_dwc3 {
    hub_2_0: hub@1 {
      compatible = "usbbda,5411";
      reg = <1>;
    };

    hub_3_0: hub@2 {
      compatible = "usbbda,411";
      reg = <2>;
      vdd-supply = <&pp3300_hub>;
      companion-hubs = <&hub_2_0>;
    };
  };

How does 'hub_2_0' know that its peer is hub_3_0 and that it has a regulator
(and potentially other resources)?

All this mess can be avoided by having a single instance in control of the
resources which is guaranteed to suspend after the USB devices.
