Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A8F54EA92
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jun 2022 22:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245332AbiFPUMw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jun 2022 16:12:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238989AbiFPUMv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jun 2022 16:12:51 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D6BA15FE8
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 13:12:50 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id v1so4750265ejg.13
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G6PSnNxxx/PVW8FFXrR6HE/lLr9drhWcqvfOWIWAGxU=;
        b=jkqKxupetiO6TfhfVzDnfyZck/aeWFqIWWHZHa/O+g+D8eOtl5NiTQ4sNMvsO5Cm4q
         +kB+x3InFzatm0matPIaUp5KcUChFkYaXXFdD33Uc5eBovHuiKvlTsxHAQMxE/jYc2sf
         hgN7lONX7pqWG/hohLhSXTGMjLrEXx2l3PwQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G6PSnNxxx/PVW8FFXrR6HE/lLr9drhWcqvfOWIWAGxU=;
        b=a9NaUKT2Nj5awNmvuAZKtjGky9qhd7TH2Hv1BFRXMI+AGoC18pDc/lh2gkvTE2Q6S6
         v+BC/um0iXWyK0m2UBvfgArQtBBVZlXuS43aikX240FF5gJVwv2w2oxLEXi5D5qXK2jN
         Ky6hZlbLT+seA9uOTUAyYYt/Y6Yparq9iDldNdhZSblZ8cyv9WfvkRmCHwqiw/0mCe/l
         cvmciaAwI9VPcxyrt1tu9UYpXLdGVo4wZNQYo5Rr7y1g+84CFB1Lwx4Abk/Yuzp8lM8k
         s4mRhFvtkW8U+rF661xZMDswoHTiOH2op/vMwvxRLTbJrTCSIGoAvqFcGWi3Jd95cN71
         83Zw==
X-Gm-Message-State: AJIora+VCgLXao7RFjf0W49KpqhYFgqWVdW8JcmtbmTQt3ZsPfR3ouMd
        56UMHANFXEDg8KUxd6UIXIVErnD/VVT/AjvLkeM=
X-Google-Smtp-Source: AGRyM1tSqRCXoQ9YIdJLBu1tDv4OWnnppZkJ57W8XiKnp6LzEwCm8P9ZPana/2FgxdfcECmwgNSPMQ==
X-Received: by 2002:a17:907:86ac:b0:708:9c4a:c6e9 with SMTP id qa44-20020a17090786ac00b007089c4ac6e9mr6053515ejc.297.1655410368607;
        Thu, 16 Jun 2022 13:12:48 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id rh17-20020a17090720f100b006fef5088792sm1149469ejb.108.2022.06.16.13.12.46
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 13:12:47 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id c21so3228141wrb.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Jun 2022 13:12:46 -0700 (PDT)
X-Received: by 2002:a5d:68d2:0:b0:210:31cc:64a6 with SMTP id
 p18-20020a5d68d2000000b0021031cc64a6mr6144685wrw.679.1655410366015; Thu, 16
 Jun 2022 13:12:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220609192000.990763-1-mka@chromium.org> <20220609121838.v22.2.I7c9a1f1d6ced41dd8310e8a03da666a32364e790@changeid>
 <CAD=FV=W6erE8ByabmYSL_OWJPKYGqysDMGYQX6j7_PSEYGZ4YQ@mail.gmail.com> <YqpprpUHmlD62YzI@google.com>
In-Reply-To: <YqpprpUHmlD62YzI@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 16 Jun 2022 13:12:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VNDamV4+j07TrnX3cUs2-D5ySbeQ-zfU=Eef8+WagGig@mail.gmail.com>
Message-ID: <CAD=FV=VNDamV4+j07TrnX3cUs2-D5ySbeQ-zfU=Eef8+WagGig@mail.gmail.com>
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

On Wed, Jun 15, 2022 at 4:22 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> > > +void onboard_hub_create_pdevs(struct usb_device *parent_hub, struct list_head *pdev_list)
> > > +{
> > > +       int i;
> > > +       struct usb_hcd *hcd = bus_to_hcd(parent_hub->bus);
> > > +       struct device_node *np, *npc;
> > > +       struct platform_device *pdev = NULL;
> > > +       struct pdev_list_entry *pdle;
> > > +
> > > +       if (!parent_hub->dev.of_node)
> > > +               return;
> > > +
> > > +       for (i = 1; i <= parent_hub->maxchild; i++) {
> > > +               np = usb_of_get_device_node(parent_hub, i);
> > > +               if (!np)
> > > +                       continue;
> > > +
> > > +               if (!of_is_onboard_usb_hub(np))
> > > +                       goto node_put;
> > > +
> > > +               npc = of_parse_phandle(np, "companion-hub", 0);
> > > +               if (npc) {
> > > +                       /*
> > > +                        * Hubs with companions share the same platform device.
> > > +                        * Create the plaform device only for the hub that is
> > > +                        * connected to the primary HCD (directly or through
> > > +                        * other hubs).
> > > +                        */
> > > +                       if (!usb_hcd_is_primary_hcd(hcd)) {
> > > +                               of_node_put(npc);
> > > +                               goto node_put;
> > > +                       }
> > > +
> > > +                       pdev = of_find_device_by_node(npc);
> > > +                       of_node_put(npc);
> > > +               } else {
> > > +                       /*
> > > +                        * For root hubs this function can be called multiple times
> > > +                        * for the same root hub node (the HCD node). Make sure only
> > > +                        * one platform device is created for this hub.
> > > +                        */
> > > +                       if (!parent_hub->parent && !usb_hcd_is_primary_hcd(hcd))
> > > +                               goto node_put;
> >
> > I don't understand the "else" case above. What case exactly are we
> > handling again? This is when:
> > * the hub is presumably just a 2.0 hub since there is no companion.
> > * our parent is the root hub and the USB 2.0 hub we're looking at is
> > not the primary
>
> The 'else' case can be entered for hubs connected to a root hub or to another
> hub further down in the tree, but we bail out only for first level hubs.
>
> > ...but that doesn't make a lot of sense to me? I must have missed something...
>
> It's not super-obvious, this bit is important: "this function can be called
> multiple times for the same root hub node". For any first level hub we only
> create a pdev if this function is called on behalf of the primary HCD. That
> is also true of a hub connected to the secondary HCD. We only want to create
> one pdev and there is supposedly always a primary HCD.
>
> Maybe it would be slightly clearer if the function returned before the loop
> if this condition is met.

I guess I'm still pretty confused. You say "For root hubs this
function can be called multiple times for the same root hub node".
Does that mean that the function will be called multiple times with
the same "parent_hub", or something else.

Unless it's called with the same "parent_hub" then it seems like if
the USB device has a device tree node and that device tree node is for
a onboard_usb_hub and there's no companion node then we _always_ want
to create the platform device, don't we? If it is called with the same
"parent_hub" then I'm confused how your test does something different
the first time the function is called vs. the 2nd.

-Doug
