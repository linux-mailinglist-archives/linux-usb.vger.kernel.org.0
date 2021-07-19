Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87ED83CF0B8
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 02:24:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237981AbhGSXnK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 19:43:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359398AbhGSWoN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Jul 2021 18:44:13 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814F1C05BD19
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 16:19:20 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id r135so30317828ybc.0
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 16:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LlezL0fbSXWmQYTDFUaIce6BNOh5OLGq/7WOzksM/j8=;
        b=XcvE/gHEKQsTS7bCpq2c1QLE/yk8wEn4Bx/tSLHz+IDwlhg6Unql03hSL0pJFK7/UT
         jzQeRzRP6a28tdGhkEL2nnq0/RiqTGracaMOFsaOyVlbf/rdPsBji0ziqLDhu0nEU11D
         a2C7ETw0B/mvWYKCOPjcf773kofD4yhteFe5uam9gIY9nOAJrV/LqfNwkL3GC3A8p6xQ
         WUd5hNJx2A4SrqdpG5trgqbGO2iBaY1Hm2nD5djf4aQ3uwdYHnsWvIwV71C/QmSOU81c
         m7624Pd3dNHGl/hVMikl7/JAGzHDoG/PWN+OdvL6HzE1YgSGzmNfe2NpUF8Z9XyofeGu
         3Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LlezL0fbSXWmQYTDFUaIce6BNOh5OLGq/7WOzksM/j8=;
        b=uBRtcE45vUYSOwdNE7kKqbFYdwRXt6Tg03heHrmcfOHJDrawlA5DlLlo3iv17HaPLB
         2a/KWIqKL9xUf/W8m3v90uWmUUW8QIYO7UdJSrb3Lse9MHHSiTsIAQDUCGA8wepv8dT4
         kVci4oTY2UnR+4lRsOuqsquNkxxgh78UTJ8q6RaIwIjMhTIWpuqKjFbQX2V7AufWsuE5
         wgLM2hbq6o4B+/pGkPx5dp7PQ/+Yex9BiOLNSvcdkY2YKFuYD0rB2HnoKTDxfiOKnBoc
         SbKK2tvh/FnFA9d0p3pIk6t55GjIpCcGGJzvmWXF37N4eo7pl6BfO2RKG1Hyupn93F85
         mfSA==
X-Gm-Message-State: AOAM531oEtFmlKm1/CI8YwKtLl5Y+WYfalsTpjY/tEwJY4wPaizJarDL
        pLIF8anD9NseRvG1PZ3QJ8deAjjA3tCFeDg9+ZY=
X-Google-Smtp-Source: ABdhPJzIjY+RFh844oBvrjTF/QSAXR0NDQUqb4NG59ZhYeuqg2iz8jfmQaWT0vuGZ3d3MTBbOsypXmZtxU8FYOnKsfI=
X-Received: by 2002:a25:b706:: with SMTP id t6mr35652520ybj.174.1626736759591;
 Mon, 19 Jul 2021 16:19:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201116151735.178737-1-pgwipeout@gmail.com> <20201116151735.178737-2-pgwipeout@gmail.com>
 <6e7a5a02-cd3c-81d3-a473-f87385c41e5a@gmail.com>
In-Reply-To: <6e7a5a02-cd3c-81d3-a473-f87385c41e5a@gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Mon, 19 Jul 2021 19:19:07 -0400
Message-ID: <CAMdYzYqUgd_uPOPCnGUvU7kxPDGNnoN+_1RmO_AyY6oUtpkfGw@mail.gmail.com>
Subject: Re: [PATCH 1/4] phy: rockchip: add rockchip usb3 innosilicon phy driver
To:     Alex Bee <knaerzche@gmail.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        =?UTF-8?B?546L5piO5oiQ?= <frank.wang@rock-chips.com>,
        zyw <zyw@rock-chips.com>, linux-usb@vger.kernel.org,
        Kever Yang <kever.yang@rock-chips.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        =?UTF-8?B?5ZC06Imv5bOw?= <william.wu@rock-chips.com>,
        wulf <wulf@rock-chips.com>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 19, 2021 at 10:29 AM Alex Bee <knaerzche@gmail.com> wrote:
>
> Hi Peter,
>
> thanks for working on this (I hope to have picked the latest version of
> your series).
>
> It's pretty obvious that the quirky innosilicon phy Rockchip decided for
> in RK3328 needs a additional glue layer. Even if this version isn't
> perfect yet (usb3 devices "sometimes" do net get detected if detached
> and attached again) - it makes thing *a lot* better than it is now (IIRC
> its about the same in vendor tree)

Yes, it certainly is broken.

>
> So: are you going to rebase this on current upstream?

Honestly I hadn't planned on it, mostly because my board started
exhibiting stability issues.
This series had been tagged as an RFC as I was hoping to resolve the
issues with it.
Unfortunately either the documentation provided was insufficient to
fix the problem, or the hardware doesn't behave as the documentation
suggests.
Also the way we have to tie into the usb core makes me really uncomfortable.

Perhaps once the rk3566 is in good shape I can poke at this again.
There's a number of other issues with older boards that have come to
light that need attention.

>
> Regards,
>
> Alex
>
> Am 16.11.20 um 16:17 schrieb Peter Geis:
> > The innosilicon based usb3 phy used in rockchip devices such as the rk3328 is bugged, requiring special handling.
> > The following erata have been observed:
> >   - usb3 device disconnect events are not detected by the controller
> >   - usb2 hubs with no devices attached do not trigger disconnect events when removed
> >   - interrupts are not reliable
> >
> > To work around these issue we implement polling of the usb2 and usb3 status.
> > On usb3 disconnection we reset the usb3 phy which triggers the disconnect event.
> > On usb2 disconnection we have to force reset the whole controller.
> > This requires a handoff to a special dwc3 device driver.
> >
> > This has been tested on the rk3328-roc-cc board with the following devices:
> >   - usb2 only device
> >   - usb3 only device
> >   - usb2 only hub without devices
> >   - usb3 hub without devices
> >   - usb2 hub with devices
> >   - usb3 hub with devices
> >
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
