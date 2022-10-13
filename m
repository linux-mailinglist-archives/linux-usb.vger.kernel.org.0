Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34FA5FE30E
	for <lists+linux-usb@lfdr.de>; Thu, 13 Oct 2022 22:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbiJMUEC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 Oct 2022 16:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiJMUEA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 Oct 2022 16:04:00 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8628718DA85;
        Thu, 13 Oct 2022 13:03:59 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id p24-20020a9d6958000000b00661c528849eso686032oto.9;
        Thu, 13 Oct 2022 13:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/H8aAoz6l7rETFO7J3jM7BsdijuYpZHfTxeVocScgc=;
        b=IH97tXIEuqHnv8yF0buqqqae0R1x5DSmNdsl8xZQbJYM545pp6XznNlbmTrifm0MHk
         VhLti5fKSjtbzt3CC6W9oHJ9tTqhzIirByxaPnMvimswbnNyYyKNtkW8FGiDKtmAnrCW
         ODdqoUh4Aga/ZaoYkNGG3OkaRUO1oiWkfQ0cr655sgg3DKL7V5zym3ypCdl5GJ8YgK9r
         UPBRB2nOwIqqwE5Xh6WF5x70kGF+xeVeHWRo96Q85RBv+WYrh8Kiu365BJ58uPz5dQKD
         q19Zr5koCIZ06P52m0ywRieeyZc5yBae5rw1ADNNOcwRDNI3w5XPAz2GjRRg1RfNayOj
         DDxg==
X-Gm-Message-State: ACrzQf0uamoJZVaDA9RvkUARyHR5qdRwaFb+20jltpC+rvaAox+ZxC/5
        TYVQBL24dimiBNm9nxX2Eg==
X-Google-Smtp-Source: AMsMyM7+PYtDsa7EQjA+sQghRK88ENkEV0dxZPFHUd138yZX381K//TyRVFizou9uBpgNYzKSxoABw==
X-Received: by 2002:a05:6830:2706:b0:659:ddc3:58cf with SMTP id j6-20020a056830270600b00659ddc358cfmr812657otu.102.1665691438648;
        Thu, 13 Oct 2022 13:03:58 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o8-20020a9d4048000000b006619701dc1csm330188oti.54.2022.10.13.13.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Oct 2022 13:03:58 -0700 (PDT)
Received: (nullmailer pid 161997 invoked by uid 1000);
        Thu, 13 Oct 2022 20:03:59 -0000
Date:   Thu, 13 Oct 2022 15:03:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Peter Chen <peter.chen@kernel.org>,
        Peng Fan <peng.fan@oss.nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 6/6] dt-bindings: usb: ci-hdrc-usb2: Add more phy tuning
 properties
Message-ID: <20221013200359.GA150958-robh@kernel.org>
References: <20221011082924.884123-1-s.hauer@pengutronix.de>
 <20221011082924.884123-7-s.hauer@pengutronix.de>
 <20221012160806.GA2189350-robh@kernel.org>
 <20221013101412.GI6702@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221013101412.GI6702@pengutronix.de>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 13, 2022 at 12:14:12PM +0200, Sascha Hauer wrote:
> On Wed, Oct 12, 2022 at 11:08:06AM -0500, Rob Herring wrote:
> > On Tue, Oct 11, 2022 at 10:29:24AM +0200, Sascha Hauer wrote:
> > > Following the example of samsung,picophy-dc-vol-level-adjust more
> > > phy tuning properties are added for configuring the remaining bitfields
> > > in the USBNC_n_PHY_CFG1 register.
> > 
> > All these properties really doesn't scale. These properties should go 
> > in the phy node as they are properties or the phy. There's no rule that 
> > you can only read properties from the driver's device node.
> 
> I understand and agree.
> 
> On i.MX8M we currently use the usb-nop-xceiv. I guess it's not an option
> to just add these properties there, so we'll need a phy node with a new
> compatible like fsl,imx8mm-usbphy. The driver would basically just
> register a usb-nop-xceiv and the node would be a container for the new
> property. Does this sound sane?

I think it would be fine if you do:

compatible = "fsl,imx8mm-usbphy", "usb-nop-xceiv";

You'll have to rework the usb-nop-xceiv schema 'select' like we have to 
do for any compatible appearing in multiple schema files.

Or don't have the fallback and add "fsl,imx8mm-usbphy" to the 
phy-generic.c driver. But that should be marked for stable for at least 
some compatibility with old kernels.

For existing kernel binaries to work, you have to go with the former 
option.

Rob
