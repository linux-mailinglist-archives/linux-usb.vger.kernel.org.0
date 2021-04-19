Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E420363E8C
	for <lists+linux-usb@lfdr.de>; Mon, 19 Apr 2021 11:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238140AbhDSJea (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Apr 2021 05:34:30 -0400
Received: from gw.atmark-techno.com ([13.115.124.170]:37208 "EHLO
        gw.atmark-techno.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237860AbhDSJe3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Apr 2021 05:34:29 -0400
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
        by gw.atmark-techno.com (Postfix) with ESMTPS id E802480488
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 18:33:57 +0900 (JST)
Received: by mail-pj1-f71.google.com with SMTP id q10-20020a17090a2dcab029014e44f5454aso14580446pjm.4
        for <linux-usb@vger.kernel.org>; Mon, 19 Apr 2021 02:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=f9v+Sm8mKFEbQyXi/sN2tJHr2LOa9v0CsJoz/H5l6cU=;
        b=aCSZ8T2f4LgpVz4bBj+V5Rau5QMjzoEZTVKZxlTg/e5Qc1rNO8S0EggqyxZmyIrltl
         IeA+0R5y99aZwrTyWzHUWeiulbpFszgVBl5sfU3+1ChtCCqXrx8HYgRkS/0ww12ANcYV
         EuDisVQ6jYAPt9IBRw266bWTb8lfOOYazlHWMZAk0emP7M5zOu3NCKLkRkCEav0WWwOc
         hU3H6Q0q2HshD1bLtBj0W6qDem2Ef+bCViXDp9caqyfKud5XAKnq9MydfjWtVnUpTTo6
         1ELirYAsbyWxWnOAwxjl0ZP2mOGc3BYxiPS3yVW01d5SEPLje/1vkqGUpOWV/Oby5kUy
         kRPQ==
X-Gm-Message-State: AOAM531XH5GyIyR/wEoY829gpA/566ahC/ORhEPMm1WDzr7djOic4h5H
        4RGqMCg8eiW79hIFrhc+o4HL+sbDdj2z8Ppc3DjC8ivSLzy2Z7u1gvzzKUsql7HPN7cTFQBfb38
        MAHLGJezDGrHe0rdBGVOhoc+Q
X-Received: by 2002:a63:1665:: with SMTP id 37mr11208887pgw.31.1618824837069;
        Mon, 19 Apr 2021 02:33:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3BVfHB/Iu3InVzb+YLUkuY7/BfcYMlC0sOGsbJiks+G4SQp5aPsproxuobb7vRE8Qif9k+g==
X-Received: by 2002:a63:1665:: with SMTP id 37mr11208853pgw.31.1618824836841;
        Mon, 19 Apr 2021 02:33:56 -0700 (PDT)
Received: from pc-0115 (103.131.189.35.bc.googleusercontent.com. [35.189.131.103])
        by smtp.gmail.com with ESMTPSA id x18sm10982637pjn.51.2021.04.19.02.33.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 02:33:56 -0700 (PDT)
Received: from martinet by pc-0115 with local (Exim 4.94)
        (envelope-from <martinet@pc-0115>)
        id 1lYQHy-002k7D-3h; Mon, 19 Apr 2021 18:33:54 +0900
Date:   Mon, 19 Apr 2021 18:33:44 +0900
From:   Dominique MARTINET <dominique.martinet@atmark-techno.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Alice Guo (OSS)" <alice.guo@oss.nxp.com>,
        gregkh@linuxfoundation.org, rafael@kernel.org,
        horia.geanta@nxp.com, aymen.sghaier@nxp.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, tony@atomide.com,
        geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        vkoul@kernel.org, peter.ujfalusi@gmail.com, a.hajda@samsung.com,
        narmstrong@baylibre.com, robert.foss@linaro.org, airlied@linux.ie,
        daniel@ffwll.ch, khilman@baylibre.com, tomba@kernel.org,
        jyri.sarha@iki.fi, joro@8bytes.org, will@kernel.org,
        mchehab@kernel.org, ulf.hansson@linaro.org,
        adrian.hunter@intel.com, kishon@ti.com, kuba@kernel.org,
        linus.walleij@linaro.org, Roy.Pledge@nxp.com, leoyang.li@nxp.com,
        ssantosh@kernel.org, matthias.bgg@gmail.com, edubezval@gmail.com,
        j-keerthy@ti.com, balbi@kernel.org, linux@prisktech.co.nz,
        stern@rowland.harvard.edu, wim@linux-watchdog.org,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
        linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-staging@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC v1 PATCH 3/3] driver: update all the code that use
 soc_device_match
Message-ID: <YH1OeFy+SepIYYG0@atmark-techno.com>
References: <20210419042722.27554-1-alice.guo@oss.nxp.com>
 <20210419042722.27554-4-alice.guo@oss.nxp.com>
 <YH0O907dfGY9jQRZ@atmark-techno.com>
 <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVY1SLZ0K30T2pimyrR6Mm=VoSTO=L-xxCy2Bj7_kostw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Geert Uytterhoeven wrote on Mon, Apr 19, 2021 at 11:03:24AM +0200:
> > This is going to need quite some more work to be acceptable, in my
> > opinion, but I think it should be possible.
> 
> In general, this is very hard to do, IMHO. Some drivers may be used on
> multiple platforms, some of them registering an SoC device, some of
> them not registering an SoC device.  So there is no way to know the
> difference between "SoC device not registered, intentionally", and
> "SoC device not yet registered".

Hm, good point, I was probably a bit too optimistic if there are devices
which don't register any soc yet have drivers which want one; I don't
see how to make the difference indeed... And that does mean we can't
just defer all the time.

> soc_device_match() should only be used as a last resort, to identify
> systems that cannot be identified otherwise.  Typically this is used for
> quirks, which should only be enabled on a very specific subset of
> systems.  IMHO such systems should make sure soc_device_match()
> is available early, by registering their SoC device early.

I definitely agree there, my suggestion to defer was only because I know
of no other way to influence the ordering of drivers loading reliably
and gave up on soc being init'd early.

In this particular case the problem is that since 7d981405d0fd ("soc:
imx8m: change to use platform driver") the soc probe tries to use the
nvmem driver for ocotp fuses for imx8m devices, which isn't ready yet.
So soc loading gets pushed back to the end of the list because it gets
defered and other drivers relying on soc_device_match get confused
because they wrongly think a device doesn't match a quirk when it
actually does.

If there is a way to ensure the nvmem driver gets loaded before the soc,
that would also solve the problem nicely, and avoid the need to mess
with all the ~50 drivers which use it.


Is there a way to control in what order drivers get loaded? Something in
the dtb perhaps?


Thanks,
-- 
Dominique
