Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE35054EC27
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 23:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379047AbiFPVIp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 17:08:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378803AbiFPVIn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 17:08:43 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495DB60AA4
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 14:08:41 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso2881611pjg.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 14:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HwbgezfQwk0Xu1pd/5zyik8R0QppWmV3ImE0Oh/38WA=;
        b=TlNoPzPnoqLcG8glyixDbYt4HuvHv1RJUrpBYBd26D/AENq5Lr2UaRi+x5RiPhoQG+
         QIc0APs6AnViZ/1aS6T9H37/g52R3nd3wFk0eHws+3wm4G03m1d69G5YUgEEHh/pIjOv
         I1a0qgibONul/Ujsu2SA/nAu2q1VPG7DyvkyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HwbgezfQwk0Xu1pd/5zyik8R0QppWmV3ImE0Oh/38WA=;
        b=yaVwK9g1NCjmyM24un2BEeipTxLFymtLhn3j+48y8T5OPKxVgwJO09wNs/T0SBWo39
         /qVPWKqP8nxmmraSCeyLgyyJasRl1/0/bx0RBlYe1SgaxAETip/1lg7Z//RULOAKijzN
         6RfWqYBUACwCbdo2jZV8oH3/KE2N9u1XFFeDsiFx/9ZJOPHtEEVqbAdg62jQv097wQzJ
         5biY5jnxTgj0rofLCAQT/S9QKKuGxfKUeb3CS+rFu1kE26CUpUlkhiONkpb1C5q7w5/I
         tRNJcalYQZFbaP9c9oZNGPOKSmuF+Ma7cp4TeGTrtr/WSckoU+q3ti/14mFqMogstEDN
         ke2A==
X-Gm-Message-State: AJIora/AHuqUhEflkTyZQm+jsVvdddDI1Tgp/U41mJl1eoJyV+lPBqT3
        kWJTi/wrwfe+bxMybXbFnVYUtQ==
X-Google-Smtp-Source: AGRyM1uc79Do6zsutgPjcjN2T3RytlgvAFKrJijqceHy6/hr47dr1Tlqvrk1p9JFum7it8re0r3fnA==
X-Received: by 2002:a17:90b:341:b0:1e0:cf43:df4f with SMTP id fh1-20020a17090b034100b001e0cf43df4fmr7041722pjb.126.1655413721353;
        Thu, 16 Jun 2022 14:08:41 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:4ef5:7e3b:63ba:fc4])
        by smtp.gmail.com with UTF8SMTPSA id g30-20020aa79dde000000b0050dc76281b8sm2215073pfq.146.2022.06.16.14.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 14:08:40 -0700 (PDT)
