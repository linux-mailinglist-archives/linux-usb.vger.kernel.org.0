Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1C173831F
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jun 2023 14:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbjFUMBR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jun 2023 08:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbjFUMBQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jun 2023 08:01:16 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B421C1A8;
        Wed, 21 Jun 2023 05:01:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A0D46154E;
        Wed, 21 Jun 2023 12:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BC0C433C8;
        Wed, 21 Jun 2023 12:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687348874;
        bh=dnsuzZWarW86jSlrptZska9lIeReMhuRGOg2gsQvupc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o+Tg1ZfF22nx36RE30p158t2kjt2B5u+y+r4zdxUjvL2CwhuhwrRRgnG7Suunmn+P
         D9iejU+u34St1g1IoqHprqdT/3ZnMl0fT+83zgfd9/yUAHMUmsC2/M09Z3XFkOkImY
         kRssyBkJbIQ0h7C85NBS+kc4TPm0zn1U/gyHcTyn3z3XIpw++r/bx3XNG5bqwOI4Jb
         BBzMk4E8kEyVnO0+dr5v2ElK41pcGhtTNv8RVerykpElLCxpvm0oqe398QICjGZ8A/
         3JqDOiU7lLugJwk1HlvT5lgLk5+Mbcvio151bQXuRlKOyBdShO4MG+FUeonT0lpBji
         Q44nN94bYQp+w==
Date:   Wed, 21 Jun 2023 17:31:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     Rob Herring <robh@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert
 to DT schema format
Message-ID: <ZJLmhqHOPrBauJDn@matsya>
References: <20230613083445.1129137-1-xu.yang_2@nxp.com>
 <20230620152921.GA3626802-robh@kernel.org>
 <DB7PR04MB450532123A20DBDB0059B6718C5DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7PR04MB450532123A20DBDB0059B6718C5DA@DB7PR04MB4505.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-06-23, 02:16, Xu Yang wrote:
> ++ Vinod Koul
> 
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, June 20, 2023 11:29 PM
> > To: Xu Yang <xu.yang_2@nxp.com>
> > Cc: krzysztof.kozlowski+dt@linaro.org; conor+dt@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; linux-phy@lists.infradead.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-usb@vger.kernel.org; Jun Li <jun.li@nxp.com>
> > Subject: [EXT] Re: [PATCH v4 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
> >
> > Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the
> > message using the 'Report this email' button
> >
> >
> > On Tue, Jun 13, 2023 at 04:34:44PM +0800, Xu Yang wrote:
> > > Convert the binding to DT schema format. Besides, this also add clocks,
> > > '#phy-cells', phy-3p0-supply and power-domains properties which are not
> > > contained in txt file due to txt file lack updates.
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > >
> > > ---
> > > Changes in v2:
> > >  - change filename to fsl,mxs-usbphy.yaml
> > >  - add other optional properties
> > >  - narrow fsl,anatop to imx6
> > >  - use additionalProperties
> > > Changes in v3:
> > >  - fix indentation
> > >  - add clocks property to example
> > > Changes in v4:
> > >  - remove [fsl,imx7ulp-usbphy, fsl,imx6ul-usbphy]
> > >  - limit item of reg and interrupts to 1
> > >  - sort enum items
> > >  - modify commit message
> > > ---
> > >  .../bindings/phy/fsl,mxs-usbphy.yaml          | 125 ++++++++++++++++++
> > >  .../devicetree/bindings/phy/mxs-usb-phy.txt   |  33 -----
> > >  2 files changed, 125 insertions(+), 33 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/fsl,mxs-usbphy.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/phy/mxs-usb-phy.txt
> >
> > This should be applied by the PHY maintainers, but they weren't Cc'ed.
> 
> I see. Thanks for reminding.
> 
> Hi Vinod,
> 
> Could you please help to apply below two patches:
>     - [v4 1/2] dt-bindings: phy: mxs-usb-phy: convert to DT schema format
>     - [v4,2/2] dt-bindings: phy: mxs-usb-phy: add imx8ulp and imx8qm compatible
> The review process has been completed.
> Many thanks in advance.

Applied now, please use get_maintainer.pl to find whom the patches
should be copied to

-- 
~Vinod
