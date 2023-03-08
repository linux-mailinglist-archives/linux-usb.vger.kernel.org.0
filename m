Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A168E6B11BF
	for <lists+linux-usb@lfdr.de>; Wed,  8 Mar 2023 20:07:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbjCHTHB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Mar 2023 14:07:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjCHTGS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 8 Mar 2023 14:06:18 -0500
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E58E6D6EB2;
        Wed,  8 Mar 2023 11:05:42 -0800 (PST)
Received: by mail-oo1-f49.google.com with SMTP id p6-20020a4ab386000000b005252182b0e0so2696730ooo.6;
        Wed, 08 Mar 2023 11:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678302323;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NordxQdldE7XmbCvmG0YEn0Zd0AFIRjo3oCJVh/XdZ8=;
        b=IxA+Tx7znS5aTSXPeYTTmE7rD8Dbh/KdeEk7XxPSLGLWlPhoF+cvLQD9r/+RP/1gbp
         Hcu06hJii09ZV/ZdXyqmDNWJ5QHgqIpGhNWa/e3bQYpiCFiZA8how+875YLcABEakezB
         M8wJsBDxZo/7SHDYA8v0n0D8aQqIgICA29SVy4YHBXgViH6dkGFGnqYpbXZXVpTlAQD6
         +k1kWlXsvqKeqnjj4VESRHAnNRnFblVMfXNjxxToj+l9560Eoa7J/WeqJ2Er/vcxldpE
         6V7hCI2zdRHEYIOwEB07TC787jFfXR8bL/isHlexkdrATTcGD1oH4J4/7jFKyya5YrPQ
         cK+w==
X-Gm-Message-State: AO0yUKXxojXxi2/D4amuemnPMvSjRS4EJl3UtG1gNXyija3R5zd1vrE0
        rmaGlBLPt22uUvRobA0J0A==
X-Google-Smtp-Source: AK7set+Gao+jPPAsPOQnMfcd9chRmvzfSEYvOGdZLRscxWI5Q71DpwiJgOdNY61QW8hZMQmLiCEi+g==
X-Received: by 2002:a4a:d014:0:b0:525:48a9:9ba with SMTP id h20-20020a4ad014000000b0052548a909bamr7229438oor.0.1678302323463;
        Wed, 08 Mar 2023 11:05:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ee6-20020a056870c80600b0016dbf59175bsm6399696oab.47.2023.03.08.11.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 11:05:23 -0800 (PST)
Received: (nullmailer pid 3608251 invoked by uid 1000);
        Wed, 08 Mar 2023 19:05:22 -0000
Date:   Wed, 8 Mar 2023 13:05:22 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: allow evaluated properties in OHCI
 controllers
Message-ID: <167830232197.3608175.18443271589392840573.robh@kernel.org>
References: <20230228152105.25358-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230228152105.25358-1-zajec5@gmail.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue, 28 Feb 2023 16:21:05 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This binding uses usb-hcd.yaml so replace additionalProperties with
> unevaluatedProperties to allow generic USB HCD properties. It's how EHCI
> and XHCI bindings work too.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/usb/generic-ohci.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

