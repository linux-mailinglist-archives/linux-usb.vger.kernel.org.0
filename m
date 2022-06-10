Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B778546AF7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 18:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236400AbiFJQwu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 12:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbiFJQwn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 12:52:43 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9937EDDC;
        Fri, 10 Jun 2022 09:52:41 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id p69so7083122iod.0;
        Fri, 10 Jun 2022 09:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3dlZmcc4YguFzqrzKcGiRHH04o2HOquEuNazJ+NGC6M=;
        b=q2VUc+JtN4qrb73MiPw+DJlLCcMX6IMHKxrWZr4NUBw11NcyHZoPpow0SMm6kkuojz
         oL7pUvfZif7R/RAD/yz6putEvIoVxHWjjbzs7k/slA94roXYFttwgylO+t/l+GMVADHt
         +8xuPb6O5a8kre9RalxYEymUK4/effVwBy7w62wRPTNcNXqyRlTDIwaM0p54KRTprMJD
         ZZwVgMFk04aBlUp0h4ESwc+nAXVAp3EEmxopaRLLUPjPLL/AZBBYQvEthrOJiAFxZkm3
         ZdXM7vaZKQEeY13I8ojK8v07V+elN0XWJdBK1WQ2tu98BVQa3Ny76ivdbW8KpPPg1/5o
         hbcA==
X-Gm-Message-State: AOAM530GwA5a71PEnexz6CNWw1v6H3FUNLwh0SmXPoYlYZAmcfG6uHa9
        sng886mj/F+T5OMRHRK50g==
X-Google-Smtp-Source: ABdhPJwtjfiieb9b2Zwvyo20L7w+ixkFBA27Lhv2JHjTw75OJqTXr1Qyq5BMLQ3/tHgbYzLpeksChQ==
X-Received: by 2002:a05:6638:2615:b0:32e:d246:8e27 with SMTP id m21-20020a056638261500b0032ed2468e27mr23882058jat.7.1654879960925;
        Fri, 10 Jun 2022 09:52:40 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id t26-20020a6b091a000000b00669b5129b4csm2126832ioi.3.2022.06.10.09.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 09:52:40 -0700 (PDT)
Received: (nullmailer pid 1819595 invoked by uid 1000);
        Fri, 10 Jun 2022 16:52:39 -0000
Date:   Fri, 10 Jun 2022 10:52:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        John Youn <John.Youn@synopsys.com>,
        Pavan Kondeti <quic_pkondeti@quicinc.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: usb: usb-xhci: Add xhci-snps-quirks
Message-ID: <20220610165239.GC1787330-robh@kernel.org>
References: <cover.1654310542.git.Thinh.Nguyen@synopsys.com>
 <1ff0422b36c32c0b8b76f99333ac785f275edd4d.1654310542.git.Thinh.Nguyen@synopsys.com>
 <20220609174840.GA4015807-robh@kernel.org>
 <6873a12f-448f-214a-ca01-a08f65ddb0ee@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6873a12f-448f-214a-ca01-a08f65ddb0ee@synopsys.com>
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

On Thu, Jun 09, 2022 at 06:11:51PM +0000, Thinh Nguyen wrote:
> Hi Rob,
> 
> Rob Herring wrote:
> > On Fri, Jun 03, 2022 at 07:48:08PM -0700, Thinh Nguyen wrote:
> >> Set this property to use xhci-snps extension to handle common Synopsys
> >> DWC_usb3x host quirks.
> > 
> > I don't see why this needs to be in DT.
> > 
> > The DWC3 stuff is a mess of quirks which doesn't work well. Quirk 
> > properties in DT require either knowing the quirk up front (You don't 
> > always) or updating the DT on a platform when you find one. Quirks 
> > should be implied by the compatible string(s) instead.
> > 
> 
> Since different vendors share the same Synopsys DWC_usb3x IPs, the
> controller's behavior is predictable based on the IP versions. 

Not really, have you looked at the existing bindings. How does the same 
IP have different numbers of clocks, resets, etc.? It's a huge mess for 
these licensed IPs and partly because they don't have publicly available 
specs where we can check what resources there really are.

> Just
> using the compatible strings will become unmanageable when we have the
> common behavior across different vendors.

This IP is not special. We use compatible everywhere else and nowhere is 
it unmanageable. And again, that's the only way you can handle quirks in 
the OS without changing the DT.

> Can we rename this property to "xhci-snps-DWC_usb3x-ip" or something
> similar?
> 
> The main goal for this device property is to indicate that it's
> Synopsys's DWC_usb3x IP. As long as we know this, the xhci-snps glue
> extension can handle the fine tuning for the controller's behavior.

Can't you just check the parent device compatible is 'snps,dwc3'? (I'm 
assuming the struct device hierarchy is glue device -> dwc3 -> xhci.)

> We could use compatible string for this goal also, but that would mean
> the host devices that go through the dwc3 driver path may not have the
> compatible string. (e.g. host on pci bus but get recreated as platform
> device). Then we would need a different way to determine that. We could
> match the parent device driver for "dwc3", but that implementation looks
> fragile.
> 
> So, will the device property "xhci-snps-DWC_usb3x-ip" work for you?

Looking at the driver, you are just creating a property within the 
kernel. It's never in DT, so why are you documenting it? You can do 
whatever DWC3 and XHCI maintainers will allow and as DT maintainer I 
don't care. I don't really think it is a great approach, but ...

Rob
