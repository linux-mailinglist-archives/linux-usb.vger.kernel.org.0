Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7234D884F
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 16:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241219AbiCNPkC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Mar 2022 11:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbiCNPkB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Mar 2022 11:40:01 -0400
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3CA22532;
        Mon, 14 Mar 2022 08:38:51 -0700 (PDT)
Received: by mail-il1-f171.google.com with SMTP id b5so11257570ilj.9;
        Mon, 14 Mar 2022 08:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bIfaEZVzhT8Wj7dBMtsfTXQ3dELijpFczoyzJGYk+5I=;
        b=ZRjoAFhzgUHnWqndkmteMlkyU1+IXfC4B7YQvzP6cVWDBem/RM3VjalyJNQ+JGfbb2
         vb4bqGSzFYSapBN6u1shkfqzJfYQW2sC4Lvx6P+yLuozUlXFBZXubMbZzcMoKwn6obF7
         MSThXv9JRKr2Cub+6El/vcku/mPEHY0OzRdL4RAEIkQrX2tfQxmEC23WSOcrRqXHGTVo
         XZVAk49O/m8oMazpK2iVDjrb0n6s+GW02vqPqk6bM1jfWImQ0nhGfhp9Bub/yQ6yL5EG
         8/ZYl7zHmY2ufZ7EaWMsac9q2GX1+I0mPQHFxnb+am1v3vkOLK46GVQ2LNCHZVh8qZ3C
         iP6w==
X-Gm-Message-State: AOAM533JqB7S7on95qzpc773Ry8sTtT9G9DHiW8Tex0XaZL8sB5I8D0u
        KVkdZk4Tiu8ghh3H/B2pOQ==
X-Google-Smtp-Source: ABdhPJzyypd1cDny9HVyY0kz7Mez/1ESGPw/R+gC8HlB8oDK7faM1jfZzNN6sm6L6dT+RMbfFPPcHA==
X-Received: by 2002:a05:6e02:118a:b0:2c6:7af8:9073 with SMTP id y10-20020a056e02118a00b002c67af89073mr20545629ili.63.1647272330540;
        Mon, 14 Mar 2022 08:38:50 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id o6-20020a056e02188600b002c61b4fef99sm9661804ilu.1.2022.03.14.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 08:38:49 -0700 (PDT)
Received: (nullmailer pid 100154 invoked by uid 1000);
        Mon, 14 Mar 2022 15:38:47 -0000
Date:   Mon, 14 Mar 2022 09:38:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Richard Leitner <richard.leitner@linux.dev>
Cc:     "Neumann, Bastian" <Bastian.Neumann@dentsplysirona.com>,
        Tommaso Merciai <tomm.merciai@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Richard Leitner <richard.leitner@skidata.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: USB2512x boost value for up- and
 downstream ports
Message-ID: <Yi9hhyYqbnAOgc7u@robh.at.kernel.org>
References: <PH0PR17MB48481AC6D6B808D2C106C4AA8E0C9@PH0PR17MB4848.namprd17.prod.outlook.com>
 <YithMVvcOKbq76OU@robh.at.kernel.org>
 <Yi5NYJfyvYcC9X+j@ltleri2>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yi5NYJfyvYcC9X+j@ltleri2>
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

On Sun, Mar 13, 2022 at 09:00:32PM +0100, Richard Leitner wrote:
> On Fri, Mar 11, 2022 at 08:48:17AM -0600, Rob Herring wrote:
> > On Fri, Mar 11, 2022 at 12:09:42PM +0000, Neumann, Bastian wrote:
> > > This patch adds devicetree documentation for signal boosting properties.
> > > 
> > > Signed-off-by: Bastian Neumann <bastian.neumann@dentsplysirona.com>
> > > ---
> > >  .../devicetree/bindings/usb/usb251xb.txt      | 22 +++++++++++++++++++
> > >  1 file changed, 22 insertions(+)
> > 
> > A popular feature all the sudden. Which one are we supposed to apply? 
> > This one or this[1]?
> 
> This seems to be a superset of the previous patchset from Tommaso.
> Therefore I'd definitley vote for this one if a v2 of it [2] gets
> merged (it was declined by GregKH because of the e-mail signature and
> fomatting issues).
> 
> Until then I assume [1] should be applied as it represents the current
> master state due to
> commit 5c2b9c61ae5d (usb: usb251xb: add boost-up property support, 2022-01-28)
> being already merged.

No, because there are changes requested on [1]. And I guess fixes will 
be needed to the driver too if it already got picked up.

Rob
