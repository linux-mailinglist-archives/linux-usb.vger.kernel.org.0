Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1AEF545352
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jun 2022 19:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345073AbiFIRsq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jun 2022 13:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344401AbiFIRsp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jun 2022 13:48:45 -0400
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB192A3A35;
        Thu,  9 Jun 2022 10:48:43 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id h8so4555576iof.11;
        Thu, 09 Jun 2022 10:48:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pWO4p8s24kIPrZ1/y02FtVagTY+LTrvd9+l19TYj85c=;
        b=S+igX7YzursFMFZw27XRkTR0+sA4d2Xevuwf99PYiQl7ZbnmaH10vjA0EIQJ9inErE
         a1IkFpsUVBeFgS/NwA5cOcewk4ErQdrkrWmrVkbk8G/0ltcWgXPBHMlMt6ykpCwtExic
         Cksz/YTGkEevdS18phJWatQ7oLFDAlkltK8RLy00pDPHFWDZIBnGoJxzXqxR//fsubkC
         VcYpu4R1qFHBAu+2va1Tz9IBD3G0/g5Yz6hD2B+IAIfrhDkA8RRuTh2SzQHEFsoaTS6+
         sC4Oou+lpzBuR1csVzz0gtAbcjKzUxm3F/QApOZ/3YikSOiSrE1Zacf6TVj+GXExuQkH
         GwGQ==
X-Gm-Message-State: AOAM530WMestZdF+RfUTcMpAFpEmUGepW81WhrTfptVYDzdVG/9c0OE3
        16cUxbkuZD6Vf7/GEEQB4w==
X-Google-Smtp-Source: ABdhPJwdkNxvkhh4rrrM87oKZT+9xfCSDvzlXM7MRCZxTC1zl0Kq0UMkmG06n35ZbFPg47z7ZnLWlQ==
X-Received: by 2002:a05:6602:2ace:b0:669:8e7c:14bb with SMTP id m14-20020a0566022ace00b006698e7c14bbmr4777870iov.213.1654796922815;
        Thu, 09 Jun 2022 10:48:42 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n12-20020a02cc0c000000b0032e42cd4274sm9889966jap.89.2022.06.09.10.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 10:48:42 -0700 (PDT)
Received: (nullmailer pid 4021485 invoked by uid 1000);
        Thu, 09 Jun 2022 17:48:40 -0000
Date:   Thu, 9 Jun 2022 11:48:40 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: usb: usb-xhci: Add xhci-snps-quirks
Message-ID: <20220609174840.GA4015807-robh@kernel.org>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
 <1ff0422b36c32c0b8b76f99333ac785f275edd4d.1654310542.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ff0422b36c32c0b8b76f99333ac785f275edd4d.1654310542.git.Thinh.Nguyen@synopsys.com>
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

On Fri, Jun 03, 2022 at 07:48:08PM -0700, Thinh Nguyen wrote:
> Set this property to use xhci-snps extension to handle common Synopsys
> DWC_usb3x host quirks.

I don't see why this needs to be in DT.

The DWC3 stuff is a mess of quirks which doesn't work well. Quirk 
properties in DT require either knowing the quirk up front (You don't 
always) or updating the DT on a platform when you find one. Quirks 
should be implied by the compatible string(s) instead.

> 
> Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.yaml b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> index 965f87fef702..540044a087a7 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.yaml
> @@ -29,6 +29,10 @@ properties:
>      description: Interrupt moderation interval
>      default: 5000
>  
> +  xhci-snps-quirks:
> +    description: Handles common Synopsys DWC_usb3x host quirks
> +    type: boolean
> +
>  additionalProperties: true
>  
>  examples:
> -- 
> 2.28.0
> 
> 
