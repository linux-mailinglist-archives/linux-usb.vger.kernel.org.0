Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9B13553D8D
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 23:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356080AbiFUVXC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 17:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356062AbiFUVWh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 17:22:37 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CF3762EA
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 14:12:26 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id u9so16520942ybq.3
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 14:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0sx9mCt7ugcCul7YmAFz+wOWvzn0YCkRrYodgyvLA20=;
        b=jJLcV4chSkoxoph0SxMvMEEtpXLscNJzrhZaEHO3ZPc7SbpH/zvDKOiacYWqha9wxj
         DO7jw0cqqT3DV5bQSLGtU5a9z6gAx2WcRSGhSMTNItAm+gIhGX/Z0ZytqEyIRY8+z2KA
         wVxV7TcVmKDv/2YKQiNeaADNAJIuInAo74XsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0sx9mCt7ugcCul7YmAFz+wOWvzn0YCkRrYodgyvLA20=;
        b=S1t+BMeu2MzaBgwKNXHfGkHpsq5vZJUT/icFtm2plTnN8F7072YnA7Kf4cSfDvHVGf
         24uRhD7ShJ3lqUGwn/Otkut2gttFDLhb03874D7bXdmC2sQNt7TvK7CR5uvyxEkgjk9s
         6+CNVvrPEZ2BNUztzK+oW1XATZ7BKJA2Fdbn/fo8r9g4U5M9qc3PeD3dxh8gqU7YTXqC
         XfZ17ygN62hHCOKPsI2nEgDHpq403vsV4tDr8t49e6Guk/nguL0jpWfOGmjL0Ro5MbJz
         pDoCFA83lUZ7Xhx+XEsO6dcw4kVyGeTx5Fn3FmrH40vc52EtefGAn09q9jJKGptFhyaV
         MrqA==
X-Gm-Message-State: AJIora8PPeO261f/EnWWui0TNHUMnMklaIJHv6khABUpjXh8svJr8Wyc
        YxMDa0y4o0qBOXG3WTbd3wnm96PCQcegackTa18qrA==
X-Google-Smtp-Source: AGRyM1t+DFUzS0wvZf5giwOBI/iXtOif2fd5MijWJHsJfzfG0w42jihhLkAOXFsXvEb8fVJDIYNV5qGIHiM0JlDwnXY=
X-Received: by 2002:a25:9d89:0:b0:669:31d4:7cd9 with SMTP id
 v9-20020a259d89000000b0066931d47cd9mr158778ybp.294.1655845945358; Tue, 21 Jun
 2022 14:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220615172129.1314056-1-pmalani@chromium.org>
 <20220615172129.1314056-5-pmalani@chromium.org> <CAE-0n53ub30HXB325wPoMB4C3n4j_9FWnNu5AmtYgU3PBvs8mQ@mail.gmail.com>
 <CACeCKadSCXZo3E4JZiwxFn_4CH3KDfQkk=xRrxSqCEWAgYhV6Q@mail.gmail.com>
 <20220616193424.GA3844759-robh@kernel.org> <CACeCKaeH6qTTdG_huC4yw0xxG8TYEOtfPW3tiVNwYs=P4QVPXg@mail.gmail.com>
In-Reply-To: <CACeCKaeH6qTTdG_huC4yw0xxG8TYEOtfPW3tiVNwYs=P4QVPXg@mail.gmail.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 21 Jun 2022 14:12:14 -0700
Message-ID: <CACeCKad=gm0zU47hmEZwninETycv0pB5fYv0J_c0_fv2cBr3hw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] dt-bindings: drm/bridge: anx7625: Add mode-switch support
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, bleung@chromium.org,
        heikki.krogerus@linux.intel.com,
        =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= 
        <nfraprado@collabora.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Pin-Yen Lin <treapking@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Xin Ji <xji@analogixsemi.com>
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

