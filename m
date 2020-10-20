Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81DD7293D4F
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 15:27:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407436AbgJTN07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 09:26:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406939AbgJTN07 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 09:26:59 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B2D7C061755
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 06:26:59 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id hk7so971465pjb.2
        for <linux-usb@vger.kernel.org>; Tue, 20 Oct 2020 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZShi3tyTE5Qc8hl+e+0NHofNlBxkE619yUjkcemELTs=;
        b=bwX+r+rzk4AbridEQ51oXeFeXfD9qkN30ZYu1zLqg2B+di74Xt//crsqbe9/eu2oUS
         VL+oNQBMgPVvx9DSn7yccsBoQv0R92/8PlBIHvLCbzy9ctkYL8K7kxxJ08cUSic4KUgo
         RtHfzLArMlCYZ2mz5tZE6w2kM6euOsQQlhL54o4273Bg8dghfHpBAWylr7DKQ5xLMkND
         CUfLPAAZJzztFvpMfx2hN/ObAZgNRhl5b8DLPU6hnuo3llUmi0Prt/gFqnr2wpi8FGtX
         bbKp6ojUjmryXLpwiDLcEuAOpeR4IKPEubLic00yk9GhgtqwJCRWoycpETVvC0FykTQB
         Y0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZShi3tyTE5Qc8hl+e+0NHofNlBxkE619yUjkcemELTs=;
        b=R5rh59dLAWjotjDSe/AoBXbI2QbU9K6ZjssHF2t/semPzXaTYlvFp1LhoxyVKsQ4z5
         uAmVArdL3IeR9BrXG7YXdraiO6ViozEEBivKnM0eMzTkEpBIKereMaCEQHJozRQhwqvl
         k+ov6Y4M6Z89j1X5btLtGWRv9cWQCSJB8vdsiGFwNa6dvA7RpsmFd6ttUsgS8jTnhchj
         QnoNIxiUniYXPCd5oarhtnBa2+/dnthICFF1+N30/FzerxZKP19BMswJJLYc60p1gaaT
         lWzDJboEu4AeELomiR5lGn8JtHsdA/BElXzQiPsicSxHqBSx+cSRXnXiey7HtajzY9DB
         SH6g==
X-Gm-Message-State: AOAM531dcObxsOxmP6jb35GvQYvqkSEdBaESfPmg7LROZPe34fl5itIO
        quUsK2Vfiibi3OnIbMK+xxKgInGcsD9q0on9sfS/nxtEA1FZuA==
X-Google-Smtp-Source: ABdhPJxX1eFo8z7HwFNneCyPHhRCIfJUFHpYhUSqGKJhbHP/ZnvGrFqwNLtR2ppxv3W5k7/esPsIDWsDcX7PG8OqbMI=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr2891562pjb.228.1603200418680;
 Tue, 20 Oct 2020 06:26:58 -0700 (PDT)
MIME-Version: 1.0
References: <913dccca-500d-1938-b199-6eb67cfb60cc@gmail.com>
 <87a6wig461.fsf@kernel.org> <20201019194639.GU4077@smile.fi.intel.com>
In-Reply-To: <20201019194639.GU4077@smile.fi.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 20 Oct 2020 16:27:47 +0300
Message-ID: <CAHp75VdctGrtE1F5Fk+E39NRJOkZA5o2J-OeJauE-zygVsu7ow@mail.gmail.com>
Subject: Re: BUG with linux 5.9.0 with dwc3 in gadget mode
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ferry Toth <fntoth@gmail.com>, USB <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

+Cc: Rafael.

On Tue, Oct 20, 2020 at 10:32 AM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 19, 2020 at 08:45:10AM +0300, Felipe Balbi wrote:
> > Ferry Toth <fntoth@gmail.com> writes:
> > > This occurs with edison-arduino board, that has a nifty switch allowing
> > > to switch between gadget/host mode. In host mode it boot fine, then
> > > crashes when I flip the switch to gadget.
> > >
> > > The below trace if what I get from the console when booting with gadget
> > > mode selected.
> > >
> > > The last kernel is used where everything is obviously working fine is 5.6.0.
> > >
> > > The kernel is built specifically for the platform, nothing suspcious
> > > going on the the dwc3 area, see
> > > https://github.com/edison-fw/linux/commits/eds-acpi-5.9.0
>
> > It this something you can reproduce on your end? Ferry, can you get dwc3
> > trace logs when this happens? ftrace_dump_on_oops may help here.
>
> For time being I can confirm that switch stopped working between v5.7 (v5.8)
> and v5.8.16. But I didn't see any crash so far (I don't use any predefined
> gadget, though).
>
> afb420486016 usb: dwc3: gadget: Handle ZLP for sg requests
> 8301e3aa1c8d usb: dwc3: gadget: Fix handling ZLP
> d884a90cec5a usb: dwc3: gadget: Don't setup more than requested
>
> Reverting them does not help, so I looked into drivers/usb changes.
>
> Manual guess work did not give any result, so I bisected:
>
> # good: [9ece50d8a470ca7235ffd6ac0f9c5f0f201fe2c8] Linux 5.8.5
> # good: [96d020ddff6adff267a6900bcfcd46a8993f5152] xhci: Always restore EP_SOFT_CLEAR_TOGGLE even if ep reset failed
> # bad: [ccc9838fed80f04e45a2c317e4a2dacdf2f1e3c2] drm/amd/pm: correct the thermal alert temperature limit settings
> # bad: [bbf423c28efcde2beec2b187806eda0041cb0582] x86/irq: Unbreak interrupt affinity setting
> # good: [9a9cc8c9b1c715317c5fc18ac695751577bdf250] powerpc/perf: Fix crashes with generic_compat_pmu & BHRB
> # bad: [8cb3561d084ef532cd13d4f1f9077a900ff9f740] usbip: Implement a match function to fix usbip
> # bad: [3c491c44194253789d568549fac3b34dccdbcecd] crypto: af_alg - Work around empty control messages without MSG_MORE
> # bad: [1d35dfde2a7d9a0627b1e9465e8e4305478fb945] device property: Fix the secondary firmware node handling in set_primary_fwnode()
> # first bad commit: [1d35dfde2a7d9a0627b1e9465e8e4305478fb945] device property: Fix the secondary firmware node handling in set_primary_fwnode()
>
> Revert on v5.9 helps.
>
> Heikki, any idea?

Rafael, this patch made a regression and it seems the proper fix might
be not so neat / small and nice to backport.
Any advice on how to proceed here?

-- 
With Best Regards,
Andy Shevchenko
