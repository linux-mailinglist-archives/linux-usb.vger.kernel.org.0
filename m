Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FDC5A6BEF
	for <lists+linux-usb@lfdr.de>; Tue, 30 Aug 2022 20:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbiH3STw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Aug 2022 14:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbiH3STu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Aug 2022 14:19:50 -0400
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C77F60;
        Tue, 30 Aug 2022 11:19:47 -0700 (PDT)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-11c4d7d4683so18700446fac.8;
        Tue, 30 Aug 2022 11:19:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=Xjuomzo4081p59XEJk05rr72jAWwRfBKhPuPEHTtXsY=;
        b=RljrkpPQnu7QkSDMD9B1+frIu99ls1CVeTM8/7zpKzxTzp0Wv9x4b6SVzwDKuk5XEE
         nxqMWAYZgtQ7C6YARqNiHwVLheCtlJWvM5PPiGW2DxLYDImU2vTebDhm503mMFoebraT
         QhYtPfZMkrFZQRGEoJ1Y3FrDBjuG13i4im61Px9h2sAaXev6UAD7c8pmxnnq6GSYK3o9
         2TGgBvBFoXw5+kqYCdsieZDmvflJto4EKcdoXND7J6QYbHNG+LM951uFMf0egh3v7QMC
         vsTxqMEE6JHm9VkBI2J++5kHKENwWTyKK8Es5TE1T6Wg9yk+12JBkrTEreVBO84snCsZ
         gC7g==
X-Gm-Message-State: ACgBeo2invcIrukGniDGmcmmYezWA6NhqFBVem2yW1wgsZ6l3uaeoqVi
        Hu5mfev7fViJdYZmVvlOkg==
X-Google-Smtp-Source: AA6agR5GK/WtkfDUqcEl4Ale7ROP128S3ilt5oR7/PvZ0Fsg7CBPmSk83ICmsulN7Bxchj4xxrDXPg==
X-Received: by 2002:a05:6870:5a4:b0:11d:37b3:ff54 with SMTP id m36-20020a05687005a400b0011d37b3ff54mr10357600oap.172.1661883586704;
        Tue, 30 Aug 2022 11:19:46 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ay13-20020a056808300d00b003431d9b3edfsm746803oib.2.2022.08.30.11.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 11:19:46 -0700 (PDT)
Received: (nullmailer pid 1796966 invoked by uid 1000);
        Tue, 30 Aug 2022 18:19:45 -0000
Date:   Tue, 30 Aug 2022 13:19:45 -0500
From:   Rob Herring <robh@kernel.org>
To:     Xu Yang <xu.yang_2@nxp.com>
Cc:     heikki.krogerus@linux.intel.com, peda@axentia.se,
        shawnguo@kernel.org, gregkh@linuxfoundation.org,
        linux@roeck-us.net, jun.li@nxp.com, linux-usb@vger.kernel.org,
        linux-imx@nxp.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: Add typec orientation
 switch properties
Message-ID: <20220830181945.GA1770115-robh@kernel.org>
References: <20220823195429.1243516-1-xu.yang_2@nxp.com>
 <20220823195429.1243516-2-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220823195429.1243516-2-xu.yang_2@nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 24, 2022 at 03:54:26AM +0800, Xu Yang wrote:
> Typec orientation switch can be implemented as a consumer of mux
> controller. So we can use mux controller to control simple gpio switch
> or other types of switch. This will cover the following typec switch
> use case: High Speed, Super Speed and Sideband switch.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Please see and participate in the recent discussions around USB-C 
connectors:

https://lore.kernel.org/all/20220810204750.3672362-2-bjorn.andersson@linaro.org/
https://lore.kernel.org/all/20220622173605.1168416-1-pmalani@chromium.org/

As mentioned there, I want to see block diagrams of the h/w for these 
bindings.

The mux binding may be a good solution here, but different muxing 
scenarios need to be considered.


> ---
> Changes since v1:
> - No changes.
> 
>  .../bindings/connector/usb-connector.yaml      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> index ae515651fc6b..47f53cdbf31a 100644
> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
> @@ -221,6 +221,24 @@ properties:
>        SNK_READY for non-pd link.
>      type: boolean
>  
> +  # The following are optional properties for "usb-c-connector".
> +  mux-controls:
> +    description: Mux controller node to use for orientation switch selection. This mux controller
> +      could handle High Speed, Super Speed and Sideband switch use case one time. In orde to do so,
> +      besides mux settings need to be properly configured for each switch under mux-controller node,
> +      correct states should also be assigned to typec-switch-states parameter.

Wrap lines at 80 char.

> +    maxItems: 1
> +
> +  typec-switch-states:
> +    description: An ordered u32 array describing the mux state value for each typec orientations.
> +      Three states correspond to NONE(high impedance), NORMAL, REVERSE respectively. If there is
> +      no HW mux state for NONE, use value of NORMAL or REVERSE for it. If this mux controller
> +      handle more than 1 switch, correct states value need to be caculated according to the mux
> +      settings.
> +    minItems: 3
> +    maxItems: 3
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

I think that 'mux-states' is what you want to use here.

Rob
