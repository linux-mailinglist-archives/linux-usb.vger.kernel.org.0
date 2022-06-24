Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A15255A2CA
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 22:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231190AbiFXUdj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 16:33:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbiFXUdi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 16:33:38 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62983344CD
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 13:33:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id cf14so4998850edb.8
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 13:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TavfSfTVVwaJ2oAtAxMPPR7datLV9IX5RQLV0Gzrz9w=;
        b=a6mFv9EjMZlxmWaLmjgPajKDMLzFtIpxIiqJTFDSPKn3to/9UQV68jYUhKQ6utybIf
         mfVHbTLaNkpYEZ6hUgACgXRyWgdh3q/LFTvB2N/EmvEarFGKOTZKJRB/qVD9mQrJgI53
         JTQWQyAMwB8Pm+nw2EWj+QG+doXYDWavHwXtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TavfSfTVVwaJ2oAtAxMPPR7datLV9IX5RQLV0Gzrz9w=;
        b=YkmOcHqpWJ7Bdj+OFRSvuTIVUyIvCXR3dbL0oSvGT/hemhmTGn5fs1RYKfYgoBH6Il
         TUXU+mozbKG18GjR9u4J6su4kRHB27Ceby/G20ht5A05xUmskU716TQutQdyNN3qYzeB
         cXXNO8cidpZFLixjxo8Wkq70/VpCB/tTkCLyhXIc/PShl/GqpPP4sAG+G97g4JDokUpQ
         Su8H+80lDb7kmBJoCii6U8OxLv3rJ8LXUQqG+I5ODxUe56NuSnNf8b6l2cQ1e/QEHPgk
         fy6HFETcUrRAyJp+3e+Cz1QtqiqYlVHdIzuf34j1mgiumnRL1A+Xkg/dD7OC57osEwmV
         FWCg==
X-Gm-Message-State: AJIora+X1cxEEG/gzXnXuEUBPQDzYvMg6BpPR9tqmOZD5PWBUWmDgC6r
        r3gvffGPhact37xG/Hzk/SIUyDKKeXjnJ8cr
X-Google-Smtp-Source: AGRyM1tP8hswFkgt/O5J+YrOmq5Ku/F170gN2TxdCkeZXLCFJl+d+e6okRTc4QXFsbbOao3IrEBdvQ==
X-Received: by 2002:aa7:dd85:0:b0:435:64d1:5ba with SMTP id g5-20020aa7dd85000000b0043564d105bamr1081155edv.389.1656102814786;
        Fri, 24 Jun 2022 13:33:34 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id p5-20020aa7c4c5000000b004376bc57de5sm57765edr.84.2022.06.24.13.33.33
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 13:33:33 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id w17so4579463wrg.7
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 13:33:33 -0700 (PDT)
X-Received: by 2002:adf:d1c1:0:b0:21b:a5e9:b7b2 with SMTP id
 b1-20020adfd1c1000000b0021ba5e9b7b2mr857431wrd.405.1656102812967; Fri, 24 Jun
 2022 13:33:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220609121838.v22.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <CAD=FV=W6erE8ByabmYSL_OWJPKYGqysDMGYQX6j7_PSEYGZ4YQ@mail.gmail.com>
 <YqpprpUHmlD62YzI@google.com> <CAD=FV=VNDamV4+j07TrnX3cUs2-D5ySbeQ-zfU=Eef8+WagGig@mail.gmail.com>
 <Yqub17iT4O7aqFMi@google.com> <CAD=FV=VEztPLhsrJecZUdyHCW7ZfFTVvxyqY5CqRVv2mWyrLog@mail.gmail.com>
 <YquoSMiQS+RG8rOM@google.com> <CAD=FV=W81pSEUbzw2ZQgs_TJ9MLnHQHiDopZXZ6bHdS7QMzAyA@mail.gmail.com>
 <YqvMffveCPiKQEUk@google.com> <CAD=FV=UJOStPfRR3Hq2DmRBSH-HCtZ16hAU9eVH5w6Hm=WSJRQ@mail.gmail.com>
 <YqytDNB2y4+qT8GD@google.com>
In-Reply-To: <YqytDNB2y4+qT8GD@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 24 Jun 2022 13:33:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UT0XtMjZ9syQPGXeTEaUrwGTb_LgDow+cofgmx4D30VA@mail.gmail.com>
Message-ID: <CAD=FV=UT0XtMjZ9syQPGXeTEaUrwGTb_LgDow+cofgmx4D30VA@mail.gmail.com>
Subject: Re: [PATCH v22 2/3] usb: misc: Add onboard_usb_hub driver
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Bastien Nocera <hadess@hadess.net>,
        Peter Chen <peter.chen@kernel.org>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Roger Quadros <rogerq@kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Jun 17, 2022 at 9:34 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> > Looking at the "companion-hub" case with fresh eyes, too, I wonder if
> > that can be simpler. If we find a companion hub, do we need both the
> > check for usb_hcd_is_primary_hcd() and the check to see whether the
> > pdev was already created?
>
> I was also doubting about this and concluded that it is still needed.
>
> Let's use once more the trogdor config as example, which has one physical
> onboard hub chip with a USB 3.1 hub and a USB 2.1 companion hub, connected
> to the dwc3 controller:
>
> &usb_1_dwc3 {
>         dr_mode = "host";
>         #address-cells = <1>;
>         #size-cells = <0>;
>
>         /* 2.x hub on port 1 */
>         usb_hub_2_x: hub@1 {
>                 compatible = "usbbda,5411";
>                 reg = <1>;
>                 vdd-supply = <&pp3300_hub>;
>                 companion-hub = <&usb_hub_3_x>;
>         };
>
>         /* 3.x hub on port 2 */
>         usb_hub_3_x: hub@2 {
>                 compatible = "usbbda,411";
>                 reg = <2>;
>                 vdd-supply = <&pp3300_hub>;
>                 companion-hub = <&usb_hub_2_x>;
>         };
> };
>
> Let's assume we don't check for the pdev. With our change above for root hubs
> the loop is now only executed for the primary HCD. In the first iteration
> we encounter the 2.x hub, it has a companion hub, but that alone doesn't
> tell us much, so we create a pdev. In the next iteration we encouter the
> 3.x hub, it also has a companion hub, but we don't know/check that the
> companion already has a pdev, so we create another one for the same
> physical hub.

Ah, you are correct. You only run into that case for the root hub,
correct? For everything else it's impossible?

...and I guess things would be different if inside the loop you
actually set "hcd" to point to the "hcd" of the child device. I guess
that's where my confusion keeps stemming from. "hcd" is the parent's
host controller which is not always the same as the child's host
controller.

It would have been keen if we could somehow know the child's host
controller and get a pointer to that, but we can't because the child
device hasn't been enumerated yet.

OK, I'm convinced. I'll mention it in your v23 but maybe I'll have a
slightly better chance of figuring this out if/when I look at this
again if we rename "hcd" to "parent_hcd".


-Doug
