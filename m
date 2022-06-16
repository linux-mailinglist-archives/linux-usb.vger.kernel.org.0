Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCC0154EDA6
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jun 2022 00:54:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378587AbiFPWye (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 18:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376865AbiFPWyc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 18:54:32 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FEA6220A
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 15:54:28 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id g7so4064590eda.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 15:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BIl5tFNLrP4Cjm2iajc389o0ARniB73n3TO6sYm0FgA=;
        b=TqQacxtrbpgXOSC1CChdq++aBuQ+pOIi3HzWd51RZpLixwbWLPQ3cBbVnkf5zIL8Mn
         N8qZF8wJHDf/B8K8/4TjVeTMtcEqNZEiIMvMQV1NGcvnaePtQzc+USsdIcg7MIA06eWY
         hJrMAU37V7sG/wTHz8RRNNEy9JyafTk+tdF9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BIl5tFNLrP4Cjm2iajc389o0ARniB73n3TO6sYm0FgA=;
        b=tJrFBagIkuipgx//TztS8hVf/hVXpqbZBjBFwv0fLksAn1JaeK8djnOn/fmrIYeOAz
         VM1HRY2Vykk/QjOoN92rI91GgZqNN9QTB4ye6FL7t7XVJ4RScwoOptxbD81hk0cbtCzb
         GO5+5s4aGDBUK67SLmNl4SeqT208ayrivb7pQSX1niLKHpVn/lXFwxaGsoEUIkLU4G87
         BRcAsENuYAUnBjAhKzccqswUIKfxSru4J48jDQdj8VrRMP07K7NyyEZgVGBKH5xev9/Y
         eJmg1AXkxell4NXEUHsLhJgokSUlJttxDbNBs5xFpTneSZhP8zVERaA/kKz7jO9xSmRq
         ABMg==
X-Gm-Message-State: AJIora+OdF6FBPSYXT535DZMroqwQ1jfxjuonHcS6OJXczvis66QV2Gn
        Uoi4S79MzBOOrCcrPo6UwHnd+47YSF8ZL9iSaU4=
X-Google-Smtp-Source: AGRyM1s93ZknBO2vbnoswZAwiq66CssPJF43FU9AMph9Fgyq/wME8reoosigE51C6O32a1xr7mlBmg==
X-Received: by 2002:a05:6402:542:b0:42d:c7d6:4121 with SMTP id i2-20020a056402054200b0042dc7d64121mr9167465edx.302.1655420067189;
        Thu, 16 Jun 2022 15:54:27 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id lb13-20020a170907784d00b006fa84a0af2asm1347911ejc.16.2022.06.16.15.54.26
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 15:54:26 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id z9so1466810wmf.3
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 15:54:26 -0700 (PDT)
X-Received: by 2002:a1c:25c4:0:b0:39c:9a08:452f with SMTP id
 l187-20020a1c25c4000000b0039c9a08452fmr7069794wml.199.1655419588107; Thu, 16
 Jun 2022 15:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220609192000.990763-1-mka@chromium.org> <20220609121838.v22.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <CAD=FV=W6erE8ByabmYSL_OWJPKYGqysDMGYQX6j7_PSEYGZ4YQ@mail.gmail.com>
 <YqpprpUHmlD62YzI@google.com> <CAD=FV=VNDamV4+j07TrnX3cUs2-D5ySbeQ-zfU=Eef8+WagGig@mail.gmail.com>
 <Yqub17iT4O7aqFMi@google.com> <CAD=FV=VEztPLhsrJecZUdyHCW7ZfFTVvxyqY5CqRVv2mWyrLog@mail.gmail.com>
 <YquoSMiQS+RG8rOM@google.com>
In-Reply-To: <YquoSMiQS+RG8rOM@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Jun 2022 15:46:15 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W81pSEUbzw2ZQgs_TJ9MLnHQHiDopZXZ6bHdS7QMzAyA@mail.gmail.com>
Message-ID: <CAD=FV=W81pSEUbzw2ZQgs_TJ9MLnHQHiDopZXZ6bHdS7QMzAyA@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jun 16, 2022 at 3:01 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Thu, Jun 16, 2022 at 02:28:38PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Jun 16, 2022 at 2:08 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > On Thu, Jun 16, 2022 at 01:12:32PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Wed, Jun 15, 2022 at 4:22 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > >
> > > > > > > +void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> > > > > > > +{
> > > > > > > +       int i;
> > > > > > > +       struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
> > > > > > > +       struct device_node *np, *npc;
> > > > > > > +       struct platform_device *pdev = NULL;
> > > > > > > +       struct pdev_list_entry *pdle;
> > > > > > > +
> > > > > > > +       if (!parent_hub->dev.of_node)
> > > > > > > +               return;
> > > > > > > +
> > > > > > > +       for (i = 1; i <= parent_hub->maxchild; i++) {
> > > > > > > +               np = usb_of_get_device_node(parent_hub, i);
> > > > > > > +               if (!np)
> > > > > > > +                       continue;
> > > > > > > +
> > > > > > > +               if (!of_is_onboard_usb_hub(np))
> > > > > > > +                       goto node_put;
> > > > > > > +
> > > > > > > +               npc = of_parse_phandle(np, "companion-hub", 0);
> > > > > > > +               if (npc) {
> > > > > > > +                       /*
> > > > > > > +                        * Hubs with companions share the same platform device.
> > > > > > > +                        * Create the plaform device only for the hub that is
> > > > > > > +                        * connected to the primary HCD (directly or through
> > > > > > > +                        * other hubs).
> > > > > > > +                        */
> > > > > > > +                       if (!usb_hcd_is_primary_hcd(hcd)) {
> > > > > > > +                               of_node_put(npc);
> > > > > > > +                               goto node_put;
> > > > > > > +                       }
> > > > > > > +
> > > > > > > +                       pdev = of_find_device_by_node(npc);
> > > > > > > +                       of_node_put(npc);
> > > > > > > +               } else {
> > > > > > > +                       /*
> > > > > > > +                        * For root hubs this function can be called multiple times
> > > > > > > +                        * for the same root hub node (the HCD node). Make sure only
> > > > > > > +                        * one platform device is created for this hub.
> > > > > > > +                        */
> > > > > > > +                       if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
> > > > > > > +                               goto node_put;
> > > > > >
> > > > > > I don't understand the "else" case above. What case exactly are we
> > > > > > handling again? This is when:
> > > > > > * the hub is presumably just a 2.0 hub since there is no companion.
> > > > > > * our parent is the root hub and the USB 2.0 hub we're looking at is
> > > > > > not the primary
> > > > >
> > > > > The 'else' case can be entered for hubs connected to a root hub or to another
> > > > > hub further down in the tree, but we bail out only for first level hubs.
> > > > >
> > > > > > ...but that doesn't make a lot of sense to me? I must have missed something...
> > > > >
> > > > > It's not super-obvious, this bit is important: "this function can be called
> > > > > multiple times for the same root hub node". For any first level hub we only
> > > > > create a pdev if this function is called on behalf of the primary HCD. That
> > > > > is also true of a hub connected to the secondary HCD. We only want to create
> > > > > one pdev and there is supposedly always a primary HCD.
> > > > >
> > > > > Maybe it would be slightly clearer if the function returned before the loop
> > > > > if this condition is met.
> > > >
> > > > I guess I'm still pretty confused. You say "For root hubs this
> > > > function can be called multiple times for the same root hub node".
> > > > Does that mean that the function will be called multiple times with
> > > > the same "parent_hub", or something else.
> > >
> > > It is called with a different "parent_hub", however for root hubs the
> > > DT node is the same for both root hubs (it's the DT node of the
> > > controller since there are no dedicated nodes for the root hubs).
> > >
> > > Just to make sure this isn't the source of the confusion: the root hubs
> > > are part of the USB controller, not 'external' hubs which are directly
> > > connected to the controller. I call the latter 'first level hubs'.
> > >
> > > > Unless it's called with the same "parent_hub" then it seems like if
> > > > the USB device has a device tree node and that device tree node is for
> > > > a onboard_usb_hub and there's no companion node then we _always_ want
> > > > to create the platform device, don't we? If it is called with the same
> > > > "parent_hub" then I'm confused how your test does something different
> > > > the first time the function is called vs. the 2nd.
> > >
> > > Let's use an adapted trogdor DT with only a USB 2.x hub as an example:
> > >
> > > usb_1_dwc3 {
> > >          dr_mode = "host";
> > >          #address-cells = <1>;
> > >          #size-cells = <0>;
> > >
> > >          /* 2.x hub on port 1 */
> > >          usb_hub_2_x: hub@1 {
> > >                  compatible = "usbbda,5411";
> > >                  reg = <1>;
> > >                  vdd-supply = <&pp3300_hub>;
> > >          };
> > > };
> > >
> > > 1st call: the 'parent_hub' corresponds to the USB 3.x root hub of
> > > usb_1_dwc3, the DT node of the hub is 'usb_1_dwc3'. The function
> > > iterates over the ports, finds usb_hub_2_x, enters the else branch
> > > (no companion hub), checks that the function was called on behalf
> > > of the primary controller and creates the pdev.
> > >
> > > 2nd call: the 'parent_hub' corresponds to the USB 2.x root hub of
> > > usb_1_dwc3, the DT node of the hub is also 'usb_1_dwc3'. The function
> > > iterates over the ports, finds usb_hub_2_x, enters the else branch
> > > (no companion hub), sees that it is not called on behalf of the
> > > primary controller and does not create a second (unnecessary) pdev.
> > >
> > > Is it clearer now?
> >
> > Ah, I get it now! Sorry for being so dense...
>
> No worries, it's certainly not obvious and probably my commentary could
> have been clearer.
>
> > So like this:
> >
> > Root hubs (those hubs with no parent) are all created with the same
> > device_node, the one for the controller itself. We don't want to
> > iterate through the same children multiple times, so we bail right
> > away if we're detect that `parent_hub` is a root hub and we're not on
> > the primary HCD.
>
> yep
>
> > For all other cases the primary and secondary controllers have distinct
> > device_nodes.
>
> You probably mean that all non-root hubs have distinct nodes, so for these
> the function is only called once.
>
> > I guess in theory that test could go before the "companion-hub" test,
> > though I don't see any case where it truly matters...
>
> Yeah, I'm still wondering whether it would be slightly less confusing to
> bail before the loop (besides saving a few cycles), it would eliminate
> the conflation with the 'companion-hub' check.

I'm not sure how that would work, though? You'd essentially need two loops then?

-Doug