Date:   Thu, 16 Jun 2022 14:08:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
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
Subject: Re: [PATCH v22 2/3] usb: misc: Add onboard_usb_hub driver
Message-ID: <Yqub17iT4O7aqFMi@google.com>
References: <20220609192000.990763-1-mka@chromium.org>
 <20220609121838.v22.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <CAD=FV=W6erE8ByabmYSL_OWJPKYGqysDMGYQX6j7_PSEYGZ4YQ@mail.gmail.com>
 <YqpprpUHmlD62YzI@google.com>
 <CAD=FV=VNDamV4+j07TrnX3cUs2-D5ySbeQ-zfU=Eef8+WagGig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=VNDamV4+j07TrnX3cUs2-D5ySbeQ-zfU=Eef8+WagGig@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 16, 2022 at 01:12:32PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 15, 2022 at 4:22 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > > > +void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> > > > +{
> > > > +       int i;
> > > > +       struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
> > > > +       struct device_node *np, *npc;
> > > > +       struct platform_device *pdev = NULL;
> > > > +       struct pdev_list_entry *pdle;
> > > > +
> > > > +       if (!parent_hub->dev.of_node)
> > > > +               return;
> > > > +
> > > > +       for (i = 1; i <= parent_hub->maxchild; i++) {
> > > > +               np = usb_of_get_device_node(parent_hub, i);
> > > > +               if (!np)
> > > > +                       continue;
> > > > +
> > > > +               if (!of_is_onboard_usb_hub(np))
> > > > +                       goto node_put;
> > > > +
> > > > +               npc = of_parse_phandle(np, "companion-hub", 0);
> > > > +               if (npc) {
> > > > +                       /*
> > > > +                        * Hubs with companions share the same platform device.
> > > > +                        * Create the plaform device only for the hub that is
> > > > +                        * connected to the primary HCD (directly or through
> > > > +                        * other hubs).
> > > > +                        */
> > > > +                       if (!usb_hcd_is_primary_hcd(hcd)) {
> > > > +                               of_node_put(npc);
> > > > +                               goto node_put;
> > > > +                       }
> > > > +
> > > > +                       pdev = of_find_device_by_node(npc);
> > > > +                       of_node_put(npc);
> > > > +               } else {
> > > > +                       /*
> > > > +                        * For root hubs this function can be called multiple times
> > > > +                        * for the same root hub node (the HCD node). Make sure only
> > > > +                        * one platform device is created for this hub.
> > > > +                        */
> > > > +                       if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
> > > > +                               goto node_put;
> > >
> > > I don't understand the "else" case above. What case exactly are we
> > > handling again? This is when:
> > > * the hub is presumably just a 2.0 hub since there is no companion.
> > > * our parent is the root hub and the USB 2.0 hub we're looking at is
> > > not the primary
> >
> > The 'else' case can be entered for hubs connected to a root hub or to another
> > hub further down in the tree, but we bail out only for first level hubs.
> >
> > > ...but that doesn't make a lot of sense to me? I must have missed something...
> >
> > It's not super-obvious, this bit is important: "this function can be called
> > multiple times for the same root hub node". For any first level hub we only
> > create a pdev if this function is called on behalf of the primary HCD. That
> > is also true of a hub connected to the secondary HCD. We only want to create
> > one pdev and there is supposedly always a primary HCD.
> >
> > Maybe it would be slightly clearer if the function returned before the loop
> > if this condition is met.
> 
> I guess I'm still pretty confused. You say "For root hubs this
> function can be called multiple times for the same root hub node".
> Does that mean that the function will be called multiple times with
> the same "parent_hub", or something else.

It is called with a different "parent_hub", however for root hubs the
DT node is the same for both root hubs (it's the DT node of the
controller since there are no dedicated nodes for the root hubs).

Just to make sure this isn't the source of the confusion: the root hubs
are part of the USB controller, not 'external' hubs which are directly
connected to the controller. I call the latter 'first level hubs'.

> Unless it's called with the same "parent_hub" then it seems like if
> the USB device has a device tree node and that device tree node is for
> a onboard_usb_hub and there's no companion node then we _always_ want
> to create the platform device, don't we? If it is called with the same
> "parent_hub" then I'm confused how your test does something different
> the first time the function is called vs. the 2nd.

Let's use an adapted trogdor DT with only a USB 2.x hub as an example:

usb_1_dwc3 {
         dr_mode = "host";
	 #address-cells = <1>;
	 #size-cells = <0>;

	 /* 2.x hub on port 1 */
	 usb_hub_2_x: hub@1 {
	         compatible = "usbbda,5411";
	         reg = <1>;
	         vdd-supply = <&pp3300_hub>;
	 };
};

1st call: the 'parent_hub' corresponds to the USB 3.x root hub of
usb_1_dwc3, the DT node of the hub is 'usb_1_dwc3'. The function
iterates over the ports, finds usb_hub_2_x, enters the else branch
(no companion hub), checks that the function was called on behalf
of the primary controller and creates the pdev.

2nd call: the 'parent_hub' corresponds to the USB 2.x root hub of
usb_1_dwc3, the DT node of the hub is also 'usb_1_dwc3'. The function
iterates over the ports, finds usb_hub_2_x, enters the else branch
(no companion hub), sees that it is not called on behalf of the
primary controller and does not create a second (unnecessary) pdev.

Is it clearer now?
