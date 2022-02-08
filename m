Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA5E4ACCED
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 02:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239465AbiBHBGO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Feb 2022 20:06:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239865AbiBHApu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Feb 2022 19:45:50 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B78DC061355
        for <linux-usb@vger.kernel.org>; Mon,  7 Feb 2022 16:45:50 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id d187so15960012pfa.10
        for <linux-usb@vger.kernel.org>; Mon, 07 Feb 2022 16:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rmp3DZvzS68gv+rXD5CE3qBfGpBWdIc/bhA+tLCOLDg=;
        b=fBoqNIp/YvvhfJD30/p2ZYWnSdqGqBGC99xKMZMAu+6e/kZWOB75g8Sn4kpEicBVkt
         Q0dvlAhHgaHK9umzmHDV+y+t1r3Hjv8Jo0ssmhOBbhiTJSaBx/K2POlTdjf+H7CGmaK4
         s61Nzp5bo3IuUD9qfIZusrS0XvyvyK2VK8ICM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rmp3DZvzS68gv+rXD5CE3qBfGpBWdIc/bhA+tLCOLDg=;
        b=cthGOYzj1HstgLQLGvGzgbMs5dTNUVHb9TOZdk1rvTr7sRPjPq23Ou/05sxgMEnRqP
         1yvJKnzk4FWrjJV8+1jFePKqGo/q/mbc4w02HUyWIF38YoLasCHw4ygZvUvFPCYVdAJ8
         MzOn6NWQXu4T/NRe3MRt5hpqlF7ZO3126WNF8WgnlNXPpbOR09Ge6zJPoePMRziKSRT8
         bkAINT2i4IXzzuqQnecOSGpk3PTKdZEtGRPsejW2S5tL8f+sSl6rINJaGuRXLeqXk/F3
         xH/h/wB5jlyNQyvf7zqm3VlI/kVQ3Rrf5mtgMH68SNRmnkeUia3JYgpSqZusyhVcVeuz
         AKQw==
X-Gm-Message-State: AOAM530G4vnGzO9rdNiZTcVBgYtEgT7QWJyOOIDeFDPStPzwzFvBcO9O
        TisPPFzqqGt6/nIEDGw/HB3cU2C5Z5/mLA==
X-Google-Smtp-Source: ABdhPJxPNWA+QyDViUi52RO9Si/EiBZz0F2WAqXb9G7DTEZTxNw4dPnff0VC8dHe4ZpweivX+2Htxg==
X-Received: by 2002:a05:6a00:1143:: with SMTP id b3mr1934161pfm.11.1644281149618;
        Mon, 07 Feb 2022 16:45:49 -0800 (PST)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com. [209.85.210.177])
        by smtp.gmail.com with ESMTPSA id k9sm4804233pgg.50.2022.02.07.16.45.49
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 16:45:49 -0800 (PST)
Received: by mail-pf1-f177.google.com with SMTP id g8so6106183pfq.9
        for <linux-usb@vger.kernel.org>; Mon, 07 Feb 2022 16:45:49 -0800 (PST)
X-Received: by 2002:a92:ca4d:: with SMTP id q13mr902121ilo.165.1644280740496;
 Mon, 07 Feb 2022 16:39:00 -0800 (PST)
MIME-Version: 1.0
References: <20220119204345.3769662-1-mka@chromium.org> <20220119124327.v20.2.Ie1de382686d61909e17fa8def2b83899256e8f5d@changeid>
 <YekPTh/G1IkvpSiI@infradead.org> <YekTFMnXK87MNMh3@kroah.com>
 <Yel+0DrtWm5I9JrL@google.com> <YemBkNhvfPukCB6C@kroah.com>
In-Reply-To: <YemBkNhvfPukCB6C@kroah.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 7 Feb 2022 16:38:49 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WUSo+knj7E9KYDnw5fTv__fdpg72f_N2p1ra7Gtyt8Dg@mail.gmail.com>
Message-ID: <CAD=FV=WUSo+knj7E9KYDnw5fTv__fdpg72f_N2p1ra7Gtyt8Dg@mail.gmail.com>
Subject: Re: [PATCH v20 2/5] driver core: Export device_is_bound()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Christoph Hellwig <hch@infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Roger Quadros <rogerq@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jan 20, 2022 at 7:36 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jan 20, 2022 at 07:25:04AM -0800, Matthias Kaehlcke wrote:
> > On Thu, Jan 20, 2022 at 08:45:24AM +0100, Greg Kroah-Hartman wrote:
> > > On Wed, Jan 19, 2022 at 11:29:18PM -0800, Christoph Hellwig wrote:
> > > > On Wed, Jan 19, 2022 at 12:43:42PM -0800, Matthias Kaehlcke wrote:
> > > > > Export device_is_bound() to enable its use by drivers that are
> > > > > built as modules.
> > > > >
> > > > > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > > > > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > >
> > > > Didn't Greg clearly NAK this the last few times it came up?
> > >
> > > Yes, which is why this series is _WAY_ on the bottom of my list for
> > > reviews...
> >
> > I wasn't aware of that prior discussion, it would have helped to know
> > that this is a major concern for you ...
>
> Sorry, that was on a different thread for a different feature, I thought
> it was this one.  Too many reviews at times.
>
> >
> > If using device_is_bound() is a no-go then _find_onboard_hub() of
> > the onboard_hub driver could make it's decision based on the
> > presence (or absence) of drvdata, which is what the function ultimately
> > returns.
>
> That suffers from the same problem.  I'll take a look at this later
> after -rc1 is out and see what can be done here...

Did you have any suggestions or pointers to places to further research
what you're looking for? I think at this point both Stephen Boyd and I
have given the patch series a fairly thorough review. If the only
problem left is the export of device_is_bound() then we should find a
better solution to the problem so the series can move forward.

Thanks!

-Doug
