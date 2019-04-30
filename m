Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB41EFE6
	for <lists+linux-usb@lfdr.de>; Tue, 30 Apr 2019 07:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbfD3FZ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Apr 2019 01:25:59 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:40516 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbfD3FZ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Apr 2019 01:25:58 -0400
Received: by mail-vk1-f195.google.com with SMTP id l17so2829799vke.7
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 22:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dAZB9m78vyMqVnCUT5sxg+zHI1l8qWvxtWApzbGtN1A=;
        b=iRmEmm4IrU6e+wZHgKHwQwIr0tcTTb9ixCcFFUV+Q+c6fi2SKUyMCAt/qUlgKI5Zjz
         JohZhhouXMXuxCAlnL7+6YHVlqjsv5zhMjn+o41T14oN8A6DN+HAOIRuUdSHnW9rAwE2
         LY5Jyu7Yvsvk8uDEVZrh9r7avMXSXUJJPl1cs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dAZB9m78vyMqVnCUT5sxg+zHI1l8qWvxtWApzbGtN1A=;
        b=cFJIJRxV/in1O+pIcWlj3Orihr5imiisBEpHZ+AHT8L2t0AsVSdrga0WgDwA/Hh0Uh
         n/owNRRm0VpPMHw06gW6XlbX7Nij8dxrGXSFc59Zb41H/Ik8bNwy+g7MKBdrhWZEj0nL
         KviO3KxlxLV0IQQoza8E79d5CA9vNVyCN/z8nzvyB23LDJ96OGRM1ZXU7uvbeg/nmHSJ
         rXsuIXokyZEr41JkRtnXTJvs1fx7+3Vz0dy5hZdfjHF9o7phnN4sB7tmgx5AeAvLQIkp
         EAyoXU94N6aAA9cmQB+69pssaXBfBjaQbfb/yEDfBpU5ngocieAdojWk/mPflzctYBo/
         WB8g==
X-Gm-Message-State: APjAAAX13Xa+ow86yOKtyQHk3drOx1WQ+4zKWoBIKaphZSOYfk6k8QUY
        bw5p5biUvp0Gk42Ds3RIdj4TxPziH54=
X-Google-Smtp-Source: APXvYqzV49ANV6/moEhRzSSJKu7AUFDgkEjgb/tXc6aGOnPl4MsBFpM/V1JGgmEGP0xFDnaqjDGehA==
X-Received: by 2002:a1f:b4ce:: with SMTP id d197mr34597716vkf.57.1556601957385;
        Mon, 29 Apr 2019 22:25:57 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id c192sm25191119vka.10.2019.04.29.22.25.55
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 22:25:56 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id g127so7290016vsd.6
        for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2019 22:25:55 -0700 (PDT)
X-Received: by 2002:a67:e88c:: with SMTP id x12mr9502003vsn.87.1556601955497;
 Mon, 29 Apr 2019 22:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190418001356.124334-1-dianders@chromium.org>
 <20190418001356.124334-4-dianders@chromium.org> <20190430012328.GA25660@bogus>
In-Reply-To: <20190430012328.GA25660@bogus>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Apr 2019 22:25:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UdtgAZBxuwjrrXtKT1sMfaELF8V193BF=UHg9fvM+yRw@mail.gmail.com>
Message-ID: <CAD=FV=UdtgAZBxuwjrrXtKT1sMfaELF8V193BF=UHg9fvM+yRw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] Documentation: dt-bindings: Add
 snps,need-phy-for-wake for dwc2 USB
To:     Rob Herring <robh@kernel.org>
Cc:     Minas Harutyunyan <hminas@synopsys.com>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Alexandru M Stan <amstan@chromium.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        William Wu <william.wu@rock-chips.com>,
        linux-usb@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
        Randy Li <ayaka@soulik.info>, Chris <zyw@rock-chips.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Ryan Case <ryandcase@chromium.org>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Julius Werner <jwerner@chromium.org>,
        Dinh Nguyen <dinguyen@opensource.altera.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Apr 29, 2019 at 6:23 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Apr 17, 2019 at 05:13:54PM -0700, Douglas Anderson wrote:
> > Some SoCs with a dwc2 USB controller may need to keep the PHY on to
> > support remote wakeup.  Allow specifying this as a device tree
> > property.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > For relevant prior discussion on this patch, see:
> >
> > https://lkml.kernel.org/r/1435017144-2971-3-git-send-email-dianders@chromium.org
> >
> > I didn't make any changes from the prior version since I never found
> > out what Rob thought of my previous arguments.  If folks want a
> > change, perhaps they could choose from these options:
> >
> > 1. Assume that all dwc2 hosts would like to keep their PHY on for
> >    suspend if there's a USB wakeup enabled, thus we totally drop this
> >    binding.  This doesn't seem super great to me since I'd bet that
> >    many devices that use dwc2 weren't designed for USB wakeup (they
> >    may not keep enough clocks or rails on) so we might be wasting
> >    power for nothing.
>
> 1b. Use SoC specific compatible strings to enable/disable remote
> wake-up. We can debate what the default is I guess.

Unfortunately it's more than just SoC.  While you need the SoC to be
able to support this type of wakeup, you also need the board design,
firmware design, regulator design, etc.  ...so I don't think we can
just use the SoC specific compatible string.

In fact, while testing this I found that USB wakeup was totally broken
unless I enabled "deep suspend" mode on my system.  Something about
the clocks / wakeup sources in the shallow suspend totally blocked it
and I couldn't figure out what.

...so I believe it really needs to be something where someone has
said: I tested it out on this board and everything is setup properly
to support USB wakeup.


> > 2. Rename this property to "snps,wakeup-from-suspend-with-phy" to make
> >    it more obvious that this property is intended both to document
> >    that wakeup from suspend is possible and that we need the PHY for
> >    said wakeup.
> > 3. Rename this property to "snps,can-wakeup-from-suspend" and assume
> >    it's implicit that if we can wakeup from suspend that we need to
> >    keep the PHY on.  If/when someone shows that a device exists using
> >    dwc2 where we can wakeup from suspend without the PHY they can add
> >    a new property.
> >
> > Changes in v2: None
> >
> >  Documentation/devicetree/bindings/usb/dwc2.txt | 3 +++
> >  1 file changed, 3 insertions(+)
