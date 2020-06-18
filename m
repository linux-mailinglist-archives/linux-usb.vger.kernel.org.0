Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B07A91FF9BA
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 18:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732019AbgFRQvz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 12:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728664AbgFRQvy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 12:51:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D31FC0613ED
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 09:51:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id b201so3060809pfb.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 09:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ysQewDSw9pjMrTYmtr4DIZRhQJEHELerRdzz4gWr0zI=;
        b=Isl79jUuGROnOJxWpzGM1yzagFHHGRUUAOks6EttsjO63UiTCwl1X+56UA8ZYoWyy5
         5UgmnnO23gbW/Z/39XIaXrdFzWifiW6dMdwwTlzrYEM5DSXiQzLfx6AoM4oCwb2p6a17
         rlyGtTTzPmr4wAwf3s/p2fkaKVmMC9vKpvVig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ysQewDSw9pjMrTYmtr4DIZRhQJEHELerRdzz4gWr0zI=;
        b=XPXwvJ4otAClX7RnkP1zImziGxJKIk1hWoe3DRJTb1xAO2/Sh99kWdNooN5JTPZaKm
         aI5lwrXZj+bDCZNIyVtHbgoIyuiofsbF2o6tgBAGspwHiqC8rECVQhdHJp4+4/Zzgz/z
         y8KcuuFYrtcuxyhbSQqZJKMJ/0dnxj79JBt24kNpopvcl8N2ZB7zDRmt1HpEGupgeyn6
         cOGGTFWCU/oCkRxZQxreADH4amGik0r0EY9h2VOmBpHbnNjQbl51QL7UPWvdwM0Qm+l9
         1Rn8EOubX5dY3YKzh8eeeLpUu3ZnQQdDPamFFf89Gh5HVP+DOmyxGiHNG6okXxbx3kJH
         c3Bw==
X-Gm-Message-State: AOAM532poyg/Ivwmuc5DJX4Qe+3n+sHpDPhN371qzlzL1Kq+C946ZSCi
        77tz3sFG/JI9ROq8jwx023uQ+g==
X-Google-Smtp-Source: ABdhPJzL9RB7aKjHDGDCcpAUdTwKeWdNUobj7fic0ZPFWMk6a2ICKZMgXeYMIfXfiYPbzW3PfMxaAA==
X-Received: by 2002:a63:7453:: with SMTP id e19mr4059548pgn.450.1592499113560;
        Thu, 18 Jun 2020 09:51:53 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id y7sm3090742pjm.54.2020.06.18.09.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 09:51:52 -0700 (PDT)
Date:   Thu, 18 Jun 2020 09:51:51 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH] driver core:Export the symbol device_is_bound
Message-ID: <20200618165151.GE4525@google.com>
References: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
 <20200618081443.GA1043700@kroah.com>
 <20200618154555.GD4525@google.com>
 <20200618155820.GA3076467@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200618155820.GA3076467@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 18, 2020 at 05:58:20PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 18, 2020 at 08:45:55AM -0700, Matthias Kaehlcke wrote:
> > Hi Greg,
> > 
> > On Thu, Jun 18, 2020 at 10:14:43AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Jun 03, 2020 at 12:09:52AM +0530, Sandeep Maheswaram wrote:
> > > > Export the symbol device_is_bound so that it can be used by the modules.
> > > 
> > > What modules need this?
> > 
> > drivers/usb/dwc3/dwc3-qcom.c (and probably other dwc3 'wrappers').
> 
> Why wasn't that said here?  No context is not good :(

Agreed, this patch should probably have been part of a series to establish
the context.

> > Short summary: QCOM dwc3 support is split in two drivers, the core dwc3
> > driver and the QCOM specific parts. dwc3-qcom is probed first (through
> > a DT entry or ACPI), dwc3_qcom_probe() then calls of_platform_populate()
> > to probe the core part. After a successful return from _populate() the
> > driver assumes that the core device is fully initialized. However the
> > latter is not correct, the driver core doesn't propagate errors from
> > probe() to platform_populate(). The dwc3-qcom driver would use
> > device_is_bound() to make sure the core device was probed successfully.
> 
> why does the dwc3-qcom driver care?

Currently the dwc3-qcom driver uses the core device to determine if the
controller is used in peripheral mode and it runtime resumes the XHCI
device when it sees a wakeup interrupt.

The WIP patch to add interconnect support relies on the core driver
to determine the max speed of the controller.

> And why is the driver split in a way that requires such "broken"
> structures?  Why can't that be fixed instead?

It seems determining the mode could be easily changed by getting it through
the pdev, as in st_dwc3_probe(). Not sure about the other two parts,
determining the maximum speed can involve evaluating hardware registers,
which currently are 'owned' by the core driver.

Manu or Sandeep who know the hardware and the driver better than me might
have ideas on how to improve things.
