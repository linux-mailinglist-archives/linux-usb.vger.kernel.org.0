Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 389E025B325
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 19:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727804AbgIBRpl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 13:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726755AbgIBRpj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 13:45:39 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C64C061245
        for <linux-usb@vger.kernel.org>; Wed,  2 Sep 2020 10:45:38 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so47981pfb.6
        for <linux-usb@vger.kernel.org>; Wed, 02 Sep 2020 10:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=M5YO14fqaaPHPcmYL4623+XBQiuMqqfILgeNu8++0Qs=;
        b=OrExn47aQ4X8wiD7c2aryGoNVqNrNUFfkkU2vS5rLfSj7UrQPLPR9UPGKY7DZER43R
         1vvzd6oID+raO/zeFh5fLbqrMFbquqRrPgneSMcDer4Y8Cd+ixwLbKSLTd3E2mKrifMw
         Y8NzsUFG6YOdlxmaOxP3A+UUZx3B4u0k6bdfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M5YO14fqaaPHPcmYL4623+XBQiuMqqfILgeNu8++0Qs=;
        b=eP4cjM/lOLQuc+1cBEacWWeyeeScla0OOe+iLY3JVf8U3wdjJszP7mJnPqdJHJHIuG
         ruDizu3woYT8NrO5vyNpMxZ8pRnJDhY8jFz8y7kTBiOO2rwzHFklsBJnRVN89BwI/Cft
         tXx8N+hKkYO4CjvHSGlRwo/BC+mIvLrSy39LnRdFXBZz0vWiS0QLQ4G+GMfx43pYTySH
         5RIzArN49FAOuqovz6bAJb9ooEyprZOpVxZNGDofddkLDki+RuA8RfU5Tu3e3xCgUigo
         KSsoPL81znqC3Q3e2345XZ1BpdEpj3p28Aor217bn5Eoe8iegLYBT6p5pU0gSprmm/J9
         zGrQ==
X-Gm-Message-State: AOAM531oPCNIpbKXxkI8HLd18qtYvGoZjAn8g6/jSlaKEWBDfSor7u7Z
        suYmDoMFf25VSNyLNlhE82oyww==
X-Google-Smtp-Source: ABdhPJxANidNJpzD1plqQWPD+xyVqjnMdfL3tfnY8w4QJp2qez/qTprRlAsuZK7nxPq3ZxfNrugSxQ==
X-Received: by 2002:aa7:8715:: with SMTP id b21mr4115176pfo.55.1599068737966;
        Wed, 02 Sep 2020 10:45:37 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id x6sm6009919pge.61.2020.09.02.10.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 10:45:37 -0700 (PDT)
Date:   Wed, 2 Sep 2020 10:45:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bastien Nocera <hadess@hadess.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RFC PATCH] USB: misc: Add usb_hub_pwr driver
Message-ID: <20200902174536.GE3419728@google.com>
References: <20200901132005.RFC.1.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <20200902053048.GB6837@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200902053048.GB6837@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Peter,

On Wed, Sep 02, 2020 at 05:31:06AM +0000, Peter Chen wrote:
> On 20-09-01 13:21:43, Matthias Kaehlcke wrote:
> > The driver combo usb_hub_pwr/usb_hub_psupply allows to control
> > the power supply of an onboard USB hub.
> > 
> > The drivers address two issues:
> >  - a USB hub needs to be powered before it can be discovered
> >  - battery powered devices may want to switch the USB hub off
> >    during suspend to extend battery life
> > 
> > The regulator of the hub is controlled by the usb_hub_psupply
> > platform driver. The regulator is switched on when the platform
> > device is initialized, which enables discovery of the hub. The
> > driver provides an external interface to enable/disable the
> > power supply which is used by the usb_hub_pwr driver.
> > 
> > The usb_hub_pwr extends the generic USB hub driver. The device is
> > initialized when the hub is discovered by the USB subsystem. It
> > uses the usb_hub_psupply interface to make its own request to
> > enable the regulator (increasing the use count to 2).
> > 
> > During system suspend usb_hub_pwr checks if any wakeup capable
> > devices are connected to the hub. If not it 'disables' the hub
> > regulator (decreasing the use count to 1, hence the regulator
> > stays enabled for now). When the usb_hub_psupply device suspends
> > it disables the hub regulator unconditionally (decreasing the use
> > count to 0 or 1, depending on the actions of usb_hub_pwr). This
> > is done to allow the usb_hub_pwr device to control the state of
> > the regulator during system suspend.
> > 
> > Upon resume usb_hub_psupply enables the regulator again, the
> > usb_hub_pwr device does the same if it disabled the regulator
> > during resume.
> 
> Hi Matthias,
> 
> I did similar several years ago [1], but the concept (power sequence)
> doesn't be accepted by power maintainer.

Yeah, I saw that, I think I even reviewed or tested some early version
of it :)

> Your patch introduce an new way to fix this long-term issue, I have an
> idea to fix it more generally.

> - Create a table (say usb_pm_table) for USB device which needs to do
> initial power on and power management during suspend suspend/resume based
> on VID and PID, example: usb/core/quirks.c
> - After hub (both roothub and intermediate hub) device is created, search
> the DT node under this hub, and see if the device is in usb_pm_table. If
> it is in it, create a platform device, say usb-power-supply, and the
> related driver is like your usb_hub_psupply.c, the parent of this device
> is controller device.

This part isn't clear to me. How would the DT look like? Would it have a
single node per physical hub chip or one node for each 'logical' hub?
Similarly, would there be a single plaform device or multiple?

I guess when registering the platform device we could pass it the
corresponding DT node, to allow it to determine its regulators, GPIOs,
etc during probe.

> - After this usb-power-supply device is probed, do initial power on at
> probe, eg, clock, regulator, reset-gpio.
> - This usb-power-supply device system suspend operation should be called after
> onboard device has suspended since it is created before it. No runtime PM ops
> are needed for it.
> - When the hub is removed, delete this platform device.

What exactly is removal? It seems once the hub is 'removed' it could never be
probed again because the platform device that is in charge of the
initialization is only created when the USB controller is initialized. I have
the impression that the platform device would have to exist as long as the USB
controller.
