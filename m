Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 067342F6FBD
	for <lists+linux-usb@lfdr.de>; Fri, 15 Jan 2021 01:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727301AbhAOAwe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jan 2021 19:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbhAOAwd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jan 2021 19:52:33 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C48C061575
        for <linux-usb@vger.kernel.org>; Thu, 14 Jan 2021 16:51:53 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id n25so4947598pgb.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Jan 2021 16:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=KsfY+YixsVwmcmnHoOrotECSyW5gjYx8SVQOL2zHmB0=;
        b=Lu0wfW7aoj2r3PRbDnh+gTDa/E5xSFM7cG7EdFbufvN9yYpCgYXmZNKblSs7172731
         sfsfE2Yhok3AoZ61p9p6XosSJ6wIZKTy9sJLAekuNjUrhFGBy8G6X8+mvKL4+8iQXeg1
         TuOz1dWkRyGZIPVZPo+lV0XCxMRcpu4X91X/LNE6yc1ssnMjlrbFPbNopml6Ix1guxI7
         8JuVjyax6LkD6Ug6bgM+QJJZhDR5cPOKusCAL0yRkvxVeZRsIfzX4CPY/nMrrTmtJ4Gl
         69g/rcMa+zrHJcg4UxCpkvtILWLVZNNnvJCfT2EKiEm3Ofv7FxEOw+cKQ81J11q/WuJX
         Z5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KsfY+YixsVwmcmnHoOrotECSyW5gjYx8SVQOL2zHmB0=;
        b=mazhftFpQ/gdzZUrIYmj5OvgCEQPdIFtSyLCLOa98kjcVx05OQ79SsE99m+jt2lclX
         xq+y+Q9A+Fhki4AVx2IM22eAFif3SwL4tKVXlv/8ZQkNw16+59EM0Wr1TzTmVGGmIZVz
         6qG9Is6hPuLXqa6BJ34vfBNWiZPJ5UJxd2n55gUIK9kXBW+MYk+r/nMHTsN459J2dXe2
         OExlRJ0WLQpr35RXrx8zsuAPNHJxT34p5NWbDIeHM5hyb8rd4iO1djx2PADFo3TTE8ks
         8l1DGn0jISulXqDB6mHqR2SnAMFtGiw51yB5/AsLCHk7i3uKNx7qdajF04iQcj462S5v
         P7jw==
X-Gm-Message-State: AOAM530dbpD9OSo3yoe0IBf0iMQ3nH2t2GcCM+s1wMAk4rYebLzBwUrG
        qitqQbojc6OUummN/C778MA=
X-Google-Smtp-Source: ABdhPJxJx0Rfcc6SXoekCmDM4fpf89cROKyJoWbDql4p+BbgpBNAluEnhQumtPjjSF+i3oGsDlON2w==
X-Received: by 2002:a62:1c16:0:b029:1a6:8b06:68e9 with SMTP id c22-20020a621c160000b02901a68b0668e9mr9891490pfc.45.1610671912675;
        Thu, 14 Jan 2021 16:51:52 -0800 (PST)
Received: from b29397-desktop ([194.5.48.251])
        by smtp.gmail.com with ESMTPSA id 22sm6316246pjw.19.2021.01.14.16.51.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 16:51:51 -0800 (PST)
Date:   Fri, 15 Jan 2021 08:51:36 +0800
From:   Peter Chen <hzpeterchen@gmail.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v6 05/11] usb: gadget: composite: Report various SSP
 sublink speeds
Message-ID: <20210115005135.GB3443@b29397-desktop>
References: <cover.1610592135.git.Thinh.Nguyen@synopsys.com>
 <eb0386fdd5d87a858281e8006a72723d3732240f.1610592135.git.Thinh.Nguyen@synopsys.com>
 <20210114054708.GB18650@b29397-desktop>
 <227f3064-8016-33db-6575-fc1a642ef485@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <227f3064-8016-33db-6575-fc1a642ef485@synopsys.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-01-14 06:16:18, Thinh Nguyen wrote:
> Hi Peter,
> 
> Peter Chen wrote:
> > On 21-01-13 18:53:14, Thinh Nguyen wrote:
> >> If a gadget supports SuperSpeed Plus, then it may operate in different
> >> sublink speeds. For example, if the gadget supports SuperSpeed Plus
> >> gen2x2, then it can support 2 sublink speeds gen1 and gen2. Inform the
> >> host of these speeds in the BOS descriptor.
> >>
> > Hi Thinh,
> >
> > I read USB 3.2 spec: ch9.6.2.5 SuperSpeedPlus USB Device Capability
> >
> > Symmetric. Rx and Tx Sublinks have the same number of lanes and operate
> > at the same speed.
> > Asymmetric. Rx and Tx Sublink have different number of lanes and/or
> > operate at different speeds.
> >
> > Why your below cases are all for symmetric, at least, the example 3
> > is asymmetric, it has different speed for sublink pairs?
> > Does your below cases are specification defined or user defined?
> 
> USB 3.2 spec section 8.5.6.7:
> Asymmetric lane types are only for SuperSpeed Interchip (SSIC). IMO,
> It's unlikely that SSIC user will use Linux kernel. We can extend and
> update the gadget framework if there's any use case for that.
> 
> 
> >
> >> Use 1 SSID if the gadget supports up to gen2x1, or not specified:
> >> - SSID 0 for symmetric RX/TX sublink speed of 10 Gbps.
> >>
> >> Use 1 SSID if the gadget supports up to gen1x2:
> >> - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> >>
> >> Use 2 SSIDs if the gadget supports up to gen2x2:
> >> - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> > Why SSID 0 is not 10Gbps?
> 
> SSID 0 and 1 are arbitrary, we can do 0 for 10Gbps. There's no
> constraint or standard from the USB 3.2 spec. However, you need to set
> the descriptor wFunctionalitySupport.SSID to be the minimum lane speed
> SSID it supports. Using SSID 0 makes it easier since we don't have to
> condition it for multiple SSIDs.
> 
> >> - SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.
> > Besides, would you give me an example what kinds of system design
> > will use below sublink speed?
> > - SSID 0 for symmetric RX/TX sublink speed of 5 Gbps.
> > - SSID 1 for symmetric RX/TX sublink speed of 10 Gbps.
> >
> > Peter
> 
> These 2 SSIDs indicate that the device is capable of running in gen1 and
> gen2 in SSP.
> 

Hi Thinh,

I am puzzled, GEN2 is back compatible for GEN1. Then, what's the usage
of this descriptor, what kinds of specific information the host wants to get?
I think the host wants to get if two pairs of tx/rx are supported, that
is what USB 3.2 adds.

-- 

Thanks,
Peter Chen