On Thu, Jun 16, 2022 at 12:57 PM Prashant Malani <pmalani@chromium.org> wrote:
>
> On Thu, Jun 16, 2022 at 12:34 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, Jun 16, 2022 at 01:54:36AM -0700, Prashant Malani wrote:
> > > On Thu, Jun 16, 2022 at 12:42 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Prashant Malani (2022-06-15 10:20:20)
> > > > >
> > > > >  .../display/bridge/analogix,anx7625.yaml      | 64 +++++++++++++++++++
> > > > >  1 file changed, 64 insertions(+)
> > > >
> > > > Can this file get a link to the product brief[1]? It helps to quickly
> > > > find the block diagram.
> > >
> > > Sure, but I don't really think that should be included in this patch
> > > (or series).
> > > I'd be happy to submit a separate patch once this series is resolved.
> > >
> > > >
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > > index 35a48515836e..bc6f7644db31 100644
> > > > > --- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > > +++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
> > > > > @@ -105,6 +105,34 @@ properties:
> > > > >        - port@0
> > > > >        - port@1
> > > > >
> > > > > +  switches:
> > > > > +    type: object
> > > > > +    description: Set of switches controlling DisplayPort traffic on
> > > > > +      outgoing RX/TX lanes to Type C ports.
> > > > > +    additionalProperties: false
> > > > > +
> > > > > +    properties:
> > > > > +      '#address-cells':
> > > > > +        const: 1
> > > > > +
> > > > > +      '#size-cells':
> > > > > +        const: 0
> > > > > +
> > > > > +    patternProperties:
> > > > > +      '^switch@[01]$':
> > > > > +        $ref: /schemas/usb/typec-switch.yaml#
> > > > > +        unevaluatedProperties: false
> > > > > +
> > > > > +        properties:
> > > > > +          reg:
> > > > > +            maxItems: 1
> > > > > +
> > > > > +        required:
> > > > > +          - reg
> > > > > +
> > > > > +    required:
> > > > > +      - switch@0
> > > > > +
> > > > >  required:
> > > > >    - compatible
> > > > >    - reg
> > > > > @@ -167,5 +195,41 @@ examples:
> > > > >                      };
> > > > >                  };
> > > > >              };
> > > > > +            switches {
> > > >
> > > > Is "switches" a bus?
> > >
> > > No.
> > >
> > > >
> > > > > +                #address-cells = <1>;
> > > > > +                #size-cells = <0>;
> > > > > +                switch@0 {
> > > > > +                    compatible = "typec-switch";
> > > >
> > > > Is this compatible matched against a driver that's populated on this
> > > > "switches" bus?
> > >
> > > No. Patch 6/7 has the implementation details on how the anx driver
> > > performs the enumeration of switches.
> > >
> > > >
> > > > > +                    reg = <0>;
> > > > > +                    mode-switch;
> > > > > +
> > > > > +                    ports {
> > > > > +                        #address-cells = <1>;
> > > > > +                        #size-cells = <0>;
> > > > > +                        port@0 {
> > > > > +                            reg = <0>;
> > > > > +                            anx_typec0: endpoint {
> > > > > +                                remote-endpoint = <&typec_port0>;
> > > > > +                            };
> > > > > +                        };
> > > > > +                    };
> > > >
> > > > I was expecting to see these simply be more ports in the existing graph
> > > > binding of this device, and then have the 'mode-switch' or
> > > > 'orientation-switch' properties be at the same level as the compatible
> > > > string "analogix,anx7625". Here's the reasoning, based on looking at the
> > > > product brief and the existing binding/implementation.
> > > >
> > > > Looking at the only existing implementation of this binding upstream in
> > > > mt8183-kukui-jacuzzi.dtsi it looks like one of these typec ports is
> > > > actually the same physically as the 'anx7625_out' endpoint (reg address
> > > > of 1) that is already defined in the binding. It seems that MIPI DSI/DPI
> > > > comes in and is output through 2 lanes, SSRX2 and SSTX2 according to the
> > > > product brief[1], and that is connected to some eDP panel
> > > > ("auo,b116xw03"). Presumably that is the same as anx_typec1 in this
> > > > patch? I suspect the USB3.1 input is not connected on this board, and
> > > > thus the crosspoint switch is never used, nor the SSRX1/SSTX1 pins.
> > > >
> > > > The existing binding defines the MIPI DSI/DPI input as port0 and two of
> > > > the four lanes of output that is probably by default connected to the
> > > > "DisplayPort Transmitter" as port1 because that's how the crosspoint
> > > > switch comes out of reset. That leaves the USB3.1 input possibly needing
> > > > a port in the ports binding, and the other two lanes of output needing a
> > > > port in the ports binding to describe their connection to the downstream
> > > > device. And finally information about if the crosspoint switch needs to
> > > > be registered with the typec framework to do typec things, which can be
> > > > achieved by the presence of the 'mode-switch' property.
> > > >
> > > > On a board like kukui-jacuzzi these new properties and ports wouldn't be
> > > > specified, because what is there is already sufficient. If this chip is
> > > > connected to a usb-c-connector then I'd expect to see a connection from
> > > > the output ports in the graph binding to the connector node's ports.
> > > > There aren't any ports in the usb-c-connector binding though from what I
> > > > see.
> > > >
> > > > I believe there's also one more use case here where USB3.1 or MIPI
> > > > DSI/DPI is connected on the input side and this device is used to steer
> > > > USB3.1 or DP through the crosspoint switch to either of the two output
> > > > pairs. This last scenario means that we have to describe both output
> > > > pairs, SSRX1/SSTX1 and SSRX2/SSTX2, as different ports in the binding so
> > > > they can be connected to different usb-c-connectors if the hardware
> > > > engineer wired the output pins that way.
> > > >
> > > > TL;DR: Can we add 'mode-switch' as an optional property and two more
> > > > ports at address 2 and 3 for the USB3.1 input and the SSRX1/SSTX1 pair
> > > > respectively to the existing graph part of this binding?
> > >
> > > Sorry, but I got lost midway through the preceding explanation.
> >
> > Made sense to me.
> >
> > > The binding
> > > can always add additional ports to each "switch" to accomplish the
> > > graph connections
> > > you are alluding to (if the driver needs/uses it, which I don't think
> > > this one does at present).
> >
> > Why is the switch special? If I just look at this from a block diagram
> > perspective, I just see a list of interfaces that need to be described
> > in the graph.
>
> Because it is specific to Type-C connectors. The anx7625.h does
> contain a cross-point
> switch which controls data lines coming from 1 (or more) Type-C
> connectors, so it seems reasonable
> to have a dedicated binding for such types of hardware sub-components,
> which helps define the graph connections
> in a more uniform manner. That's not to say:
> - this can only be used by this hardware. The typec-switch binding is
> generic enough to accommodate other hardware.
> - there is only 1 way to do this. The interfaces could be described
> using existing port OF graph bindings, but I don't
> see that as reason enough to not include a dedicated switch binding if
> it makes the overall binding more logically organized (IMO) and
> makes driver registration code mode clean.
>
> >
> > > Adding extra ports to existing ports gets tricky from a mode-switch
> > > enumeration perspective (which
> > > ports should have the modes switches, which shouldn't? Do you follow
> > > the remote end points for each port
> > > and see which one is a Type C connector?
> >
> > The driver knows which port is which because the binding has to define
> > it. So you have to check 2 of them (SSRX1/SSTX1 and SSRX2/SSTX2) to find
> > usb C connectors.
>
> Right, but with the switch binding you no longer need to check. If
> there is a typec-switch, you know
> it is coming from a Type-C connector, so you can just register the
> switches with the Type-C framework.
>
> >
> > > What if we add an
> > > intermediate switch device in the future?)
> > > Having a dedicated "switch" binding makes this consistent and easy
> > > (port0 will always have the end-point for the switch).
> > >
> > > While there may be more than 1 valid approach here, I believe the
> > > current one is appropriate.
> >
> > To put it simply, if you want to define a generic binding, I want to see
> > at least 2 users of it.

Pin-Yen and I will work on adding another user for the binding to v5 of
this patch series.

Best regards,

- Prashant
