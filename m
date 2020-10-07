Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523542865E9
	for <lists+linux-usb@lfdr.de>; Wed,  7 Oct 2020 19:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728504AbgJGR2y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Oct 2020 13:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbgJGR2v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Oct 2020 13:28:51 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A558C061755
        for <linux-usb@vger.kernel.org>; Wed,  7 Oct 2020 10:28:50 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id q123so1722211pfb.0
        for <linux-usb@vger.kernel.org>; Wed, 07 Oct 2020 10:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xZ+v2OuQAePhXqVi/kdiZzONG4PhtaojmuzF5SZ8xdQ=;
        b=jjVdZZJO2VKrU5vGwGaKENvwebjy9U4YrvQZuQh867KzqulQ5YAGG2aGsnvOJ7SNwL
         67LhMH6thzslOn+c6LItKcOFZ+dBQk9LTKjj+fPA5sW9cednh50SxaSbstDyu+8uyh/e
         jXLbDrUk/RYwNjhbeYGqQt4xxOvM7AzzXokt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xZ+v2OuQAePhXqVi/kdiZzONG4PhtaojmuzF5SZ8xdQ=;
        b=HU3blZNXgFqPT2GxuHI24Z3I9Inth73bOj1AjoqkHBQ6zQ0A7w9xt7JjOMMPmRqwh2
         ct7Yvu2wWgv5sAP1Y6cFBq9RRHU9Riw4nSvO0M835a6yLsaBjAo3SxTGXJ9mN4KGhUcp
         5qd4Nft14iL/J2DT73plYQuVxole2Wjg+3j0Yq8w2orG5F+qW4w+PIUudNmfD+ROlkuy
         21yRGpaf9cgTnISyZb/Pn9d0xuRtbj3IRCzmtKvn7bY6WNIkIwDCGbmYuBbJ2uCBgaL2
         iBELBXFOUBFzESPdM92SNb4FvLUg9RJto4AcYAoC+2NSXOu2tNc/R73W5zMxy2tc5ELr
         iU+g==
X-Gm-Message-State: AOAM533t3/zLBqsHym67OESQ3EjVExXwEOzI/0yjVqXlVUESc+pfwT8O
        QRB8OF32yXoWZmZZwf0zwJJNaA==
X-Google-Smtp-Source: ABdhPJw9NREkTfYOdNETDhW2xqODkOGKkUImfKXew2xQ2izoRdSgSn+1QXOSornth1rL61DMyAkEJQ==
X-Received: by 2002:a63:551d:: with SMTP id j29mr3965988pgb.144.1602091729994;
        Wed, 07 Oct 2020 10:28:49 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id o62sm3991891pfb.172.2020.10.07.10.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 10:28:49 -0700 (PDT)
Date:   Wed, 7 Oct 2020 10:28:47 -0700
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
Message-ID: <20201007172847.GB620323@google.com>
References: <CAL_JsqLWmBCjrbs2D-d+9naJAKkNhDAbmRtqvCDY8jv=L_q-xA@mail.gmail.com>
 <CAD=FV=XkV2eGuPhpo-v4bYy12DVNtDAtjyzpKs7r6SOUZf6-sg@mail.gmail.com>
 <20201006004510.GD4135817@google.com>
 <20201006141820.GA416765@rowland.harvard.edu>
 <20201006165957.GA191572@google.com>
 <20201006171524.GB423499@rowland.harvard.edu>
 <20201006192536.GB191572@google.com>
 <20201007010023.GA438733@rowland.harvard.edu>
 <20201007160336.GA620323@google.com>
 <20201007163838.GA457977@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201007163838.GA457977@rowland.harvard.edu>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 07, 2020 at 12:38:38PM -0400, Alan Stern wrote:
> On Wed, Oct 07, 2020 at 09:03:36AM -0700, Matthias Kaehlcke wrote:
> > On Tue, Oct 06, 2020 at 09:00:23PM -0400, Alan Stern wrote:
> > > On Tue, Oct 06, 2020 at 12:25:36PM -0700, Matthias Kaehlcke wrote:
> > > > On Tue, Oct 06, 2020 at 01:15:24PM -0400, Alan Stern wrote:
> > > > > You don't need a platform device or a new driver to do this.  The code 
> > > > > can go in the existing hub driver.
> > > > 
> > > > Maybe. IIUC currently USB drivers don't support/use suspend_late. Could that
> > > > be added? It would simplify matters, otherwise all hubs need to know their
> > > > peers and check in suspend if they are the last hub standing, only then the
> > > > power can be switched off. It would be simpler if a single instance (e.g. the
> > > > hub with the DT entries) is in control.
> > > 
> > > Adding suspend_late would be a little painful.  But you don't really 
> > > need it; you just need to make the "master" hub wait for its peer to 
> > > suspend, which is easy to do.
> > 
> > Ok, I wasn't sure if the hubs suspend asynchronously from each other. If they
> > do it should indeed not be a problem to have the "master" wait for its peers.
> 
> Well, order of suspending is selectable by the user.  It can be either 
> asynchronous or reverse order of device registration, which might pose a 
> problem.  We don't know in advance which of two peer hubs will be 
> registered first.  It might be necessary to introduce some additional 
> explicit synchronization.

I'm not sure we are understanding each other completely. I agree that
synchronization is needed to have the primary hub wait for its peers, that
was one of my initial concerns.

Lets use an example to clarify my secondary concern: a hub chip provides a
USB 3 and a USB 2 hub, lets say the USB 3 hub is the primary.

Here is some pseudo-code for the suspend function:

hub_suspend(hub)
  ...

  if (hub->primary) {
    device_pm_wait_for_dev(hub->peer)

    // check for connected devices and turn regulator off
  }

  ...
}

What I meant with 'asynchronous suspend' in this context:

Can hub_suspend() of the peer hub be executed (asynchronously) while the
primary is blocked on device_pm_wait_for_dev(), or would the primary wait
forever if the peer hub isn't suspended yet?

> > > And hubs would need to know their peers in any case, because you have to
> > > check if any devices attached to the peer have wakeup enabled.
> > 
> > My concern was about all hubs (including 'secondaries') having to know their
> > peers and check on each other, in the scenario we are now talking about only
> > the "master" hub needs to know and check on its peers, which is fine.
> 
> Not all hubs would need this.  Only ones marked in DT as having a power 
> regulator.

Sure, as long as the primary (with a power regulator) can wait for its peers
to suspend without the risk of blocking forever (my doubt above).
