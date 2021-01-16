Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0724E2F8DDF
	for <lists+linux-usb@lfdr.de>; Sat, 16 Jan 2021 18:12:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728583AbhAPRLI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 Jan 2021 12:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728565AbhAPRLF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 16 Jan 2021 12:11:05 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B66CC06179C
        for <linux-usb@vger.kernel.org>; Sat, 16 Jan 2021 05:38:36 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id h10so7315938pfo.9
        for <linux-usb@vger.kernel.org>; Sat, 16 Jan 2021 05:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QKKRbdPU1flcIuIAU6UVgkhJSC2FGG1ZRDzTtGLCCwU=;
        b=lGFXS7eO9rPQtYfyvSsBYJUIMZDlCwaAiV8YXs9XM68Je0BUaLJLX3zJZP+QfQLD8V
         9KNoSJQGozQAyMEDXXKs/YJx7RE7ZLlfsg6WOk4wvPRMJ7MDfGcSkYy2Vu+3eHLlylrI
         /KVEWagzePzbqUA7KmXXHFMgc+sz/mCUtV4w/PvseVHvR5EumXGIdjlVGKnmWJodHn4F
         mHmv7gN4DDQ3aIEBoxnlbY6JVcczcMvw9YwZP6dy6OHxOdUZAaBmAglxGjlpmo6zOxWl
         dXnQyD1z6SchWK2LYKlt7nLmtnGpaOirVo2ammpbGFsX5pyGELnEWMK3cjxSzVVvdb3z
         rgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QKKRbdPU1flcIuIAU6UVgkhJSC2FGG1ZRDzTtGLCCwU=;
        b=ePqvakYIQDkni3R2xriwt3+QsYvR/izmRY59RffAbtD3rdOLvuRgg+kBTS5JFur2ar
         M8f1Ht9w+6ScRQ9M512U/nJWkKifNLlKa7yadSD+kOp7uCwafL2iok76D5XwTnCP2j37
         Dml03j3Im5DAE7hHxM2QRWSeoY8G/MFAEuhpu8aH1Xlk43mJkN+DTcr5Ud6Ffe5ILS1+
         fqTOIHczbi50WwHr0wUZAnMl5tnKaYBDJ3iPFbiCuPGOmTQK2rVmLCFchXAb6GS3RL13
         8J8Tba5qj0qWf1Q0o8OZ/9kqfoqMmWqocNFRe2GeDomo7PWt6n7g9DBZgYRuQkOiC8+Y
         7p9w==
X-Gm-Message-State: AOAM532ZVwxxBSVSzOqrBaQrfzIeXuYYXng1mEFW6FKFIUgqHm1n1a0R
        6BKQuRTQ7222de2m6FVpdw8=
X-Google-Smtp-Source: ABdhPJxs1HjJX8oVR6wg9PNuTr1J+0vlUAuP9f70tNZNaw38DsMgagMRDH7ZQMPEPmRMS9v3TCDyxQ==
X-Received: by 2002:a62:1b95:0:b029:19b:178f:84d7 with SMTP id b143-20020a621b950000b029019b178f84d7mr17852587pfb.70.1610804315529;
        Sat, 16 Jan 2021 05:38:35 -0800 (PST)
Received: from b29397-desktop ([138.199.22.198])
        by smtp.gmail.com with ESMTPSA id i1sm1974805pjl.36.2021.01.16.05.38.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 16 Jan 2021 05:38:34 -0800 (PST)
Date:   Sat, 16 Jan 2021 21:37:42 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 05/11] usb: gadget: composite: Report various SSP
 sublink speeds
Message-ID: <20210116133741.GA18285@b29397-desktop>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <eb0386fdd5d87a858281e8006a72723d3732240f.1610592135.git.Thinh.Nguyen@synopsys.com>
 <20210114054708.GB18650@b29397-desktop>
 <227f3064-8016-33db-6575-fc1a642ef485@synopsys.com>
 <20210115005135.GB3443@b29397-desktop>
 <3803df98-0321-ad69-babe-ceb41f95229d@synopsys.com>
 <2ef9de95-6213-3753-00ee-97e6c5ea6d43@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef9de95-6213-3753-00ee-97e6c5ea6d43@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-01-15 02:56:37, Thinh Nguyen wrote:
> Thinh Nguyen wrote:
> > Peter Chen wrote:
> >> On 21-01-14 06:16:18, Thinh Nguyen wrote:
> >>> Hi Peter,
> >>>
> >>> Peter Chen wrote:
> >>>> On 21-01-13 18:53:14, Thinh Nguyen wrote:
> >>>>> If a gadget supports SuperSpeed Plus, then it may operate in different
> >>>>> sublink speeds. For example, if the gadget supports SuperSpeed Plus
> >>>>> gen2x2, then it can support 2 sublink speeds gen1 and gen2. Inform the
> >>>>> host of these speeds in the BOS descriptor.
> >>>>>
> >>>> Hi Thinh,
> >>>>
> >>>> I read USB 3.2 spec: ch9.6.2.5 SuperSpeedPlus USB Device Capability
> >>>>
> >>>> Symmetric. Rx and Tx Sublinks have the same number of lanes and operate
> >>>> at the same speed.
> >>>> Asymmetric. Rx and Tx Sublink have different number of lanes and/or
> >>>> operate at different speeds.
> >>>>
> >>>> Why your below cases are all for symmetric, at least, the example 3
> >>>> is asymmetric, it has different speed for sublink pairs?
> >>>> Does your below cases are specification defined or user defined?
> >>> USB 3.2 spec section 8.5.6.7:
> >>> Asymmetric lane types are only for SuperSpeed Interchip (SSIC). IMO,
> >>> It's unlikely that SSIC user will use Linux kernel. We can extend and
> >>> update the gadget framework if there's any use case for that.
> >>>
> >>>
> >>>>> Use 1 SSID if the gadget supports up to gen2x1, or not specified:
> >>>>> - SSID 0 for symmetric RX/TX sublink speed of 10 Gbps.
> >>>>>
> >>>>> Use 1 SSID if the gadget supports up to gen1x2:
> >>>>> - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> >>>>>
> >>>>> Use 2 SSIDs if the gadget supports up to gen2x2:
> >>>>> - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> >>>> Why SSID 0 is not 10Gbps?
> >>> SSID 0 and 1 are arbitrary, we can do 0 for 10Gbps. There's no
> >>> constraint or standard from the USB 3.2 spec. However, you need to set
> >>> the descriptor wFunctionalitySupport.SSID to be the minimum lane speed
> >>> SSID it supports. Using SSID 0 makes it easier since we don't have to
> >>> condition it for multiple SSIDs.
> >>>
> >>>>> - SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.
> >>>> Besides, would you give me an example what kinds of system design
> >>>> will use below sublink speed?
> >>>> - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> >>>> - SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.
> >>>>
> >>>> Peter
> >>> These 2 SSIDs indicate that the device is capable of running in gen1 and
> >>> gen2 in SSP.
> >>>
> >> Hi Thinh,
> >>
> >> I am puzzled, GEN2 is back compatible for GEN1. Then, what's the usage
> >> of this descriptor, what kinds of specific information the host wants to get?
> >> I think the host wants to get if two pairs of tx/rx are supported, that
> >> is what USB 3.2 adds.
> >>
> > Hi Peter,
> >
> > Yes, it's backward compatible. However Gen1x2 uses SuperSpeed Plus Link
> > Protocol. Single lane Gen 1 doesn't. This additional RX/TX sublink speed
> > attribute pair is telling the host that the device is capable of running
> > at Gen1x2 and Gen2x2. Host can use this information to know that the
> > device supports Gen 1 as SSP, and it can infer that the device supports
> > dual-lane. Otherwise, the host can only check for dual-lane support
> > after it receives a port status or sublink speed device notification TP.
> > Regardless, the gadget should describe all the sublink speeds the device
> > is capable of in the SSP capability descriptor.
> >
> 
> Regarding checking port status and sublink speed device notification, I
> meant it as "connected" status and not capability.
> 

Thanks for explaining it, Thinh

-- 

Thanks,
Peter Chen

