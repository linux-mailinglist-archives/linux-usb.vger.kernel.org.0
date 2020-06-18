Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0197D1FFD88
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jun 2020 23:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731361AbgFRVpV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Jun 2020 17:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731336AbgFRVpU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 18 Jun 2020 17:45:20 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0464C06174E
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 14:45:18 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id jz3so3167633pjb.0
        for <linux-usb@vger.kernel.org>; Thu, 18 Jun 2020 14:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7m9IQb77WMRokOHCzjIG9BXkj3DN9XbzWU3McEPzT8M=;
        b=OcNB5enPK8vW1r84gntMK0xfEmL/Jimh5afRSEsvDbZzXnL3YX6s65onPZf514fpdl
         daeUA9Ca6KGAn/1VBWBh6Y0kHs7R74fSQA1Q8WfojvcSvXYlYTocfEVj7W408/sfRkFn
         cjO+fs0Dwn6W7fzwjCeJYRqLcxUaVT8lTBlC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7m9IQb77WMRokOHCzjIG9BXkj3DN9XbzWU3McEPzT8M=;
        b=BOqlImUE06jNbwiHCJJNHieomhWPP3DRmNhxPfqPgP8pMcbkO/nEcbAjXaoKW7DTdt
         zvpieQyjZbaCwnycIT0zaF1hT/Zp/55Lcl9vmxel2WKgeP+X8+pqcZuKysxINJtgOjC1
         w9vePm16kUzzapETxfIzgdvP/qWtP3cu8BxFpqIwUwS4TuhLzQtAXPg2/bg0SkavSwdn
         n1aEifFF75ZdpjTLjUrgjm+61idH6vhJxCbbyaF0qKtCvIBNTaePoyZ0fJu6DmhNzlWu
         LieMCWmebfWEunKIQ0iQNFrZseNRUorQ9iYz77F0N4OSrxR1JRMAJvuf6Cn5geKw2uJD
         hfKg==
X-Gm-Message-State: AOAM531jREVQ8dqbckqCQ/hD7foBLegDy3liJ/+PX9mE6BGn8YkC2IBw
        No10rA9aIuoZA54Sp8YYIqB45A==
X-Google-Smtp-Source: ABdhPJz3nUvKGWRVCVOaK7H+h3HvFaJft3BtzeMV++r6/ZAd6Tosgp7bHy1wjftoAyOoxC5OGj8+NQ==
X-Received: by 2002:a17:90a:fcc:: with SMTP id 70mr365314pjz.106.1592516718466;
        Thu, 18 Jun 2020 14:45:18 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id q1sm3970287pfk.132.2020.06.18.14.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 14:45:17 -0700 (PDT)
Date:   Thu, 18 Jun 2020 14:45:16 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH] driver core:Export the symbol device_is_bound
Message-ID: <20200618214516.GG4525@google.com>
References: <1591123192-565-1-git-send-email-sanm@codeaurora.org>
 <20200618081443.GA1043700@kroah.com>
 <20200618154555.GD4525@google.com>
 <20200618155820.GA3076467@kroah.com>
 <20200618165151.GE4525@google.com>
 <CAL_Jsq+5NCvvpKd-69QvgqK6wzbc53=MTt-TcVop23hjT6Rs_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+5NCvvpKd-69QvgqK6wzbc53=MTt-TcVop23hjT6Rs_g@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 18, 2020 at 11:33:49AM -0600, Rob Herring wrote:
> On Thu, Jun 18, 2020 at 10:51 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > On Thu, Jun 18, 2020 at 05:58:20PM +0200, Greg Kroah-Hartman wrote:
> > > On Thu, Jun 18, 2020 at 08:45:55AM -0700, Matthias Kaehlcke wrote:
> > > > Hi Greg,
> > > >
> > > > On Thu, Jun 18, 2020 at 10:14:43AM +0200, Greg Kroah-Hartman wrote:
> > > > > On Wed, Jun 03, 2020 at 12:09:52AM +0530, Sandeep Maheswaram wrote:
> > > > > > Export the symbol device_is_bound so that it can be used by the modules.
> > > > >
> > > > > What modules need this?
> > > >
> > > > drivers/usb/dwc3/dwc3-qcom.c (and probably other dwc3 'wrappers').
> > >
> > > Why wasn't that said here?  No context is not good :(
> >
> > Agreed, this patch should probably have been part of a series to establish
> > the context.
> >
> > > > Short summary: QCOM dwc3 support is split in two drivers, the core dwc3
> > > > driver and the QCOM specific parts. dwc3-qcom is probed first (through
> > > > a DT entry or ACPI), dwc3_qcom_probe() then calls of_platform_populate()
> > > > to probe the core part. After a successful return from _populate() the
> > > > driver assumes that the core device is fully initialized. However the
> > > > latter is not correct, the driver core doesn't propagate errors from
> > > > probe() to platform_populate(). The dwc3-qcom driver would use
> > > > device_is_bound() to make sure the core device was probed successfully.
> > >
> > > why does the dwc3-qcom driver care?
> >
> > Currently the dwc3-qcom driver uses the core device to determine if the
> > controller is used in peripheral mode and it runtime resumes the XHCI
> > device when it sees a wakeup interrupt.
> >
> > The WIP patch to add interconnect support relies on the core driver
> > to determine the max speed of the controller.
> >
> > > And why is the driver split in a way that requires such "broken"
> > > structures?  Why can't that be fixed instead?
> >
> > It seems determining the mode could be easily changed by getting it through
> > the pdev, as in st_dwc3_probe(). Not sure about the other two parts,
> > determining the maximum speed can involve evaluating hardware registers,
> > which currently are 'owned' by the core driver.
> >
> > Manu or Sandeep who know the hardware and the driver better than me might
> > have ideas on how to improve things.
> 
> We never should have had this split either in the DT binding nor
> driver(s) as if the SoC wrapper crap and licensed IP block are
> independent things. The thing to do here is either make the DWC3 code
> a library which drivers call (e.g. SDHCI) or add hooks into the DWC3
> driver for platform specifics (e.g. Designware PCI). Neither is a
> simple solution though.

Sounds reasonable, but as you say it's likely not a short term
solution. If someone ever picked it up maybe they could create a
new driver (with plenty of copied code from the current driver)
and start with supporting a single platform (with multi-platform
support in the driver architecture). Other drivers could then be
migrated one by one by folks who have the hardware to test.
Duplicate code is definitely not desirable, but it's probably
more feasible than migrating all the drivers in one big bang.

I guess for now we are stuck with the race in the dwc3-qcom
driver ...
