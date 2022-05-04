Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D92D851A1DB
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 16:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351085AbiEDONJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 10:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351070AbiEDONH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 10:13:07 -0400
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D60419A7;
        Wed,  4 May 2022 07:09:31 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id y14-20020a9d460e000000b00605ee347da1so965072ote.8;
        Wed, 04 May 2022 07:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=o53a8GmxnocjGIYplhPt9PwSDPQJ/OPLUJA/SSfS1HM=;
        b=l4mdAZsYZYqH0kJ3KVaHvWC3PKi+vV81qasjUiPGDIVe5F2dsje5nwVy6gjB08vz4j
         svFU4W+nCzjBb/oIfHUVaQKDtPFS8KRH1XiQSAGlDhUl9ArEmDbhoA95ZiZCcpWZuPtv
         DsEgNU87GWlewYFhHCqiOitDD4Cmnzo8gpvlcBalu76coNEfvzEmgf454Z3rAlTNS96V
         YNxtSvHFz1RB1eyqK+eV+4F9W8UQmLLjC1HUCK66XITq86D/HGWwip+eosKdZoK9mM5E
         sA6zTKNlPCGpBZCnPDlJJPUdT5OvNUU9Cf0fG/G4XpnjMOvzUJFIcPi4N+2xKSkpZF9V
         49Jw==
X-Gm-Message-State: AOAM532oJqCWpZ+FQPdMGgwvqv+YiSWmItAkUwrqURDkeEaQVANDovqC
        FkisG9hftbf8JamR2FEjbQ==
X-Google-Smtp-Source: ABdhPJxtg9hxvR1IWm7xYdENP2YcZLWfPM1hpwSN0lI2GlIknHz/N+T7Lk6/cpY1Z6RkYt3IV4Uh2A==
X-Received: by 2002:a05:6830:16c8:b0:606:2557:e324 with SMTP id l8-20020a05683016c800b006062557e324mr4010876otr.33.1651673370512;
        Wed, 04 May 2022 07:09:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b18-20020aca2212000000b00325cda1ff8esm4374899oic.13.2022.05.04.07.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 07:09:29 -0700 (PDT)
Received: (nullmailer pid 1631408 invoked by uid 1000);
        Wed, 04 May 2022 14:09:29 -0000
Date:   Wed, 4 May 2022 09:09:29 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniels Umanovskis <du@axentia.se>
Cc:     Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: usb: usb251xb: add documentation for
 reset-delay-us
Message-ID: <YnKJGf6lgKfp9Vpj@robh.at.kernel.org>
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-2-du@axentia.se>
 <YnB1ZQwpOBcT4zct@robh.at.kernel.org>
 <75ed6e33-0d67-c50f-4d3a-7345d5f058b4@axentia.se>
 <YnDz/q7hqlTbRqYR@ltleri2>
 <fb7a499f-2abb-d84e-c8d5-4d15e7fb6d3d@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fb7a499f-2abb-d84e-c8d5-4d15e7fb6d3d@axentia.se>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 03, 2022 at 11:41:17AM +0200, Daniels Umanovskis wrote:
> On 5/3/22 11:21 AM, Richard Leitner - SKIDATA wrote:
> > What's the maximum timeout you've observed?
> > 
> > I guess it would be the simpler and "better" approach to just increase
> > the timeout in the driver (if it's not too much above the 500µs).
> 
> I saw 800-820 us at most, and my initial fix internally was just to increase
> the sleep duration in the driver. But it's an increase of over 50% and I
> don't feel it makes sense to change the driver's behavior for thousands of
> users with properly working chips, hence the configurable timeout for
> out-of-spec batches like the one we had here. I expect more users to run
> across such batches in the coming months.
> 
> In an ideal world, we'd just trash these hubs that should have surely failed
> factory QA, but with today's component shortage that's an unimaginable
> luxury...

The only solution that works here is increase the timeout in the driver. 
Are you going to tweak the dtb based on what batch the chip is from? No, 
that's not possible.

Having worked in a chip company, I can tell you how they would fix it. 
Better testing? No, they'd change the documentation.

Rob
